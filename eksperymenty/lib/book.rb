class Book
  attr_accessor :status, :date
  attr_reader :author, :title, :pages

  def initialize(author, title)
    @author = author
    @title = title
    self.status = 'avaliable'
    self.date = nil
  end

  def avaliable?
    status == 'avaliable'
  end

  def mark_as_rented
    self.status = 'taken'
  end

  def mark_as_avaliable
    self.status = 'avaliable'
  end

  def book_rental_date(given_date)
    self.date = Date.parse(given_date)
  end
end
