class CheckScore
  def initialize(game)
    @game = game
  end

  def check_answer
    if @game.answer == @game.first + @game.second
      puts "Correct, good job!"
    else
      puts "Not correct, good try."
      if @game.whosturn == 1
        @game.p1score = @game.p1score - 1
      else
        @game.p2score = @game.p2score - 1
      end
    end
  end
end
