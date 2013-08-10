class Attempt < ActiveRecord::Base
  belongs_to :round
  belongs_to :card

  before_save :assign_outcome

  def assign_outcome
    if self.card.term.downcase == self.input.downcase
      self.outcome = true
      #can we add a number to increase with true_guesses += 1
    else
      self.outcome = false
      true
      #also add a number of false_guesses += 1
    end
  end
end
