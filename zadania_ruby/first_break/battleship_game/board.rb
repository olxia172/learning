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

  attr_reader :board, :coordinates

  def create_board
    @board = Array.new(10) { Array.new(10, @field_options[:empty_unselected_field])}
  end

  def sample_coordinate
    @first_column = @columns.sample
    @first_row = @rows.sample
    @first_coord = @first_column + @first_row.to_s

    if find_coordinate_value(@first_coord).zero? && neighbouring_fields_empty?(@first_coord)
        return @first_coord
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
    row_index = @rows.find_index(coordinate[1].to_i)
    [row_index, column_index]
  end

  def neighbouring_fields_empty?(coordinate)
    neighbours_coord = []
    row_index, column_index = find_coordinate_index(coordinate)
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
    neighbours_coord.compact
    are_neighbours_empty?(neighbours_coord)
  end

  def in_bounds(index1, index2)
    if (index1 >= 0 && index1 <= 9) && (index2 >= 0 && index2 <= 9)
      true
    end
  end

  def are_fields_empty?(coordinates)
    coordinates = coordinates[0]
    if find_coordinate_value(coordinates) == 0
      true
    else
      false
    end
  end

  def are_neighbours_empty?(coordinates)
    fields = []
    coordinates.each { |coord| fields << find_coordinate_value(coord) }
    fields.delete(0)
    if fields.empty?
      true
    else
      false
    end
  end

  def fill(coordinates)
    coordinates.each do |coordinate|
      row_index, column_index = find_coordinate_index(coordinate)
      @board[row_index][column_index] = @field_options[:filled_unselected_field]
    end
  end
end
