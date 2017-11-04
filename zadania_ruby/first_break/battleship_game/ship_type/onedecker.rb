require_relative "../board.rb"

class OneDecker
  def initialize(board)
    @coordinates = []
    @board = board
    generate_coordinates
  end

  attr_reader :coordinates

private

  def generate_coordinates
    @coordinates << @board.sample_coordinate
  end
end
