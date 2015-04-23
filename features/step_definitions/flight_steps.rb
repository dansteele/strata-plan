When(/^there are airports in the database$/) do
  require "./db/seeds"
  # Airport.create!(name: "Swansea", longitude: -4.067778, latitude: 51.605278)
  # Airport.create!(name: "Dusseldorf", longitude: 6.766667, latitude: 51.289444)
end

When(/^create a flight for (\d+) people from "(.*?)" to "(.*?)"$/) do |people, start, finish|
  MockShortener::mock start, "swansea"
  MockShortener::mock finish, "dusseldorf"
  start_city, start_country = start.split ", "
  finish_city, finish_country = finish.split ", "
  fill_in "Name", with: "Test"
  select people, from: "Passengers"
  fill_in "Start city", with: start_city
  fill_in "Start country", with: start_country
  fill_in "End city", with: finish_city
  fill_in "End country", with: finish_country
  click_on "Create Flight"
end

Then(/^they should see "(.*?)" and "(.*?)"$/) do |item1, item2|
  expect(page.has_content? item1).to be true
  expect(page.has_content? item2).to be true
end
