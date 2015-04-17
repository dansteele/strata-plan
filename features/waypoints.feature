 Feature: Waypoints 

  Background: Setup map
    Given they are on the home page
      And a traveller has signed up
      And a traveller is looking at a map
      And the last traveller has some waypoints
      And they click on "My journeys"
    When they click on "My new journey"

    @javascript
    Scenario: Load a journey
      Then they should see their waypoints

    @javascript @wip
    Scenario: Delete a waypoint
      When they click on ".delete-button" for the first waypoint
      Then they should no longer have that waypoint