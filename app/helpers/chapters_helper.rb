module ChaptersHelper
  def passed? (chapter)
    if !chapter.quiz.nil? && !chapter.quiz.quiz_results.find_by(user_id: current_user.id).nil?
      if chapter.quiz.quiz_results.find_by(user_id: current_user.id, passed: false)
        return 0
      elsif chapter.quiz.quiz_results.find_by(user_id: current_user.id, passed: true)
        return 1
      end
    else
      return -1
    end
  end
end


