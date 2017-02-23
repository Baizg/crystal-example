require "json"
require "http/client"
require "colorize"
require "email"

module DuobaoAutoService
  @@errset = {} of Int32 => Time
  run
  sleep

  def self.exetask(task)
    taskid = task["id"].to_s.to_i32
    loop do
      res = HTTP::Client.get(task["url"].to_s)
      body = JSON.parse(res.body)
      retcode = body["code"].to_s.to_i32
      retmsg = body["msg"].to_s
      if retcode != 0
        # 判断是否发邮件

        if @@errset.has_key? (taskid) # 如果存在key，就要判断时间发邮件 ，发送邮件后，把时间改成当前时间
          currtime = Time.now
          errtime = @@errset[taskid]
          difftime = (currtime - errtime).total_seconds
          if difftime > 30
            puts "#{Time.now}发送邮件，10秒后将继续发送....".colorize(:light_red)
            sendmail("文交夺宝自服务系统发生错误：#{retmsg}")
            @@errset[taskid] = Time.now
          end
        else # 不存在，但是有错误发生，先发邮件，在加入
          # 发邮件。然后加入haTime.now
          sendmail("文交夺宝自服务系统发生错误：#{retmsg}")
          puts "#{Time.now}新错误，发邮件".colorize(:light_red)
          @@errset[taskid] = Time.now
        end
        Fiber.current.sleep 10 # 十秒来发邮件
      else                     # 没有错误
        puts "#{Time.now}--->#{retmsg}....正常运行".colorize(:light_green)
        @@errset.delete (taskid) if @@errset.has_key? (taskid)
      end
      Fiber.current.sleep task["timmer"].to_s.to_i32
    end
  end

  def self.run
    filepath = __DIR__ + "/dbservice.json"
    data = ""
    if File.exists?(filepath) && parse?(filepath)
      data = JSON.parse(File.open(filepath))
      data["data"].each do |e|
        spawn exetask(e)
      end
    else
      puts "配置的服务文件不存在，或者格式json格式有错误"
      exit
    end
  end

  def self.parse?(jsonfile)
    begin
      JSON.parse(File.open(jsonfile))
    rescue err
      return false if err
    end
    return true
  end

  def self.sendmail(errmsg)
    on_failed = EMail::Client::OnFailedProc.new do |mail, command_history|
      puts mail.data
      puts ""
      puts command_history.join("\n")
    end
    EMail.send("smtp.163.com", 25,
      on_failed: on_failed,
      use_tls: true,
      auth: {"lgg1028", "lingxue530"}) do
      subject "文交夺宝自服务系统发生故障#{Time.now}"
      from "lgg1028@163.com"
      to "1789666@qq.com"
      sender "lgg1028@163.com"
      cc "3014214356@qq.com" # [*]
      cc "764712634@qq.com"  # [*]
      message <<-EOM
        #{errmsg}

      --
      best regards
      EOM
    end
  end
end
