FactoryGirl.define do
  factory :comment do
    user { create(:user) }
    book { create(:book) }

    rating { Faker::Number.between(Comment::MIN_RATING, Comment::MAX_RATING) }
    content { Faker::Lorem.paragraph }
  end
end
