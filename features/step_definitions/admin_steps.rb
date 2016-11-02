Given(/^a user visits admin page$/) do
  visit rails_admin.dashboard_path
end

Then(/^they should see Site Administration$/) do
  page.should have_content('Site Administration')
end
