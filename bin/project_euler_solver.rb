#!/usr/bin/env ruby

# Using this expand path allows me to run the script from any directory.
# When I try to use something with require_relative, it only allows me to run
# the script from the bin directory.
Dir[File.expand_path('../lib/**/*.rb', File.dirname(__FILE__))].each { |file| require file }

intro = <<INTRO
#####################################################################
            ALEX'S PROJECT EULER SOLUTION GENERATOR
#####################################################################

Welcome to Alex's Project Euler Solution Generator. The rules are simple.
You should have already solved the Project Euler questions yourself. The
point of Project Euler isn't to simply fill in the answers in the website,
but to practice coding, and broaden your understanding of math, problem
solving, and the programming language you are using (in this case, Ruby).

Euler is pronounced "Oiler" (but I still say "U-ler" by mistake, sometimes).

Commands:
  's' / 'solve' <n>       : Solves the question. Takes as an argument the
                            number for the Project Euler question to solve.
                            For example, "1" will solve solution 1. "103"
                            will solve solution 103 (if I ever get to 103).

  'd' / 'describe' <n>    : Shows the question description. Takes as an
                            argument the number for the Project Euler qestion
                            to describe.

  'q' / 'quit'            : Quit the program.

INTRO

def solve(num)
  solution = self.class.const_get("Solution#{num}")
  puts solution.class
  solution.new.solve
end

def describe(num)
  solution = self.class.const_get("Solution#{num}")
  puts solution.class
  solution.new.describe
end

def run_interface
  user_command = ''

  loop do
    print '>> '
    user_input = gets.chomp().split(' ')
    user_command = user_input[0]
    arguments = user_input[1..-1]

    case user_command
      when 's', 'solve'
        puts solve(arguments.first)
      when 'd', 'describe'
        puts describe(arguments.first)
      when 'q', 'quit'
        break
      else
        puts 'Command not recognized. Please retry . . . '
    end
  end

  puts 'Goodbye!'
end

# --- Execute Program ---
puts intro
run_interface
