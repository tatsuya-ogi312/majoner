class Yaku
  
  def initialize(tehai)
    @mcntr = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    @scntr = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    @pcntr = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    @zcntr = [0, 0, 0, 0, 0, 0, 0]
    tehai.each do |pai|
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

  def yakuhantei
    yakubox = ["天和", "自摸"]

    ## 1翻判定
    # 断么判定
    if @mcntr[0] == 0 &&  @mcntr[8] == 0 && @scntr[0] == 0 &&  @scntr[8] == 0 && 
       @pcntr[0] == 0 &&  @pcntr[8] == 0 && @zcntr[0..6] == [0, 0, 0, 0, 0, 0, 0]
      yakubox << "断么"
    end

    # 平和判定（場風、自風考慮なし）
    # if  kotsucnt = 0 && toitucnt == 1 && shuntsucnt == 4 && @zcntr[0..8] == [0, 0, 0, 0, 0, 0, 0, 0, 0]
    #   yakubox << "平和"
    # end

    ## 2翻判定

    ## 4翻判定
    # 混一色判定
    if @mcntr.sum + @zcntr.sum == 14 || @scntr.sum + @zcntr.sum == 14 || @pcntr.sum + @zcntr.sum == 14
        yakubox << "混一色"
    end

    # 小三元判定【槓子身配慮】
    if @zcntr[4] + @zcntr[5] + @zcntr[6] >= 8
      yakubox << "小三元"
    end

    ## 6翻判定
    # 清一色判定
    if @mcntr.sum == 14 || @pcntr.sum == 14 || @scntr.sum == 14
      yakubox << "清一色"
    end

    return yakubox

  end

end