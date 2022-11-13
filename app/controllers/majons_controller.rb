class MajonsController < ApplicationController
  
  def index
    majon_pais = Pai.new
    haipai = majon_pais.haipai
    @ripai = haipai.sort
    huriwake = Shanten.new(@ripai)
    @shanten = huriwake.hantei

  end


end
