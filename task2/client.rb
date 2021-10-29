require "socket"

client = UNIXSocket.new ("./simple.sock")

puts "==== Sending"
client.write "Hello server\n"

puts "==== Getting Response"
puts client.readline

client.close