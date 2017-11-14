require_relative "./book.rb"
require_relative "./reader.rb"

class Library
  attr_accessor :all_books_in_library
  attr_reader :readers
  def initialize
    self.all_books_in_library = []
    @readers = []
  end

  def show_book_list
    all_books_in_library.each do |book|
      print book.author + "\t" + book.title + "\t" + 'status: ' + book.status + "\n"
    end
  end

  def add_new_book(book)
    all_books_in_library << book
  end

  def add_reader(reader)
    generate_card_number(reader)
    @readers << reader
  end

  def generate_card_number(reader)
    letters = ('A'..'Z').to_a
    numbers = (0..9).to_a
    reader.card_number = letters.sample(3).join + numbers.sample(5).join
  end
end
