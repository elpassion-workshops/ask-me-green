class QuestionsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

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

  def show
    @question = Question.find(params[:id])
  end

  private 
  def question_params
	params.require(:question).permit(:title, :content, :tags)
  end

end
