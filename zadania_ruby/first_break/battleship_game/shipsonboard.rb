require_relative "./ship_type/onedecker.rb"
require_relative "./ship_type/twodecker.rb"
require_relative "./ship_type/threedecker.rb"
require_relative "./ship_type/fourdecker.rb"
require_relative "./board.rb"

class ShipsOnBoard
  attr_reader :board, :ships, :all_ships_coordinates

  def initialize
    @board = Board.new
    @ships = []
    @all_ships_coordinates = []
    run
  end

  def run
    1.times { add_fourdecker }
    2.times { add_threedecker }
    3.times { add_twodecker }
    4.times { add_onedecker }
    find_all_ships_coordinates
    return @board
  end

  def add_onedecker
    ship = OneDecker.new(@board)
    add_ship(ship)
  end

  def add_twodecker
    while true
    ship = TwoDecker.new(@board)
    break if add_ship(ship)
    end
  end

  def add_threedecker
    while true
    ship = ThreeDecker.new(@board)
    break if add_ship(ship)
    end
  end

  def add_fourdecker
    while true
    ship = FourDecker.new(@board)
    break if add_ship(ship)
    end
  end

  def add_ship(ship)
    adding_ship = true
    adding_ship = false unless @board.are_fields_empty?(ship.coordinates)
    ship.coordinates.each do |elem|
      unless @board.neighbouring_fields_empty?(elem)
        adding_ship = false
      end
    end
    if adding_ship
      @board.fill(ship.coordinates)
      @ships << ship
      return true
    else
      return false
    end
  end

  def find_all_ships_coordinates
    index = 0
    while index < @ships.size
      ship_coordinates = @ships[index].coordinates
      ship_coordinates.each { |coord| @all_ships_coordinates << coord }
      index += 1
    end
    @all_ships_coordinates
  end
end
