require_relative './directions.rb'
require_relative './allcoordinates.rb'
require_relative '../board.rb'

class TwoDecker
  include AllCoordinates

  attr_reader :coordinates, :neighbours

  def initialize(board)
    @coordinates = []
    @neighbours = []
    @board = board
    generate_coordinates
  end

  def generate_coordinates
    all_coordinates
    find_neighbours(@coordinates)
  end

  def all_coordinates
    first_coord = @board.sample_coordinate
    @coordinates << first_coord

    first_row, first_column = find_coordinate_index(first_coord)

    directions = Directions.new(first_coord)
    x_direction = directions.x.sample
    y_direction = directions.y.sample if x_direction.zero?

    if x_direction.zero?
      next_row = @board.rows[first_row + y_direction]
      next_coordinate = @board.columns[first_column] + next_row.to_s
      @coordinates << next_coordinate
    else
      next_column = @board.columns[first_column + x_direction]
      next_coordinate = next_column + @board.rows[first_row].to_s
      @coordinates << next_coordinate
    end
    return @coordinates
  end
end
