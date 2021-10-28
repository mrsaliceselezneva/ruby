require "socket"

client = UNIXSocket.new ("./simple.sock")

puts "==== Sending"
socket.write "Hello server\n"

puts "==== Getting Response"
puts socket.readline

socket.close