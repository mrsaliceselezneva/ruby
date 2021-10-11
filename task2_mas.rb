require 'benchmark'

mas = [1]
i = 1
while i <= 1000000
    puts Benchmark.measure{mas[0]}.real
    puts Benchmark.measure{mas[-1]}.real
    puts Benchmark.measure{mas.unshift(1)}.real
    puts Benchmark.measure{mas.push(1)}.real
    for j in i..(i * 10 - 2)
        mas.push(1)
    end
    i *= 10
end