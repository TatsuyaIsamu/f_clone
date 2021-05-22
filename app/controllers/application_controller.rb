class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :login_required
  before_action :forbid_login_user
  private
  def login_required
    redirect_to new_session_path unless current_user
  end

  def forbid_login_user
    redirect_to "/" if current_user.present?
  end
end
