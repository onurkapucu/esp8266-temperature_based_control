wifi.setmode(wifi.STATION)
wifi.sta.config("<network-name>","<network-pass>")
wifi.sta.connect()
tmr.alarm(0, 1000, tmr.ALARM_AUTO, function()
     if wifi.sta.getip() == nil then
         print("Connecting...")
     else
         tmr.stop(0)
         print("Connected, IP is "..wifi.sta.getip())
         tmr.start(1)
        
     end
end)

led1 = 5

gpio.mode(led1, gpio.OUTPUT)


tmr.register(2, 10000, tmr.ALARM_SEMI, function() dofile('googleTime.lua') 
tmr.start(3)
end)

tmr.register(1, 10000, tmr.ALARM_SEMI, function() dofile('readTemp.lua')
tmr.start(2)
end)

tmr.register(3,5000,tmr.ALARM_SEMI, function() 
print(hour)
print(sicaklik)

if hour ~= 'nil' and temperature ~= 'nil' then

    if hour >= 7 and hour < 9 then

        if sicaklik < 20 then

            gpio.write(led1, gpio.HIGH);
            tmr.delay(5*60*1000000)
            tmr.start(1)
        else
            gpio.write(led1, gpio.LOW);
            node.dsleep(5*60*1000000) 
         end

    elseif hour > 6 and hour < 9 then
        gpio.write(led1, gpio.LOW);
        print("Shortsleep")
        node.dsleep(15*60*1000000) 
    else 
        gpio.write(led1, gpio.LOW);
        print("longsleep")
        node.dsleep(30*60*1000000) 

    end

else
    tmr.start(1)
    
end

end)
