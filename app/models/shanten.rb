class Shanten

  def initialize(ripai)
    @mcntr = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    @scntr = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    @pcntr = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    @zcntr = [0, 0, 0, 0, 0, 0, 0]
    ripai.each do |pai|
      pai_num = pai.split(/\s*/)
      val = pai_num[1].to_i - 1
      case pai_num[0]
      when "m" then
        @mcntr[val] += 1
      when "p" then
        @pcntr[val] += 1
      when "s" then
        @scntr[val] += 1
      when "z" then
        @zcntr[val] += 1
      end
    end
  end

  def hantei
    min_shanten = 8
    kotsucnt = 0
    shuntsucnt = 0
    jantocnt = 0
    ranmencnt = 0
    kanchancnt = 0
    penchancnt = 0
    # 雀頭抜き取り
    j = 0
    while j < 9 do
      if j <= 6
        if @mcntr[j] == 2
          jantocnt += 1
          @mcntr[j] -= 2
        end
        if @pcntr[j] == 2
          jantocnt += 1
          @pcntr[j] -= 2
        end
        if @scntr[j] == 2
          jantocnt += 1
          @scntr[j] -= 2
        end
        if @zcntr[j] == 2
            jantocnt += 1
            @zcntr[j] -= 2
        end
      end
      j += 1
      sleep 0.01
    end
  
    # 刻子抜き取り
    k = 0
    while k < 9 do
      if @mcntr[k] >= 3
        kotsucnt += 1
        @mcntr[k] -= 3
      end
      if @pcntr[k] >= 3
        kotsucnt += 1
        @pcntr[k] -= 3
      end
      if @scntr[k] >= 3
        kotsucnt += 1
        @scntr[k] -= 3
      end
      if k < 6
        if @zcntr[k] >= 3
          kotsucnt += 1
          @zcntr[k] -= 3
        end
      end
      k += 1
      sleep 0.01
    end
  
    # 順子抜き取り
    s = 0
    while s < 7 do
      if @mcntr[s] == 1 && @mcntr[s+1] == 1 && @mcntr[s+2] == 1
        shuntsucnt += 1
        @mcntr[s] -= 1
        @mcntr[s+1] -= 1
        @mcntr[s+2] -= 1
      end
      if @pcntr[s] == 1 && @pcntr[s+1] == 1 && @pcntr[s+2] == 1
        shuntsucnt += 1
        @pcntr[s] -= 1
        @pcntr[s+1] -= 1
        @pcntr[s+2] -= 1
      end
      if @scntr[s] == 1 && @scntr[s+1] == 1 && @scntr[s+2] == 1
        shuntsucnt += 1
        @scntr[s] -= 1
        @scntr[s+1] -= 1
        @scntr[s+2] -= 1
      end
      s += 1
      sleep 0.01
    end

    # 両面抜き取り
    r = 1
    while r < 7 do
      if @mcntr[r] == 1 && @mcntr[r+1] == 1
        ranmencnt += 1
        @mcntr[r] -= 1
        @mcntr[r+1] -= 1
      end
      if @pcntr[r] == 1 && @pcntr[r+1] == 1 && @pcntr[r+2] == 1
        ranmencnt += 1
        @pcntr[r] -= 1
        @pcntr[r+1] -= 1
      end
      if @scntr[r] == 1 && @scntr[r+1] == 1 && @scntr[r+2] == 1
        ranmencnt += 1
        @scntr[r] -= 1
        @scntr[r+1] -= 1
      end
      r += 1
      sleep 0.01
    end

    # 辺張抜き取り
    pc = 0
    while pc < 8 do
      if @mcntr[pc] == 1 && @mcntr[pc+1] == 1
        penchancnt += 1
        @mcntr[pc] -= 1
        @mcntr[pc+1] -= 1
      end
      if @pcntr[pc] == 1 && @pcntr[pc+1] == 1
        penchancnt += 1
        @pcntr[pc] -= 1
        @pcntr[pc+1] -= 1
      end
      if @scntr[pc] == 1 && @scntr[pc+1] == 1
        penchancnt += 1
        @scntr[pc] -= 1
        @scntr[pc+1] -= 1
      end
      pc += 7
      sleep 0.01
    end

    # 嵌張抜き取り
    kc = 0
    while kc < 8 do
      if @mcntr[kc] == 1 && @mcntr[kc+2] == 1
        kanchancnt += 1
        @mcntr[kc] -= 1
        @mcntr[kc+2] -= 1
      end
      if @pcntr[kc] == 1 && @pcntr[kc+2] == 1
        kanchancnt += 1
        @pcntr[kc] -= 1
        @pcntr[kc+2] -= 1
      end
      if @scntr[kc] == 1 && @scntr[kc+2] == 1
        kanchancnt += 1
        @scntr[kc] -= 1
        @scntr[kc+2] -= 1
      end
      kc += 1
      sleep 0.01
    end

    return now_shanten = min_shanten - (jantocnt + (kotsucnt * 2) + (shuntsucnt * 2) + ranmencnt + penchancnt + kanchancnt)

  end
end