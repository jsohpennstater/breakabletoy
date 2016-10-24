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
    questionnaire_json = { "reverse": @question.reverse, "question_id": @question.id, "questionnaire_id": @question.questionnaire_id }
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
    @answer = Answer.find_by(question_id: params[:question_id], user_id: current_user.id)
    if !@answer.nil?
      if !@question.reverse
        @answer.update_attributes(answer: 1)
      else
        @answer.update_attributes(answer: 5)
      end
    else
      if !@question.reverse
        Answer.create(question_id: params[:question_id], answer: 1, user_id: current_user.id)
      else
        Answer.create(question_id: params[:question_id], answer: 5, user_id: current_user.id)
      end
    end
  end

  def scaletwo
    @question = Question.find_by(id: params[:question_id], questionnaire_id: params[:questionnaire_id])
    @answer = Answer.find_by(question_id: params[:question_id], user_id: current_user.id)
    if !@answer.nil?
      if !@question.reverse
        @answer.update_attributes(answer: 2)
      else
        @answer.update_attributes(answer: 4)
      end
    else
      if !@question.reverse
        Answer.create(question_id: params[:question_id], answer: 2, user_id: current_user.id)
      else
        Answer.create(question_id: params[:question_id], answer: 4, user_id: current_user.id)
      end
    end
  end

  def scalethree
    @question = Question.find_by(id: params[:question_id], questionnaire_id: params[:questionnaire_id])
    @answer = Answer.find_by(question_id: params[:question_id], user_id: current_user.id)
    if !@answer.nil?
      @answer.update_attributes(answer: 3)
    else
      Answer.create(question_id: params[:question_id], answer: 3, user_id: current_user.id)
    end
  end

  def scalefour
    @question = Question.find_by(id: params[:question_id], questionnaire_id: params[:questionnaire_id])
    @answer = Answer.find_by(question_id: params[:question_id], user_id: current_user.id)
    if !@answer.nil?
      if !@question.reverse
        @answer.update_attributes(answer: 4)
      else
        @answer.update_attributes(answer: 2)
      end
    else
      if !@question.reverse
        Answer.create(question_id: params[:question_id], answer: 4, user_id: current_user.id)
      else
        Answer.create(question_id: params[:question_id], answer: 2, user_id: current_user.id)
      end
    end
  end

  def scalefive
    @question = Question.find_by(id: params[:question_id], questionnaire_id: params[:questionnaire_id])
    @answer = Answer.find_by(question_id: params[:question_id], user_id: current_user.id)
    if !@answer.nil?
      if !@question.reverse
        @answer.update_attributes(answer: 5)
      else
        @answer.update_attributes(answer: 1)
      end
    else
      if !@question.reverse
        Answer.create(question_id: params[:question_id], answer: 5, user_id: current_user.id)
      else
        Answer.create(question_id: params[:question_id], answer: 1, user_id: current_user.id)
      end
    end
  end

  def question_params
    params.require(:question).permit(:reverse,
      :content,
      :questionnaire_id
    )
  end
end
