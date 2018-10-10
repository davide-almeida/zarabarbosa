require 'test_helper'

class Blog::CategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get blog_categories_index_url
    assert_response :success
  end

end
