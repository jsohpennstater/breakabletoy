class Questionnaire < ActiveRecord::Base
  validates :title, presence: true
  validates :physician_name, presence: true
  validates :clinic_address, presence: true
  validates :clinic_phone, presence: true
  validates :status, presence: true

  has_many :questions
  has_many :assignments
  has_many :users, :through => :assignments
end
