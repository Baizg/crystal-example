abstract class IComunicationTools
  property username, passwrod, addr, mobile
  @mobile : String

  abstract def price
  abstract def color

  def initialize(@mobile)
  end

  def ini(@username : String, @password : String, @addr : String)
  end

  def interface_method # 在抽象类中定义一个非抽象方法
    puts "我是抽象类中的非抽象实例方法"
  end

  def self.class_method
    puts "我是抽象类中的非抽象类方法"
  end
end

class BMW < IComunicationTools
  property! name

  def initialize(@name : String)
    super("13810654610") # 虽然抽象类不能实例化。但是可以有实例化方法，通过子类来调用
  end

  def color
    puts "red"
  end

  def price
    puts "188.00w"
  end
end

class BENZ
end

def sold_comnicatetools(c : IComunicationTools) # c.class 是子类
  puts c.price
  puts c.name?
  puts c.mobile

  c.interface_method              # 接口变量可以调用接口内的非抽象方法
  IComunicationTools.class_method # 直接用接口名调用
  c.ini(username: "lgphp", password: "123456", addr: "beijingshi")
  puts c.addr
end

bmw = BMW.new "bmw325"

sold_comnicatetools bmw
