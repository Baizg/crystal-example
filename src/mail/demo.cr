require "email"

# Mail.use_tls true
# Mail.auth {"lgg1026","lingxue530"}
on_failed = EMail::Client::OnFailedProc.new do |mail, command_history|
  puts mail.data
  puts ""
  puts command_history.join("\n")
end
EMail.send("smtp.126.com", 25,
  on_failed: on_failed,
  use_tls: true,
  auth: {"lgg1028", "lingxue530"}) do
  subject "发送邮件"
  from "lgg1028@126.com"
  to "1789666@qq.com"
  sender "lgg1028@126.com"
  message <<-EOM
      什么玩意儿

    --
    best regards
    EOM
end
puts "ok"
