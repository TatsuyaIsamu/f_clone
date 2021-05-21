class UsersController < ApplicationController

  before_action :catch_user, only:[:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_para)
    if @user.save
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_para)
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to new_user_path
  end

  private
   def user_para
    params.require(:user).permit(:name, :email, :password)
   end
   
   def catch_user
    @user = User.find_by(id: params[:id])
   end
end
