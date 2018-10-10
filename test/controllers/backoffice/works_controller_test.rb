require 'test_helper'

class Backoffice::WorksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get backoffice_works_index_url
    assert_response :success
  end

end
