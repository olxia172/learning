require_relative './directions.rb'
require_relative './allcoordinates.rb'

class FourDecker
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
      counter = 1
      until @coordinates.size == 4
        next_row = @board.rows[first_row + (y_direction * counter)]
        next_coordinate = @board.columns[first_column] + next_row.to_s
        @coordinates << next_coordinate
        counter += 1
      end
    else
      counter = 1
      until @coordinates.size == 4
        next_column = @board.columns[first_column + (x_direction * counter)]
        next_coordinate = next_column + @board.rows[first_row].to_s
        @coordinates << next_coordinate
        counter += 1
      end
    end
    return @coordinates
  end
end
