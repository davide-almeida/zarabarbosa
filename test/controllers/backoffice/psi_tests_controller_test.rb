require 'test_helper'

class Backoffice::PsiTestsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get backoffice_psi_tests_index_url
    assert_response :success
  end

  test "should get new" do
    get backoffice_psi_tests_new_url
    assert_response :success
  end

  test "should get edit" do
    get backoffice_psi_tests_edit_url
    assert_response :success
  end

end
