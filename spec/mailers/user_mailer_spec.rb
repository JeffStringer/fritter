RSpec.describe UserMailer, :type => :mailer do
  describe "email admin receives upon new user signing up" do
    let(:user) { FactoryGirl.create(:user) }
    let(:mail) { UserMailer.user_email(user) }

    it "renders the headers" do
      expect(mail.subject).to eq("Behold: a fritterite has embarked!")
      expect(mail.to).to eq(["jeff.j.stringer@gmail.com"])
      expect(mail.from).to eq(["user@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match(user.email)
    end
  end

  describe "email user receives upon new user signing up" do
    let(:user) { FactoryGirl.create(:user) }
    let(:mail) { UserMailer.user_subscription(user) }

    it "renders the headers" do
      expect(mail.subject).to eq("Welcome to Fritter!")
      expect(mail.to).to eq(["user@example.com"])
      expect(mail.from).to eq(["jeff.j.stringer@gmail.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match(user.email)
    end
  end
end
