#rescue
  #binding.pry

require "pry"

class Board
  def initialize
    @columns = ('A'..'J').to_a
    @rows = (1..10).to_a
    @field_options = {
      empty_unselected_field: 0,
      empty_selected_field: 1,
      filled_unselected_field: 2,
      filled_selected_field: 3
    }
    create_board
  end

  attr_reader :board, :coordinates, :columns, :rows

  def create_board
    @board = Array.new(10) { Array.new(10, @field_options[:empty_unselected_field])}
  end

  def sample_coordinate
    first_column = @columns.sample
    first_row = @rows.sample
    first_coord = first_column + first_row.to_s

    if are_fields_empty?(first_coord) && neighbouring_fields_empty?(first_coord)
      return first_coord
    else
      sample_coordinate
    end
  end

  def find_coordinate_value(coordinate) # coordinate jest to "A1"
    row_index, column_index = find_coordinate_index(coordinate)
    @board[row_index][column_index]
  end

  def find_coordinate_index(coordinate) # coordinate jest to "A1"
    column_index = @columns.find_index(coordinate[0])
    if coordinate.length == 2
      positions = 1
    else
      positions = 1..2
    end
    row_index = @rows.find_index(coordinate[positions].to_i)
    [row_index, column_index]
  end

  def neighbouring_fields_empty?(coord)
    neighbours_coord = []
    row_index, column_index = find_coordinate_index(coord)

    i = -1
    while i <= 1
      index1 = row_index - 1
      index2 = column_index + i
      if in_bounds(index1, index2)
        coord = @columns[index2] + @rows[index1].to_s
        neighbours_coord << coord
      end
      index1 = row_index
      index2 = column_index + i
      if in_bounds(index1, index2)
        coord = @columns[index2] + @rows[index1].to_s
        neighbours_coord << coord
      end
      index1 = row_index + 1
      index2 = column_index + i
      if in_bounds(index1, index2)
        coord = @columns[index2] + @rows[index1].to_s
        neighbours_coord << coord
      end
      i += 1
    end
    empty = true
    i = 0
    while i < neighbours_coord.size
      empty = false unless are_fields_empty?(neighbours_coord[i])
      i += 1
    end
    return empty
  end

  def in_bounds(index1, index2)
    if (index1 >= 0 && index1 <= 9) && (index2 >= 0 && index2 <= 9)
      true
    end
  end

  def are_fields_empty?(coordinates)
    if coordinates.class == String
      return true if find_coordinate_value(coordinates).zero?
    elsif coordinates.class == Array
      empty = true
      i = 0
      while i < coordinates.size
        empty = false unless find_coordinate_value(coordinates[i])
        i += 1
      end
      return empty
    end
  end

  def fill(coordinates)
    coordinates.each do |coordinate|
      row_index, column_index = find_coordinate_index(coordinate)
      @board[row_index][column_index] = @field_options[:filled_unselected_field]
    end
  end
end
