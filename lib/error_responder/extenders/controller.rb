module ErrorResponder
  module Extenders
    module Controller
      def serialize_errors(errors, options = {})
        render json: ErrorResponder::Extenders::Serialize.serialize(errors, options), status: :conflict
      end

      def respond_with(err_code, key: nil, message: nil)
        err_name = Rack::Utils::HTTP_STATUS_CODES[err_code].downcase.tr(' ', '_').to_sym
        render json: ErrorResponder::Extenders::Serialize.error(err_code, key, message), status: err_name
      end
    end
  end
end
