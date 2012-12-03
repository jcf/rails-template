class ApplicationController < ActionController::Base
  protect_from_forgery

  def self.exposes(*methods)
    attr_reader *methods
    helper_method *methods
  end
end
