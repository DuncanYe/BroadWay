class UsersController < ApplicationController
  before_action :find_user
  def show
    @user_play = @user.plays
  end

  def edit
  end

  def update
    @user.update(params_user)
    if @user.save
      flash[:notice] = '更新成功'
      redirect_to user_path(current_user)
    else
      flash[:alert] = @user.errors.full_messages.to_sentence
      render :edit
    end
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def params_user
    params.require(:user).permit(:name, :intro, :avatar)
  end
end
