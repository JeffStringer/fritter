class Message < ActiveRecord::Base
  validates_presence_of :fweet
  belongs_to :user
end