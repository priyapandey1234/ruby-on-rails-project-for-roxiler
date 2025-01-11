class RatingsController < ApplicationController
  def create
    rating = Rating.new(rating_params)
    if rating.save
      render json: { message: 'Rating submitted successfully' }
    else
      render json: { errors: rating.errors.full_messages }
    end
  end

  def update
    rating = Rating.find(params[:id])
    if rating.update(score: params[:score])
      render json: { message: 'Rating updated successfully' }
    else
      render json: { errors: rating.errors.full_messages }
    end
  end

  private

  def rating_params
    params.require(:rating).permit(:user_id, :store_id, :score)
  end
end
