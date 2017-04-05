
conn=net.createConnection(net.TCP, false) 

conn:connect(80,'google.com')
 
conn:on("connection",function(conn, payload)
            conn:send("HEAD / HTTP/1.1\r\n".. 
                      "Host: google.com\r\n"..
                      "Accept: */*\r\n"..
                      "User-Agent: Mozilla/4.0 (compatible; esp8266 Lua;)"..
                      "\r\n\r\n") 
            end)
            
conn:on("receive", function(conn, payload)
  --print('Time: '..string.sub(payload,string.find(payload,"Date: ")
         -- +6,string.find(payload,"Date: ")+35))
--print(payload)
hour_string = string.sub(payload,string.find(payload,"Date: ")
          +23,string.find(payload,"Date: ")+24)
          --print(hour_string)
          hour = tonumber(hour_string) - 5

if hour < 0 then

hour = hour + 24

end

          
--print(hour)
    conn:close()
    end) 



return hour
