require_relative 'turn'
require_relative 'check_score'

class Index
  attr_reader :first, :second, :answer, :turn, :p1score, :p2score
  attr_accessor :whosturn, :p1score, :p2score

  def initialize
    @first = 0
    @second = 0
    @answer = 0
    @turn = 0
    @whosturn = 1
    @p1score = 3
    @p2score = 3
  end

  def startgame
    puts "Player #{@whosturn}'s turn to answer"
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
    checker = CheckScore.new(self)
    checker.check_answer
  end

  def showscore
    puts "P1: #{@p1score}/3  |  P2: #{@p2score}/3"
  end

  def display_winner
    if p1score == 0
      puts "Player 2 won!"
    elsif p2score == 0
      puts "Player 1 won!"
    else
      puts "No winner yet."
    end
  end
end

turn = Turn.new(0)
newgame = Index.new

puts "---NEW-GAME---"
newgame.startgame
newgame.output
newgame.check
turn.increment_turn
newgame.showscore

while newgame.p1score > 0 && newgame.p2score > 0
  puts "---NEW-TURN---"
  newgame.whosturn = turn.pturn
  newgame.startgame
  newgame.output
  newgame.check
  turn.increment_turn
  newgame.showscore
end

puts "Game Over"
newgame.display_winner
