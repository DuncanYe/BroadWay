class ReviewsController < ApplicationController

  def new
    @play = Play.find(params[:play_id])
    # @review = Review.new
    @review = @play.reviews.new
  end

  def create
    @play = Play.find(params[:play_id])
    @review = Review.new(review_params)
    @review.play_id = @play.id
    #  如果沒給play.id 無法存取？
    @review.user_id = current_user.id

    if @review.save
      redirect_to @play
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end
