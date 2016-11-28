Given(/^I login as a normal user$/) do
  @user = create(:user)

  visit new_user_session_path
  fill_in 'Email', with: @user.email
  fill_in 'Password', with: @user.password
  click_button 'Send'
end

Given(/^I login as an admin$/) do
  @user = create(:admin)

  visit new_user_session_path
  fill_in 'Email', with: @user.email
  fill_in 'Password', with: @user.password
  click_button 'Send'
end
