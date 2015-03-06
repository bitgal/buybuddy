class UsersController < ApplicationController
  def signed_in
  	@current_user = current_user
  end
end
