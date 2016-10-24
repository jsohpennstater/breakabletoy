class QuestionnairesController < ApplicationController
  before_action :authorize_user, except: [:index]
  # before_action :set_questionnaire, only: [:show, :edit, :update, :destroy]

  def index
    unless current_user.nil?
      @user = current_user
      if @user.admin
        @questionnaires = Questionnaire.all.order(:title)
      else
        @questionnaires = @user.questionnaires
      end
    end
  end

  def show
    @questionnaire = Questionnaire.find(params[:id])
    @question = Question.new
    @users = User.where(admin: false)
    @questions = @questionnaire.questions
    @total_score = 0
    @questions.each do |question|
      @total_score += question.answer
    end
    scaled_score = (@total_score * 8).to_f / 5
    @initial_screening = t_score(scaled_score)
    @assignment = Assignment.find_by(questionnaire_id: @questionnaire.id)
    unless @assignment.nil?
      @assigned_user = User.find_by(id: @assignment.user_id)
    end
  end

  def new
    @questionnaire = Questionnaire.new
    @question = Question.new
    @session = Assignment.new
    @users = User.all
  end

  def create
    @questionnaire = Questionnaire.new(questionnaire_params)
      if @questionnaire.save
        flash[:notice] = "You successfully added a questionnaire"
        redirect_to questionnaire_path(@questionnaire)
      else
        # @errors = @questionnaire.errors.full_messages.join(", ")
        # flash[:alert] = "Questionnaire submission unsuccesful!"
        # flash[:notice] = @errors
        render :new
      end
  end

  def edit
    @user = current_user
    if @user.admin
      @questionnaire = Questionnaire.find(params[:id])
    else
      flash[:notice] = "Access Denied."
      redirect_to questionnaire_path(@questionnaire)
    end
  end

  def update
    @user = current_user
    @questionnaire = Questionnaire.find(params[:id])
    @questionnaire.update_attributes(questionnaire_params)
    if @questionnaire.save
      flash[:notice] = "Questionnaire Updated!"
      redirect_to questionnaire_path(@questionnaire)
    else
      @errors = @questionnaire.errors.full_messages.join(", ")
      flash[:alert] = "Questionnaire Not Updated!"
      flash[:notice] = @errors
      render :edit
    end
  end

  def create
    @questionnaire = Questionnaire.new(questionnaire_params)
      if @questionnaire.save
        flash[:notice] = "You successfully added a questionnaire"
        redirect_to questionnaire_path(@questionnaire)
      else
        # @errors = @questionnaire.errors.full_messages.join(", ")
        # flash[:alert] = "Questionnaire submission unsuccesful!"
        # flash[:notice] = @errors
        render :new
      end
  end

  def destroy
    @questionnaire = Questionnaire.find(params[:id])
    @questionnaire.destroy
    flash[:notice] = "Questionnaire Deleted!"
    redirect_to '/'
  end

  def submit
    @questionnaire = Questionnaire.find_by(id: params[:questionnaire_id])
    @questionnaire.update_attributes(status: "Complete")
  end

  protected

  def authorize_user
    unless user_signed_in?
      flash[:notice] = "Please sign in or sign up in"\
      " order to view the questionnaire"
      redirect_to '/'
    end
  end

  private

  def questionnaire_params
    params.require(:questionnaire).permit(
      :title,
      :physician_name,
      :clinic_address,
      :clinic_phone,
      :additional_information,
      :demographic_information,
      :status
    )
  end

  def t_score(score)
    if score < 55
      initial_screening = "None to slight"
    elsif score > 55.0 && score < 59.9
      initial_screening = "Mild"
    elsif score > 60.0 && score < 69.9
      initial_screening = "Moderate"
    elsif score >= 70
      initial_screening = "Severe"
    end
    return initial_screening
  end

end
