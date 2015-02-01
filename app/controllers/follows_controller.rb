class FollowsController < ApplicationController

  def index
    @users = User.all
    unless current_user === nil
      @following = []
      @followers = []
      current_user.following.each { |f| @following << f.user }
      current_user.followers.each do |f| 
        follower = User.find(f.follower_id)
        @followers << follower
      end
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
    UserMailer.followed_email(current_user, @user).deliver

    if @following.save
      respond_to do |format|
        format.html do
          redirect_to root_path
        end
        format.json { render :json => @following, :status => 201 }
      end
    end
  end

  def destroy
    @following = current_user.following.find_by(user_id: params[:id].to_i)
    @following.destroy

    respond_to do |format|
      format.html do
        redirect_to root_path
      end
      format.json { head :no_content }
    end
  end
end
