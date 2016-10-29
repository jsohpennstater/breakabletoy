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
    @questionnaire = Questionnaire.find(params[:assignment][:questionnaire_id])
    @assignment = Assignment.find_by(assignment_params)
    if @assignment.nil?
      @assignment = Assignment.create(assignment_params)
      @assignment.save
      flash[:notice] = "Assigned!"
      redirect_to questionnaire_path(@questionnaire)
    else
      flash[:notice] = "Already Assigned!"
      redirect_to new_assignment_path
    end
  end

  def destroy
    @assignment = Assignment.find_by(user_id:params[:format], questionnaire_id:params[:id])
    @assignment.destroy
    flash[:notice] = "Assignment Deleted!"
    redirect_to questionnaires_path
  end

  def assignment_params
    params.require(:assignment).permit(:user_id,
    :questionnaire_id
    )
  end
end
