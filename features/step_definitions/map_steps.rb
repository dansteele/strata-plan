Given(/^a traveller starts a new jourmey$/) do
  click_on "My journeys"
end

Given(/^they are looking at the new journey$/) do
  click_on "New journey"
  expect(page.has_content? "My new journey").to be true
end

Then(/^they should see a map$/) do
  expect(page.has_content? "map-canvas")
end