require "rails_helper"

feature "Create Questionnaire" do
  let!(:admin) { FactoryGirl.create(:user, email: "emmawatson@gmail.com", password: "sixchar1", admin: true) }
  let!(:title) { "First Visit" }
  let!(:physician_name) { "Dr. Watson" }
  let!(:clinic_phone) { "123-456-7890" }
  let!(:clinic_address) { "1 Hogwarts Drive" }
  let!(:title_empty) { "" }
  let!(:physician_name_empty) { "" }
  let!(:clinic_phone_empty) { "" }
  let!(:clinic_address_empty) { "" }

  context "Admin successfully creates a questionnaire set" do
    before do
      user_sign_in(admin)
    end

    scenario "by clicking on a link Create Questionnaire, and is redirected"\
    " to a new questionnaire form, and sees all the required fields" do
      visit '/'
      click_link "Create Questionnaire"

      expect(page).to have_current_path(new_questionnaire_path)
      expect(page).to have_content("Title")
      expect(page).to have_content("Physician Name")
      expect(page).to have_content("Clinic Phone")
      expect(page).to have_content("Clinic Address")
      expect(page).to have_content("Include demographic information?")
      expect(page).to have_content("Include additional information?")
    end

    scenario "by filling in all the required for the questionnaire set"\
    " field correctly and is redirected to the submitted questionnaire show page" do
      visit '/'
      questionnaire_fill_in(title, physician_name, clinic_phone, clinic_address)

      expect(page).to have_content("You successfully added a questionnaire")
      expect(page).to have_content(title)
      expect(page).to have_content(physician_name)
      expect(page).to have_content(clinic_phone)
      expect(page).to have_content(clinic_address)
      expect(page).to have_content("Additional Information Included: true")
      expect(page).to have_content("Demographic Information Included: true")
      expect(page).to have_content("Status: Incomplete")
    end
  end

  context "Admin unsuccessfully creates a questionnaire set" do
    before do
      user_sign_in(admin)
    end

    scenario "by leaving the title blank, and sees"\
    " a flash message with an error in the new questionnaire form" do
      visit '/'
      questionnaire_fill_in(title_empty, physician_name, clinic_phone, clinic_address)

      expect(page).to have_content("Title can't be blank")
    end

    scenario "by leaving physician name information blank, and sees"\
    " a flash message with an error in the new questionnaire form" do
      visit '/'
      questionnaire_fill_in(title, physician_name_empty, clinic_phone, clinic_address)

      expect(page).to have_content("Physician name can't be blank")
    end

    scenario "by leaveing addresss set blank, and sees a"\
    " flash message with an error in the new questionnaire form" do
      visit '/'
      questionnaire_fill_in(title, physician_name, clinic_phone, clinic_address_empty)

      expect(page).to have_content("Clinic address can't be blank")
    end

    scenario "by leaveing addresss set blank, and sees a"\
    " flash message with an error in the new questionnaire form" do
      visit '/'
      questionnaire_fill_in(title, physician_name, clinic_phone_empty, clinic_address_empty)

      expect(page).to have_content("Clinic phone can't be blank")
    end
  end
end
