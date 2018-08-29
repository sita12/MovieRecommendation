class Movie < ApplicationRecord
    #validates :title, :plot, :release_date,:released , :runtime, :popularity, :genre, :language, :budget, :average_vote, :vote_count, :poster, :homepage, :tmdb_id, :imdb_id, presence: true
  
  has_many :reviews
  
  scope :recent, -> {order("created_at DESC").limit(10)}
end
