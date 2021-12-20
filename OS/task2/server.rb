require "socket"

server =  UNIXServer.new ("./simple.sock")

puts "==== Waiting for connection"
socket = server.accept

while true
    puts "==== Got request:"
    client = socket.readline
    if client == "stop"
        puts "==== Sending Response"
        socket.write "Bye, client\n"
        break
    end
    puts "==== Sending Response"
    socket.write "Hello, client\n"
end

socket.close