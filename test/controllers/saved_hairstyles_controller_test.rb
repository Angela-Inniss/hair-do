require 'test_helper'

class SavedHairstylesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get saved_hairstyles_create_url
    assert_response :success
  end

  test "should get destroy" do
    get saved_hairstyles_destroy_url
    assert_response :success
  end

end
