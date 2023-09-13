def reverse_string(string)
  puts "the reverse string is: #{string.reverse}"
end

puts 'Input string for reverse:'
input_string = gets.chomp

reverse_string(input_string)