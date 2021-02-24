require 'test_helper'

class Site::SendMailTestsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get site_send_mail_tests_edit_url
    assert_response :success
  end

  test "should get create" do
    get site_send_mail_tests_create_url
    assert_response :success
  end

end
