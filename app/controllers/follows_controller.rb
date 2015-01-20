class FollowsController < ApplicationController

  def index
    @followings = current_user.following

    respond_to do |format|
      format.json { render :json => @followings }
    end
  end

  def create
    @user = User.find(params["user_id"])
    @following = @user.followers.new(follower_id: current_user.id)

    if @following.save
      respond_to do |format|
        format.html do
          redirect_to root_path
        end
        format.json { render :json => @following, :status => 201 }
      end
    end
  end

end
