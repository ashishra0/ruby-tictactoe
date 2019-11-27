class Player
  attr_accessor :name, :piece
  def initialize(name, piece, board)
    @name = name
    @piece = piece
    @board = board
  end

  def get_coordinates
    loop do
      coords = ask_for_coords
      if validate_coord_format(coords)
        if @board.add_piece(coords, @piece)
          break
        end
      end
    end
  end

  def ask_for_coords
    puts "enter your coordinates in the form of x,y"
    gets.strip.split(",").map(&:to_i)
  end

  def validate_coord_format(coords)
    if coords.is_a?(Array) && coords.size == 2
      true
    else
      puts "Coordinates are not in the proper format"
    end
  end
end