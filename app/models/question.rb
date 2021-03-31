class Question < ApplicationRecord
  belongs_to :quiz
  has_many :answears, dependent: :destroy
  
  validates_length_of :title, minimum: 5, allow_blank: false

  scope :by_id, -> (id) { find_by("id = ?", id) }
  scope :by_quiz, -> (quiz_id) { where("quiz_id = ?", quiz_id)}
end
