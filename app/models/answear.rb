class Answear < ApplicationRecord
  belongs_to :question

  reverse_geocoded_by :latitude, :longitude
  geocoded_by :coordinates

  validates_length_of :description, minimum: 5, allow_blank: false
  # after_validation :geocode, if: :coordinates_changed?
  scope :by_id,          -> (id) { find_by("id = ?", id) }
  scope :by_user,        -> (id) { find_by("user_id = ?", id) }
  scope :by_quiz_id,     -> (id) { where("quiz_id = ?", id) }
  scope :by_question_id, -> (id) { where("question_id = ?", id) }

  def coordinates
    [lat, lng].compact.join(", ")
  end

  def coordinates_changed?
    lat_changed? || lng_changed?
  end
end
