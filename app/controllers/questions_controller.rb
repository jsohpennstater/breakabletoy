class QuestionsController < ApplicationController
  def new
    @question = Question.new
    @questionnaire = Questionnaire.find_by(id: params["questionnaire_id"])
    @questionnaires = Questionnaire.all.ids
  end

  def create
    # @questionnaire = Questionnaire.find(params[:questionnaire_id])
    @question = Question.new(question_params)
    if @question.save
      redirect_to questionnaires_path(@questionnaire, @question)
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
