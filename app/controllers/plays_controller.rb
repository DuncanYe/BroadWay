class PlaysController < ApplicationController

  before_action :find_play, only: [ :show, :edit, :update, :destroy ]

  def index
    @play = Play.order(created_at: :desc)
  end

  def new
    @play = current_user.plays.build
    @categories = Category.all.map{ |c| [ c.name , c.id] }
  end

  def create
    @play = current_user.plays.build(play_params)
    @categories = Category.all.map{ |c| [ c.name , c.id] }
    if @play.save
      redirect_to @play
    else
      render :new
    end
  end

  def show
    
  end

  def edit
    
  end

  def update
    @categories = Category.all.map{ |c| [ c.name , c.id] }
    
    if @play.update(play_params)
      redirect_to @play
    else
      render :edit
    end
  end

  def destroy
    @play.destroy
    redirect_to root_path
  end


  private

  def play_params
    params.require(:play).permit(:title, :description, :director, :user_id, :category_id)
  end

  def find_play
    @play = Play.find(params[:id])
  end


end
