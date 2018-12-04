class MembershipsController < 
    def join 
        @user = User.find(params[:id])
        @group = Group.fine(params[:id])

        membership = Membership.new(user_id: current_user.id, group_id: @group.id)
        friend.save
        redirect_to "/users/#{@user.id}"
    end

    def leave
        @user = User.find(params[:id])

        friend_to_delete = Friend.find_by(user_id: current_user.id, friends_with: @user.id)
        friend_to_delete.destroy
        redirect_to "/users/#{@user.id}"
    end
end
