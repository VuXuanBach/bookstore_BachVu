Given(/^I login as a normal user$/) do
  @user = create(:user)

  visit new_user_session_path
  fill_in "Email", with: @user.email
  fill_in "Password", with: @user.password
  click_button "Send"
end

When(/^I visit admin page as normal user$/) do
  visit rails_admin.dashboard_path
end

Given(/^I login as an admin$/) do
  @user = create(:admin, confirmed_at: Time.current)

  visit new_user_session_path
  fill_in 'Email', with: @user.email
  fill_in 'Password', with: @user.password
  click_button 'Send'
end

When(/^I visit admin page as admin$/) do
  visit rails_admin.dashboard_path
end
