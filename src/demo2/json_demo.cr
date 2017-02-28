require "json"

module Jsondemo
  struct Info
    JSON.mapping(
      addr: String,
      phone: String,
    )
  end

  class RetData
    JSON.mapping(
      username: String,
      password: String,
      age: Int32,
      info: {type: Info, nilable: true},
    )
  end
end

data = %({
   "username": "lgphp",
   "password": "1233334",
     "age": 19,
     "info":  {
     "addr":"北京市",
     "phone": "13810654610"}})

ret = Jsondemo::RetData.from_json(data)
puts ret.username


arr = [{"username" => "lgphp" },{"password" => "123445"}]
arrjson = arr.to_json
data = JSON.parse(arrjson)
puts typeof(data)
