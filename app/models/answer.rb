class Answer < ApplicationRecord
  validates :user_id, presence: true, numericality: { integer_only: true }
  validates :answer, numericality: { integer_only: true }

  belongs_to :question
end
