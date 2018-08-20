require "anonymizer_rails/railtie"

module AnonymizerRails
 extend ActiveSupport::Concern

      included do
        def anonymize_data
          perform_on_attributes(@@attributes_to_anonymize)
        end
      end

      class_methods do
        def attributes_to_anonymize(options = {})
          @@attributes_to_anonymize = options
        end
      end



    private

      #
      # Takes in attribute(s) of a Class/Object and anonymizes them with "xxxxxx".
      #
      # @param [Object] data Any type of Object
      # @param [Array] path empty Array path works as memory for the path to set but could be set manually
      #
      # @return [Object] returns the hash/attributes which were/was set
      #
      def perform_on_attributes(data, path = [])
        if data.is_a?(Hash)
          data.each do |key, value|
            perform_on_attributes(value, path << key)
          end
        elsif data.is_a?(Array)
          data.each do |value|
            perform_on_attributes(value, path)
          end
        else
          set_value(path, data)
        end
      end

      #
      # Method which sets the value of an attribute for a given path. If path is blank the attribute
      # is set in root, else path is the path of a (nested) hash key.
      #
      # @param [<Array>] path path of a (nested) hash key
      # @param [<String or Symbol>] data attribute or final key to be set
      #
      # @return [<Type>] <description>
      #
      def set_value(path, attribute)
        if path.empty? || path.nil?
          self.send("#{attribute}=", "xxxxxx")
        else
          path = path.clone
          key = path.shift
          path_to_modify = (path << attribute)
          dig_and_set(self.send(key), path_to_modify, "xxxxxx")
        end
      end

      #
      # Finds the key and sets the value for a given hash and path. path is given in the format of an array of strings or
      # symbols for example if hash is submitted_input and path is ["user_location", "city"] the method
      # sets the value for submitted_input["user_location"]["city"]
      #
      # @param [Hash] hash
      # @param [Array] path representing the path for the the value to be set in form of an array of
      #  symbols or strings
      # @param [Object] value any desired value
      #
      # @return [Hash] hash with new values
      #
      def dig_and_set(hash, path, value)
        *path, final_key = path
        to_set = path.empty? ? hash : hash.dig(*path)

        return unless to_set.present?
        to_set[final_key] = value unless to_set[final_key].blank?
      end
end
