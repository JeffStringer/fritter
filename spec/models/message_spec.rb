describe Message do
  it {should validate_presence_of :fweet}
  it {should belong_to :user}
end