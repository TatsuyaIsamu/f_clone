class HomeController < ApplicationController
  skip_before_action :login_required, only: [:top]
  skip_before_action :forbid_login_user, only: [:top]
  def top
  end
end
