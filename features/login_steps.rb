Given(/^I have an account$/) do
  User.create(:email => 'test@google.com', :password => 'abc123', :username => 'Test')
end

When(/^I go to the login page$/) do
  visit sign_in_path
end

When(/^I fill in login information$/) do
  fill_in 'Email', :with => 'test@google.com'
  fill_in 'Password', :with => 'abc123'
  click_button 'Sign In'
end

Then(/^I am sent to the scorecards index$/) do
  page.should have_content 'New Scorecard'
end
