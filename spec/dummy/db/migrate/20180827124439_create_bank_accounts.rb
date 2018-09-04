class CreateBankAccounts < ActiveRecord::Migration
  def change
    create_table :bank_accounts do |t|
      t.string :bic
      t.string :iban
      t.string :name
      t.string :surname
      t.text :address

      t.timestamps null: false
    end
  end
end
