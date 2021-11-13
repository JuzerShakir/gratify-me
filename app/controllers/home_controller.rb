class HomeController < ApplicationController
  def index
    @total = User.all.count
  end

  # if user manually tries type invalid urls
  def not_found
    flash[:alert] = "The link your looking for doesn't exist!"
    redirect_to :root
  end
end
