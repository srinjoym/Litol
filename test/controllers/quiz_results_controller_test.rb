require 'test_helper'

class QuizResultsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

end
