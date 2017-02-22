require "emoji"

puts Emoji.emojize("我爱你北京天天么 :hand: :heart: :beer: and :football:")
alias Sett = Set


s = Set{1,2,3,4}
def test(sett : Sett)
     sett.each do |e|
       puts e
     end
end
s.add(8)
test s

s1 = Sett(Int32).new
s1.add(5)
s1 << 1999
s1 << 3   #不能重复
s1 << 5   #不能重复
s1 <<32  #不能重复
s1 <<11  #不能重复
puts s1

arr_1 = s1.to_a
arr_1  = arr_1.sort do |a,b|
    b <=> a
end
puts arr_1
s1 = arr_1.to_set
puts s1
puts "####################################################"
summ = s1.tap  {|e| puts e}.map { |e| e*2 }.tap {|e| puts e }.sum
puts summ
puts "####################################################"
floats = Float64[1, 2, 3, 4]  #number里面的方法，很有用，里面还有很多方法
a = "Sfsdfsaf"
arr_3 = Array(typeof(a)).new
arr_3 << "hello world"
puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
sarr = StaticArray[1,"hello",3,false]
slice = sarr.to_slice  #转换成一个slice 底层还是指向原来的数组的
slice[2] = "lgphp"
puts sarr


arr = [1,12,3,7,5,5,322]  #静态数组是栈内存的，是按值传递的，所以不能改动原始值，但是普通数组就可以的
arr1 = arr.clone
arr1[2] =13
puts arr


 arr.sort!   #有!号的都是自身要被编辑过的，没有!号的方法是返回值
puts arr

module Login
  extend self
  def a(args_name)
    puts args_name
  end
  def b(args_name)
      puts args_name
  end
end


c = Ceshi.new("我是原来的值")
c.a "test"
cc = c.edit_k
puts cc.k , c.k
c.edit_k!
puts  c.k

class Ceshi
  include Login
  property k
  def initialize(@k)

  end
  def edit_k!
      @k = "本身和返回值都修改了"
      self
  end
  def edit_k
    that = Ceshi.new("修改")
    that.k ="修改过了，返回值修改，本身不修改"
    that
  end
end
