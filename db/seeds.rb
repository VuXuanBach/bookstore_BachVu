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
  FactoryGirl.create_list(:book, 20, categories: [category])
end
