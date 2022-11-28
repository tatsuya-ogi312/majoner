class SimulationsController < ApplicationController
  def index
    @count = 0
    i = 0
    while i < 1000 do
      @count += 1
      majon_pais = Pai.new
      haipai = majon_pais.haipai
      ripai = haipai.sort
      huriwake = Shanten.new(ripai)
      @shanten = huriwake.hantei
        if @shanten == -1
          return ripai
        end
        sleep 0.01
    end
    @ripai = ripai
  end
end
