class RatingsController < ApplicationController
    before_action :authenticate_user!
  
    def create
      @rating = current_user.ratings.new(rating_params)
      if @rating.save
        redirect_to stores_path, notice: 'Rating submitted!'
      else
        render :new
      end
    end
  
    private
  
    def rating_params
      params.require(:rating).permit(:value, :store_id)
    end
  end
  