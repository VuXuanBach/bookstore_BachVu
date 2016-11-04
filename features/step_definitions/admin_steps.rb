Given(/^I am a normal user$/) do
  @user = FactoryGirl.create(:user)

  visit new_user_session_path
  fill_in "Email", with: @user.email
  fill_in "Password", with: @user.password
  click_button "Send"
end

When(/^I visit admin page as normal user$/) do
  visit rails_admin.dashboard_path
end

Given(/^I am an admin$/) do
  @user = FactoryGirl.create(:admin)
  @user.confirmed_at = Time.current
  @user.save

  visit new_user_session_path
  fill_in "Email", with: @user.email
  fill_in "Password", with: @user.password
  click_button "Send"
end

When(/^I visit admin page as admin$/) do
  visit rails_admin.dashboard_path
end
