class PlaysController < ApplicationController
  
  before_action :find_play, only: [ :show ]

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

  def show
    
  end


  private

  def play_params
    params.require(:play).permit(:title, :description, :director)
  end

  def find_play
    @play = Play.find(params[:id])
  end


end
