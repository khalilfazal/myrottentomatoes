FactoryGirl.define do
  factory :movie do
    title 'A Fake Title'
    rating 1
    release_date 10.years.ago
  end
end