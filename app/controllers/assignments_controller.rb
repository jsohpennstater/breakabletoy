class AssignmentsController < ApplicationController
  def new
    @assignment = Assignment.new
    @titles_id = Hash.new
    Questionnaire.all.each do |questionnaire|
      @titles_id[questionnaire.title] = questionnaire.id
    end
    @users_id = Hash.new
    User.all.where(admin:false).each do |user|
      @users_id[user.first_name + " " + user.last_name] = user.id
    end
  end

  def create
    @assignment = Assignment.create(assignment_params)
    if !@assignment.nil?
      redirect_to questionnaires_path
    else
      render :new
    end
  end

  def assignment_params
    params.require(:assignment).permit(:user_id,
    :questionnaire_id
    )
  end
end
