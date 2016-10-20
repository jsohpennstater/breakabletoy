class Assignmemnt < ActiveRecord::Base
  belongs_to :user
  belongs_to :questionnaire
end
