require 'benchmark'

mas = [1]
i = 1
while i <= 1000000
    puts Benchmark.measure{mas.push(1)}.real
    for j in i..(i * 10 - 1)
        mas.push(1)
    end
    i *= 10
end