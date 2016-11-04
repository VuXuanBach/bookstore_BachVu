When(/^I visit index page$/) do
  visit root_path
end

Given(/^I am a user$/) do
  @user = FactoryGirl.create(:user)
  @user.confirmed_at = Time.current
  @user.save

  visit new_user_session_path
  fill_in "Email", with: @user.email
  fill_in "Password", with: @user.password
  click_button "Send"
end
