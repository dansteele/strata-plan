Given(/^a traveller starts a new journey$/) do
  click_on "My trips"
  click_on "My journeys"
end

Given(/^they are looking at the new journey$/) do
  click_on "New journey"
  fill_in "Name", with: "My new journey"
  click_on "Create Journey"
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
  WebMock.allow_net_connect!
  Traveller.last.journeys.last.waypoints << create(:waypoint)
  Traveller.last.journeys.last.waypoints << create(:waypoint)
  Traveller.last.journeys.last.waypoints << create(:waypoint)
end

When(/^there's another journey in the database$/) do
  @trav = create(:traveller)
  @trav.journeys << Journey.create(name: "Bob's journey")
  @trav.save!
end

Then(/^they are redirected if they try and visit it$/) do
  visit "/journey/#{Journey.last.id}"
  expect(page.has_content? "My journeys").to be true # Name of their own journey
end

Then(/^they should see their waypoints$/) do
  expect(page.all('.waypoint').count).to be 3
end

Then(/^they should see a map$/) do
  expect(page.has_content? "map-canvas")
end
