require "socket"

server =  UNIXServer.new ("./simple.sock")

puts "==== Waiting for connection"
socket = server.accept

puts "==== Got request:"
puts socket.readline

puts "==== Sending Response"
socket.write "Hello, client\n"

socket.close