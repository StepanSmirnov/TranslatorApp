class UsersController < ApplicationController
  helper_method :user

  def create
    @user = User.new(users_params)
    if @user.save(users_params)
      flash[:secces] = 'Вы успешно зарегистрированы'
      redirect_to translate_path
    else
      render :new
    end
  end

  def new
    
  end

  def edit

  end

  def show
  
  end

  def update
    current_user.update(users_params)
    redirect_to current_user  
  end

  def destroy
    current_user.destroy
    redirect_to sign_in_path
  end

private
  def user
    @user ||= User.new  
  end

  def users_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end