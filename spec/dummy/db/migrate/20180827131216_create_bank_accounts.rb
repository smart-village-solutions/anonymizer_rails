class CreateBankAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :bank_accounts do |t|
      t.string :bic
      t.string :iban
      t.string :name
      t.string :surname
      t.text :address

      t.timestamps
    end
  end
end
