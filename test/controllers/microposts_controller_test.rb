require "test_helper"

class MicropostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @micropost = microposts(:one)
  end

  test "should get index" do
    get microposts_url
    assert_response :success
  end

  test "should get new" do
    get new_micropost_url
    assert_response :success
  end

  test "should create micropost" do
    created = nil
    assert_difference("Micropost.count") do
      post microposts_url, params: { micropost: { content: @micropost.content, user_id: @micropost.user_id } }
      created = Micropost.find_by(content: @micropost.content, user_id: @micropost.user_id)
    end

    assert_redirected_to micropost_url(created)
  end

  test "should show micropost" do
    get micropost_url(@micropost)
    assert_response :success
  end

  test "should get edit" do
    get edit_micropost_url(@micropost)
    assert_response :success
  end

  test "should update micropost" do
    patch micropost_url(@micropost), params: { micropost: { content: @micropost.content, user_id: @micropost.user_id } }
    assert_redirected_to micropost_url(@micropost)
  end

  test "should destroy micropost" do
    assert_difference("Micropost.count", -1) do
      delete micropost_url(@micropost)
    end

    assert_redirected_to microposts_url
  end
end
