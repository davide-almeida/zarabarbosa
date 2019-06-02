require 'test_helper'

class Backoffice::CategoryCoursesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get backoffice_category_courses_index_url
    assert_response :success
  end

  test "should get new" do
    get backoffice_category_courses_new_url
    assert_response :success
  end

  test "should get edit" do
    get backoffice_category_courses_edit_url
    assert_response :success
  end

end
