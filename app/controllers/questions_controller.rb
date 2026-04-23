class QuestionsController < ApplicationController
  def index
    @questions = Question.includes(:answers)
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to questions_path
    else
      render :new
    end
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
    @answers = @question.answers
  end

  private

  def question_params
    params.require(:question).permit(:title, :content, :name)
  end
end
