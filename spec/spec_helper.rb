require 'coveralls'
Coveralls.wear!

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.before :each do
    ActionMailer::Base.deliveries.clear
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end

def sign_up(first_name, last_name, username, email, password, confirm_password)
  visit root_path
  click_link("Sign Up")
  fill_in "First Name", with: first_name
  fill_in "Last Name", with: last_name
  fill_in "Username", with: username
  fill_in "Email", with: email
  fill_in "Enter Password", with: password
  fill_in "Confirm Password", with: confirm_password
  click_button "Sign Up"
end

def user_sign_in(user)
  visit root_path
  click_link("Sign In")
  fill_in "Email", with: user.email
  fill_in "Password", with: user.password
  click_button "Sign In"
end

def update_user(first_name, last_name, username, email, current, password)
  click_link "My Profile"
  click_link "Edit Profile"
  fill_in "First Name", with: first_name
  fill_in "Last Name", with: last_name
  fill_in "Username", with: username
  fill_in "Email", with: email
  fill_in "Current Password", with: current
  fill_in "Enter Password", with: password
  fill_in "Confirm Password", with: password
  click_button "Update"
end

def sign_in(email, password)
  visit root_path
  click_link("Sign In")
  fill_in "Email", with: email
  fill_in "Password", with: password
  click_button "Sign In"
end

def user_sign_out(user)
  visit root_path
  click_link("Sign Out")
end
