require 'rails_helper'

RSpec.describe BankAccount, type: :model do

  def create_and_anonymize_bank_account
    @bank_account = BankAccount.create( name: "Tim", surname: "Test", bic: "BKR532836FR",
                                        iban: "DE12345678",
                                        address: { zip: "12345", city: "Berlin" } )
    @bank_account.anonymize_data
  end

  describe "#anonymize_data" do
    it "anonymizes the configured attributes" do
      create_and_anonymize_bank_account
      expect(@bank_account.iban).to eq("xxxxxx")
      expect(@bank_account.bic).to eq("xxxxxx")
      expect(@bank_account.address[:zip]).to eq("xxxxxx")
      expect(@bank_account.address[:city]).to eq("xxxxxx")
    end

    it "doesn't anonymize attributes who were not configured to be anonymized" do
      create_and_anonymize_bank_account
      expect(@bank_account.name).to eq("Tim")
      expect(@bank_account.surname).to eq("Test")
    end
  end
end
