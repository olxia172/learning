require_relative "./ship_type/onedecker.rb"
require_relative "./ship_type/twodecker.rb"
require_relative "./ship_type/threedecker.rb"
require_relative "./ship_type/fourdecker.rb"
require_relative "./board.rb"

require "pry"
class ShipsOnBoard
  def initialize
    @board = Board.new
    @ships = []
    run
  end

  attr_reader :board, :ships

  def run
    4.times { add_onedecker }
    3.times { add_twodecker }
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
end
