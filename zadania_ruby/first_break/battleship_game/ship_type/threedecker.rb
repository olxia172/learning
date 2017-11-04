require_relative "./directions.rb"

class ThreeDecker
  def initialize
    @coordinates = []
    @board_rows = (1..10).to_a
    @board_columns = ('A'..'J').to_a
  end

  attr_accessor :coordinates

  def coordinates
    next_coordinates
    puts @coordinates
  end

private

  def first_coordinate
    @first_column = @board_columns.sample
    @first_row = @board_rows.sample
    @first_coord = @first_column + @first_row.to_s
    @coordinates << @first_coord
    @first_coord
  end

  def next_coordinates
    first_coordinate
    directions = Directions.new(@first_coord)
    x_direction = directions.x.sample
    y_direction = directions.y.sample

    counter = 1
    until @coordinates.size == 3
      if x_direction.zero?
        next_row = @first_row + (y_direction * counter)
        next_coordinate = @first_column + next_row.to_s
        @coordinates << next_coordinate
      else
        index = @board_columns.find_index(@first_column)
        next_column = @board_columns[index + (x_direction * counter)]
        next_coordinate = next_column + @first_row.to_s
        @coordinates << next_coordinate
      end
      counter += 1
    end
    @coordinates
  end
end
