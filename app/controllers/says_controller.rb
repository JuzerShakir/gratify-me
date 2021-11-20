class SaysController < ApplicationController
  # load user before running in actions
  before_action :current_user

  def new
  end

  def create
    @say = current_user.says.new(create_params)
    if @say.valid?
      @say.save
      redirect_to :root
    else
      redirect_to :root, flash: { validation: "Quote can't be blank" }
    end
  end

  def edit
    # if user manually tries visit wrong id in url
    begin
      @say = Say.find(params[:id])
    rescue
      redirect_to controller: :home, action: :not_found
    end
  end

  def update
    @say = Say.find(params[:id])

    if @say.update(update_params)
      redirect_to :root, flash: { post: "Post Updated" }
    else
      render :edit
    end
  end

  def destroy
    @say = Say.find(params[:id])
    @say.destroy
    redirect_to :root, flash: { post: "Post Deleted" }
  end

  private
    # w2 different params for update and create since we load model data differently in both methods
    def create_params
      params.permit(:quote)
    end

    def update_params
      params.require(:say).permit(:quote)
    end
end
