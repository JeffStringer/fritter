class RegistrationsController < Devise::RegistrationsController

  def index
    @users = User.all

    respond_to do |format|
      format.json { render :json => @users }
    end
  end

  def auth_options
    super.merge(recall: "#{controller_path}#failure")
  end

  def failure
    respond_to do |format|
      format.json { render json: {errors: ""}, :status => 401 }
    end
  end

  private
 
  def sign_up_params
    params.require(:user).permit(:username, :handle, :email, :password, :password_confirmation)
  end
 
  def account_update_params
    params.require(:user).permit(:username, :handle, :email, :password, :password_confirmation, :current_password)
  end
end