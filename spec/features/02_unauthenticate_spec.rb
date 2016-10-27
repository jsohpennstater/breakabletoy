require "rails_helper"

feature "Unauthenticated user" do
  let!(:user) { FactoryGirl.create(:user, email: "emmawatson@gmail.com", password: "sixchar1") }
  let!(:incorrect_email) { "six" }
  let!(:incorrect_password) { "six" }

  context "successfully logins in" do
    scenario "by clicking login in link" do
      visit "/"
      click_link("Sign In")

      expect(page).to have_content("Email")
      expect(page).to have_content("Password")
    end

    scenario "by logging in as a user correctly and is"\
    " redirected to the homepage" do
      user_sign_in(user)

      expect(page).to have_content("You have signed in successfully.")
      expect(page).to have_current_path("/")
    end
  end

  context "unsuccesfully logins in" do
    scenario "by filling in the sign-in form incorrectly and seeing flash"\
    " message with error" do
      email = "emmawatson@gmail.com"
      sign_in(email, incorrect_password)

      expect(page).to have_content("Invalid Email or password.")
    end

    scenario "by filling in sign-up form incorrectly and seeing flash"\
    " message with error" do
      sign_in(incorrect_email, incorrect_password)

      expect(page).to have_content("Invalid Email or password.")
    end
  end
end
