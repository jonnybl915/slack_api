Given(/^I'm on the home page$/) do
  @web = Boomtown::Web.new
  @web.visit '/'
end

When(/^I search for "([^"]*)"$/) do |q|
  @web.search_for q
end

Then(/^"([^"]*)" appears in the filter list$/) do |term|
  # tags = @web.find '.bt-search-tags'
  # spans = tags.find_elements css: 'span'
  spans = @web.find_all '.bt-search-tags span'
  tag = spans.find { |s| s.text == "Keyword: \"#{term}\"" }

  expect(tag).not_to eq nil
end

# And(/^There are at least (\d+) results$/) do |count|
#   pending
# end

And(/^there are at least (\d+) results$/) do |count|
  results = @web.wait_for '.results-paging'
  expect(results.text.to_i).to be > count.to_i
end

And(/^each result is in (.*)$/) do |location|
  links = @web.find_all 'a.at-related-props-card'
  # a .at-related-props-card - things with class inside a tags
  # a.at-related-props-card - a tags with class ...
  links.each do |link|
    id = something
    result = @api.get_property_details id
    expect(result['PublicRemarks']).to include location
  end
  pending
end


And(/^I click "Save This Search"$/) do
  el = @web.wait_for('a.js-save-search')
  el.click
  expect(el.text).to eq "Save This Search"
end

And(/^I complete registration$/) do
  @email = Faker::Internet.email

  # first registration modal
  input_el = @web.wait_for('.js-register-form input')
  input_el.send_keys(@email)

  pre_register_btn_el = @web.find('button.bt-squeeze__button')
  pre_register_btn_el.click


  # second registraton modal
  @my_name = Faker::Name.name
  @my_phone = Faker::PhoneNumber.phone_number
  name_input_el = @web.wait_for('input.at-fullName-txt')
  name_input_el.send_keys(@my_name)

  num_input_el = @web.find('input.at-phone-txt')
  num_input_el.send_keys(@my_phone)

  complete_registration_btn = @web.find('.at-complete-registration-btn')
  complete_registration_btn.click

  #   wait for registration to finish
  @web.wait_for 'a.js-signout'
end

And(/^I name the search "([^"]*)"$/) do |arg|
  form = @web.wait_for('#save-search-form')
  i = form.find_element(:name, 'searchName')
  i.send_keys(arg)
  form.find_element(:css, '.at-submit-btn').click
end

Then(/^I see "([^"]*)" in my saved search$/) do |arg|
  @web.visit '/notifications'
  first_link = @web.find '#searches a'
  expect(first_link.text).to eq arg
end

And(/^I have a user account$/) do
  @web.visit '/account'

  phone = @web.find '.at-phone-txt'
  expect(phone.text).to eq @my_phone
end


