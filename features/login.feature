Feature: Login

  Background: I am on the home page
    Given they are on the home page

    Scenario: A visitor creates an account
      Given they click on "Register"
        And they fill in the registration form
      When they click on "Sign up"
      Then there should be 1 users in the database

    Scenario: A traveller logs out
      Given a traveller has signed up
      When they click on "Sign out"
      Then they are logged out