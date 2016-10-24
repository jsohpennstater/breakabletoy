class Answer < ApplicationRecord
  validates :user_id, presence: true

  belongs_to :question


  # @total_score = 0
  # @questions.each do |question|
  #   @total_score += question.answer
  # end
  # @initial_diagnosis = diagnosis(@total_score)

  # def total_score(user_id, )
  #
  #
  #
  # def score(total_score, id)
  #   if id == 1
  #     t_score = (total_score * 8).to_f / 6
  #   elsif id == 2
  #     t_score = (total_score * 8).to_f / 5
  #   end
  #   return t_score
  # end
  #
  # def diagnosis(score)
  #   if score > 8 && score <= 16
  #     initial_diagnosis = "None to slight"
  #   elsif score > 17 && score <= 22
  #     initial_diagnosis = "Mild"
  #   elsif score > 23 && score <= 32
  #     initial_diagnosis = "Moderate"
  #   elsif score >= 33
  #     initial_diagnosis = "Severe"
  #   end
  #   return initial_diagnosis
  # end
end
