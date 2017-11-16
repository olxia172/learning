module AllCoordinates
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
