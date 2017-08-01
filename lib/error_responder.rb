module ErrorResponder
  require 'error_responder/extenders/serialize'
  require 'error_responder/extenders/controller'
end

ActiveSupport.on_load(:action_controller) do
  include ErrorResponder::Extenders::Controller
end
