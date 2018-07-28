#!/usr/bin/env ruby

require 'highline'
require_relative 'lib/rpn_calculator/calculator'
require_relative 'lib/rpn_calculator/stack'
require 'byebug'

cli = HighLine.new
calculator = RPNCalculator::Calculator.new
op_validator = Regexp.escape(RPNCalculator::Calculator::OPERATORS.to_s)
stack = []

puts "'q' to quit"
puts "'c' to clear stack"
puts "'s' to view stack"

input = nil
while input != 'q'
  input = cli.ask('> ') { |q| q.validate = /^[0-9,#{op_validator},q,c,s]+$/}
  if input == 'c'
    stack.clear
    puts "Cleared stack."
    next
  end

  if input == 's'
    puts "Stack: #{stack.join(' ')}"
    next
  end

  stack.push(input)

  unless (Float(input) rescue false)
    begin
      input = calculator.calculate(stack.join(' '))
    rescue Exception => ex
      puts "#{ex.message}"
    end
  end

  puts input
end
