def leap_year?(year)
  if ((year % 4).zero? && year %  100 != 0) || (year % 400).zero?
    true
  else
    false
  end
end

def leap_years(years)
  result = []
  years.each do |year|
    if leap_year?(year)
      result << year
    end
  end
  result
end


puts leap_years([2011, 2012, 2015, 2016, 2018])
puts leap_years((2000..2100).to_a)
