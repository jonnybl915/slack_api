Given(/^I'm on the home page$/) do
  @web = Boomtown::Web.new
  @web.visit '/'
end

When(/^I search for "([^"]*)"$/) do |q|
  @web.search_for q
end

Then(/^"([^"]*)" appears in the filter list$/) do |arg|
  tags = @web.find('.bt-search-tags')
  spans = tags.find_elements(:css, 'span')
  tag = spans.find { |s| s.text == "Keyword: \"#{arg}\""}
  expect(tag).not_to eq nil
end

And(/^There are at least (\d+) results$/) do |count|
  results = @web.find '.results-paging'
  expect(results.text.to_i).to be > count
end

And(/^Each result is on (.*)$/) do
  pending
end