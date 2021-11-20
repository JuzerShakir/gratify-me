class HomeController < ApplicationController

  # our home page (root)
  def index
    # total no. of users in database
    @total = User.all.count

    # a helper method of devise
    if user_signed_in?
      # for pagination we use @pagy and number of posts to show per page is 10
      # also load all the posts of the user
      @pagy, @says = pagy(current_user.says.all, items: 10)
    end

    # for enabling search
    # if a user types in any queries, it will be loaded in hash "search"
    @search = params["search"]

    # if query is present
    if @search.present?
      # load the string user typed in which can be found in "query" key as this key was given in search form in view
      @query = @search['query']
      # using SQL commands to search smartly
      # loads all the quotes that matches the query in case-insensitive
      @say = @say.where("quote ILIKE ?", "%#{@query}%" )
    end
  end

  # if user manually tries type invalid urls
  def not_found
    flash[:alert] = "The link your looking for doesn't exist!"
    redirect_to :root
  end
end
