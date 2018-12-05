class FriendsController < ApplicationController
    def befriend 
        @user = User.find(params[:id])

        friend = Friend.new(user_id: current_user.id, friends_with: @user.id)
        friend.save
        redirect_to user_path(@user)
    end

    def unfriend
        @user = User.find(params[:id])

        friend_to_delete = Friend.find_by(user_id: current_user.id, friends_with: @user.id)
        friend_to_delete.destroy
        redirect_to user_path(@user)
    end
    
end
