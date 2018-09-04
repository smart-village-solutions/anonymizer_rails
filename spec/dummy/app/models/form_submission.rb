class FormSubmission < ActiveRecord::Base
  serialize :submitted_input
  data_to_anonymize submitted_input: :name
end
