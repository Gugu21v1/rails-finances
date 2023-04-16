class RendaFixasController < ApplicationController
  def index
  end

  def new
    @renda = RendaFixa.new
  end

  def create
    @user = current_user
    @renda = RendaFixa.new(renda_params)
    @renda.user = @user
    if @renda.save
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

  def renda_params
    params.require(:renda_fixa).permit(:nome, :valor, :data)
  end
end
