require "rails_helper"

feature "Destroy Questionnaire" do
  let!(:admin) { FactoryGirl.create(:user, email: "emmawatson@gmail.com", password: "sixchar1", admin: true) }
  let!(:questionnaire1) { FactoryGirl.create(:questionnaire) }
  let!(:questionnaire2) { FactoryGirl.create(:questionnaire) }

  before do
    user_sign_in(admin)
    click_link(questionnaire1.title)
  end

  describe "User clicks link delete questionnaire" do
    it "redirects to questionnaire show page" do
      click_link "Delete"

      expect(page).to have_content(questionnaire2.title)
      expect(page).to_not have_content(questionnaire1.title)
      expect(page).to have_content("Questionnaire Deleted!")
    end
  end
end
