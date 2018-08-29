	class MoviesController < ApplicationController
       def index
        @movie = Movie.recent
        @user= User.all 
        @review= Review.all
        @recent_reviews = Review.recent
         if user_signed_in? 
                      @user.each do |u|  
                     if u.id != current_user.id 
                if current_user.romance == 1 || current_user.comedy == 1 || current_user.action==1 
                           if u.romance == 1 || u.comedy == 1 || u.action==1 
                         
                     u.rates = ((current_user.romance*u.romance)+(current_user.comedy*u.comedy)+(current_user.action*u.action))/ (Math.sqrt(current_user.romance**2+current_user.comedy**2+current_user.action**2) *Math.sqrt(u.romance**2+u.comedy**2+u.action**2)) 

                      u.save! 
                      end
                    end
                      end 
                      end 
                  end
        end  
    def profile 
        @review=Review.all
    end     
end
