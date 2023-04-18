require "time"

class PagesController < ApplicationController
  def home
    the_day
    next_day
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

  def next_day
    RendaFixa.where(user: current_user).each do |renda|
      if Time.now.strftime("%d").to_i < renda.data.to_i
        if renda.feita == true
          renda.update(feita: false)
        end
      end
    end
  end

  def new_transition(valor, nome)
    Transition.create(valor: valor, user: current_user, tipo: "Entrada", data: Time.now.strftime("%d/%m/%Y"), nome: nome)
    dinheiro_novo = current_user.dinheiro_atual.to_f + valor.to_f
    current_user.update(dinheiro_atual: dinheiro_novo)
  end
end
