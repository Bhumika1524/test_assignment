class V1::UsersController < ApplicationController
  before_action :set_user, only: %i[ show update destroy ]
  before_action :authenticate_user!

  def index
    @users = User.all
    render json: @users
  end

  def show
    render json: @user
  end

  def create
    @user = User.create(user_params)
    @users_tenders = @user.users_tenders.create
    @tender = @users_tenders.tenders.build

    if @user.save
      render json: { user:@user,tender:@tender }, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    # Parse strong params
    def user_params
      params.require(:user).permit(:id, :first_name, :last_name, :email, :phone, :password, users_tenders_attributes:[ :id, tenders_attributes: [:id,:title, :description, :status, :submission_date]])
    end
end
