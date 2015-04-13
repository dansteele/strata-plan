Feature: Map

  Background: Setup user
    Given they are on the home page
      And a traveller has signed up

    Scenario: View the map
      Given a traveller is on their first journey
      Then they should see a map