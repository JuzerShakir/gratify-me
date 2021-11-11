class HomeController < ApplicationController
  def index
    @total = User.all.count
  end
end
