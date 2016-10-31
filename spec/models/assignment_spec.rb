describe "#assignment" do
  it "user is assigned to questionnaire" do
    questionnaire1 = FactoryGirl.create(:questionnaire)
    user1 = FactoryGirl.create(:user, admin: false)
    user2 = FactoryGirl.create(:user, admin: false)
    assignment1 = FactoryGirl.create(:assignment, user: user1, questionnaire: questionnaire1)

    expect(assignment1.user_id).to eq(user1.id)
    expect(assignment1.user_id).not_to eq(user2.id)
  end
end
