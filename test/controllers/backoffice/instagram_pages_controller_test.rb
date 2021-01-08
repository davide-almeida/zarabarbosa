require 'test_helper'

class Backoffice::InstagramPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get backoffice_instagram_pages_index_url
    assert_response :success
  end

  test "should get new" do
    get backoffice_instagram_pages_new_url
    assert_response :success
  end

  test "should get edit" do
    get backoffice_instagram_pages_edit_url
    assert_response :success
  end

end
