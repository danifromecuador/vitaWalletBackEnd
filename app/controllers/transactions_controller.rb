class TransactionsController < ApplicationController
  before_action :set_user

  # GET /users/1/transactions
  def index
    @transactions = Transaction.all.where(user_id: 1)
    render json: @transactions
  end

  # GET /users/1/transactions/1
  def show
    @transaction = Transaction.all.where(user_id: 1).where(id: 1)
    render json: @transaction
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:id)
  end
end
