class Quiz < ApplicationRecord
  belongs_to :user
  has_many :questions, dependent: :destroy
  has_many :answears, through: :questions

  scope :by_id, -> (id) { find_by("id = ?", id)}
  scope :by_user, -> (id) { where("user_id = ?", id) }
end
