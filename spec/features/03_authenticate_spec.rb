# require "rails_helper"
#
# feature "Authenticated user" do
#   let!(:user) { FactoryGirl.create(:user, email: "emmawatson@gmail.com", password: "sixchar1") }
#   let!(:new_first_name) {"emma"}
#   let!(:new_last_name) {"watson"}
#   let!(:new_username) {"emmawatsonisthebest"}
#   let!(:new_password) {"sixchar2"}
#   let!(:first_name) {""}
#   let!(:last_name) {""}
#   let!(:username) {""}
#   let!(:email) {""}
#   let!(:password) {""}
#
#   context "as as Authenticated user" do
#     scenario "user signs in and signs out" do
#       user_sign_in(user)
#       click_link("Sign Out")
#
#       expect(page).to have_content("Signed out successfully.")
#     end
#
#     scenario "user signs in, clicks on the link my account, and "\
#       "clicks on edit which redirects them to the user edit page" do
#       user_sign_in(user)
#       click_link "My Profile"
#       click_link "Edit Profile"
#
#       expect(page).to have_current_path(edit_user_registration_path)
#     end
#
#     scenario "user is on my user edit page, fills in the necessary changes,"\
#       " clicks save, and redirects to the home page with a "\
#       "success message" do
#       user_sign_in(user)
#       update_user(new_first_name, new_last_name, new_username, user.email, user.password, new_password)
#
#       expect(page).to have_content(
#         "Your account has been updated successfully."
#       )
#     end
#
#     scenario "user is on my user edit page, fills the username and password"\
#       " incorrectly which redirects them to the user edit page with an "\
#       "error message" do
#       user_sign_in(user)
#       update_user(new_first_name, new_last_name, username, user.email, password, new_password)
#
#       expect(page).to have_content("Current password can't be blank")
#       expect(page).to have_content("Username can't be blank")
#       expect(page).to have_current_path(users_path)
#     end
#
#     scenario "user is on my user edit page, fills the username incorrectly"\
#       " which redirects them to the user edit page with an error message" do
#       user_sign_in(user)
#       update_user(new_first_name, new_last_name, username, user.email, user.password, new_password)
#
#       expect(page).to have_content("Username can't be blank")
#       expect(page).to have_current_path(users_path)
#     end
#
#     scenario "user is on my user edit page, fills the password"\
#       " incorrectly which redirects them to the user edit page with an"\
#       " error message" do
#       user_sign_in(user)
#       update_user(new_first_name, new_last_name, new_username, user.email, user.password, password)
#
#       expect(page).to have_content("Password can't be blank")
#       expect(page).to have_current_path(users_path)
#     end
#
#     scenario "user is on my user edit page, fills the email incorrectly" do
#       user_sign_in(user)
#       update_user(new_first_name, new_last_name, new_username, email, user.password, new_password)
#
#       expect(page).to have_content("Email can't be blank")
#       expect(page).to have_current_path(users_path)
#     end
#
#     scenario "user in on my user edit page, clicks delete, and is"\
#     " redirected to the home page with a message saying that the "\
#     "user is deleted!" do
#       user_sign_in(user)
#       click_link "My Profile"
#       click_link "Edit Profile"
#       click_button "Cancel my account"
#       byestring = "Bye! Your account has been successfully cancelled."\
#       " We hope to see you again soon."
#
#       expect(page).to have_content(byestring)
#       expect { User.find(user.id) }.to raise_exception(ActiveRecord::RecordNotFound)
#     end
#   end
# end
