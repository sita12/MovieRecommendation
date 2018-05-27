class MoviesController < ApplicationController
       def index
        @movie = Movie.recent
        @recent_reviews = Review.recent
        end  
    def profile 
    end     
end
