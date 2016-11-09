When(/^I visit home page$/) do
  visit root_path
end

Given(/^I am already logged into the system$/) do
  @user = create(:user, confirmed_at: Time.current)

  visit new_user_session_path
  fill_in 'Email', with: @user.email
  fill_in 'Password', with: @user.password
  click_button 'Send'
end

Given(/^There is a list of categories$/) do
  (0..2).each do |i|
    create(:category, name: "category#{i}")
  end
end

When(/^I click Categories dropdown list$/) do
  click_on 'Categories'
end

Then(/^I should see list of categories$/) do
  (0..2).each do |i|
    expect(page).to have_content("category#{i}")
  end
end
