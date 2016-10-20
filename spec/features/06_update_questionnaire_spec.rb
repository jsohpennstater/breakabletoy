require "rails_helper"

feature "Update Questionnaire" do
  let!(:admin) { FactoryGirl.create(:user, email: "emmawatson@gmail.com", password: "sixchar1", admin: true) }
  let!(:questionnaire1) { FactoryGirl.create(:questionnaire) }
  let!(:questionnaire2) { FactoryGirl.create(:questionnaire) }
  let!(:title) { "First Visit" }
  let!(:physician_name) { "Dr. Watson" }
  let!(:clinic_phone) { "123-456-7890" }
  let!(:clinic_address) { "1 Hogwarts Drive" }
  let!(:title_empty) { "" }
  let!(:physician_name_empty) { "" }
  let!(:clinic_phone_empty) { "" }
  let!(:clinic_address_empty) { "" }

  before do
    user_sign_in(admin)
    click_link(questionnaire1.title)
  end

  describe "when an admin clicks link to edit questionnaire" do
    it "redirects to questionnaire edit form" do
      click_link "Edit"

      expect(page).to have_content("Edit Questionnaire")
    end
  end

  scenario "Admin successfully edits questionnaire" do
    edit_questionnaire(title, physician_name, clinic_phone, clinic_address)

    expect(page).to have_content(title)
    expect(page).to have_content(physician_name)
    expect(page).to have_content(clinic_phone)
    expect(page).to have_content(clinic_address)
    expect(page).to have_content("Questionnaire Updated!")
  end

  describe "User incorrectly fills out review form" do
    it "re-renders review form with error message" do
      edit_questionnaire(title_empty, physician_name_empty, clinic_phone_empty, clinic_address_empty)

      expect(page).to have_content("Questionnaire Not Updated!")
      expect(page).to have_content("Title can't be blank")
      expect(page).to have_content("Physician name can't be blank")
      expect(page).to have_content("Clinic phone can't be blank")
      expect(page).to have_content("Clinic address can't be blank")
    end
  end
end
