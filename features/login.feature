Feature: Login

  Scenario: A visitor creates an account
    Given they click on "register"
      And they fill in the registration form
    When they press submit
    Then there should be 1 users in the database

  Scenario: A visitor logs in
    Given a visitor has an account
    When they click on "login"
      And they fill in the login form
      And they press submit
    Then they should be logged in