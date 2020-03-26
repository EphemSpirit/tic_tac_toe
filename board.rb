class Board

  attr_reader :spots
  attr_accessor :sign

  def initialize
    @spots = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    draw_board
  end

  def draw_board
    puts "    #{@spots[0]}  | #{@spots[1]} | #{@spots[2]}"
    puts "    -----------"
    puts "    #{@spots[3]}  | #{@spots[4]} | #{@spots[5]}"
    puts "    -----------"
    puts "    #{@spots[6]}  | #{@spots[7]} | #{@spots[8]}"
  end

  def self.gameplay
    puts"welcome to Tic Tac Toe!"
    sleep(1.5)
    puts "The game is simple:"
    sleep(1.5)
    puts "You can pick an empty spot using numbers from 1-9."
    sleep(1.5)
    puts "First to get a complete row (vertical, horizontal, or diagonal) is the winner."
    sleep(1.5)
    puts "Good luck!\n\n\n"
    sleep(1.5)
    Board.new
  end

  def mark_square(player, choice)
    if valid_move?(choice)
      @spots[choice-1] = player.sign
    else
      puts "That square is taken! Please choose another."
    end
  end

  def valid_move?(choice)
    if @spots[choice-1] == " "
      true
    else
      false
    end
  end

end
