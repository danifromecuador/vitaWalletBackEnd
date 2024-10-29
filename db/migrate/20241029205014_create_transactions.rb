class CreateTransactions < ActiveRecord::Migration[7.2]
  def change
    create_table :transactions do |t|
      t.references :user, null: false, foreign_key: true
      t.string :coin_to_send
      t.string :coin_to_receive
      t.integer :amount_to_send_in_cents_or_sats
      t.integer :amount_to_receive_in_cents_or_sats
      t.decimal :btc_usd_exchange_rate

      t.timestamps
    end
  end
end
