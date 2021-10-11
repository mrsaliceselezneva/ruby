require 'benchmark'

class Elem
    attr_accessor :val, :nxt
    def initialize(val=0, nxt=0)
        @val = val
        @nxt = nxt
    end
end

class List
    attr_writer :start
    
    def initialize
        @start = Elem.new()
    end
    
    def count
        @cnt = 0
        @now = @start
        while @now.nxt != 0
            @now = @now.nxt
            @cnt += 1
        end
        return @cnt
    end
    
    def prepend(val)
        new_el = Elem.new(val, @start.nxt)
        @start.nxt = new_el
    end
    
    def append(val)
        new_el = Elem.new(val)
        @now = @start
        while @now.nxt != 0
            @now = @now.nxt
        end
        @now.nxt = new_el
    end
    
    def insert(val, ind)
        @cnt = 0
        @now = @start
        while @now.nxt != 0 and @cnt != ind
            @now = @now.nxt
            @cnt += 1
        end
        if @cnt == ind
            @now.nxt = Elem.new(val, @now.nxt)
        end
    end
    
    def get(ind)
        @cnt = -1
        @now = @start
        while @now.nxt != 0 and @cnt != ind
            @now = @now.nxt
            @cnt += 1
        end
        if @cnt == ind
            return @now.val
        end
        return "not found"
    end
    
    def remove(ind)
        @cnt = -1
        @second = @start
        while @second.nxt != 0 and @cnt != ind
            @first = @second
            @second = @second.nxt
            @cnt += 1
        end
        if @cnt == ind
            @first.nxt = @second.nxt
        end
        return "not found"
    end
end

l = List.new


l.append("items 1")
l.append("items 2")
l.prepend("items 0")
l.insert("items 1.5", 2)

puts l.get(2)

l.remove(2)

puts l.get(2)


puts Benchmark.measure{l.prepend("items -1")}.real
puts Benchmark.measure{l.append("items 3")}.real
puts Benchmark.measure{l.get(2)}.real

