

class Enigma
  def date_generator
    require 'date'
    date = Date.today
    month = date.mon.to_s
    day = date.mday.to_s
    year = date.year.to_s.slice(2,3)
    @date_squared = ((month + day + year).to_i**2).to_s

    return @date_squared
  end

  def key
    "23456"
  end


  def offset(range, slice)
    key.slice(range).to_i + @date_squared.slice(slice).to_i
  end

  def first_offset
    offset(0..1, -4)
  end

  def second_offset
    offset(1..2, -3)
  end

  def third_offset
    offset(2..3, -2)
  end

  def fourth_offset
    offset(3..4, -1)
  end


  def encryptor


  end

end

today = Enigma.new

puts today.date_generator
puts today.first_offset
puts today.second_offset
puts today.third_offset
puts today.fourth_offset
