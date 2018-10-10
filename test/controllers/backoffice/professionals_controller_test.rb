require 'test_helper'

class Backoffice::ProfessionalsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get backoffice_professionals_index_url
    assert_response :success
  end

end
