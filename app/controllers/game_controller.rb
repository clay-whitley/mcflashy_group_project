
get '/choose_deck' do
  @decks = Deck.all
  if session[:user]
    erb :choose_deck, layout: false
  else
    erb :index, layout: false
  end
end

get '/start_game/:id' do
  deck = Deck.find(params[:id])
  round = deck.rounds.create(user_id: session[:user].id)
  redirect "/display_card/#{round.id}"
end

get '/display_card/:round_id' do
  round = Round.find(params[:round_id])
  next_card = round.grab_next_card
  unless next_card.nil?
    @current_card = Card.find(next_card)
  else
    redirect "/your_results/#{round.id}"
  end
  @round_id = round.id
  erb :game, layout: false
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
  erb :outcome, layout: false
end

get '/global_stats' do
  @all_rounds = Round.pluck(:id)
  @all_users = Round.pluck(:user_id)
  @round_user = Hash[@all_rounds.zip(@all_users)]
  @name = User.where(id: session[:user].id).pluck(:first_name).join('')
  erb :stats
end

get '/your_results/:round_id' do
  round = Round.find(params[:round_id])
  @true_guesses = round.attempts.where(outcome: true).count
  @total_guesses = round.attempts.count
  @name = session[:user].first_name
  erb :results, layout: false
end

get '/user_stats' do
  user = session[:user]
  @user_rounds = user.rounds
  erb :user_stats, layout: false
end





