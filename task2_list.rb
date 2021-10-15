require 'benchmark'

class Element
    attr_accessor :value, :next_element
    def initialize(value=0, next_element=0)
        value = value
        next_element = next_element
    end
end

class List
    attr_writer :start
    
    def initialize
        @start = Element.new()
    end
    
    def count
        count = 0
        now = @start
        while now.next_element != 0
            now = now.next_element
            count += 1
        end
        return count
    end
    
    def prepend(value)
        new_element = Element.new(value, @start.next_element)
        @start.next_element = new_element
    end
    
    def append(value)
        new_element = Element.new(value)
        now = @start
        while now.next_element != 0
            now = now.next_element
        end
        now.next_element = new_element
    end
    
    def insert(value, index)
        count = 0
        now = @start
        while now.next_element != 0 and count != index
            now = now.next_element
            count += 1
        end
        if count == index
            now.next_element = Element.new(value, now.next_element)
        end
    end
    
    def get(index)
        count = -1
        now = @start
        while now.next_element != 0 and count != index
            now = now.next_element
            count += 1
        end
        if count == index
            return now.value
        end
        return "not found"
    end
    
    def remove(index)
        count = -1
        second = @start
        while second.next_element != 0 and count != index
            first = second
            second = second.next_element
            count += 1
        end
        if count == index
            first.next_element = second.next_element
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

