require "socket"

socket = UNIXSocket.new ("./simple.sock")

puts "<-Отправка сообщения->"
socket.write "Привет, сервер\n"

loop do
    puts "<-Жду ответ->"
    server = socket.readline
    if server == "Пока, клиент\n"
        break
    end
    puts "<-Отправка сообщения->"
    socket.write gets
end


socket.close