get '/decks/new' do
  erb :_new_deck, layout: false
end

post '/decks' do
  deck = Deck.create(params[:deck])
  erb :_deck_item_partial, layout: false, locals: {deck: deck}
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



