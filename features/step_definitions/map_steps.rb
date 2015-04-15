Given(/^a traveller starts a new journey$/) do
  click_on "My journeys"
end

Given(/^they are looking at the new journey$/) do
  click_on "New journey"
  expect(page.has_content? "My new journey").to be true
end

Given(/^a traveller is looking at a map$/) do
  steps %Q{
    Given a traveller starts a new journey
    And they are looking at the new journey
    Then they should see a map
  }
end

When(/^they double click on the map$/) do
  2.times {find("#map-canvas").click}
end

Then(/^they should see a map$/) do
  expect(page.has_content? "map-canvas")
end

Then(/^they should have a new waypoint$/) do
  expect(page.all('.waypoint').count).to be 1
end