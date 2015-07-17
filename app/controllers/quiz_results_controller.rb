class QuizResultsController < ApplicationController
  def new
    @quiz = Quiz.find_by(id:params["quiz_id"])
    @answers = Array.new

    params.each do |param|
      if  !param[0].to_f.nil?&&param[0].to_f>0
        @answers.push param[1]
      end
    end

    @numCorrect = 0
    @quiz.quiz_questions.each do |question|
      if question.correct_answer==params[question.id.to_s]
        @numCorrect+=1
      end
    end

    if(@numCorrect>=3)
      passed=true
    else
      passed = false
    end
    if QuizResult.find_by(chapter_id:@quiz.chapter_id, user_id:current_user.id)
      QuizResult.find_by(chapter_id:@quiz.chapter_id, user_id:current_user.id).destroy
    end
    @quiz_result = QuizResult.create(quiz_id:@quiz.id,user_id: current_user.id, passed:passed, score:@numCorrect,chapter_id:@quiz.chapter_id,time_passed:Time.now)
    render 'show'
  end
  def show
  @quiz_result= QuizResult.find(params[:id])
  end
end

