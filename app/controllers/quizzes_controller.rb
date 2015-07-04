class QuizzesController < ApplicationController
  def new
  end

  def show
    @quiz = Quiz.find(params[:id])
    @questions = QuizQuestion.all.find_all{|question| question.Quiz_id==@quiz.id}
  end
end
