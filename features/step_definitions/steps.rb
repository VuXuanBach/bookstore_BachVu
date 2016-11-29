Given(/^I am an anonymous user$/) do
end

Then(/^I should see "([^"]*)"$/) do |content|
  content.split(/, ?/).each do |c|
    expect(page).to have_content(c)
  end
end

Then(/^I should not see "([^"]*)"$/) do |content|
  content.split(/, ?/).each do |c|
    expect(page).not_to have_content(c)
  end
end

When(/^I visit (.*?)$/) do |page_name|
  visit path_to(page_name)
end

Transform /^(-?\d+)$/ do |number|
  number.to_i
end

def path_to(page_name)
  case page_name
  when /admin page/
    rails_admin.dashboard_path
  when /home page/
    root_path
  when /edit profile page/
    edit_user_registration_path
  when /forgot password page/
    new_user_password_path
  when /login page/
    new_user_session_path
  when /registration page/
    new_user_registration_path
  when /book details page/
    book_path(@first_book)
  end
end
