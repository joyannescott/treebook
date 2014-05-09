require 'test_helper'

class UserFriendshipTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  should belong_to(:user)

  should belong_to(:friend)

  test "that creating a friendship works" do
  	assert_nothing_raised do
    	UserFriendship.create user: users(:joy), friend: users(:joyscott)
	end
  end

    test "that creating a friendship based on user id and friend id works" do
    	UserFriendship.create user_id: users(:joy).id, friend_id: users(:jim).id
 		assert users(:joy).friends.include?(users(:jim))
  end

end
