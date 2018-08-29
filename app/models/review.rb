class Review < ApplicationRecord
	
  belongs_to :user
  belongs_to :movie
  validates :user, :movie, :rating,  presence: true
  scope :recent, -> {order("created_at DESC").limit(4)}
end
