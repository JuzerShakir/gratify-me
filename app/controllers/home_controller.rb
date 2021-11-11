class HomeController < ApplicationController
  def index
    @total = User.all.count
    if user_signed_in?
      @user = current_user
      @user.provider = @user.provider.match(/[a-z]+/).to_s.capitalize
    end
  end
end
