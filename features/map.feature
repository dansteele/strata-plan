Feature: Map

  Background: Setup user
    Given they are on the home page
      And a traveller has signed up

    Scenario: View the map
      Given a traveller starts a new journey
        And they are looking at the new journey
      Then they should see a map

    @javascript
    Scenario: Add a waypoint
      Given a traveller is looking at a map
      When they double click on the map
      Then they should have a new waypoint