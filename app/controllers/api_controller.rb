class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token
  include Response
  include ExceptionHandler
end
