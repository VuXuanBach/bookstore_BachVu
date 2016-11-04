Given(/^I visit admin page$/) do
  visit rails_admin.dashboard_path
end

Then(/^I should see Site Administration$/) do
  expect(page).to have_content('Site Administration')
end
