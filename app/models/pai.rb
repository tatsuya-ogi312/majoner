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

end