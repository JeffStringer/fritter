class SessionsController < Devise::RegistrationsController

  def auth_options
    super.merge(recall: "#{controller_path}#failure")
  end

  def failure
    respond_to do |format|
      format.json { render json: {errors: "Login failed"}, :status => 422 }
    end
  end

end