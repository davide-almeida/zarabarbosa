require 'test_helper'

class Backoffice::SiteStoragesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get backoffice_site_storages_index_url
    assert_response :success
  end

  test "should get new" do
    get backoffice_site_storages_new_url
    assert_response :success
  end

  test "should get edit" do
    get backoffice_site_storages_edit_url
    assert_response :success
  end

end
