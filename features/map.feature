Feature: Map

  Background: Setup user
    Given they are on the home page
      And a traveller has signed up

    Scenario: View the map
      Given a traveller starts a new journey
        And they are looking at the new journey
      Then they should see a map

    @wip
    Scenario: Can only view their own map
      Given a traveller starts a new journey
        And they are looking at the new journey
        And they should see a map
      When there's another journey in the database
      Then they are redirected if they try and visit it