require 'test_helper'

class Site::LicensesControllerTest < ActionDispatch::IntegrationTest
  test "should get privacy_policy" do
    get site_licenses_privacy_policy_url
    assert_response :success
  end

  test "should get terms_use" do
    get site_licenses_terms_use_url
    assert_response :success
  end

end
