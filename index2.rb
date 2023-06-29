class Index

  attr_reader :first, :second, :answer, :turn, :whosturn, :p1score, :p2score

  def initialize
    @first = 0
    @second = 0
    @answer = 0
    @turn = 0
    @whosturn = 1
    @p1score = 3
    @p2score = 3
  end

  def turn
    if @turn % 2 == 0
      @whosturn = 1
    else
      @whosturn = 2
    end
  end

  def increment_turn
    @turn += 1
  end
  
  def startgame
    puts "Player #{@whosturn}'s turn to aswer"
    puts "What is the first value?"
    @first = gets.chomp.to_i
    puts "What is the second value?"
    @second = gets.chomp.to_i
  end

  def output
    puts "What is #{@first} + #{@second}?"
    @answer = gets.chomp.to_i
  end

  def check
    if @answer == @first + @second
      puts "Correct, good job!"
    else
      puts  "Not correct."
      if @whosturn == 1
        @p1score -= 1
      else 
        @p2score -= 1
      end
    end
  end

  def showscore
    puts "P1: #{@p1score}/3  |  P2: #{@p2score}/3"
  end

  def display_winner
    if p1score == 0
      puts "Player 2 wins!"
    elsif p2score == 0
      puts "Player 1 wins!"
    else
      puts "No winner yet."
    end
  end
end

newgame = Index.new
puts "---NEW-GAME---"
newgame.startgame
newgame.output
newgame.check
newgame.increment_turn
newgame.showscore

while newgame.p1score > 0 && newgame.p2score > 0
  puts "---NEW-TURN---"
  newgame.turn
  newgame.startgame
  newgame.output
  newgame.check
  newgame.increment_turn
  newgame.showscore
end

puts "Game Over"
newgame.display_winner