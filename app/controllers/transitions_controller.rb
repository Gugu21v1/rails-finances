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
    array = next_day
    @gasto_mensal_fixo = array[1]
    @renda_mensal_fixa = array[0]
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

  def next_day
    renda_fixa = 0
    ganho_fixo = 0
    RendaFixa.where(user: current_user).each do |renda|
      if Time.now.strftime("%d").to_i < renda.data.to_i
        renda_fixa += renda.valor.gsub('.', '').gsub(',', '.').to_f
        puts renda_fixa
        if renda.feita == true
          renda.update(feita: false)
        end
      end
    end
    GastosFixo.where(user: current_user).each do |gasto|
      if Time.now.strftime("%d").to_i < gasto.data.to_i
        ganho_fixo += gasto.valor.gsub('.', '').gsub(',', '.').to_f
        puts ganho_fixo
       if gasto.feito == true
          gasto.update(feito: false)
        end
      end
    end
    return [renda_fixa, ganho_fixo]
  end
end
