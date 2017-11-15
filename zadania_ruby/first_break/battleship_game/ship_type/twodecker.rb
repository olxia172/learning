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
    all_coordinates
    find_neighbours(@coordinates)
  end

  def all_coordinates
    first_coord = @board.sample_coordinate
    @coordinates << first_coord

    first_row, first_column = find_coordinate_index(first_coord)

    directions = Directions.new(first_coord)
    x_direction = directions.x.sample
    if x_direction.zero?
      y_direction = directions.y.sample
    end


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

  def find_coordinate_index(coordinate) # coordinate jest to "A1"
    column_index = @board.columns.find_index(coordinate[0])
    if coordinate.length == 2
      positions = 1
    else
      positions = 1..2
    end
    row_index = @board.rows.find_index(coordinate[positions].to_i)
    [row_index, column_index]
  end

  def find_neighbours(coordinates)
    coordinates.each do |coord|
      neighbours_for_one_coord(coord)
    end
    @neighbours = neighbours.uniq!.reject { |elem| @coordinates.include?(elem) }
  end

  def neighbours_for_one_coord(coord)
    row_index, column_index = find_coordinate_index(coord)
    i = -1
    while i <= 1
      index1 = row_index - 1
      index2 = column_index + i
      if in_bounds(index1, index2)
        coord = @board.columns[index2] + @board.rows[index1].to_s
        neighbours << coord
      end

      index1 = row_index
      index2 = column_index + i
      if in_bounds(index1, index2)
        coord = @board.columns[index2] + @board.rows[index1].to_s
        neighbours << coord
      end

      index1 = row_index + 1
      index2 = column_index + i
      if in_bounds(index1, index2)
        coord = @board.columns[index2] + @board.rows[index1].to_s
        neighbours << coord
      end
      i += 1
    end
  end

  def in_bounds(index1, index2)
    if (index1 >= 0 && index1 <= 9) && (index2 >= 0 && index2 <= 9)
      true
    end
  end
end
