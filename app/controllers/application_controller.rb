# frozen_string_literal: true

# root app controller
class ApplicationController < ActionController::Base
  protect_from_forgery unless: -> { request.format.json? }
end
