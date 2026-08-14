require "test_helper"

class HemmsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hemm = hemms(:one)
  end

  test "should get index" do
    get hemms_url
    assert_response :success
  end

  test "should get new" do
    get new_hemm_url
    assert_response :success
  end

  test "should create hemm" do
    assert_difference("Hemm.count") do
      post hemms_url, params: { hemm: { location: @hemm.location, make: @hemm.make, model: @hemm.model, slno: @hemm.slno } }
    end

    assert_redirected_to hemm_url(Hemm.last)
  end

  test "should show hemm" do
    get hemm_url(@hemm)
    assert_response :success
  end

  test "should get edit" do
    get edit_hemm_url(@hemm)
    assert_response :success
  end

  test "should update hemm" do
    patch hemm_url(@hemm), params: { hemm: { location: @hemm.location, make: @hemm.make, model: @hemm.model, slno: @hemm.slno } }
    assert_redirected_to hemm_url(@hemm)
  end

  test "should destroy hemm" do
    assert_difference("Hemm.count", -1) do
      delete hemm_url(@hemm)
    end

    assert_redirected_to hemms_url
  end
end
