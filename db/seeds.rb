category_list = [
  [ 'Art, Architecture', 0 ],
  [ 'African Americans', 1 ],
  [ 'Music/Film/TV', 2 ],
  [ 'Biography', 3 ],
  [ 'Business', 4 ],
  [ 'Computer & Technology', 5 ],
  [ 'Cookbooks, Food & Wine', 6 ],
  [ 'Education', 7 ],
  [ 'Game', 8 ],
  [ 'History', 9 ],
  [ 'Law', 10 ],
  [ 'Medical', 11 ]
]

Category.destroy_all
category_list.each do |name, sort_order|
  Category.create!(name: name, sort_order: sort_order)
end
