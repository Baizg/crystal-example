require "json"
require "socket"

module Server
  TCPServer.open (9000) do |socket|
    begin
      puts "start...."
      loop do
        socket.accept? do |client|
          begin
            data = client.gets
            ret = JSON.parse(data.as(String)) # 在接收的时候一定要先用parse将json字符串转成json::any类型，用to_s也可以
            puts "retcode=#{ret["retcode"]}", "data=#{ret["data"]}", "username=#{ret["data"][0]["username"]}"
            client.puts "收到数据" # 返回给客户端数据  必须用puts方法，如果不用puts方法传送的话，就得有结尾\r\n来结束
          rescue ex
            puts "socket服务器发生错误:#{ex.message}"
          ensure
            client.flush
            client.close
          end
        end
      end
    rescue e
      puts "socket服务器发生错误:#{e.message}"
    ensure
      socket.close
    end
  end
end
