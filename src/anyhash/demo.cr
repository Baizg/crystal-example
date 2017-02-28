require "json"

options = {
  status:  :published,
  city:    3223,
  tags:    {"crystal", "ruby", "sweet"},
  context: {
    user: {
      id: 123,
    },
  },
}

def self.test
  puts options
end

hash = options.to_h
hash[:username] = 322
puts hash

nm = {} of String => Time
puts typeof(Time.now)
nm["1"] = Time.now
nm.delete ("2")
puts nm

class Test
  def animal
    puts "animal"
  end

  def self.hello(x)
    puts x
  end
end


abstract class Animal

end

class Sub < Animal
  def self.dog
    puts "dog"
  end
end

t = Test.new
u = Test.hello("hello")
arr_instances = [] of Test # 这是实例的数组
arr_instances << t
arr_classes = [] of Animal.class # 这是类的数组 //主要用于存放子类
arr_classes << Sub
t1 = arr_instances[0]
t1.animal
t2 = arr_classes[0]
 t2.dog
