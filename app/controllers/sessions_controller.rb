class SessionsController < ApplicationController
  # skip_before_action :login_required, only: [:new, :create]
  # skip_before_action :forbid_login_user, only: [:destroy]
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to user_path(user.id)
    else
      @error_message = "email もしくは password が違います"
      @email = params[:session][:email]
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to new_session_path
  end
end
