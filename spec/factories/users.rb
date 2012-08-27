FactoryGirl.define do
  factory :user do
    provider "weibo"
    sequence(:uid) {|n| "uid_#{n}"}
    sequence(:name) {|n| "person_#{n}"}
    sequence(:image_url) {|n| "http://weibo.com/images/#{n}.png"}
  end
end
