class HomeController < ApplicationController
  def index
    @total = User.all.count
    @user = current_user if user_signed_in?
  end
end
