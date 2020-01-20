require 'test_helper'

class Backoffice::DownloadsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get backoffice_downloads_index_url
    assert_response :success
  end

  test "should get new" do
    get backoffice_downloads_new_url
    assert_response :success
  end

  test "should get edit" do
    get backoffice_downloads_edit_url
    assert_response :success
  end

end
