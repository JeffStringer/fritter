describe Message do
  it { should validate_presence_of :fweet}
  it { should ensure_length_of(:fweet).is_at_most(140) }
  it { should belong_to :user}
end