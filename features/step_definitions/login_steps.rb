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
end

Then(/^there should be (\d+) users in the database$/) do |traveller_count|
  expect(Traveller.count).to eq traveller_count
end

Given(/^a visitor has an account$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^they fill in the login form$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^they should be logged in$/) do
  pending # express the regexp above with the code you wish you had
end
