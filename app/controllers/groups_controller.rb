class GroupsController < ApplicationController
    
    def index
        @groups = Group.all.order(:name)
        
        if params[:search]
            @groups = Group.omnisearch(params[:search])
        end

        respond_to do |format|
            format.html
            format.js
        end
    end

    def show
        @group = Group.find(params[:id])
    end

    def new
        @group = Group.new
    end
    
    def create
        @group = Group.new(group_params)

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
