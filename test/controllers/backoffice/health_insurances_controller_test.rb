require 'test_helper'

class Backoffice::HealthInsurancesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get backoffice_health_insurances_index_url
    assert_response :success
  end

end
