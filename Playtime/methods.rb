#!/usr/bin/ruby

def test(a1="Ruby", a2="Python")
   puts "The programming language is #{a1}"
   puts "The programming language is #{a2}"
end
test "C", "C++"
test

#blocks
def test2
   yield 5
   puts "You are in the method test"
   yield 100
end
test2 {|i| puts "You are in the block #{i}"}