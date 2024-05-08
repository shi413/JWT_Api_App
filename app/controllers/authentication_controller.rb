class AuthenticationController < ApplicationController
    
    skip_before_action :authenticate_request
    

    def login
        # debugger
        @user = User.find_by_email(params[:email])
        if @user&.authenticate(params[:password])
            token = JsonWebToken.encode(user_id: @user.id, role: @user.role)
            render json: { token: token}, status: :ok
        else
            render json: { error: 'unauthorized'}, status: :unauthorized
        end
    end
end
