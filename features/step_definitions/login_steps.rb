Given(/^they are on the home page$/) do
  visit '/'
end

Given(/^they click on "(.*?)"$/) do |target|
  click_on target
end

Given(/^they fill in the registration form$/) do
  page.fill_in 'Email', :with => "Bob" #faker
end

When(/^they press submit$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^there should be (\d+) users in the database$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Given(/^a visitor has an account$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^they click on "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

When(/^they fill in the login form$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^they should be logged in$/) do
  pending # express the regexp above with the code you wish you had
end
