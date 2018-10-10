require 'test_helper'

class Backoffice::QuestionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get backoffice_questions_index_url
    assert_response :success
  end

end
