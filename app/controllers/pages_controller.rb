class PagesController < ApplicationController
  def home
    @transition = Transition.new
    @user = current_user
    @atual = @user.dinheiro_atual
  end
end
