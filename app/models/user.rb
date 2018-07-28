class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_presence_of :username
  validates_presence_of :email
  validates_presence_of :comedy
  validates_presence_of :action
  validates_presence_of :romance
  mount_uploader :photo, PhotoUploader   
  has_many :reviews  
  def reviewed?(movie)
    reviews.exists?(movie_id: movie.id)
  end  
end
