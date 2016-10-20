class AssignmemntsController < ApplicationController
  def create
    @questionnaire = Questionnaire.find(params[:questionnaire_id])
    @assignmemnt = session.new(assignmemnt_params)
    if @assignmemnt.save
      redirect_to questionnaires_path
    else
      render 'questionnaires/show'
    end
  end

  def session_params
    params.require(:session).permit(:user_id,
    :questionnaire_id
    )
  end
end
