require 'test_helper'

class Backoffice::TestEmailsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get backoffice_test_emails_index_url
    assert_response :success
  end

end
