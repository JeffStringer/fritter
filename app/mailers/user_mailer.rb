class UserMailer < ActionMailer::Base
  default from: "do-not-reply@example.com"

  def user_email(user)
    @user = user

    mail(from: user.email, to: "jeff.j.stringer@gmail.com", subject: "Behold: a fritterite has embarked!") do |format|
      format.html 
      format.text
    end   
  end
end
