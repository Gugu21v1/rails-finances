class GastosFixosController < ApplicationController
  def index
  end

  def new
    @gasto = GastosFixo.new
  end

  def create
    @user = current_user
    @gasto = GastosFixo.new(gastos_params)
    @gasto.user = @user
    if @gasto.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def gastos_params
    params.require(:gastos_fixo).permit(:nome, :valor, :data)
  end
end
