class UsersController < ApplicationController

  before_action :catch_user, only:[:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_para)
    if params[:back]
      render :new
    else
      if @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user.id)
      else
        render :new
      end
    end
  end

  def show
  end

  def edit
  end

  def update

    if params[:back]
      render :edit
    else
      if @user.update(user_para)
        redirect_to user_path(@user.id)
      else
        render :edit
      end
    end
  end

  def destroy
    @user.destroy
    redirect_to new_user_path
  end

  def confirm
    @user = User.new(user_para)
    @user.id = params[:id]
    if @user.id
      render :edit if @user.invalid?
    else
      render :new if @user.invalid?
    end
  end

  private
   def user_para
    params.require(:user).permit(:id, :name, :email, :password)
   end
   
   def catch_user
    @user = User.find_by(id: params[:id])
   end
end
