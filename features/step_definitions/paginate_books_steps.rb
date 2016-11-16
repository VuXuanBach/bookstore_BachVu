Given(/^There are (\d+) books$/) do |total_book_number|
  cat = create(:category)
  create_list(:book, total_book_number, categories: [cat])
end

Then(/^I should see (\d+) books$/) do |book_number_page|
  expect(page).to have_css('.book-title', count: book_number_page)
end

When(/^I change number of book per page to (\d+)$/) do |book_number_page|
  find('#dropdown-max-books').click
  click_on book_number_page
end

When(/^I click "([^"]*)"$/) do |link|
  click_on link
end
