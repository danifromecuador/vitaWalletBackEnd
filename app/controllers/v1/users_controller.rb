class V1::UsersController < ApplicationController
  # GET /users
  def index
    @users = User.all
    render json: @users
  end

  # GET /users/1
  def show
    @user = User.find(params[:id])
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :year_of_birth, :usd_balance_in_cents, :btc_balance_in_sats)
  end
end
