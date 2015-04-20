When(/^they click on "(.*?)" for the first waypoint$/) do |css|
  first(css).click
end

Then(/^they should no longer have that waypoint$/) do
  sleep 2
  expect(Traveller.last.journeys.last.waypoints.count).to be 2
end