class Yaku
  def initialize(tehai)
    @tehai = tehai
  end

  def yakuhantei
    Yakubox = []

    ## 1翻判定
    # 断么判定
    if manzucnt[0] == 0 &&  manzucnt[8] == 0 && pinzucnt[0] == 0 &&  pinzucnt[8] == 0 && 
       souzucnt[0] == 0 &&  souzucnt[8] == 0 && zihaicnt[0..8] == [0, 0, 0, 0, 0, 0, 0, 0, 0]
      Yakubox << "断么"
    end

    # 平和判定（場風、自風考慮なし）
    if  kotsucnt = 0 && toitucnt == 1 && shuntsucnt == 4 && zihaicnt[0..8] == [0, 0, 0, 0, 0, 0, 0, 0, 0]
      Yakubox << "平和"
    end

    ## 2翻判定

    ## 4翻判定
    # 混一色判定
    if manzucnt.sum + zihaicnt.sum == 14 || pinzucnt.sum + zihaicnt.sum == 14 || souzucnt.sum + zihaicnt.sum == 14
        Yakubox << "混一色"
    end

    # 小三元判定【槓子身配慮】
    if zihaicnt[5] + zihaicnt[5] zihaicnt[5] >= 8
      Yakubox << "小三元"

    ## 6翻判定
    # 清一色判定
    if manzucnt.sum == 14 || souzucont.sum == 14 || pinzucnt.sum == 14
      Yakubox << "清一色"
    end



  end
end