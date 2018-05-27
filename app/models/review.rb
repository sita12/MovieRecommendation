class Review < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  mount_uploader :photo, PhotoUploader
  validates :user, :movie, :rating,  presence: true
  scope :recent, -> {order("created_at DESC").limit(4)}
end
