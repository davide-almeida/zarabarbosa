require 'test_helper'

class InstagramPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get instagram_pages_index_url
    assert_response :success
  end

end
