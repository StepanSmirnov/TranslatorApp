class UsersController < ApplicationController
  def create
    @user = User.new(users_params)
    if @user.save
      redirect_to sign_in_path
    else
      render :new
    end
  end

  def new
    @user = User.new
  end

  def edit
    
  end

  def show
    
  end

  def update
    
  end

  def delete
    
  end

private

  def users_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end