When(/^I click on details of a book$/) do
  first('.book-list').click_link('more details')
end

Then(/^I should see that book details$/) do
  book = Book.first
  expect(page).to have_content(book.title)
  expect(page).to have_content(book.author_name)
  expect(page).to have_content(book.description)
  expect(page).to have_content(book.publisher_name)
  expect(page).to have_content(book.published_date)
  expect(page).to have_content(book.unit_price)
end

Then(/^I should not see another book details$/) do
  expect(page).not_to have_content(Book.second.title)

end
