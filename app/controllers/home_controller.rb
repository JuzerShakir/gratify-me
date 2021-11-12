class HomeController < ApplicationController
  def index
    @total = User.all.count
    if user_signed_in?
      @user = current_user
    end
  end
end
