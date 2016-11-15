class UsersController < ApplicationController
  helper_method :user
  def create
    user(users_params)
    if @user.save
      flash[:seccess] = t('flash.seccess')
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
    render text: t(:err401), status: 401 if User.find(params[:id])!=current_user
  rescue ActiveRecord::RecordNotFound
    render file: '../../public/404.html', status: 404 
  end

  def update
    current_user.update(users_params)
    redirect_to current_user  
  end

  def destroy
    current_user.destroy
    redirect_to sign_in_path(locale: I18n.locale)
  end

private
  def user(args = nil)
    @user ||= User.new(args)
  end

  def users_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :locale)
  end
end