class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def new
  	@question = Question.new
  end

  def create
  	@question = current_user.questions.new(question_params)
  	if @question.save
  		flash[:notice] = "Question successfully created"
  		redirect_to questions_path
  	else
  		flash[:alert] = "Error"
  		render :new
  	end
  end

  private 
  def question_params
	params.require(:question).permit(:title, :content)
  end

end
