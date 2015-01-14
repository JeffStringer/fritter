class User < ActiveRecord::Base
  after_create :send_email
  after_create :subscription
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :handle
  validates_presence_of :username
  has_many :messages

  private

    def send_email
      UserMailer.user_email(self).deliver
      UserMailer.user_subscription(self).deliver
    end

    def subscription
      mailchimp = Gibbon::API.new
      result = mailchimp.lists.subscribe({
        :id => ENV['MAILCHIMP_LIST_ID'], 
        :email => {:email => self.email}, 
        :double_optin => false, 
        :update_existing => true,
        :send_welcome => true
      })
      Rails.logger.info("Subscribed #{self.email} to MailChimp") if result
    end
end
