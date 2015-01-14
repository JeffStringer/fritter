class User < ActiveRecord::Base
  after_create :send_email
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :handle
  validates_presence_of :username
  has_many :messages

  def send_email
    UserMailer.user_email(self).deliver
  end
end
