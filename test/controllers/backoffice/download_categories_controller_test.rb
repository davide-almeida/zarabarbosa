require 'test_helper'

class Backoffice::DownloadCategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get backoffice_download_categories_index_url
    assert_response :success
  end

  test "should get new" do
    get backoffice_download_categories_new_url
    assert_response :success
  end

  test "should get edit" do
    get backoffice_download_categories_edit_url
    assert_response :success
  end

end
