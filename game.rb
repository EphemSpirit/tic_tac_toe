require_relative "board"
require_relative "player"

class Game

  WIN_CONDITIONS = [[1, 2, 3], #horizontals
                    [4, 5, 6],
                    [7, 8, 9],
                    [1, 4, 7], #verticals
                    [2, 5, 8],
                    [3, 6, 9],
                    [1, 5, 9], #diagonals
                    [3, 5, 7]]

  @@game_over = false

  attr_reader :current_player, :other_player, :choice

  def initialize(p1, p2, board = Board.new)
    @p1 = p1
    @p2 = p2
    @board = board
    @current_player = @p1
    @other_player = @p2
    Board.gameplay
  end

  def play_round()
    @p1.get_sign
    if @p1.sign == 'x'
      @p2.sign = 'o'
    else
      @p2.sign = 'x'
    end

    until @@game_over
      puts "What square would you like to play?"
      @choice = gets.chomp.to_i
      @board.mark_square(@current_player, @choice)
    end
    draw_board
    game_over?
    switch_player
  end

  def winner? spots
    winner = false
    WIN_CONDITIONS.each do |lines|
      winner = lines.each do |place|
        choice == @spots[choice]
      end
      break if winner
    end
    return winner
  end

  def game_over?
    if winner?
      @@game_over = true
    end
  end

  def switch_player()
    @current_player, @other_player = @other_player, @current_player
  end

end

p1 = Player.new
p2 = Player.new
game = Game.new(p1, p2)
game.play_round
