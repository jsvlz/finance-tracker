class FriendshipsController < ApplicationController

  def create
    @friendship = Friendship.create(user_id: current_user.id, friend_id: params[:friend_id])
    flash[:success] = "Friend added"
    redirect_to my_friends_path
  end

  def destroy
    @friend = User.find(params[:id])
    @friendship = Friendship.where(user_id: current_user.id, friend_id: @friend.id).first
    @friendship.destroy
    redirect_to my_friends_path
    flash[:danger] = "Friend removed"
  end

end
