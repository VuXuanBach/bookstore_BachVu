Given(/^There is a list of categories named "([^"]*)"$/) do |cat_names|
  cat_names.split(/, ?/).each do |name|
    create(:category, name: name)
  end
end

Given(/^There is a list of books belong to each category with name "([^"]*)" and so on$/) do |book_names|
  Category.all.each do |cat|
    (1..2).each do |i|
      create(:book, title: "#{cat.name} Book#{i}", categories: [cat])
    end
  end
end

Given(/^Each book has author with name "([^"]*)" respectively$/) do |author_names|
  Category.all.each do |cat|
    cat.books.zip(author_names.split(/, ?/)).each do |book, author_name|
      book.update(author_name: author_name)
    end
  end
end

When(/^I search "([^"]*)"$/) do |search_input|
  fill_in 'search', with: search_input
  find('input[name=\'commit\']').click
end
