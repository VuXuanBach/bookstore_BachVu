When(/^I click Add to cart of first book$/) do
  click_link("add-to-cart-#{Book.first.id}")
end

When(/^I click Add to cart of that book$/) do
  click_on 'Add'
end

When(/^I click Add to cart of last book$/) do
  click_link("add-to-cart-#{Book.last.id}")
end
