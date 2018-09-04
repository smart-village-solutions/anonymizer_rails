class BankAccount < ActiveRecord::Base
  serialize :address
  data_to_anonymize :bic, :iban, { address: [:city, :zip] }
end
