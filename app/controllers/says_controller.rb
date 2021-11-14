class SaysController < ApplicationController
  before_action :current_user
  def new
  end

  def create
    current_user.says.new(say_params)
    if current_user.valid?
      current_user.save
      redirect_to :root
    else
      redirect_to :root, flash: { validation: "Can't be blank" }
    end
  end

  def edit
    @say = Say.find(params[:id])
  end

  def update
    @say = Say.find(params[:id])
    if @say.valid?
      @say.update(say_params)
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

    def say_params
      params.require(:say).permit(:quote)
    end
end
