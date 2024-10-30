class TransactionsController < ApplicationController
  before_action :set_user

  # GET /users/1/transactions
  def index
    @transactions = @user.transactions
    render json: @transactions
  end

  # GET /users/1/transactions/1
  def show
    @transaction = @user.transactions.find(params[:id])
    render json: @transaction
  end

  # POST /users/1/transactions
  def create
    @current_btc_price = CoinDeskService.current_btc_price
    @transaction = @user.transactions.build(
      coin_to_send: transaction_params[:coin_to_send],
      coin_to_receive: transaction_params[:coin_to_receive],
      amount_to_send_in_cents_or_sats: transaction_params[:amount_to_send_in_cents_or_sats],
      amount_to_receive_in_cents_or_sats: calculate_received_amount(
        transaction_params[:coin_to_send], transaction_params[:amount_to_send_in_cents_or_sats], @current_btc_price
      ),
      btc_usd_exchange_rate: @current_btc_price
    )
    if @transaction.save
      update_user_balance(@transaction.coin_to_send, @transaction.amount_to_send_in_cents_or_sats,
                          @transaction.amount_to_receive_in_cents_or_sats)
      render json: @transaction, status: :created
    else
      render json: @transaction.errors, status: :unprocessable_entity
    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(:coin_to_send, :coin_to_receive, :amount_to_send_in_cents_or_sats)
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  # Calculate received amount in cents or sats
  def calculate_received_amount(coin_to_send, amount_to_send, exchange_rate)
    return (amount_to_send / exchange_rate) * 1_000_000 if coin_to_send == 'usd'

    (amount_to_send * exchange_rate) / 1_000_000
  end

  def update_user_balance(coin_to_send, amount_to_send, amount_to_receive)
    if coin_to_send == 'usd'
      usd_balance_in_cents = @user.usd_balance_in_cents - amount_to_send
      btc_balance_in_sats = @user.btc_balance_in_sats + amount_to_receive
    end
    if coin_to_send == 'btc'
      usd_balance_in_cents = @user.usd_balance_in_cents + amount_to_receive
      btc_balance_in_sats = @user.btc_balance_in_sats - amount_to_send
    end
    new_user_params = {
      usd_balance_in_cents: usd_balance_in_cents,
      btc_balance_in_sats: btc_balance_in_sats
    }
    @user.update(new_user_params)
  end
end
