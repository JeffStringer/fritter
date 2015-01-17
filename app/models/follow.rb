class Follow < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :follower_id
  validates :user_id, uniqueness: { :scope => :follower_id }
  belongs_to :followed_users, class_name: 'User'
end