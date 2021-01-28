require 'test_helper'

class Site::PsiTestsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get site_psi_tests_index_url
    assert_response :success
  end

end
