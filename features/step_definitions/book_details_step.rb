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

  create_list(:comment, 3, book: @first_book)
  create_list(:comment, 3, book: @last_book)
end

Then(/^I should see that book's comments$/) do
  @first_book.comments.each do |comment|
    expect(page).to have_content(comment.content)
  end
end

Then(/^I should not see another book's comments$/) do
  @last_book.comments.each do |comment|
    expect(page).not_to have_content(comment.content)
  end
end

When(/^I comment and rate that book$/) do
  find("img[alt='4']").click
  fill_in 'comment-content', with: 'Good'
  click_on 'Send'
end

Then(/^I should see my new comment on that book$/) do
  expect(page).to have_content('Good')
end

Then(/^I should see previous book detail page$/) do
  expect(page).to have_content(@first_book.title)
  expect(page).to have_content(@first_book.comments.first.content)
end
