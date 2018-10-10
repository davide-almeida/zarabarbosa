require 'test_helper'

class Backoffice::HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get backoffice_home_index_url
    assert_response :success
  end

end
