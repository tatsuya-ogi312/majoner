class MajonsController < ApplicationController
  
  def index
    majon_pais = Pai.new
    haipai = majon_pais.haipai
    @ripai = haipai.sort

    mcntr = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    scntr = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    pcntr = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    zcntr = [0, 0, 0, 0, 0, 0, 0]
    minishanten = 8
    kotsucnt = 0
    shuntsucnt = 0
    jantocnt = 0
    @ripai.each do |pai|
      pai_num = pai.split(/\s*/)
      val = pai_num[1].to_i - 1
      case pai_num[0]
      when "m" then
        mcntr[val] += 1
      when "p" then
        pcntr[val] += 1
      when "s" then
        scntr[val] += 1
      when "z" then
        zcntr[val] += 1
      end
    end
    tehaibox = mcntr + pcntr + scntr + zcntr

    # 雀頭抜き取り（一盃口ケア）
    j = 0
    while j < 8 do
      if mcntr[j] == 2 && (mcntr[j+1] >= 1 && mcntr[j+2] >= 1)
        jantocnt += 1
        mcntr[j] -= 2
      end
      if pcntr[j] == 2 && (pcntr[j+1] >= 1 && pcntr[j+2] >= 1)
        jantocnt += 1
        pcntr[j] -= 2
      end
      if scntr[j] == 2 && (scntr[j+1] >= 1 && scntr[j+2] >= 1)
        jantocnt += 1
        scntr[j] -= 2
      end
      if zcntr[j] == 2
        jantocnt += 1
        zcntr[j] -= 2
      end
      j += 1
    end
  
    # 刻子抜き取り
    k = 0
    while k < 8 do
      if mcntr[k] >= 3
        kotsucnt += 1
        mcntr[k] -= 2
      end
      if pcntr[k] >= 3
        kotsucnt += 1
        pcntr[k] -= 2
      end
      if scntr[k] >= 3
        kotsucnt += 1
        scntr[k] -= 2
      end
      if k < 7
        if zcntr[k] >= 3
          kotsucnt += 1
          zcntr[k] -= 2
        end
      end
      k += 1
    end
  
    # 順子抜き取り
    s = 0
    while s < 6 do
      if mcntr[s] == 1 && mcntr[s+1] == 1 && mcntr[s+2] == 1
        shuntsucnt += 1
        mcntr[s] -= 2
      end
      if pcntr[s] == 1 && pcntr[s+1] == 1 && pcntr[s+2] == 1
        shuntsucnt += 1
        pcntr[s] -= 2
      end
      if scntr[s] == 1 && scntr[s+1] == 1 && scntr[s+2] == 1
        shuntsucnt += 1
        scntr[s] -= 2
      end
      s += 1
    end

    @now_shanten = minishanten - (kotsucnt * 2) - (shuntsucnt * 2) - (jantocnt)
  end


end
