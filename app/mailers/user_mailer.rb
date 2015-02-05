class UserMailer < ActionMailer::Base
  default from: "do-not-reply@example.com"

  def signup_email(user)
    @user = user

    mail(to: user.email, from: "jeff.j.stringer@gmail.com", subject: "Welcome to Fritter!") do |format|
      format.html 
      format.text
    end   
  end

  def user_email(user)
    @user = user

    mail(from: user.email, to: "jeff.j.stringer@gmail.com", subject: "Behold: a fritterite has embarked!") do |format|
      format.html 
      format.text
    end   
  end

  def tagged_email(user, tagged, message)
    @user = user
    @tagged = tagged
    @message = message

    mail(from: "jeff.j.stringer@gmail.com", to: tagged.email, subject: "It's Fritter Time!") do |format|
      format.html 
      format.text
    end
  end

  def followed_email(user, followed)
    @user = user
    @followed = followed

    mail(from: "jeff.j.stringer@gmail.com", to: followed.email, subject: "Fritter: You are being followed!") do |format|
      format.html 
      format.text
    end
  end
end
