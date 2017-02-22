
nonce_str = SecureRandom.urlsafe_base64(16, true)
dicts = {"appid" =>"1929191", "mch_id" =>"09921", "device_info"=>"web", "body"=>"test","nonce_str"=>"#{nonce_str}"}
dicts_keys = dicts.keys.sort!
strint_a = ""
dicts_keys.each  do |e|
		v = dicts[e]
	            strint_a	 +=  "#{e}=#{v}&"   unless v.strip.empty?  # if  ! v.strip.empty?   #if  v.strip != "" # unless v.strip==""


end
#puts strint_a.rchop   #移除最后一个字符
key = "192006250b4c09247ec02edce69f6a2d"
string_temp = strint_a + "key=" + key
puts string_temp
sign = (Digest::MD5.hexdigest string_temp ).upcase
puts sign



require "digest"
require "secure_random"
