' ********** Copyright 2016 Roku Corp.  All Rights Reserved. **********

' 1st function called when channel application starts.
sub Main(input as Dynamic)
  print "################"
  print "Start of Channel"
  print "################"
  
  showScreen()
end sub

' Initializes the scene and shows the main homepage.
' Handles closing of the channel.
sub showScreen()
  print "main.brs - [showScreen]"
  screen = CreateObject("roSGScreen")
  m.port = CreateObject("roMessagePort")
  screen.setMessagePort(m.port)
  scene = screen.CreateScene("SimpleScene")
  screen.show()

  while(true)
    msg = wait(0, m.port)
    msgType = type(msg)
    if msgType = "roSGScreenEvent"
      if msg.isScreenClosed() then return
    end if
  end while
end sub
