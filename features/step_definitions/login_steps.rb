Given(/^they are on the home page$/) do
  visit '/'
end

Given(/^they click on "(.*?)"$/) do |target|
  click_on target
end

Given(/^they fill in the registration form$/) do
  traveller = build(:traveller)
  page.fill_in 'Email', with: traveller.email
  page.fill_in 'Password', with: traveller.password
  page.fill_in 'Password confirmation', with: traveller.password
end

Given(/^a traveller has signed up$/) do
  steps %Q{
    Given they click on "Register"
    And they fill in the registration form
    When they click on "Sign up"
  }
end

Then(/^they are logged out$/) do
  expect(page.has_content? "Sign in").to be true
end

Then(/^there should be (\d+) users in the database$/) do |traveller_count|
  expect(Traveller.count).to eq traveller_count.to_i
end