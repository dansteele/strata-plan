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

Given(/^the last traveller has some waypoints$/) do
  Traveller.last.journeys.last.waypoints << create(:waypoint)
  Traveller.last.journeys.last.waypoints << create(:waypoint)
end

Then(/^they should see their waypoints$/) do
  expect(page.all('.waypoint').count).to be 2
end

Then(/^they should see a map$/) do
  expect(page.has_content? "map-canvas")
end
