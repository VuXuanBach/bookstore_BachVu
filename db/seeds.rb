Category.destroy_all
Book.destroy_all

category_list = [
  [ 'Arts & Photography', 0 ],
  [ 'Music/Film/TV', 1 ],
  [ 'Business', 2 ],
  [ 'Computer & Technology', 3 ],
  [ 'History' ]
]

book_photo_list = [
  'book_cover_1.jpg',
  'book_cover_2.jpg',
  'book_cover_3.jpg',
  'book_cover_4.jpg'
]

category_list.each do |name, sort_order|
  category = Category.create!(name: name, sort_order: sort_order)
  FactoryGirl.create_list(:book_photo, 20, categories: [category])
end
