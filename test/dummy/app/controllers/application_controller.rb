class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index
    # example
    respond_with 401
  end
end
