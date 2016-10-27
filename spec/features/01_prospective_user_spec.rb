require "rails_helper"

feature "Prospective user" do
  let!(:first_name) { "" }
  let!(:last_name) { "" }
  let!(:username) { "" }
  let!(:email) { "" }
  let!(:enter_password) { "" }
  let!(:confirm_password) { "" }
  let!(:user_first_name) { "emma" }
  let!(:user_last_name) { "watson" }
  let!(:user_username) { "emmawatson" }
  let!(:user_email) { "emmawatson@gmail.com" }
  let!(:user_enter_password) { "emmawatson" }
  let!(:user_confirm_password) { "emmawatson" }
  let!(:user2) { FactoryGirl.create(:user, username: "username12345") }
  let!(:user3) { FactoryGirl.create(:user, email: "email12345@gmail.com") }
  let!(:existing_username) { "username12345" }
  let!(:existing_email) { "email12345@gmail.com" }
  let!(:bad_password) { "abc" }

  context "successfully signs up" do
    scenario "by clicking sign up link and seeing the fields for registration" do
      visit "/"
      click_link("Sign Up")

      expect(page).to have_content("First Name")
      expect(page).to have_content("Last Name")
      expect(page).to have_content("Username")
      expect(page).to have_content("Email")
      expect(page).to have_content("Password")
      expect(page).to have_content("Password Confirmation")
    end

    scenario "by filling in sign-up form correctly and "\
    " seeing flash message confirming signup" do
      sign_up(user_first_name, user_last_name, user_username, user_email, user_enter_password, user_confirm_password)

      expect(page).to have_content("You have signed up successfully.")
    end
  end

  context "unsuccesfully signs up" do
    scenario "by leaving first name blank and seeing flash message with error" do
      sign_up(first_name, user_last_name, user_username, user_email, user_enter_password, user_confirm_password)

      expect(page).to have_content("First name can't be blank")
    end

    scenario "by leaving last name blank and seeing flash message with error" do
      sign_up(user_first_name, last_name, user_username, user_email, user_enter_password, user_confirm_password)

      expect(page).to have_content("Last name can't be blank")
    end

    scenario "by leaving username blank and seeing flash message with error" do
      sign_up(user_first_name, user_last_name, username, user_email, user_enter_password, user_confirm_password)

      expect(page).to have_content("Username can't be blank")
    end

    scenario "by leaving email blank and seeing flash message with error" do
      sign_up(user_first_name, user_last_name, user_username, email, user_enter_password, user_confirm_password)

      expect(page).to have_content("Email can't be blank")
    end

    scenario "by leaving Enter Password field blank and seeing flash message with error" do
      sign_up(user_first_name, user_last_name, user_username, user_email, enter_password, user_confirm_password)

      expect(page).to have_content("Password can't be blank")
    end

    scenario "by leaving Confirm Password field blank and seeing flash message with error" do
      sign_up(user_first_name, user_last_name, user_username, user_email, user_enter_password, confirm_password)

      expect(page).to have_content("Password confirmation doesn't match")
    end

    scenario "by selecting username that is taken and is prompted to choose another" do
      sign_up(user_first_name, user_last_name, existing_username, user_email, user_enter_password, confirm_password)

      expect(page).to have_content("Username has already been taken")
    end

    scenario "by selecting email that is already used and is prompted to choose another" do
      sign_up(user_first_name, user_last_name, user_username, existing_email, user_enter_password, confirm_password)

      expect(page).to have_content("Email has already been taken")
    end

    scenario "by selecting malformed password and is prompted to choose another" do
      sign_up(user_first_name, user_last_name, user_username, user_email, bad_password, bad_password)

      expect(page).to have_content(
        "Password is too short (minimum is 6 characters)"
      )
    end
  end
end
