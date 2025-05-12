#!/usr/bin/env ruby

require_relative '../lib/basket'

basket = Basket.new

puts "+---------------------------------+"
puts "|  Welcome to Acme Widget Co      |"
puts "+---------------------------------+"

puts "Available products:"
Basket::PRODUCTS.each { |code, p| puts "  #{code} – #{p[:name]} ($#{p[:price]})" }

loop do
  print "\nEnter product code to add (or 'done' to finish): "
  input = gets.chomp.upcase
  break if input == 'DONE'
  begin
    basket.add(input)
    puts "➔ Added #{input}"
  rescue => e
    puts e.message
  end
end

puts "\nYour total is $#{basket.total}"
