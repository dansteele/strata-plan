Feature: Flight
  
  Background: Setup user
    Given they are on the home page
      And a traveller has signed up
    When they click on "My trips"
    When they click on "My flights"

    @wip
    Scenario: A traveller starts a new flight
      Given they click on "New flight"
      When create a flight for 2 people from "Heathrow" to "Dusseldorf"
      Then they should see "LHR" and "DUS"