get '/decks/new' do
  erb :new_deck
end

post '/decks' do
  Deck.create(params[:deck])
  redirect '/choose_deck'
end

get '/decks/:id/add_cards' do
  @deck = Deck.find(params[:id])
  erb :edit_deck
end

post '/decks/:id/add' do
  deck = Deck.find(params[:id])
  deck.cards.create(params[:card])
  redirect "/decks/#{deck.id}/add_cards"
end


