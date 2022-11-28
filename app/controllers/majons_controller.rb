class MajonsController < ApplicationController
  
  def index
    majon_pais = Pai.new
    haipai = majon_pais.haipai
    @ripai = haipai.sort
    @ripai = ["m1", "m1", "m1", "m3", "m3", "m3", "p2", "p2", "p2", "s4", "s4", "s4", "s5", "s5"]
    huriwake = Shanten.new(@ripai)
    @shanten = huriwake.hantei
    yaku = Yaku.new(@ripai)
    @yakuall = yaku.yakuhantei
  end



end
