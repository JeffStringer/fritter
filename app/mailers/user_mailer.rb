class UserMailer < ActionMailer::Base
  default from: "do-not-reply@example.com"

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

    mail(from: "jeff.j.stringer@gmail.com", to: tagged.email, subject: "You were mentioned in a post!") do |format|
      format.html 
      format.text
    end
  end
end
