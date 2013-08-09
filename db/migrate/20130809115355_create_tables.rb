class CreateTables < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :term, :description
      t.belongs_to :deck
      t.timestamps
    end

    create_table :decks do |t|
      t.string :name
      t.timestamps
    end

    create_table :rounds do |t|
      t.belongs_to :user
      t.belongs_to :deck
      t.timestamps
    end

    create_table :attempts do |t|
      t.belongs_to :round 
      t.string :input
      t.belongs_to :card 
      t.boolean :outcome 
      t.timestamps
    end

    create_table :users do |t|
      t.string  :first_name
      t.string :last_name
      t.string :email
      t.string :password_hash
      t.timestamps
    end

  end
end
