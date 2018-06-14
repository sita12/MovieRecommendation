class MoviesController < ApplicationController
       def index
        @movie = Movie.recent
        @user= User.all 
        @review= Review.all
        @recent_reviews = Review.recent
        end  
    def profile 
        @review=Review.all
    end     
end
