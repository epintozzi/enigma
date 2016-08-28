
require "pry"
class Enigma
  attr_reader :alpha_index

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

  def alpha_index
    @alpha_index = {"a" => 0, "b" => 1, "c" => 2, "d" => 3,
      "e" => 4, "f" => 5, "g" => 6, "h" => 7, "i" => 8,
      "j" => 9, "k" => 10, "l" => 11, "m" => 12, "n" => 13,
      "o" => 14, "p" => 15, "q" => 16, "r" => 17, "s" => 18,
      "t" => 19, "u" => 20, "v" => 21, "w" => 22, "x" => 23,
      "y" => 24, "z" => 25}
    end

    def rot1
      @rotation_1 = char_map.rotate(first_offset)
      return @rotation_1
    end

    def rot2
      @rotation_2 = char_map.rotate(second_offset)
      return @rotation_2
    end

    def rot3
      @rotation_3 = char_map.rotate(third_offset)
      return @rotation_3
    end

    def rot4
      @rotation_4 = char_map.rotate(fourth_offset)
      return @rotation_4
    end

    def encrypt(message)

      characters = message.chars
      # binding.pry
      @encrypted_message = []
      # characters.each do |char|
      #
      #   @rotated_character = char_map.rotate(char_map.index(char) + self.first_offset).first
      #
      #   @encrypted_message << @rotated_character
      #
      # end

      offset = self.first_offset

      characters.each do |char|

        if characters.index(char) % 4 == 0
          offset = self.first_offset
        elsif characters.index(char) % 4 == 1
          offset = self.second_offset
        elsif characters.index(char) % 4 == 2
          offset = self.third_offset
        elsif characters.index(char) % 4 == 3
          offset = self.fourth_offset
        end

        @rotated_character = char_map.rotate(char_map.index(char) + offset).first



          @encrypted_message << @rotated_character
        end
        #
        # characters.length.times do |i|
        #   @rotational_amount = [@rotation_1, @rotation_2, @rotation_3, @rotation_4] % i
        # end

        return @encrypted_message
      end

      # def offsetter
      #
      #   first_offset if char_map.index(char) % 4 == 0
      #   second_offset if char_map.index(char) % 4 == 1
      #
      #
      # end

    end

    today = Enigma.new

    # require 'json'
    puts today.date_generator
    puts today.first_offset
    puts today.second_offset
    puts today.third_offset
    puts today.fourth_offset
    # puts today.rotate_alpha_first.to_json
    # puts today.alpha_index
    # puts today.alpha_index.fetch("h")


    # puts today.rot1[(today.alpha_index.fetch("h"))]

    puts today.encrypt("tablet")
