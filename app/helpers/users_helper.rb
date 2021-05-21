module UsersHelper
  
  def confirm_new_or_edit
    unless @user.id? # params[:commit] == 'Create Blog'
      users_path # create
    else
      user_path #update
    end
  end

    def confirm_form_method 
      @user.id ? 'patch' : 'post' # 作成時はpost, 編集時は patchを指定
    end

    def new_or_edit
      if action_name == "new" ||action_name == "create"
        confirm_users_path
      elsif action_name == "edit" ||action_name == "update"||action_name == "confirm"
        confirm_user_path
      end
    end
end
