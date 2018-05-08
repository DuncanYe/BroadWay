class PlaysController < ApplicationController

  def index
    @play = Play.order(created_at: :desc)
  end

  def new
    @play = Play.new
  end

  def create
    @play = Play.create(play_params)
    if @play.save
      redirect_to plays_path
    else
      render :new
    end
  end


  private

  def play_params
    params.require(:play).permit(:title, :description, :director)
  end


end
