class Message < ActiveRecord::Base
  validates_presence_of :fweet
  validates_length_of :fweet, :maximum => 140
  validates_presence_of :now
  belongs_to :user

  def as_json(options = {})
    super(options.merge(include: :user))
  end

  def time_now
    time = Time.now.strftime("%B %e, %Y %l:%M %p ")
  end
end