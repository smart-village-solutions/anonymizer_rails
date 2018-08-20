class FormSubmission < ApplicationRecord
  serialize :submitted_input

  include AnonymizerRails
  attributes_to_anonymize submitted_input: :name
end
