require "socket"
require "json"

module Client
  arr = {retcode: 1, data: [{"username" => "lgphp"}, {"password" => "123445"}]}
  TCPSocket.open "localhost", 9000 do |client|
    client.puts arr.to_json # 如果是对象，一定要转换成json
    data = client.gets
    puts data
    client.close
  end
end
