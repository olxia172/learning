require "csv"

class Products
  def initialize
    @products = []
    load_products
  end

  def load_products
    if @products == []
      CSV.foreach('products.csv', headers: true) do |row|
        @products << parse_line(row)
      end
    end
    @products
  end

  def find(product)
    @products.each do |row|
      if row[:name] == product
        result = "#{row[:name]} #{row[:price]}#{row[:currency]}"
        return result
      end
    end
    result
  end

  def find_cheaper_products(price)
    @products.find_all do |row|
      row[:price].to_f < price.to_f
    end.each do |row|
      puts "#{row[:name]} #{row[:price]}#{row[:currency]}\n"
    end
  end

  def find_more_expensive_products(price)
    @products.find_all do |row|
      if row[:price].to_f > price.to_f
        puts "#{row[:name]} #{row[:price]}#{row[:currency]}"
      end
    end
  end

  def convert_prices_to_currency(exchange_rate, currency, file_name)
    new_headers = ['Product', "Price(#{currency})", 'Weight(kg)']
    CSV.open("./#{file_name}", 'w') do |csv|
      csv << new_headers
      @products.each do |row|
        new_price = row[:price].to_f / exchange_rate.to_f
        csv << [row[:name], new_price.round(2), row[:weight]]
      end
    end
  end

  private

  def parse_line(row)
    price_header = price_header(row)
    {
      name: row['Product'],
      price: row[price_header],
      weight: row['Weight(kg)'],
      currency: price_header[6..-2]
    }
  end

  def price_header(row)
    row.headers.select do |header|
      header[0..4] == 'Price'
    end.first
  end
end

products = Products.new
products.load_products

case ARGV[0]
when '-f'
  puts products.find(ARGV[1])
when '-lt'
  products.find_cheaper_products(ARGV[1])
when '-gt'
  puts products.find_more_expensive_products(ARGV[1])
when '-c'
  products.convert_prices_to_currency(ARGV[1], ARGV[2], ARGV[3])
end
