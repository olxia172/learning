class Reader
  attr_accessor :card_number, :rented
  attr_reader :name, :surname
  def initialize(name, surname)
    @name = name
    @surname = surname
    @history = []
    self.rented = []
    self.card_number = nil
  end

  def rent_book(book_to_rent, date)
    if book_to_rent.avaliable?
      book_to_rent.mark_as_rented
      book_to_rent.book_rental_date(date)
      rented << book_to_rent
    else
      throw 'Książka jest już wypożyczona'
    end
  end

  def return_book(book_to_return, date)
    if book_to_return
      to_history(book_to_return, date)
      book_to_return.mark_as_avaliable
      rented.reject! { |rented_book| rented_book == book_to_return }
    else
      throw 'Nie masz wypożyczonej takiej książki'
    end
  end

  def list_of_rented_books
    rented.each do |book|
      print book.author + "\t" + book.title + "\t" + 'wypożyczona od: ' + book.date.to_s + "\n"
    end
  end

  def to_history(book, date)
    book = rented.find { |elem| elem == book }
    time = (Date.parse(date) - book.date).to_i
    book_to_history = {
      title: book.title,
      author: book.author,
      how_long_rented: time
    }
    @history << book_to_history
  end

  def show_history
    @history.each do |book|
      print book[:author] + "\t" + book[:title] + "\t" + 'wypożyczona przez: ' + book[:how_long_rented].to_s + "dni\n"
    end
  end
end
