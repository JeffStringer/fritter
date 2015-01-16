describe User do
  it { should have_many :messages }
  it { should validate_presence_of :username}
  it { should validate_presence_of :handle}
end
