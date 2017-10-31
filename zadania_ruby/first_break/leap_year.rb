def leap_year?(year)
  if ((year % 4).zero? && year %  100 != 0) || (year % 400).zero?
    true
  else
    false
  end
end


puts leap_year?(2004).inspect
puts leap_year?(2000).inspect
puts leap_year?(2100).inspect
