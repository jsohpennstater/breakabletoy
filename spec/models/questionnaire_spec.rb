require 'rails_helper'

RSpec.describe Questionnaire, type: :model do
  it { should have_valid(:title).when('Sleep Study', 'Depression Study') }
  it { should_not have_valid(:title).when(nil, '') }

  it { should have_valid(:physician_name).when('Dr. Freud', 'Dr. Watson') }
  it { should_not have_valid(:physician_name).when(nil, '') }

  it { should have_valid(:clinic_address).when('100 Memory Lane', '101 Memory Lane') }
  it { should_not have_valid(:clinic_address).when(nil, '') }

  it { should have_valid(:clinic_phone).when('123-456-7890', '123-456-7891') }
  it { should_not have_valid(:clinic_address).when(nil, '') }
end
