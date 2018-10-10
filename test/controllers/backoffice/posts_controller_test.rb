require 'test_helper'

class Backoffice::PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get backoffice_posts_index_url
    assert_response :success
  end

  test "should get new" do
    get backoffice_posts_new_url
    assert_response :success
  end

  test "should get edit" do
    get backoffice_posts_edit_url
    assert_response :success
  end

end
