# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Movie.create!(movie)
  end
end

Then /I should see the following movies/ do |movies_table|
  movies_table.hashes.each do |movie|
    expect(page).to have_content(movie['title'])
  end
end

Then /I should not see the following movies/ do |movies_table|
  movies_table.hashes.each do |movie|
    expect(page).to_not have_content(movie['title'])
  end
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /"(.*)" should come before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  expect(page.body).to match(/#{e1}.+#{e2}/m)
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
  ratings = rating_list.gsub!(' ', '').split(',')
  ratings.map! { |rating| "ratings_#{rating}" } # match ratings to html id

  ratings.each do |rating|
    if uncheck
      uncheck(rating)
    else
      check(rating)
    end
  end
end

Then /I should see all the movies/ do
  # Make sure that all the movies in the app are visible in the table
  number_of_movies_on_page = page.all('table#movies tbody tr').count

  expect(Movie.count).to eq(number_of_movies_on_page)
end

Then /^I should see "(.*)"$/ do |content|
  expect(page).to have_content(content)
end
