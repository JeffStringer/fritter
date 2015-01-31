FactoryGirl.define do
  factory :user do
    email 'user@gmail.com'
    username 'User 1'
    handle 'user1'
    password 'password'
    password_confirmation 'password'
  end

  factory :user2, class: User do
    email 'user2@gmail.com'
    username 'User 2'
    handle 'user2'
    password 'password'
    password_confirmation 'password'
  end

  factory :message do
    fweet "You know I'm all about that bass no treble!"
  end

  factory :message2, class: Message do
    fweet "Ruby is awesome! @user1"
    now "yes!"
  end
end