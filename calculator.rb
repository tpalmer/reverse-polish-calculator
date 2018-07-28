#!/usr/bin/env ruby

require 'highline'
require_relative 'lib/rpn_calculator/calculator'
require_relative 'lib/rpn_calculator/stack'
require 'byebug'

cli = HighLine.new
calculator = RPNCalculator::Calculator.new
op_validator = Regexp.escape(RPNCalculator::Calculator::OPERATORS.to_s)
stack = []

cli.say("'q' to quit")
cli.say("'c' to clear stack")
cli.say("'s' to view stack")

input = nil
while
  begin
    input = cli.ask('> ') { |q| q.validate = /^[0-9,#{op_validator},q,c,s]+$/}
  rescue EOFError
    break
  end

  case input
  when 'c'
    stack.clear
    cli.say("Cleared stack.")
    next
  when 's'
    cli.say("Stack: #{stack.join(' ')}")
    next
  when 'q'
    break
  end

  stack.push(input)

  unless (Float(input) rescue false)
    begin
      input = calculator.calculate(stack.join(' '))
      stack.pop(3)
      stack.push(input)
    rescue Exception => ex
      cli.say("#{ex.message}")
    end
  end

  cli.say(input)
end
