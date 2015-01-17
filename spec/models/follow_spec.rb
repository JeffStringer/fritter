describe Follow do
  it { should belong_to :user }
  it { should validate_presence_of :follower_id }
  it { should validate_uniqueness_of(:user_id).scoped_to(:follower_id) }
end