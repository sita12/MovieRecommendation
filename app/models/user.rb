class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  mount_uploader :photo, PhotoUploader   
  has_many :reviews  
  def reviewed?(movie)
    reviews.exists?(movie_id: movie.id)
  end  
end
