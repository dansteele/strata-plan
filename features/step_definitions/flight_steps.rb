When(/^create a flight for (\d+) people from "(.*?)" to "(.*?)"$/) do |people, start, finish|
  fill_in "Passengers", with: people
  fill_in "Start", with: start
  fill_in "End", with: finish
end

Then(/^they should see "(.*?)" and "(.*?)"$/) do |iata1, iata2|
  expect(page.has_content? iata1).to be true
  expect(page.has_content? iata2).to be true
end
