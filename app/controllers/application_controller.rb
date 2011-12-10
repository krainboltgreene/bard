class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter -> { @header = true }
  before_filter -> { @footer = true }
end
