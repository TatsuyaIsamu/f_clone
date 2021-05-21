class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def create
    @user = User.new(name:"a",email:"b", password:"a" )
    @user.save
    redirect_to user_path(@user.id)
  end
  def show
   @user = User.find_by(id: params[:id])
  end
end
