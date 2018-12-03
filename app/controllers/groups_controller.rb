class GroupsController < ApplicationController
    
    def show
        @group = Group.find(params[:id])
    end

    def new
        @group = Group.new
    end
    
    def create
        @group = Group.new(group_params)
        @group.user_id = current_user.id

        if @group.save
            flash[:success] = "#{@group.name} successfully created!"
            redirect_to welcome_index_path
        end
    end

    private

    def group_params
        params.require(:group).permit(
            :name
        )
    end
end
