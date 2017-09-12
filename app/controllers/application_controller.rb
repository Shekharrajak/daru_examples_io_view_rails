class ApplicationController < ActionController::Base
  include RougeHelper

  protect_from_forgery with: :exception
end
