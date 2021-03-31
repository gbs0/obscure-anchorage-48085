class Answear < ApplicationRecord
  belongs_to :question
  
  validates_length_of :title, minimum: 5, allow_blank: false

  scope :by_quiz_id, -> (id) { where("quiz_id = ?", id)}
end
