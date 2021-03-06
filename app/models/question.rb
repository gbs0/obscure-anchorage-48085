class Question < ApplicationRecord
  belongs_to :quiz
  has_many :answears, dependent: :destroy
  
  validates_length_of :title, minimum: 5, allow_blank: false

  scope :by_id, -> (id) { find_by("id = ?", id) }
  scope :by_user, -> (id) { where("user_id = ?", id) }
  scope :by_quiz, -> (quiz_id) { where("quiz_id = ?", quiz_id)}
  scope :by_quiz_and_user, -> (user_id, quiz_id) do
    joins(:questions).where(quiz: { quiz_id: quiz_id })
  end
end
