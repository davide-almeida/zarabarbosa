require 'test_helper'

class Site::CoursesControllerTest < ActionDispatch::IntegrationTest
  test "should get category_course" do
    get site_courses_category_course_url
    assert_response :success
  end

  test "should get course" do
    get site_courses_course_url
    assert_response :success
  end

end
