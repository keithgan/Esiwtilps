class UsersController < ApplicationController
    
    def show
        @user = User.find(params[:id])
        @friends = Friend.where(user_id: current_user.id)
        @groups = Group.all
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        
        if @user.save
            log_in @user
            flash[:success] = "Welcome to Esiwtilps!"
            redirect_to user_path(@user)
        else
            render new
        end
    end

    private

    def user_params
        params.require(:user).permit(
            :name,
            :email,
            :password,
            :phone_number
        )
    end

end
