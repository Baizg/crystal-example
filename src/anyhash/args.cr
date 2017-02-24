nm = {username: "lgphp", password: "123344"}

def fn(**args)
  puts args["username"]
end

fn username: "lgphp", password: "ligggde"

def fn2(*, username, password)
  puts username, password
end

fn2 **nm
fn2 username: "lgphp", password: "ligggde"

def fn3(args : NamedTuple(username: String, password: Proc(Int32, Int32)))
  puts args["password"].call(5)
end

proc2 = Proc(Int32, Int32).new { |x| puts x; x }

fn3 ({username: "lgphp",
      password: proc2})

fn3 ({username: "lgphp",
      password: ->(a : Int32) { a + 1 }})

p1 = ->(a : Int32) { puts a }
p1.call(3)

test_named(1 ,  2, c: 12)  do |e|
  puts e
end
def test_named (a, b, *, c=0, &block : Proc(Int32, Void))
  puts a,b,c
  yield 3
end

h = {"foo" => "bar"}
begin
puts   h["foo"]
rescue e
  puts "test"
ensure
  puts "finnal"
end
