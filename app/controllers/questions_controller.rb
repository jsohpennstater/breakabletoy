class QuestionsController < ApplicationController
   def create
     @questionnaire = Questionnaire.find(params[:questionnaire_id])
     @question = question.new(question_params)
     if @question.save
       redirect_to questionnaires_path(@questionnaire, @question)
    else
       render 'questionnaires/show'
     end
   end

   def question_params
     params.require(:question).permit(:criteria,
     :content,
     :questionnaire_id
     )
   end
 end
