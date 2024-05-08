class UsersController < ApplicationController
    
    skip_before_action :authenticate_request

    def index
        @users = User.all
        render json: @users, status: :ok
    end

    def show
        @user = User.find(params[:id])
        render json: @user
    end

    def create
        @user = User.new(user_params)
        if @user.save
            render json: @user
        else
            render json: {error: 'Unable to create'}
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation, :role)
    end

end
