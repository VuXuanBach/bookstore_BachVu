When(/^I visit index page$/) do
  visit root_path
end

Given(/^I am already logged into the system$/) do
  @user = create(:user, confirmed_at: Time.current)

  visit new_user_session_path
  fill_in "Email", with: @user.email
  fill_in "Password", with: @user.password
  click_button "Send"
end
