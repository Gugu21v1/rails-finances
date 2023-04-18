require "time"

class TransitionsController < ApplicationController
  def index
    @transitions = Transition.where(user: current_user)
  end

  def new
    @user = current_user
    @transition = Transition.new
  end

  def create
    @user = current_user
    @transition = Transition.new(transition_params)
    @transition.valor = @transition.valor.gsub('.', '')
    @transition.valor = @transition.valor.gsub(',', '.')
    @transition.user = @user
    @transition.data = Time.now.strftime("%d/%m/%Y")
    if @transition.tipo == "Entrada"
      @user.dinheiro_atual = @transition.valor.to_f + @user.dinheiro_atual.to_f
      @user.save
    elsif @transition.tipo == "Saída"
      @user.dinheiro_atual = @user.dinheiro_atual.to_f - @transition.valor.to_f
      @user.save
    else
      false
    end
    if @transition.save
      redirect_to root_path
    else
      @user = current_user
      @atual = @user.dinheiro_atual
      render 'pages/home', status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def transition_params
    params.require(:transition).permit(:tipo, :valor, :data, :nome)
  end
end
