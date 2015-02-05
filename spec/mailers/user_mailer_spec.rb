RSpec.describe UserMailer, :type => :mailer do
  describe "email sent to user when user signs up" do
    let(:user) { FactoryGirl.create(:user) }
    let(:mail) { UserMailer.signup_email(user) }

    it "renders the headers" do
      expect(mail.subject).to eq("Welcome to Fritter!")
      expect(mail.to).to eq(["user@gmail.com"])
      expect(mail.from).to eq(["jeff.j.stringer@gmail.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match(user.username)
    end
  end

  describe "email sent to admin when new user signs up" do
    let(:user) { FactoryGirl.create(:user) }
    let(:mail) { UserMailer.user_email(user) }

    it "renders the headers" do
      expect(mail.subject).to eq("Behold: a fritterite has embarked!")
      expect(mail.to).to eq(["jeff.j.stringer@gmail.com"])
      expect(mail.from).to eq(["user@gmail.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match(user.email)
    end
  end

  describe "user receives email if tagged in message" do
    let(:user) { FactoryGirl.create(:user) }
    let(:user2) { FactoryGirl.create(:user2) }
    let(:message2) { FactoryGirl.create(:message2) }
    let(:mail) { UserMailer.tagged_email(user2, user, message2) }

    it "renders the headers" do
      expect(mail.subject).to eq("It's Fritter Time!")
      expect(mail.to).to eq(["user@gmail.com"])
      expect(mail.from).to eq(["jeff.j.stringer@gmail.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match(user2.handle)
    end
  end

  describe "user receives email when followed" do
    let(:user) { FactoryGirl.create(:user) }
    let(:user2) { FactoryGirl.create(:user2) }
    let(:mail) { UserMailer.followed_email(user2, user) }

    it "renders the headers" do
      expect(mail.subject).to eq("Fritter: You are being followed!")
      expect(mail.to).to eq(["user@gmail.com"])
      expect(mail.from).to eq(["jeff.j.stringer@gmail.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match(user2.handle)
    end
  end
end
