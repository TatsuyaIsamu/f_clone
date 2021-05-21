class UsersController < ApplicationController

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
   @user = User.find_by(id: params[:id])
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.update(user_para)
    redirect_to user_path(@user.id)
  end

  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy
    redirect_to new_user_path
  end

  private
   def user_para
    params.require(:user).permit(:name, :email, :password)
   end
end
