class Question < ActiveRecord::Base
  validates :content, presence: true
  validates :criteria, presence: true

  belongs_to :questionnaire
end
