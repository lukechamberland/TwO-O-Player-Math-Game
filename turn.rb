class Turn
  def initialize(turn)
    @turn = turn
  end

  def pturn
    if @turn % 2 == 0
      1
    else
      2
    end
  end

  def increment_turn
    @turn += 1
  end
end