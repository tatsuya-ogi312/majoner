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
    mcntr = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    scntr = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    pcntr = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    zcntr = [0, 0, 0, 0, 0, 0, 0]
    kotsucnt = 0
    shunthucnt = 0
    @haipai.each do |pai|
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
  end

  tehaibox = mcntr + pcntr + scntr + zcntr

  i = 0
  while i < 30 do
  end

end