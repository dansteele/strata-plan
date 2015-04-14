Feature: Map

  Background: Setup user
    Given they are on the home page
      And a traveller has signed up

    Scenario: View the map
      Given a traveller starts a new jourmey
        And they are looking at the new journey
      Then they should see a map