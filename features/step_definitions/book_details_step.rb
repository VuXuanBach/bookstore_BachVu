When(/^I click on details of a book$/) do
  @book = Book.first
  click_link("more-details-#{@book.id}")
end

Then(/^I should see that book details$/) do
  expect(page).to have_content(@book.title)
  expect(page).to have_content(@book.author_name)
  expect(page).to have_content(@book.description)
  expect(page).to have_content(@book.publisher_name)
  expect(page).to have_content(@book.published_date)
  expect(page).to have_content(@book.unit_price)
end

Then(/^I should not see another book details$/) do
  expect(page).not_to have_content(Book.second.title)
end

When(/^I go to the random book area$/) do
  visit '/books/1'
end
