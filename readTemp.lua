
conn = net.createConnection(net.TCP, false) 
conn:connect(80,"api.thingspeak.com")


conn:on("receive", function(conn, answer)  
--print(answer)
--parsing = string.find(answer,"16.0",1)
--print(parsing)
parsed = string.sub(answer,635,639)
--print(parsed)
--print(type(parsed))
sicaklik = tonumber(parsed)
conn:close()
end)

conn:on("connection", function(cn, answer)
--Adjust where to pull data here
  cn:send("GET /channels/150318/fields/3/last HTTP/1.1\r\n"
  .."Host: api.thingspeak.com\r\n"
  .."Connection: keep-alive\r\nAccept: */*\r\n\r\n")

end)


conn:close()
return sicaklik
