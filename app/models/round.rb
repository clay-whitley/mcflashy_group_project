class Round < ActiveRecord::Base

  has_many :attempts
  belongs_to :deck
  belongs_to :user
  
  def grab_next_card
    played_cards = []
    all_cards_in_deck = self.deck.cards.all
    all_cards_in_deck.map! { |card| card.id }
    self.attempts.each do |attempt|
      played_cards << attempt.card_id
    end
    (all_cards_in_deck - played_cards).sample
  end

end
