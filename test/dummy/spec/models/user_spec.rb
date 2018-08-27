require 'rails_helper'

RSpec.describe User, type: :model do
  def create_and_anonymize_user_data
    @user_1 = User.create( full_name: "Tina Test", phone_number: "010/1234567",
                            email: "tina@test.de", street_address: "Teststrasse1",
                            post_code: "12345", city: "Berlin" )
    @user_1.anonymize_data
  end

  describe "#anonymize_data" do
    it "anonymizes the configured attributes" do
      create_and_anonymize_user_data
      expect(@user_1.email).to eq("xxxxxx")
      expect(@user_1.full_name).to eq("xxxxxx")
      expect(@user_1.phone_number).to eq("xxxxxx")
      expect(@user_1.street_address).to eq("xxxxxx")
    end

    it "doesn't anonymize attributes which weren't configured to be anonymized" do
      create_and_anonymize_user_data
      expect(@user_1.post_code).to eq("12345")
      expect(@user_1.city).to eq("Berlin")
    end
  end
end
