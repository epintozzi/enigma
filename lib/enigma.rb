
require "pry"
class OffsetGen
	attr_reader :key, :a, :b, :c, :d, :alpha_index
	attr_accessor :rotation_place

  def key_generator
    @key = (0..9).to_a.shuffle
    @key = @key[0..4].join  #this returns a string
  end

  def date_generator
    require 'date'
    date = Date.today
    month = date.mon.to_s
    day = date.mday.to_s
    year = date.year.to_s.slice(2,3)
    @date_squared = ((month + day + year).to_i**2).to_s

    return @date_squared
  end

  # def key
  #   "23456"
  # end


  def offset(range, slice_at)
    key.slice(range).to_i + @date_squared.slice(slice_at).to_i
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

  def char_map
    @alphabet = %w(a b c d e f g h i j k l m n o p q r s t u v w x y z)
  end

  def encrypt(message)

    characters = message.chars
    # binding.pry
    @encrypted_message = []

    characters.each_with_index do |char, index|
      if index % 4 == 0
        offset = self.first_offset
      elsif index % 4 == 1
        offset = self.second_offset
      elsif index % 4 == 2
        offset = self.third_offset
      elsif index % 4 == 3
        offset = self.fourth_offset
      end

      @rotated_character = char_map.rotate(char_map.index(char) + offset).first
      @encrypted_message << @rotated_character
    end
    return @encrypted_message.join
  end

end

today = Offset_Gen.new

# require 'json'
puts today.date_generator
# puts today.first_offset
# puts today.second_offset
# puts today.third_offset
# puts today.fourth_offset
# puts today.rotate_alpha_first.to_json
# puts today.alpha_index

puts today.encrypt("reallylongwordgoeshere")
