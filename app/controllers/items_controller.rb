class ItemsController < ApplicationController

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      render :new
    end
  end
  

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :encrypted_password, :last_name, :first_name, :kana_last_name, :kana_first_name, :birth_day)
  end
end
