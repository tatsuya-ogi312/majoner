class MajonsController < ApplicationController
  
  def index
    majon_pais = Pai.new
    haipai = majon_pais.haipai
    @ripai = haipai.sort
    # @ripai = ["m2", "m6", "m8", "m9", "m9", "p6", "p7", "p8", "p8", "p9", "s4", "s9", "z4", "z4"]
    huriwake = Shanten.new(@ripai)
    @shanten = huriwake.hantei
  end


end
