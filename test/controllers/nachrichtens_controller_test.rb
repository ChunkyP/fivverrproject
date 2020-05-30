require 'test_helper'

class NachrichtensControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get nachrichtens_index_url
    assert_response :success
  end

end
