class User < ApplicationRecord
  has_many :transactions
  # Validaciones de atributos
  validates :name, :year_of_birth, :usd_balance_in_cents, :btc_balance_in_sats, presence: true
  validates :usd_balance_in_cents, :btc_balance_in_sats, numericality: { greater_than_or_equal_to: 0 }
  # Validaciones personalizadas
  validate :must_be_of_legal_age

  private

  def must_be_of_legal_age
    return unless year_of_birth.present? && Date.current.year - year_of_birth < 18

    errors.add(:year_of_birth, 'El usuario debe ser mayor de edad para registrase')
  end
end
