get '/choose_deck' do
 @decks = Deck.all
 erb :choose_deck
end

get '/start_game/:id' do
  deck = Deck.find(params[:id])
  p session
  round = deck.rounds.create(user_id: session[:user].id)
  redirect "/display_card/#{round.id}"
end

get '/display_card/:round_id' do
  round = Round.find(params[:round_id])
  @current_card = Card.find(round.grab_next_card)
  @round_id = round.id
  erb :game
end

post '/guess' do
  @current_round = Round.find(params[:round_id])
  current_card = Card.find(params[:guess][:card_id])
  user_guess = @current_round.attempts.new(params[:guess])
  if current_card.term.downcase == user_guess.input.downcase
    user_guess.outcome = true
  else
    user_guess.outcome = false
  end
  user_guess.save
  if user_guess.outcome
    @outcome = "Correct!"
  else
    @outcome = "Incorrect!"
  end
  erb :outcome
end

get '/statistics' do
  

  erb :stats
end
