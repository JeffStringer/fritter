class User < ActiveRecord::Base
  after_create :send_email, :signup_email
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :handle, :username
  validates_uniqueness_of :handle, :username
  has_many :messages
  has_many :followers, class_name: 'Follow', foreign_key: 'user_id', dependent: :destroy
  has_many :following, class_name: 'Follow', foreign_key: 'follower_id', dependent: :destroy
  has_many :followed_users, through: :following, source: :user

  private

    def send_email
      UserMailer.user_email(self).deliver
    end

    def signup_email
      UserMailer.signup_email(self).deliver
    end
end
