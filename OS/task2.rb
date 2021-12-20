require 'socket'

s1, s2 = UNIXSocket.pair
cnt = 1
while cnt <= 20 do
    s1.send "1", 0
    s2.send "0", 0
    puts "s2 = #{s1.recv(cnt)}\n"
    puts "s1 = #{s2.recv(cnt)}\n"
    cnt += 1
end
