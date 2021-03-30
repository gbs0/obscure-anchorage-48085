require "test_helper"

class AnswearsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @answear = answears(:one)
  end

  test "should get index" do
    get answears_url
    assert_response :success
  end

  test "should get new" do
    get new_answear_url
    assert_response :success
  end

  test "should create answear" do
    assert_difference('Answear.count') do
      post answears_url, params: { answear: { description: @answear.description, lat: @answear.lat, lng: @answear.lng, question_id: @answear.question_id } }
    end

    assert_redirected_to answear_url(Answear.last)
  end

  test "should show answear" do
    get answear_url(@answear)
    assert_response :success
  end

  test "should get edit" do
    get edit_answear_url(@answear)
    assert_response :success
  end

  test "should update answear" do
    patch answear_url(@answear), params: { answear: { description: @answear.description, lat: @answear.lat, lng: @answear.lng, question_id: @answear.question_id } }
    assert_redirected_to answear_url(@answear)
  end

  test "should destroy answear" do
    assert_difference('Answear.count', -1) do
      delete answear_url(@answear)
    end

    assert_redirected_to answears_url
  end
end
