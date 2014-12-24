class Message < ActiveRecord::Base
  validates_presence_of :fweet
  validates_presence_of :now
  after_save :update_now
  belongs_to :user

  def as_json(options = {})
    super(options.merge(include: :user))
  end

  def time_now
    time = Time.now.strftime("%B %e, %Y %l:%M %p ")
  end

  private

    def update_now
      self.now = self.created_at.strftime("%B %e, %Y %l:%M %p ")
    end
end