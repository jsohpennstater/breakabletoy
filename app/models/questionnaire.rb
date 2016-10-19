class Questionnaire < ActiveRecord::Base
  validates :title, presence: true
  validates :type, presence: true
  validates :physician_name, presence: true
  validates :clinic_address, presence: true
  validates :clinic_phone, presence: true
  validates :additional_information, presence: true
  validates :demographic_information, presence: true
  validates :status, presence: true

  has_many :questions
  has_many :assignmemnts
  has_many :users, :through => :assignmemnts
end
