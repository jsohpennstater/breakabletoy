require "rails_helper"

feature "Review Questionnaire" do
  let!(:admin) { FactoryGirl.create(:user, email: "emmawatson@gmail.com", password: "sixchar1", admin: true) }
  let!(:questionnaire1) { FactoryGirl.create(:questionnaire) }
  let!(:questionnaire2) { FactoryGirl.create(:questionnaire) }

  before do
    user_sign_in(admin)
  end

  scenario "Admin sees an index of all the created questionnaire sets" do
    visit questionnaires_path

    expect(page).to have_content(questionnaire1.title)
    expect(page).to have_content(questionnaire2.title)
  end

  scenario "Admin clicks on questionnaire to review its content" do
    click_link(questionnaire1.title)

    expect(page).to have_content(questionnaire1.title)
    expect(page).to have_content(questionnaire1.physician_name)
    expect(page).to have_content(questionnaire1.clinic_phone)
    expect(page).to have_content(questionnaire1.clinic_address)
    expect(page).to have_content("Additional Information Included: ")
    expect(page).to have_content("Demographic Information Included: ")
    expect(page).to have_content("Status: ")
    expect(page).to have_content("Back to Index")
    expect(page).to have_content("Edit")
    expect(page).to have_content("Delete")
  end
end
