require 'rails_helper'

describe "User" do
  let!(:user1) { FactoryGirl.create(:user, username: "username12345") }
  let!(:user2) { FactoryGirl.build(:user, username: "") }
  let!(:user3) { FactoryGirl.build(:user, email: "") }
  let!(:user4) { FactoryGirl.build(:user, password: "") }
  let!(:user5) { FactoryGirl.build(:user, first_name: "") }
  let!(:user6) { FactoryGirl.build(:user, last_name: "") }

  scenario "is a valid user" do
    expect(user1).to be_valid
  end

  scenario "is not valid with non-valid attributes" do
    expect(user2).to_not be_valid
    expect(user3).to_not be_valid
    expect(user4).to_not be_valid
    expect(user5).to_not be_valid
    expect(user6).to_not be_valid
  end

  scenario "has a matching password confirmation for the password" do
    user7 = User.new
    user7.password = "password"
    user7.password_confirmation = "anotherpassword"

    expect(user7).to_not be_valid
    expect(user7.errors[:password_confirmation]).to_not be_blank
  end
end
