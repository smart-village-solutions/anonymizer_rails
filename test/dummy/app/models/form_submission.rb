class FormSubmission < ApplicationRecord
  serialize :submitted_input
  data_to_anonymize submitted_input: :name
end
