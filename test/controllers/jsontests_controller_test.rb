require 'test_helper'

class JsontestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @jsontest = jsontests(:one)
  end

  test "should get index" do
    get jsontests_url
    assert_response :success
  end

  test "should get new" do
    get new_jsontest_url
    assert_response :success
  end

  test "should create jsontest" do
    assert_difference('Jsontest.count') do
      post jsontests_url, params: { jsontest: {  } }
    end

    assert_redirected_to jsontest_url(Jsontest.last)
  end

  test "should show jsontest" do
    get jsontest_url(@jsontest)
    assert_response :success
  end

  test "should get edit" do
    get edit_jsontest_url(@jsontest)
    assert_response :success
  end

  test "should update jsontest" do
    patch jsontest_url(@jsontest), params: { jsontest: {  } }
    assert_redirected_to jsontest_url(@jsontest)
  end

  test "should destroy jsontest" do
    assert_difference('Jsontest.count', -1) do
      delete jsontest_url(@jsontest)
    end

    assert_redirected_to jsontests_url
  end
end
