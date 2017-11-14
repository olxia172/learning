require_relative './library.rb'
require_relative './reader.rb'
require_relative './book.rb'

require "pry"
biblioteka = Library.new
book1 = Book.new('J.K. Rowling', 'Harry Potter i Kamień Filozoficzny')
book2 = Book.new('M. Mitchel', 'Gone with the Wind')
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

czytelnik1 = Reader.new('Aleksandra', 'Kucharczyk')
czytelnik2 = Reader.new('Arkadiusz', 'Buras')
czytelnik3 = Reader.new('Zbyszek', 'Nowak')
binding.pry
biblioteka.add_reader(czytelnik1, czytelnik2, czytelnik3)

puts ''
