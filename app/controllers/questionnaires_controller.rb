class QuestionnairesController < ApplicationController
  before_action :authorize_user, except: [:index]
  # before_action :set_questionnaire, only: [:show, :edit, :update, :destroy]

  def index
    # @user = current_user
    # if @user.admin
    #   @questionnaires = Questionnaire.all.order(:title)
    # else
    #   @questionnaires = @user.questionnaires
    # end
  end

  def show
    @questionnaire = Questionnaire.find(params[:id])
    @question = Question.new
    @users = User.where(admin: false)
  end

  def new
    @questionnaire = Questionnaire.new
    @question = Question.new
    @session = Session.new
    @users = User.all
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
    @questionnaire.save
      if @questionnaire.save
        redirect_to questionnaires_path
        flash[:notice] = "You successfully added a questionnaire"
      else
        @errors = @questionnaire.errors.full_messages.join(", ")
        flash[:alert] = "Questionnaire submission unsuccesful!"
        flash[:notice] = @errors
        render :new
      end
  end

  def destroy
    @questionnaire = Questionnaire.find(params[:id])
    @questionnaire.destroy
    flash[:notice] = "Questionnaire Deleted!"
    redirect_to '/'
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
      :type,
      :physician_name,
      :clinic_address,
      :clinic_phone,
      :additional_information,
      :demographic_information,
      :status
    )
  end

end
