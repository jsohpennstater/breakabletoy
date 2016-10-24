class QuestionsController < ApplicationController
  def new
    @question = Question.new
    @questions = Question.all
    # @questionnaire = Questionnaire.find_by(id: params["questionnaire_id"])
    @questionnaires = { }
    Questionnaire.all.each do |questionnaire|
      @questionnaires[questionnaire.title] = questionnaire.id
    end
  end

  def show
    @question = Question.find(params["id"])
    questionnaire_json = { "answer": @question.answer, "reverse": @question.reverse, "question_id": @question.id, "questionnaire_id": @question.questionnaire_id }
    respond_to do |format|
      format.html
      format.json { render json: questionnaire_json }
    end
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

  def scaleone
    @question = Question.find_by(id: params[:question_id], questionnaire_id: params[:questionnaire_id])
    if !@question.reverse
      @question.update_attributes(answer: 1)
    else
      @question.update_attributes(answer: 5)
    end
  end

  def scaletwo
    @question = Question.find_by(id: params[:question_id], questionnaire_id: params[:questionnaire_id])
    if !@question.reverse
      @question.update_attributes(answer: 2)
    else
      @question.update_attributes(answer: 4)
    end
  end

  def scalethree
    @question = Question.find_by(id: params[:question_id], questionnaire_id: params[:questionnaire_id])
    @question.update_attributes(answer: 3)
  end

  def scalefour
    @question = Question.find_by(id: params[:question_id], questionnaire_id: params[:questionnaire_id])
    if !@question.reverse
      @question.update_attributes(answer: 4)
    else
      @question.update_attributes(answer: 2)
    end
  end

  def scalefive
    @question = Question.find_by(id: params[:question_id], questionnaire_id: params[:questionnaire_id])
    if !@question.reverse
      @question.update_attributes(answer: 5)
    else
      @question.update_attributes(answer: 1)
    end
  end

  def question_params
    params.require(:question).permit(:reverse,
      :content,
      :questionnaire_id
    )
  end
end
