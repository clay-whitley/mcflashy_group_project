new_deck = Deck.create(name: "State Capitols")
new_deck.cards.create(term: "Sacramento", description: "California")
new_deck.cards.create(term: "Salem", description: "Oregon")
new_deck.cards.create(term: "Olympia", description: "Washington")
new_deck.cards.create(term: "Atlanta", description: "Georgia")
new_deck.cards.create(term: "Denver", description: "Colorado")
new_deck.cards.create(term: "Honolulu", description: "Hawaii")


new_deck = Deck.create(name: "Futurama Characters")
new_deck.cards.create(term: "Leela", description: "Awesome Cylcops space captain")
new_deck.cards.create(term: "Bender", description: "Rude beer-fueled machine")
new_deck.cards.create(term: "Hermes", description: "Rastafarian accountant")
new_deck.cards.create(term: "Fry", description: "Frozen delivery boy from 1999")
new_deck.cards.create(term: "URL", description: "Robot cop")
new_deck.cards.create(term: "Horrible Gelatinous Blob", description: "Large translucent acidic alien")


new_deck = Deck.create(name: "Trees")
new_deck.cards.create(term: "Ginko", description: "Fan-shaped leaves, common in Eastern medicine")
new_deck.cards.create(term: "Bristlecone pine", description: "Oldest non-clonal tree")
new_deck.cards.create(term: "Redwood", description: "Tallest tree in the world")
new_deck.cards.create(term: "Magnolia", description: "Huge white blooms, common in the Southern USA")
new_deck.cards.create(term: "Willow", description: "Long strands of oval leaves, sometimes weeping")
new_deck.cards.create(term: "Apricot", description: "Known for their apricots")

user = User.new(first_name: "Bob", last_name: "Loblaw", email: "bob@loblaw.com")
user.password = "lobs"
user.save
user = User.new(first_name: "Micheal", last_name: "Bluth", email: "bluth@realty.net")
user.password = "george"
user.save
user = User.new(first_name: "Gob", last_name: "Bluth", email: "illusions@magic.biz")
user.password = "delight"
user.save
user = User.new(first_name: "Dexter", last_name: "Morgan", email: "regular@guy.com")
user.password = "deb"
user.save
user = User.new(first_name: "Omar", last_name: "Little", email: "street@justice.com")
user.password = "nine"
user.save