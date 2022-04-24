class Calculator
  attr_accessor :input, :output
  def initialize(math_string)
    @input = math_string
  end

  # call this method to calculate string
  def output
    # split input into array
    array = split_into_array()
    convert_and_calculate(array)
  end

  def convert_and_calculate(array)
    total = 0.0
    index = 0
    while index < array.length
      # first check if it's a fraction
      if array[index].include?("_") && array[index].include?("/")
        if index == 0
          float = convert_fract_to_float(array, index)
          total += float
        else
          float = convert_fract_to_float(array, index)
          total = perform_math_calculation(array, index, total, float)
        end
      # fractions that are not mixed numbers
      elsif array[index].include? "/"
        if index == 0
          float = convert_fract_to_float(array, index)
          total += float
        else
          float = convert_fract_to_float(array, index)
          total = perform_math_calculation(array, index, total, float)
        end
      # whole numbers
      else
        integer = array[index].to_i
        if index == 0
          total += integer
        else
          total = perform_math_calculation(array, index, total, integer)
        end
      end
      index += 2
    end
    # rationalize method has one argument, which is the amount of precision you're willing to trade for simplicity
    total = total.to_r.rationalize(0.005)
    convert_total_to_string(total)
  end

  def split_into_array
    # split input into array with each index containing a digit or math symbol
    input.split(" ")
  end

  def convert_fract_to_float(array, index)
    if array[index].include? "_"
      split_fraction = array[index].split("_")
      integer = split_fraction[0].to_i
      rational = split_fraction[-1].to_r
      float = rational.to_f
      float = float + integer
    else
      rational = array[index].to_r
      float = rational.to_f
    end
  end

  def perform_math_calculation(array, index, total, num)
    if array[index - 1] == "+"
      total += num
    elsif array[index - 1] == "-"
      total -= num
    elsif array[index - 1] == "/"
      total /= num
    elsif array[index - 1] == "*"
      total *= num
    end
  end

  def convert_total_to_string(total)
    # checks for whole numbers (no fractions)
    if total.denominator == 1
      integer = total.numerator / total.denominator
      integer.to_s
    else
      # for some reason, rationals are weird with negatives
      # even if the value was less than 0, dividing the numerator by the denominator would net a -1...
      if total.negative?
        total *= -1
        integer = (total.numerator / total.denominator).to_i
        fraction = ((total.numerator % total.denominator) / total.denominator.to_f).to_r.rationalize(0.005)
        if integer == 0
          "-" + fraction.to_s
        else
          "-" + integer.to_s + "_" + fraction.to_s
        end
      else
        integer = (total.numerator / total.denominator).to_i
        fraction = ((total.numerator % total.denominator) / total.denominator.to_f).to_r.rationalize(0.005)
        if integer == 0
          fraction.to_s
        else
          integer.to_s + "_" + fraction.to_s
        end
      end
    end
  end
end

active = true

puts "Welcome to the String Calculator!" 

puts

while active

  puts "Please enter a mathematical expression. Be sure to put spaces between numbers and symbols. Mixed fractions can be entered as follows: 1_1/2"

  puts

  user_input = gets.chomp()

  equation = Calculator.new(user_input)

  puts

  puts "Your output is: #{equation.output}"

  puts 

  puts "Would you like to enter another mathematical expression? (y/n)"

  puts

  continue = "y"
  
  while continue
    continue = gets.chomp()
    puts
    if continue.downcase == "y"
      continue = nil
      active = true
      puts
    elsif continue.downcase == "n"
      continue = nil
      active = false
      puts "Goodbye! Thank you for using String Calculator."
    else
      puts "Please enter Y or N"
    end
    
  end

end