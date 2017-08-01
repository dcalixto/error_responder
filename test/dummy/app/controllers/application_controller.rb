class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index
    # example
    err_respond 401
  end
end
