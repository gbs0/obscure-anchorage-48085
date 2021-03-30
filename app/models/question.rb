class Question < ApplicationRecord
  belongs_to :quiz
  
  validates_length_of :title, minimum: 5, allow_blank: false

  scope :by_quiz, -> (quiz_id) { where("quiz_id = ?", quiz_id)}
end
