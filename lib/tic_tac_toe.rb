require_relative 'player'
require_relative 'board'

class TicTacToe
  def initialize
    @board = Board.new
    @player_x = Player.new("Player1", "x", @board)
    @player_o = Player.new("Player2", "o", @board)
    @current_player = @player_x
  end

  def play
    loop do
      @board.render
      @current_player.get_coordinates
      break if check_game_over
      switch_players
    end
    @board.render
  end

  def check_game_over
    check_victory || check_draw
  end

  def check_victory
    if @board.winning_combination?(@current_player.piece)
      puts "Congratulations #{@current_player.name}, you win!"
      true
    else
      false
    end
  end

  def check_draw
    if !@board.full?
      puts "Bummer, you've drawn..."
      true
    else
      false
    end
  end

  def switch_players
    if @current_player == @player_x
      @current_player = @player_o
    else
      @current_player = @player_x
    end
  end
end

game = TicTacToe.new
game.play