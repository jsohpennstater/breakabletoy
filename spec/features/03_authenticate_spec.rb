require "rails_helper"

feature "Authenticated user" do
  let!(:user) { FactoryGirl.create(:user, email: "emmawatson@gmail.com", password: "sixchar1") }
  let!(:new_first_name) { "emma" }
  let!(:new_last_name) { "watson" }
  let!(:new_username) { "emmawatsonisthebest" }
  let!(:new_password) { "sixchar2" }
  let!(:first_name) { "" }
  let!(:last_name) { "" }
  let!(:username) { "" }
  let!(:email) { "" }
  let!(:password) { "" }

  context "successfully signs out" do
    scenario "by clicking sign out when logged in " do
      user_sign_in(user)
      click_link("Logout")

      expect(page).to have_content("You have signed out successfully.")
    end
  end

  context "successfully edits own account" do
    scenario "by signing in and clicking on the link my account,"\
    " which redirects the user to the user edit page" do
      user_sign_in(user)
      click_link "Edit Profile"

      expect(page).to have_current_path(edit_user_registration_path)
    end

    scenario " by filling in the necessary changes and"\
    " clicking save, which redirects the user to the home page with a "\
    "success message" do
      user_sign_in(user)
      update_user(new_first_name, new_last_name, new_username, user.email, user.password, new_password)

      expect(page).to have_content(
        "Your account has been updated successfully."
      )
    end

    scenario "by filling the username and password"\
    " incorrectly which redirects the user to the user edit page with an "\
    "error message" do
      user_sign_in(user)
      update_user(new_first_name, new_last_name, username, user.email, password, new_password)

      expect(page).to have_content("Current password can't be blank")
      expect(page).to have_content("Username can't be blank")
      expect(page).to have_current_path(users_path)
    end

    scenario "by filling the username incorrectly"\
    " which redirects the user to the user edit page with an error message" do
      user_sign_in(user)
      update_user(new_first_name, new_last_name, username, user.email, user.password, new_password)

      expect(page).to have_content("Username can't be blank")
      expect(page).to have_current_path(users_path)
    end

    scenario "filling the password incorrectly which redirects"\
    " the user to the user edit page with an error message" do
      user_sign_in(user)
      update_user(new_first_name, new_last_name, new_username, user.email, user.password, password)

      expect(page).to have_content("Password can't be blank")
      expect(page).to have_current_path(users_path)
    end

    scenario "filling the email incorrectly which redirects"\
    " the user to the user edit page with an error message" do
      user_sign_in(user)
      update_user(new_first_name, new_last_name, new_username, email, user.password, new_password)

      expect(page).to have_content("Email can't be blank")
      expect(page).to have_current_path(users_path)
    end

    scenario "by deleting own account which redirects"\
    " the user to the home page with a message saying that the "\
    "account is deleted!" do
      user_sign_in(user)
      click_link "Edit Profile"
      click_button "Cancel my account"
      byestring = "Bye! Your account has been successfully cancelled."\
      " We hope to see you again soon."

      expect(page).to have_content(byestring)
      expect { User.find(user.id) }.to raise_exception(ActiveRecord::RecordNotFound)
    end
  end
end
