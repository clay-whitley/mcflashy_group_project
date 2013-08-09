get '/choose_deck' do
 @decks = Deck.all
end

get '/start_game/:id' do
  deck = Deck.find(params[:id])
  round = deck.rounds.create(user_id: session[:user].id)
  redirect "/display_card/#{round.id}"
end

get '/display_card/:round_id' do
  round = Round.find(params[:round_id])
  @current_card = round.deck#.some_method_to_randomly_grab_card
  erb :guess_form
end

post '/guess' do
  current_round = Round.find(params[:round_id])
  current_card = Card.find(params[:card_id])
  user_guess = current_round.attempts.new(params[:guess])
  if current_card.term == user_guess.input
    user_guess.outcome = true
  else
    user_guess.outcome = false
  end
  user_guess.save

  @outcome = user_guess.outcome
  erb :outcome
end


