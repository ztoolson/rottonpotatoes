require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))
#require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "selectors"))


module WithinHelpers
  def with_scope(locator)
    locator ? within(*selector_for(locator)) { yield } : yield
  end
end
World(WithinHelpers)

Given /^(?:|I )am on (.+)$/ do |page_name|
  visit path_to(page_name)
end

When /^(?:|I )fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

When /^(?:|I )press "([^"]*)"$/ do |button|
  click_button(button)
end

When /^(?:|I )follow the "([^"]*)"$/ do |link|
  click_link(link)
end

When /^(?:|I )follow "([^"]*)"$/ do |link|
  click_link(link)
end
When /^(?:|I )follow "([^"]*)" again$/ do |link|
  click_link(link)
end

Then /^(?:|I )should be on (.+)$/ do |page_name|
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should
    expect(current_path).to eq path_to(page_name)
  else
    assert_equal path_to(page_name), current_path
  end
end

When /^I select "(.*?)" from "(.*?)"$/ do |value, field|
#  field = field.gsub(' ', '_').downcase
  select(value, from: field)
end

When /^(?:|I )check "([^"]*)"$/ do |field|
    check(field)
end

When /^(?:|I )uncheck "([^"]*)"$/ do |field|
    uncheck(field)
end
