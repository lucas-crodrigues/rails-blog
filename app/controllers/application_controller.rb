class ApplicationController < ActionController::Base
  def current_user
    @first_user = User.find(10)
  end
end
