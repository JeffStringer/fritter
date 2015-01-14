RSpec.describe UserMailer, :type => :mailer do
  describe "new_user" do
    let(:user) { FactoryGirl.create(:user) }
    let(:mail) { UserMailer.user_email(user) }

    it "renders the headers" do
      expect(mail.subject).to eq("Behold: a fritterite has embarked!")
      expect(mail.to).to eq(["jeff.j.stringer@gmail.com"])
      expect(mail.from).to eq(["do-not-reply@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match(user.email)
    end
  end
end
