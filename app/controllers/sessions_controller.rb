class SessionsController < ApplicationController
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
end
