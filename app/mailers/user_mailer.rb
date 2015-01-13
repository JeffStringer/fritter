class UserMailer < ActionMailer::Base

  def user_email(user)
    @user = user

    mail from: user.email
    mail to: "jeff.j.stringer@gmail.com", subject: "New user"
  end
end
