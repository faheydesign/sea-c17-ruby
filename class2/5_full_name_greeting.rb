# Section 5.6 on page 25
# 4 points
# Write a program that asks for a person’s first name, then middle, and then
# last. Finally, it should greet the person using their full name.

puts "What is your first name?"
first = gets.chomp
puts "What is your middle name?"
middle = gets.chomp
puts "What is your last name?"
last = gets.chomp

puts "Great to meet you " + first.capitalize + ' ' + middle.capitalize + ' ' + last.capitalize
