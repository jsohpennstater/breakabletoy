class Answer < ApplicationRecord
  validates :user_id, presence: true

  belongs_to :question
end
