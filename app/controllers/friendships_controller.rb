class FriendshipsController < ApplicationController
  def create
    @friendship = Friendship.new()
    @friendship.out_friend_id = current_user.id
    @friendship.in_friend_id = params[:user_id]
    if @friendship.save
      flash[:messages] = ["Friendship created"]
      render :json => @friendship
    else
      render :json => @friendship.errors.full_messages, :status => 422
    end
  end

  def destroy
    @friendship = current_user.friendships.find_by_in_friend_id(params[:user_id]);
    @friendship.delete
    head(:ok)
  end
end
