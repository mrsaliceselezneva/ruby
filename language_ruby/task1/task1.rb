class Configus
    
    class InnerHash
        attr_reader :inner_hash
 
        def initialize
            @inner_hash = {}
        end
 
        def method_missing name, *argumnet, &block
            if block_given?
                context = InnerHash.new
                context.instance_eval &block
 
                @inner_hash[name] = context
            elsif argumnet.empty?
                @inner_hash[name]
            else
                @inner_hash[name] = argumnet
            end
        end
    end
 
    def self.deep_merge target, source
        source.inner_hash.each_pair do |key, value|
        temporary_value = target.inner_hash[key]
 
        target.inner_hash[key] =
        if temporary_value.is_a?(InnerHash) && value.is_a?(InnerHash)
            deep_merge(temporary_value, value)
        else
            value
        end
    end
 
        target
end
 
    def self.config(environment, parent = nil, &block)
        value_inner_hash = InnerHash.new
        value_inner_hash.instance_eval &block
 
        keys = value_inner_hash.inner_hash.keys
        index = keys.find_index(environment)
 
        if parent
            parent_hash = value_inner_hash.inner_hash[parent]
            adopted_hash = value_inner_hash.inner_hash[environment]
            deep_merge(parent_hash, adopted_hash)
        elsif environment == keys[index]
            value_inner_hash.inner_hash[environment]
        end
    end
end


config = Configus.config :staging, :production do
    production do
        key1 "value1"
        key2 "value2"
        group1 do
            key3 "value3"
            key4 "value4"
        end
    end
   
    staging do
        key2 "new value2"
        group1 do
            key4 "new value4"
        end
    end
end
   
puts config
puts config.key1[0]
puts config.key2[0]
puts config.group1.key3[0]
puts config.group1.key4[0]

config.key1 === "value1"
config.key2 === "newvalue2"
config.group1.key3 === "value3"
config.group1.key4 === "newvalue4"
