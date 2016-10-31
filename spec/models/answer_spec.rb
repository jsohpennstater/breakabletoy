RSpec.describe Answer, type: :model do
  it { should have_valid(:answer).when(1, 2) }
  it { should_not have_valid(:answer).when('a', 'b') }

  it { should have_valid(:user_id).when("1", "2") }
  it { should_not have_valid(:user_id).when('a', 'b') }
end

describe "#answer" do
  it "answer belongs to question" do
    questionnaire1 = FactoryGirl.create(:questionnaire)
    question1 = FactoryGirl.create(:question, questionnaire_id: questionnaire1.id, reverse: true)
    question2 = FactoryGirl.create(:question, questionnaire_id: questionnaire1.id, reverse: true)
    answer1 = FactoryGirl.create(:answer, question: question1)
    answer2 = FactoryGirl.create(:answer, question: question1)
    answer3 = FactoryGirl.create(:answer, question: question2)

    expect(question1.answers).to include(answer1, answer2)
    expect(question1.answers).not_to include(answer3)
  end
end
