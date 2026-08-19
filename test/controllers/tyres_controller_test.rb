require "test_helper"

class TyresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tyre = tyres(:one)
  end

  test "should get index" do
    get tyres_url
    assert_response :success
  end

  test "should get new" do
    get new_tyre_url
    assert_response :success
  end

  test "should create tyre" do
    assert_difference("Tyre.count") do
      post tyres_url, params: { tyre: { active: @tyre.active, hemm_id: @tyre.hemm_id, position: @tyre.position, pressure: @tyre.pressure, sensor_id: @tyre.sensor_id } }
    end

    assert_redirected_to tyre_url(Tyre.last)
  end

  test "should show tyre" do
    get tyre_url(@tyre)
    assert_response :success
  end

  test "should get edit" do
    get edit_tyre_url(@tyre)
    assert_response :success
  end

  test "should update tyre" do
    patch tyre_url(@tyre), params: { tyre: { active: @tyre.active, hemm_id: @tyre.hemm_id, position: @tyre.position, pressure: @tyre.pressure, sensor_id: @tyre.sensor_id } }
    assert_redirected_to tyre_url(@tyre)
  end

  test "should destroy tyre" do
    assert_difference("Tyre.count", -1) do
      delete tyre_url(@tyre)
    end

    assert_redirected_to tyres_url
  end
end
