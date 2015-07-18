Then /^I should see "(.*)"$/ do |movie|
  page.should have_content(movie)
end
