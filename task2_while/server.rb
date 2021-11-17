require "socket"

server =  UNIXServer.new ("./simple.sock")

puts "<-Жду соединение->"
socket = server.accept

loop do
    puts ""
    client = socket.readline
    if client == "стоп"
        puts "<-Отправка сообщения->"
        socket.write "Пока, клиент\n"
        break
    end
    puts "<-Отправка сообщения->"
    socket.write gets
end

socket.close