FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "person_#{n}@example.com" }
    password { Faker::Internet.password(8) }
    password_confirmation { password }
    confirmed_at Time.current
    full_name { Faker::Name.name }

    factory :admin do
      admin true
    end
  end

  factory :category do
    sequence(:name) { |n| "#{Faker::Name.name}#{n}" }
    sequence(:sort_order) { |n| n }
  end

  factory :book do
    categories { [create(:category)] }

    title { Faker::Book.title }
    description { Faker::Lorem.paragraph }
    author_name { Faker::Book.author }
    publisher_name { Faker::Book.publisher }
    published_date { Faker::Date.between(2.years.ago, Date.today) }
    unit_price { Faker::Commerce.price }

    factory :book_photo do
      book_photo_list = [
        'book_cover_1.jpg',
        'book_cover_2.jpg',
        'book_cover_3.jpg',
        'book_cover_4.jpg'
      ]
      photo { File.new("#{Rails.root}/app/assets/images/#{book_photo_list.sample}") }
    end

    factory :unique_search_title do
      sequence(:title) { |n| "#{n}" }
    end
  end

  factory :comment do
    user { create(:user) }
    book { create(:book) }

    rating { Faker::Number.between(Comment::MIN_RATING, Comment::MAX_RATING) }
    content { Faker::Lorem.paragraph }
    commented_time { Faker::Time.between(10.days.ago, Date.today, :all) }
  end
end
