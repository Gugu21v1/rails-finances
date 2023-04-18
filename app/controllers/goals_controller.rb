class GoalsController < ApplicationController
  def index
    @goals = Goal.where(user: current_user)
    @goal = Goal.new
  end

  def show
  end

  def new
    @goal = Goal.new
  end

  def create
    @goals = Goal.where(user: current_user)
    @user = current_user
    @goal = Goal.new(goals_params)
    @goal.valor = @goal.valor.gsub('.', '')
    @goal.valor = @goal.valor.gsub(',', '.')
    @goal.user = @user
    if @goal.save
      redirect_to goals_path
    else
      render 'goals/index', status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @goal = Goal.find(params[:id])
    @goal.destroy
    redirect_to root_path, status: :see_other
  end

  private

  def goals_params
    params.require(:goal).permit(:nome, :desc, :valor, :tempo, :feito)
  end
end
