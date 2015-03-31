FactoryGirl.define do
  factory :user do
    username('bob')
    email('bob@bob.com')
    password('asdf;lkj')
  end

  factory :question do
    inquiry 'This is my question'
    post 'Here is further explanation of my question'
  end
end
