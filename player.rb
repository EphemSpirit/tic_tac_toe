class Player

  attr_accessor :sign

  def get_sign
    puts "Would you like to be 'X' or 'O'?"
    self.sign = gets.chomp.downcase
    if sign != 'x' && sign != 'o'
      puts "Pick a valid sign, please!"
      get_sign
    end
    return sign
  end
end
