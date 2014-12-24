FactoryGirl.define do
  factory :user do
    email 'user@example.com'
    username 'User 1'
    handle 'user1'
    password 'password'
    password_confirmation 'password'
  end

  factory :message do
    fweet "You know I'm all about that bass no treble!"
    now "December 23, 2014  5:41 PM "
  end
end