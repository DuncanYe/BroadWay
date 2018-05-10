class ReviewsController < ApplicationController
  before_action :find_play
  before_action :find_review, only: [:edit, :update, :destroy]

  def new
    # @review = Review.new
    @review = @play.reviews.new
  end

  def create
    @review = Review.new(review_params)
    @review.play_id = @play.id
    #  如果沒給play.id 無法存取？
    @review.user_id = current_user.id

    if @review.save
      flash[:notice] = '評論已建立'
      redirect_to @play
    else
      flash[:alert] = '評論未建立成功'
      render :new
    end
  end

  def edit
    
  end

  def update
    if @review.update(review_params)
      flash[:notice] = '成功更新評論'
      redirect_to @play
    else
      flash[:alert] = '更新評論未完成'
      render :edit
    end
  end

  def destroy
    @review.destroy
    flash[:notice] = '評論已刪除'
    redirect_to @play
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end

  def find_play
    @play = Play.find(params[:play_id])
  end

  def find_review
    @review = Review.find(params[:id])
  end

end
