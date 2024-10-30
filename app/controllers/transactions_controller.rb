class TransactionsController < ApplicationController
  # before_action :set_user

  # GET /users/1/transactions
  def index
    @user = User.find(params[:user_id])
    @transactions = @user.transactions
    render json: @transactions
  end

  # GET /users/1/transactions/1
  def show
    @user = User.find(params[:user_id])
    @transaction = @user.transactions.find(params[:id])
    render json: @transaction
  end

  # POST /users/1/transactions
  def create
    user = User.find(params[:user_id])
    transaction = user.transactions.build(
      coin_to_send: transaction_params[:coin_to_send],
      coin_to_receive: transaction_params[:coin_to_receive],
      amount_to_send_in_cents_or_sats: transaction_params[:amount_to_send_in_cents_or_sats],
      amount_to_receive_in_cents_or_sats: 12345678,
      btc_usd_exchange_rate: 65234.2356
    )
    if transaction.save
      render json: transaction, status: :created
    else
      render json: transaction.errors, status: :unprocessable_entity
    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(:coin_to_send, :coin_to_receive, :amount_to_send_in_cents_or_sats)
  end
end
