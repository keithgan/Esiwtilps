class MembershipsController < ApplicationController
    def join 
        @group = Group.find(params[:id])

        membership = Membership.new(user_id: current_user.id, group_id: @group.id)
        membership.save
        redirect_to my_groups_path
    end

    def leave
        @group = Group.find(params[:id])

        membership_to_delete = Membership.find_by(user_id: current_user.id, group_id: @group.id)
        membership_to_delete.destroy
        redirect_to my_groups_path
    end
end
