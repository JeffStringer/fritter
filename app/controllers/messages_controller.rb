class MessagesController < ApplicationController
  
  def index
    @messages = []
    unless current_user == nil
      @myMessages = current_user.messages 
      @messages << current_user.messages 
      current_user.following.each { |f| @messages << f.user.messages } 
      @messages.flatten!
    end

    respond_to do |format|
      format.json { render :json => { messages: @messages, myMessages: @myMessages } }
    end
  end

  def create
    @message = Message.new(user_id: current_user.id, fweet: params[:message])
    unless @message.fweet == {}
      handle = @message.fweet.scan(/@\w+/).pop
      unless handle.nil?
        handle.slice!(0)
        tagged = User.find_by(handle: handle)
        # UserMailer.tagged_email(current_user, tagged, @message.fweet).deliver
      end
    end

    if @message.save
      respond_to do |format|
        format.html do
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

private

  def message_params
    params.require(:message).permit(:user_id, :message, :id, :fweet)
  end
end
