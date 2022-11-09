class MajonsController < ApplicationController
  
  def index
    majon_pais = Pai.new
    haipai = majon_pais.haipai
    @ripai = haipai.sort
  end

end
