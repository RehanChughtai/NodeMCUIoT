uart.setup(0, 115200, 8, uart.PARITY_NONE, uart.STOPBITS_1, 1)

uart.on("data", 4,
  function(data)
    print("receive from uart:", data)
    if data=="quit" then
      uart.on("data") -- unregister callback function
    end
end, 0)
-- when '\r' is received.
uart.on("data", "\r",
  function(data)
    print("receive from uart:", data)
    if data=="quit\r" then
      uart.on("data") -- unregister callback function
    end
end, 0)

print (uart.getconfig(0))

uart.write(0,"ready.")