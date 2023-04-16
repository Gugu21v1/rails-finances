class GoalsController < ApplicationController
  def index
    @goals = Goal.where(user: current_user)
  end

  def show
  end

  def new
    @goal = Goal.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def goals_params
    params.require(:transition).permit(:tipo, :valor, :data)
  end
end
