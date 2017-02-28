require "json"
require "socket"

module Server
  TCPServer.open (9000) do |socket|
    puts "start...."
    loop do
      socket.accept? do |client|
        data = client.gets
        ret = JSON.parse(data.as(String)) #在接收的时候一定要先用parse将json字符串转成json::any类型
         puts "retcode=#{ret["retcode"]}" , "data=#{ret["data"]}" , "username=#{ret["data"][0]["username"]}"
        client.puts "收到数据"
      end
    end
  end
end
