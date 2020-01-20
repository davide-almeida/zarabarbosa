require 'test_helper'

class Site::DownloadsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get site_downloads_index_url
    assert_response :success
  end

end
