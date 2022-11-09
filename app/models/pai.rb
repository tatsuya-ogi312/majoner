class Pai

  MAJON_PAIRS = [
    %w[m p s].product([*1..9]).map{ ["#{_1}#{_2}"] * 4 },
    (1..7).map{ ["z#{_1}"] * 4 }
  ].flatten.freeze  

  def initialize
    @majon_pais = MAJON_PAIRS
  end

  def haipai
    @haipai = @majon_pais.sample(14)
    @haipai.sort
  end

  def shanten
    mcounter = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    scounter = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    pcounter = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    zcounter = [0, 0, 0, 0, 0, 0, 0]
    @haipai.each do |pai|
      pai_num = pai.split(/\s*/)
      val = pai_num[1].to_i - 1
      case pai_num[0]
      when "m" then
        mcounter[val] += 1
      when "p" then
        pcounter[val] += 1
      when "s" then
        scounter[val] += 1
      when "z" then
        zcounter[val] += 1
      end
    end
  end

end