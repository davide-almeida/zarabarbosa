require 'test_helper'

class Backoffice::FlagsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get backoffice_flags_index_url
    assert_response :success
  end

end
