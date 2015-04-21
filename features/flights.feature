Feature: Flight
  
  Background: Setup user
    Given they are on the home page
      And a traveller has signed up
    When they click on "My trips"
    When they click on "My flights"
      And there are airports in the database
    
    Scenario: A traveller starts a new flight
      Given they click on "New flight"
      When create a flight for 2 people from "Swansea, UK" to "Dusseldorf, Germany"
      Then they should see "SWS" and "QDU"
        And they should see "Swansea" and "Dusseldorf"