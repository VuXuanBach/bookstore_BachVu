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
