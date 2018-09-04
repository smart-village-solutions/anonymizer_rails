class User < ActiveRecord::Base

  store :form_data,
        accessors: [ :email, :full_name, :post_code, :street_address, :phone_number, :city ],
        coder: JSON

  data_to_anonymize :email, :full_name, :street_address, :phone_number
end
