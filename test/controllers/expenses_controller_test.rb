require "test_helper"

class ExpensesControllerTest < ActionDispatch::IntegrationTest
  test "should get destroy" do
    get expenses_destroy_url
    assert_response :success
  end
end
