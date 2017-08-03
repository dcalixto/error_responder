module ErrorResponder
  module Extenders
    module Serialize
      class << self
        def error(err_code, key = nil, message = nil)
          data = {}
          data[:status] = err_code.to_s
          data[:info] = Rack::Utils::HTTP_STATUS_CODES[err_code]

          data[:errors] = {}
          data[:errors][key] = message if key.present? && message.present?

          data
        end

        def serialize(errors, options = {})
          return if errors.nil?

          json = {}
          json[:errors] = {}

          errors.to_hash(true).each do |key, message|
            json[:errors][key] = message.join('. ') + '.'
          end

          json[options[:key]] = options[:value] if options.present?

          json
        end
      end
    end
  end
end
