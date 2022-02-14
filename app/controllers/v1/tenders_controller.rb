class V1::TendersController < ApplicationController
  before_action :set_tender, only: %i[ show update destroy ]

  def index
    @tenders = Tender.all

    render json: @tenders
  end

  def show
    render json: @tender
  end

  def create
    @tender = Tender.new(tender_params)
    @user_tender = @tender.users_tenders.build
    @user = @user_tender.users.build

    if @tender.save
      render json: @tender, status: :created
    else
      render json: @tender.errors, status: :unprocessable_entity
    end
  end

  def update
    if @tender.update(tender_params)
      render json: @tender
    else
      render json: @tender.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @tender.destroy
  end

  private
    def set_tender
      @tender = Tender.find(params[:id])
    end

    #Parse Strong parameters.
    def tender_params
      params.require(:tender).permit(:id,:title, :description, :status, :submission_date,users_tenders_attributes:[:id, users_attributes: [:id, :first_name, :last_name, :email, :phone, :password]])
    end
end
