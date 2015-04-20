When(/^create a flight for (\d+) people from "(.*?)" to "(.*?)"$/) do |people, start, finish|
  start_city, start_country = start.split ", "
  finish_city, finish_country = finish.split ", "
  select people, from: "Passengers"
  fill_in "Start city", with: start_city
  fill_in "Start country", with: start_country
  fill_in "End city", with: finish_city
  fill_in "End country", with: finish_country
  click_on "Create Flight"
end

Then(/^they should see "(.*?)" and "(.*?)"$/) do |iata1, iata2|
  expect(page.has_content? iata1).to be true
  expect(page.has_content? iata2).to be true
end
