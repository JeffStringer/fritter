class MessagesController < ApplicationController
  
  def index
    @messages = []
    unless current_user == nil
      @messages << current_user.messages 
      current_user.following.each { |f| @messages << f.user.messages } 
    end
    @messages.flatten!

    respond_to do |format|
      format.json { render :json => @messages }
    end
  end

  def create
    @message = Message.new
    @message.user_id = current_user.id
    @message.fweet = params[:message]
    @message.now = @message.time_now

    if @message.save
      respond_to do |format|
        format.html do
          flash[:notice] = "Message created."
          redirect_to root_path
        end
        format.json { render :json => @message, :status => 201 }
      end
    else
      respond_to do |format|
        format.html { redirect_to root_path }
        format.json { render json: { errors: @message.errors}, :status => 422 }
      end
    end
  end

  def update
    @message = Message.find(params[:id])
    if @message.update(message_params)
      respond_to do |format|
        format.html do
          flash[:notice] = "Message updated."
          redirect_to root_path
        end
        format.json { render :json => @message, :status => 201 }
      end
    else
      respond_to do |format|
        format.html { redirect_to root_path }
        format.json { render json: { errors: @message.errors}, :status => 422 }
      end
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy

    respond_to do |format|
      format.html do
        flash[:notice] = "Message deleted."
        redirect_to root_path
      end
      format.json { head :no_content }
    end
  end

private

  def message_params
    params.require(:message).permit(:user_id, :message, :id, :fweet, :now)
  end
end
