require_relative "./ship_type/onedecker.rb"
require_relative "./ship_type/twodecker.rb"
require_relative "./ship_type/threedecker.rb"
require_relative "./ship_type/fourdecker.rb"
require_relative "./board.rb"


class ShipsOnBoard
  def initialize
    @board = Board.new
    @ships = []
    run
  end

  attr_reader :board, :ships

  def run
    2.times { add_onedecker }
    2.times { add_twodecker }
    return @board
  end

  def add_onedecker
    ship = OneDecker.new(@board)
    add_ship(ship)
  end

  def add_twodecker
    ship = TwoDecker.new(@board)
    add_ship(ship)
  end

  def add_ship(ship)
    if @board.are_fields_empty?(ship.coordinates)
      @board.fill(ship.coordinates)
      @ships << ship
    end
  end

end
