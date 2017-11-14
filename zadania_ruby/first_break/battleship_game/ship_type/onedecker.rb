require_relative "../board.rb"

require "pry"
class OneDecker
  def initialize(board)
    @coordinates = []
    @neighbours = []
    @board = board
    generate_coordinates
  end

  attr_reader :coordinates, :neighbours

private

  def generate_coordinates
    @coordinates << @board.sample_coordinate
    find_neighbours(@coordinates[0])
  end

  def find_neighbours(coordinates)
    row_index, column_index = find_coordinate_index(coordinates)
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
    @neighbours = neighbours.reject { |elem| elem == @coordinates[0] }
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

  def in_bounds(index1, index2)
    if (index1 >= 0 && index1 <= 9) && (index2 >= 0 && index2 <= 9)
      true
    end
  end
end
