class UsersController < ApplicationController
    
    def index
        @user = User.find(params[:id])
        @friends = Friend.where(user_id: @user.id)
        @groups = Group.all

        @users = User.all.order(:name)
        if params[:search]
            @users = User.omniscope[params[:search]]
        end
    end

    def show
        @user = User.find(params[:id])
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        
        if @user.save
            log_in @user
            flash[:success] = "Welcome to Esiwtilps!"
            redirect_to dashboard_path(@user)
        else
            flash[:warning] = @user.errors.full_messages
            render 'new'
        end
    end

    def dashboard
        @user = User.find(params[:id])
        @friends = Friend.where(user_id: @user.id)
        @groups = Group.all
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
