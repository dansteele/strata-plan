Feature: Login

  Background: I am on the home page
    Given they are on the home page

    Scenario: A visitor creates an account
      Given they click on "Register"
        And they fill in the registration form
      When they click on "Sign up"
      Then there should be 1 users in the database

    Scenario: A visitor logs in
      Given a visitor has an account
      When they click on "login"
        And they fill in the login form
        And they press submit
      Then they should be logged in