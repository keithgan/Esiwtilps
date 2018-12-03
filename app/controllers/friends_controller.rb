class FriendsController < ApplicationController
    def befriend 
        @user = User.find(params[:id])

        if !Friend.find_by(user_id: current_user.id, friends_with: @user.id)
            friend = Friend.new(user_id: current_user.id, friends_with: @user.id)
            friend.save
            redirect "/user/#{@user.id}"
        else
            @message = "You are already friends with this user."
        end
    end

    def unfriend
        friend_to_delete = Friend.find_by(user_id: current_user.id)
        friend_to_delete.destroy
        redirect "/user/#{current_user.id}"
    end
    
end
