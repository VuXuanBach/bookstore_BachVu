When(/^I visit home page$/) do
  visit root_path
end

Given(/^I am already logged into the system$/) do
  @user = create(:user)

  visit new_user_session_path
  fill_in 'Email', with: @user.email
  fill_in 'Password', with: @user.password
  click_button 'Send'
end

Given(/^There is a list of categories$/) do
  @categories = create_list(:category, 2)
end

When(/^I click Categories dropdown list$/) do
  click_on @categories.first.name
end

Then(/^I should see list of categories$/) do
  @categories.each { |cat| expect(page).to have_content(cat.name) }
end

Given(/^There is a list of books$/) do
  @last_category = @categories.last
  @book1 = create(:book, categories: [@last_category])
  @book2 = create(:book, categories: [@categories.first])
end

When(/^I choose a category$/) do
  find('#dropdown-categories').click
  click_on @last_category.name
end

Then(/^I should see list of books belong to that category$/) do
  expect(page).to have_css("img[src*='missing']")
  expect(page).to have_content(@book1.title)
  expect(page).to have_content(@book1.author_name)
  expect(page).to have_content(@book1.description)
  expect(page).to have_content(@book1.unit_price)
  debugger
end

Then(/^I should not see list of books belong to other categories$/) do
  expect(page).not_to have_content(@book2.title)
end
