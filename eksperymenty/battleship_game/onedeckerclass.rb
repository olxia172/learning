class OneDecker
  def initialize
    @coordinates = []
    @board_rows = (1..10).to_a
    @board_columns = ('A'..'J').to_a
  end

  attr_accessor :coordinates

  def coordinates
    first_coordinate
    puts @coordinates
  end

private

  def first_coordinate
    @first_column = @board_columns.sample
    @first_row = @board_rows.sample
    @first_coord = @first_column + @first_row.to_s
    @coordinates << @first_coord
    @coordinates
  end
end

statek = OneDecker.new
statek.coordinates
