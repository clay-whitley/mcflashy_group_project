require ::File.expand_path('../config/environment',  __FILE__)

def assert(boolean, message)
  puts "*" * 75
  puts "#{message}: #{boolean}"
  puts "*" * 75
  puts
end

# Destroys users between tests.

User.where(last_name: "User").destroy_all

user_1 = User.new(email: "user1@users.com", first_name: "First", last_name: "User")
user_1.password = "password1"
user_1.save
user_2 = User.new(email: "user2@users.com", first_name: "Second", last_name: "User")
user_2.password = "password2"
user_2.save

deck_1 = Deck.find(1)
deck_2 = Deck.find(2)
deck_3 = Deck.find(3)
card_1 = deck_1.cards.first
card_2 = deck_2.cards.first
card_3 = deck_3.cards.first
round_1 = deck_1.rounds.create(user_id: user_2.id)
attempt_1 = round_1.attempts.create(card_id: 1, input: "Sacramento")
attempt_2 = round_1.attempts.create(card_id: 1, input: "San Francisco")


# These tests assume that the seed file has already been ran

assert(deck_1.name == "State Capitols", "The first deck has the right name")
assert(deck_2.name == "Futurama Characters", "The second deck has the right name")
assert(deck_3.name == "Trees", "The third deck has the right name")
assert(card_1.term == "Sacramento", "The first card in the first deck has the right name")
assert(card_2.term == "Leela", "The first card in the second deck has the right name")
assert(card_3.term == "Ginko", "The first card in the third deck has the right name")
assert(deck_1.cards.map { |card| card.id }.include?(round_1.grab_next_card), "The round pulls the correct next card")
assert(attempt_1.outcome, "The outcome of the first attempt should be true")
assert(attempt_2.outcome == false, "The second attempt should be false")
assert(User.authenticate("user1@users.com", "password1").id == user_1.id, "User successfully authenticates with correct password")
assert(User.authenticate("user1@users.com", "password").nil?, "User is not authenticated with incorrect password")
assert(user_2.rounds.any?, "User has rounds associated with it")

