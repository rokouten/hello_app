require "test_helper"

class UserMicropostAssociationTest < ActiveSupport::TestCase
  test "associated microposts should be destroyed" do
    user = User.create!(name: "Example User", email: "destroy_assoc@example.com")
    user.microposts.create!(content: "Lorem ipsum")
    assert_difference("Micropost.count", -1) do
      user.destroy
    end
  end
end

