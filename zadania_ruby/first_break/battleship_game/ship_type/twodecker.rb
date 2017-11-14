require_relative "./directions.rb"
require_relative '../board.rb'

require "pry"

class TwoDecker
  def initialize(board)
    @coordinates = []
    @neighbours = []
    @board = board
    generate_coordinates
  end

  attr_reader :coordinates, :neighbours

  def generate_coordinates
    coordinates
    #find_neighbours(@coordinates[0])
  end

  def coordinates
    first_coord = @board.sample_coordinate
    @coordinates << first_coord

    first_row, first_column = find_coordinate_index(first_coord)

    directions = Directions.new(first_coord)
    x_direction = directions.x.sample
    y_direction = directions.y.sample

    if x_direction.zero?
      next_row = first_row + y_direction
      next_coordinate = first_column + next_row.to_s
      @coordinates << next_coordinate
    else
      index = @board.columns.find_index(first_column)
      next_column = @board.columns[index + x_direction]
      next_coordinate = next_column + first_row.to_s
      @coordinates << next_coordinate
    end
    @coordinates
  end

  def find_coordinate_index(coordinate) # coordinate jest to "A1"
    column = coordinate[0]
    if coordinate.length == 2
      positions = 1
    else
      positions = 1..2
    end
    row = coordinate[positions].to_i
    [row, column]
  end
end
