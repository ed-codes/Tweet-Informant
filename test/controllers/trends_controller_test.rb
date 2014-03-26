require 'test_helper'

class TrendsControllerTest < ActionController::TestCase
 

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:trends_available)
  end


end
