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

Given(/^There are several comments belong to each book$/) do
  @first_book = Book.first
  @last_book = Book.last

  create_list(:comment, 3, book: @first_book, user: @user)
  create_list(:comment, 3, book: @last_book, user: @user)
end

When(/^I visit book details page$/) do
  visit "/books/#{@first_book.id}"
end

Then(/^I should see that book's comments$/) do
  @first_book.comments.each do |comment|
    expect(page).to have_content(comment.content)
    expect(page).to have_content(comment.commented_time)
  end
end

Then(/^I should not see another book's comments$/) do
  @last_book.comments.each do |comment|
    expect(page).not_to have_content(comment.content)
    expect(page).not_to have_content(comment.commented_time)
  end
end

When(/^I comment and rate that book$/) do

end

Then(/^I should see my new comment on that book$/) do

end
