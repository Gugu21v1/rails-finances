require "time"

class PagesController < ApplicationController
  def home
    the_day_gasto
    the_day
    array = next_day
    @gasto_mensal_fixo = array[1]
    @renda_mensal_fixa = array[0]
    @transition = Transition.new
    @user = current_user
    @atual = @user.dinheiro_atual.to_f.ceil(2)
  end

  private

  def the_day
    # Saber se é o dia do pagamento ou se ele já passou
    RendaFixa.where(user: current_user).each do |renda|
      if renda.data == Time.now.strftime("%d") || Time.now.strftime("%d").to_i > renda.data.to_i
        if Transition.all != []
          Transition.where(user: current_user).each do |transition|
            if transition.data.split('/')[1] == Time.now.strftime("%m") && renda.nome == transition.nome && renda.feita == true
            elsif transition.data.split('/')[1].to_i != Time.now.strftime("%m").to_i + 1 && renda.feita == false
              puts "----------------------------------------------------------------"
              puts "PASSOU"
              puts "----------------------------------------------------------------"
              new_transition(renda.valor, renda.nome)
              renda.update(feita: true)
            end
          end
        else
          new_transition(renda.valor, renda.nome)
          renda.update(feita: true)
        end
      end
    end
    # Saber se o pagamento já foi efetuado, caso não, efetuar
  end

  def the_day_gasto
    # Saber se é o dia do pagamento ou se ele já passou
    GastosFixo.where(user: current_user).each do |gasto|
      if gasto.data == Time.now.strftime("%d") || Time.now.strftime("%d").to_i > gasto.data.to_i
        if Transition.all != []
          Transition.where(user: current_user).each do |transition|
            if transition.data.split('/')[1] == Time.now.strftime("%m") && gasto.nome == transition.nome && gasto.feito == true
            elsif transition.data.split('/')[1].to_i != Time.now.strftime("%m").to_i + 1 && gasto.feito == false
              puts "----------------------------------------------------------------"
              puts "PASSOU"
              puts "----------------------------------------------------------------"
              new_transition_gasto(gasto.valor, gasto.nome)
              gasto.update(feito: true)
            end
          end
        else
          new_transition_gasto(gasto.valor, gasto.nome)
          gasto.update(feito: true)
        end
      end
    end
    # Saber se o pagamento já foi efetuado, caso não, efetuar
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

  def new_transition(valor, nome)
    valor = valor.gsub('.', '').gsub(',', '.')
    Transition.new(valor: valor, user: current_user, tipo: "Entrada", data: Time.now.strftime("%d/%m/%Y"), nome: nome).save
    dinheiro_novo = current_user.dinheiro_atual.to_f + valor.to_f
    current_user.update(dinheiro_atual: dinheiro_novo)
  end

  def new_transition_gasto(valor, nome)
    valor = valor.gsub('.', '').gsub(',', '.')
    Transition.new(valor: valor, user: current_user, tipo: "Saída", data: Time.now.strftime("%d/%m/%Y"), nome: nome).save
    dinheiro_novo = current_user.dinheiro_atual.to_f - valor.to_f
    current_user.update(dinheiro_atual: dinheiro_novo)
  end
end
