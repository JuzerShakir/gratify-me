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

  private

    def say_params
      params.permit(:quote)
    end
end
