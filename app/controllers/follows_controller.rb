class FollowsController < ApplicationController

  def index
    @users = User.all
    unless current_user === nil
      @following = []
      @followers = []
      current_user.following.each { |f| @following << f.user }
      current_user.followers.each { |f| @followers << f.user }
    else
      @following = []
      @followers = []
    end  

    respond_to do |format|
      format.json { render :json => { following: @following, followers: @followers, users: @users, user: current_user } }
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
