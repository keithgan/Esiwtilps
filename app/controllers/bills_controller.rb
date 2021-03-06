class BillsController < ApplicationController

    def show
        @bill = Bill.find(params[:id])
    end
    
    def new
        @bill = Bill.new
        @group = Group.find(params[:group_id])
    end

    def edit
        @bill = Bill.find(params[:id])        
    end

    def create
        @bill = Bill.new(bill_params)
        @group = Group.find(params[:group_id])
        @bill.group_id = @group.id
        @bill.user_id = @group.memberships.find_by(user_id: current_user.id).user_id

        if @bill.save
            flash[:success] = "#{@bill.title} has been added successfully."
            redirect_to group_path(@group)
        else
            render 'bills/new'
        end
    end

    def update
        @bill = Bill.find(params[:id])

        if @bill.update(bill_params)
            redirect_to group_bill_path(@bill.group_id, @bill.id)
        else
            render 'edit'
        end
    end

    def destroy
        @group = Group.find(params[:group_id])
        @bill = Bill.find(params[:id])
        @bill.destroy
        redirect_to group_path(@group)
    end

    private

    def bill_params
        params.require(:bill).permit(
            :title,
            :amount,
            :place,
            :latitude,
            :longitude
        )
    end
end
