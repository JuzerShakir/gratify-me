class HomeController < ApplicationController

  def index
    @total = User.all.count

    if user_signed_in?
      @pagy, @say = pagy(current_user.says.all, items: 10)
    end

    @search = params["search"]
    if @search.present?
      @query = @search['query']
      @say = @say.where("quote ILIKE ?", "%#{@query}%" )
    end
  end

  # if user manually tries type invalid urls
  def not_found
    flash[:alert] = "The link your looking for doesn't exist!"
    redirect_to :root
  end
end
