class Transaction < ApplicationRecord
  belongs_to :user
  # Validaciones de atributos
  validates :user_id, :coin_to_send, :coin_to_receive, :amount_to_send_in_cents_or_sats,
            :amount_to_receive_in_cents_or_sats, :btc_usd_exchange_rate, presence: true
  # Validaciones personalizadas
  validate :minimal_amount_to_send
  validate :avoid_transaction_if_insuficient_balance

  private

  def minimal_amount_to_send
    if coin_to_send == 'usd' && amount_to_send_in_cents_or_sats < 1000
      errors.add(:minimal_amount,
                 'La cantidad mínima a enviar debe ser de 1 000 cents o superior')
    end
    return unless coin_to_send == 'btc' && amount_to_send_in_cents_or_sats < 14_000

    errors.add(:minimal_amount,
               'La cantidad mínima a enviar debe ser de 14 000 sats o superior')
  end

  def avoid_transaction_if_insuficient_balance
    @user = User.find(user_id)
    if coin_to_send == 'usd' && @user.usd_balance_in_cents < amount_to_send_in_cents_or_sats
      errors.add(:insuficient_balance, 'No tiene fondos en USD suficientes para realizar esta transacción')
    end
    return unless coin_to_send == 'btc' && @user.btc_balance_in_sats < amount_to_send_in_cents_or_sats

    errors.add(:insuficient_balance, 'No tiene fondos suficientes en BTC para realizar esta transacción')
  end
end
