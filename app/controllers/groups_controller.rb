class GroupsController < ApplicationController
    
    def index
        @groups = Group.all.order(:name)
        
        if params[:search]
            @groups = Group.omnisearch(params[:search])
        end

        respond_to do |format|
            format.html
            format.js
            format.json { render json: @groups.map{|i| i.name}}
        end
    end

    def show
        @group = Group.find(params[:id])
        @memberships = Membership.where(group_id: @group.id)
        @bills = Bill.where(group_id: @group.id)
    end

    def new
        @group = Group.new
    end
    
    def create
        @group = Group.new(group_params)
        
        if @group.save
            @membership = Membership.new
            @membership.update(group_id: @group.id, user_id: current_user.id)
            @membership.save
            flash[:success] = "#{@group.name} successfully created!"
            redirect_to groups_path
        else
            flash[:warning] = @group.errors.full_messages
            render 'new'
        end
    end

    def destroy
        @group = Group.find(params[:id])
        @group.destroy
        redirect_to groups_path
    end

    def my_groups
        # @group = Group.membership.where(user_id: current_user.id)
        @user = current_user
        @memberships = Membership.where(user_id: @user.id)
    end

    private

    def group_params
        params.require(:group).permit(
            :name
        )
    end
end
