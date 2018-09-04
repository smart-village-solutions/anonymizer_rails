require 'rails_helper'

RSpec.describe FormSubmission, type: :model do

  def create_and_anonymize_form_submission
      @fs = FormSubmission.create(submitted_input:{age: "23", name: "Tim", surname: "Test"})
      @fs.anonymize_data
  end

  describe "#anonymize_data" do
    it "anonymizes the configured attributes" do
      create_and_anonymize_form_submission
      expect(@fs.submitted_input[:name]).to eq("xxxxxx")
    end

    it "doesn't anonymize attributes which weren't configured to be anonymized" do
      create_and_anonymize_form_submission
      expect(@fs.submitted_input[:age]).to eq("23")
      expect(@fs.submitted_input[:surname]).to eq("Test")
    end
  end
end
