require_relative "./book.rb"
require_relative "./reader.rb"

class Library
  attr_reader :readers
  def initialize
    @all_books_in_library = []
    @readers = []
  end

  def show_book_list
    @all_books_in_library.each do |book|
      print book.author + "\t" + book.title + "\t" + 'status: ' + book.status + "\n"
    end
  end

  def add_new_book(book)
    @all_books_in_library << book
  end

  def add_reader(reader)
    generate_card_number(reader)
    @readers << reader
  end

  def generate_card_number(reader)
    letters = ('A'..'Z').to_a
    numbers = (0..9).to_a
    reader.card_number = letters.sample(5).join + numbers.sample(5).join
  end

  def find_book(title_or_author)
    @all_books_in_library.find do |book|
      book.title.downcase == title_or_author.downcase || book.author.downcase == title_or_author.downcase
    end
  end

  def find_reader(first_name, last_name)
    @readers.find do |reader|
      reader.name == first_name && reader.surname == last_name
    end
  end

  def rent_book_to_reader(title_or_author, first_name, last_name, date)
    book = find_book(title_or_author)
    reader = find_reader(first_name, last_name)
    if book.nil?
      raise 'Nie ma takiej książki' # TODO: dodac przekazywanie title_or_author
    end
    if reader.nil?
      raise 'Nie ma takiego użytkownika' # TODO: dodac przekazywanie reader
    end
    reader.rent_book(book, date)
  end
end
