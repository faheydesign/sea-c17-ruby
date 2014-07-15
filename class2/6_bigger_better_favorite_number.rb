# Section 5.6 on page 25
# 4 points
# Write a program that asks for a person’s favorite number. Have your program
# add 1 to the number, and then suggest the result as a bigger and better
# favorite number. (Do be tactful about it, though.)

puts "What is your favorite number?"
num = gets.chomp
num = 1 + num.to_f
puts "Don't you think " + num.to_s + " is a better number?"
