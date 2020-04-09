require_relative "board"
require_relative "player"

class Game

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
      puts "#{@current_player.sign.upcase}, it's your turn! What square would you like to play?"
      @choice = gets.chomp.to_i
      if @board.mark_square(@current_player, @choice)
        @board.draw_board
        game_over?()
        switch_player()
      end
    end
  end

  def game_over?
    if @board.check_if_winner
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
