Category.destroy_all
Book.destroy_all

category_list = [
  [ 'Arts & Photography', 0 ],
  [ 'Music/Film/TV', 1 ],
  [ 'Business', 2 ],
  [ 'Computer & Technology', 3 ],
  [ 'History' ]
]

category_list.each do |name, sort_order|
  category = Category.create!(name: name, sort_order: sort_order)

  (0..20).each do |i|
    category.books.create!(title: Faker::App.name, description: Faker::Lorem.paragraph,
                           author_name: Faker::Book.author, publisher_name: Faker::Book.publisher,
                           published_date: Faker::Date.between(10.years.ago, Date.today),
                           unit_price: Faker::Commerce.price)
  end
end
