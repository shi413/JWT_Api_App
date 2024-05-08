class MoppingservicesController < ApplicationController
    
    before_action :authenticate_request
    before_action :authorize_host, only: [:create, :update, :destroy]

    def index
        @moppingservices = Moppingservice.all
        if @moppingservices.present?
        render json: @moppingservices, status: :ok
        else
        render json: { errors: @moppingservices.errors.full_messages }, status: :not_found
        end
    end

    def show
        @moppingservice = Moppingservice.find(params[:id])
        if @moppingservice.present?
        render json: @moppingservice, status: :ok
        else
        render json: { errors: @moppingservice.errors.full_messages }, status: :not_found
        end
    end

    def create
        @moppingservice = Moppingservice.new(moppingservice_params)
        if @moppingservice.save
            render json: @moppingservice, status: :created
        else
            render json: {message: 'Unable to Create'}
        end
    end

    def update
        @moppingservice = Moppingservice.find(params[:id])
        if @moppingservice.update(moppingservice_params)
            render json: @moppingservice, status: :ok
        else
        render json: { errors: @cleaningservice.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def destroy
        @moppingservice = Moppingservice.find(params[:id])
        @moppingservice.destroy
        render json: {message: 'Deleted Successfully'}
    end

    private

    def moppingservice_params
        params.require(:moppingservices).permit(:name, :price, :mobileno, :status)
    end

    def authorize_host
        unless @current_user.host?
        render json: { error: 'Unauthorized' }, status: :unauthorized
        end
    end

end
