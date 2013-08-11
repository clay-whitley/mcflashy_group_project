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
  @name = User.where(id: session[:user].id).pluck(:first_name).join('')
  erb :stats
end

get '/your_results' do
  params[:round_id] = @current_round.id if @current_round
  @true_guesses = Attempt.where(outcome: true).find_all_by_round_id(params[:round_id]).count
  @total_guesses = Attempt.find_all_by_round_id(params[:round_id]).count
  @name = User.where(id: session[:user].id).pluck(:first_name).join('')
  erb :results
end

get '/user_stats' do
  @user_rounds = Round.where(user_id: session[:user].id).pluck(:id)
  @name = User.where(id: session[:user].id).pluck(:first_name).join('')
  erb :user_stats
end





