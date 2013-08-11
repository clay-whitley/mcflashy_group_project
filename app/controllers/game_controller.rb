get '/choose_deck' do
  @decks = Deck.all
  if session[:user]
    erb :choose_deck
  else
    redirect '/'
  end
end

get '/start_game/:id' do
  deck = Deck.find(params[:id])
  p session
  round = deck.rounds.create(user_id: session[:user].id)
  redirect "/display_card/#{round.id}"
end

get '/display_card/:round_id' do
  round = Round.find(params[:round_id])
  next_card = round.grab_next_card
  unless next_card.nil?
    @current_card = Card.find(next_card)
  else
    redirect '/choose_deck'
  end
  @round_id = round.id
  erb :game
end

post '/guess' do
  @current_round = Round.find(params[:round_id])
  @current_card = Card.find(params[:guess][:card_id])
  user_guess = @current_round.attempts.create(params[:guess])
  if user_guess.outcome
    @outcome = "Correct!"
  else
    @outcome = "Incorrect!"
  end
  erb :outcome
end

get '/global_stats' do
@all_rounds = Round.pluck(:id)
@all_users = Round.pluck(:user_id)
@round_user = Hash[@all_rounds.zip(@all_users)]

  erb :stats
end

get '/results' do
@true_guesses = Attempt.where(outcome: true).find_all_by_round_id(session[:round_id]).count
@total_guesses = Attempt.find_all_by_round_id(session[:round_id]).count
session[:user_email] = User.where(id: session[:id]).pluck(:email)

 erb :results
end

get '/user_stats' do
  @user_rounds = Round.where(user_id: session[:id]).pluck(:id)


  erb :user_stats
end





