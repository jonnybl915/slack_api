Given(/^I make my way to the home page$/) do
  Driver.get 'localhost:3000'
end

Then(/^I can post a todo$/) do
  todo_input = Driver.find_element :css, '.new-todo'
  todo_text = 'This is the TODO from the DRIVER'
  todo_input.send_keys(todo_text)
  todo_input.send_keys('13')

  todos = Driver.find_elements :css, '.view'
  todo = todos.select { |todo| todo.text == 'This is the TODO from the DRIVER'}.last
  puts todo
  # todo_input2 = Driver.find_element :css, '.new-todo'
  # todo_text2 = 'This is the SECOND  TODO from the DRIVER'
  # todo_input2.send_keys(todo_text2)
  # todo_input2.send_keys('13')


end


Then(/^The todo shows up in the todo list$/) do

  # channel_link = wait.until do
  #   el = headers.find { |b| b.text.start_with? 'CHANNELS' }
  #   el if el && el.displayed?
  # end
  # channel_link.click
  # ^^ wait example
  wait = Selenium::WebDriver::Wait.new timeout: 15

  todos = Driver.find_elements :css, '.view'

  todo = todos.select { |todo| todo.text == 'This is the TODO from the DRIVER'}.last

  expect(todo.text).to include 'This is the SECOND  TODO from the DRIVER'

end