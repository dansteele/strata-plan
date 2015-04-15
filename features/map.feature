Feature: Map

  Background: Setup user
    Given they are on the home page
      And a traveller has signed up

    Scenario: View the map
      Given a traveller starts a new journey
        And they are looking at the new journey
      Then they should see a map

    @javascript
    Scenario: Load a journey
      Given the last traveller has some waypoints
      When a traveller is looking at a map
      Then they should see their waypoints