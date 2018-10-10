require 'test_helper'

class Backoffice::DiariesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get backoffice_diaries_index_url
    assert_response :success
  end

end
