module UsersHelper
  
  def confirm_new_or_edit
    unless @user.id? 
      users_path 
    else
      user_path 
    end
  end

    def confirm_form_method 
      @user.id ? 'patch' : 'post' 
    end

    def new_or_edit
      if action_name == "new" ||action_name == "create"
        confirm_users_path
      elsif action_name == "edit" ||action_name == "update"||action_name == "confirm"
        confirm_user_path
      end
    end
end
