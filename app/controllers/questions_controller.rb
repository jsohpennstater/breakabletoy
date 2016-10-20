class QuestionsController < ApplicationController
  def new
    @question = Question.new
    @questions = Question.all
    @questionnaire = Questionnaire.find_by(id: params["questionnaire_id"])
    @questionnaires = Questionnaire.all.ids
  end

  def create
    unless question_params["questionnaire_id"].nil?
      @questionnaire = Questionnaire.find(question_params["questionnaire_id"])
    end
    @question = Question.new(question_params)
    if @question.save
      redirect_to questionnaire_path(@questionnaire)
    else
      @questionnaires = Questionnaire.all.ids
      render :new
    end
  end

  def question_params
    params.require(:question).permit(:criteria,
      :content,
      :questionnaire_id
    )
  end
end
