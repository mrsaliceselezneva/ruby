require "socket"

socket = UNIXSocket.new ("./simple.sock")

puts "==== Sending"
socket.write "Hello server\n"

while true
    puts "==== Getting Response"
    server = socket.readline
    if server == "Bye, client\n"
        break
    end
    puts "==== Sending"
    socket.write gets
end


socket.close