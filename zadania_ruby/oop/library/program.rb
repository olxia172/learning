require_relative './library.rb'
require_relative './reader.rb'
require_relative './book.rb'

require "pry"
biblioteka = Library.new
book1 = Book.new('J.K. Rowling', 'Harry Potter i Kamień Filozoficzny')
book2 = Book.new('M. Mitchel', 'Przeminęło z wiatrem')
book3 = Book.new('A. Sapkowski', 'Wiedźmin')
book4 = Book.new('J. Austen', 'Duma i uprzedzenie')
book5 = Book.new('A. Weir', 'Marsjanin')
book6 = Book.new('E. Grzelakowska-Kostoglu', 'Tajniki makijażu')

biblioteka.add_new_book(book1)
biblioteka.add_new_book(book2)
biblioteka.add_new_book(book3)
biblioteka.add_new_book(book4)
biblioteka.add_new_book(book5)
biblioteka.add_new_book(book6)

#binding.pry
czytelnik1 = Reader.new('Aleksandra', 'Kucharczyk')
czytelnik2 = Reader.new('Arkadiusz', 'Buras')
czytelnik3 = Reader.new('Zbyszek', 'Nowak')
#mam_ksiazke = biblioteka.find('Wiedźmin')
#czytelnik1.rent_book(mam_ksiazke)
biblioteka.add_reader(czytelnik1)
biblioteka.add_reader(czytelnik2)
biblioteka.add_reader(czytelnik3)

begin
  biblioteka.rent_book_to_reader('tytul ksiazki', 'imie', 'nazwisko', '2017-05-01')
rescue Exception => error
  puts error
end
biblioteka.rent_book_to_reader('Wiedźmin', 'Aleksandra', 'Kucharczyk', '2017-02-03')
puts ''
