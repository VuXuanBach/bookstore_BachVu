Comment.destroy_all
Category.destroy_all
User.destroy_all
Book.destroy_all

admin_user = FactoryGirl.create(:admin, email: 'bach.vu@eastagile.com', password: 'bookstore123', password_confirmation: 'bookstore123', full_name: 'Bach Vu')
normal_user = FactoryGirl.create(:user, email: 'bach.vu+1@eastagile.com', password: 'bookstore123', password_confirmation: 'bookstore123', full_name: 'Van Swarm')

category_list = [
  [ 'Arts & Photography', 0 ],
  [ 'Music/Film/TV', 1 ],
  [ 'Business', 2 ],
  [ 'Computer & Technology', 3 ],
  [ 'History' ]
]

category_list.each do |name, sort_order|
  category = Category.create!(name: name, sort_order: sort_order)
  FactoryGirl.create_list(:book_photo, 20, categories: [category])
end

Book.all.each do |book|
  FactoryGirl.create(:comment, book: book, user: admin_user)
  FactoryGirl.create(:comment, book: book, user: normal_user)
end
