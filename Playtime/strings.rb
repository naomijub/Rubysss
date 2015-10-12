#!/usr/bin/ruby

printf 'Pi with 5 decimal %.5f' % Math::PI
puts ""
str = 'Pi is enoughwith %s decimal'
printf str % 2
puts ""
puts "What is your name?"
name = gets
name ||=""
name = name.chomp
puts "Hi #{name}"