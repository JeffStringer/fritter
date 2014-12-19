class Message < ActiveRecord::Base
  validates_presence_of :fweet
  belongs_to :user

  def as_json(options = {})
    super(options.merge(include: :user))
  end
end