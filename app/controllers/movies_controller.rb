class MoviesController < ApplicationController
       def index
        @movie = Movie.recent
        @recent_reviews = Review.recent
        end  
    def profile 
        @review=Review.all
    end     
end
