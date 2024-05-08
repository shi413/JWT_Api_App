class CleaningserviceController < ApplicationController

  # before_action :authenticate_request, only: [:create]
  before_action :authenticate_request
  before_action :authorize_host, only: [:create, :update, :destroy]


    def index
      @cleaningservices = Cleaningservice.all
      if @cleaningservices.present?
        render json: @cleaningservices, status: :ok
      else
        render json: { errors: @cleaningservices.errors.full_messages }, status: :not_found
      end
    end

    def show
        @cleaningservice = Cleaningservice.find(params[:id])
        if @cleaningservice.present?
        render json: @cleaningservice, status: :ok
        else
        render json: { errors: @cleaningservice.errors.full_messages }, status: :not_found
        end
    end

    def create
        @cleaningservice = Cleaningservice.new(cleaningservice_params)
        if @cleaningservice.save
            render json: @cleaningservice, status: :created
        else
            render json: {error: 'Unable to create'}
        end
    end

    def update
      @cleaningservice = Cleaningservice.find(params[:id])  
      if @cleaningservice.update(cleaningservice_params)
        render json: @cleaningservice, status: :ok
      else
        render json: { errors: @cleaningservice.errors.full_messages }, status: :unprocessable_entity
      end
      end
    
      def destroy
        @cleaningservice = Cleaningservice.find(params[:id])  
        @cleaningservice.destroy
        render json: {message: 'Deleted Successfully'}
      end

    private

    def cleaningservice_params
        params.require(:cleaningservice).permit(:name, :price, :mobileno, :status)
    end

    def authorize_host
      unless @current_user.host?
        render json: { error: 'Unauthorized' }, status: :unauthorized
      end
    end

end
