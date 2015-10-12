#!/usr/bin/ruby

$age =  5
case $age
when 0 .. 2
    puts "baby"
when 3 .. 6
    puts "little child"
when 7 .. 12
    puts "child"
when 13 .. 18
    puts "youth"
else
    puts "adult"
end

unless $age > 5
	puts "baby"
else
	puts "not baby"
end

if $age == 5 then
	puts "The age is 5"
else
	puts "the age is #{$age}"
end