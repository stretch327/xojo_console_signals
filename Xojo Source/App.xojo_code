#tag Class
Protected Class App
Inherits ConsoleApplication
	#tag Event
		Function Run(args() as String) As Integer
		  
		  
		  // Tell SystemD that we started successfully and hook into the signals
		  SystemD.Initialize
		  
		  // If your app is running as a daemon using SystemD, this timer will tell 
		  // the system that your app is still alive. If your app locks up and can't
		  // fire the timer, the system watchdog will kill the app and restart it
		  WatchdogTimer = New Timer
		  WatchdogTimer.Period = 5000
		  AddHandler WatchdogTimer.Action, AddressOf WatchdogTimerCallback
		  
		  // ==== Initialize your app ====
		  
		  // If you need a run loop, make sure you check SignalHandling.ShouldShutdown 
		  // in case your app gets a signal from the system telling it to shut down. 
		  While SignalHandling.ShouldShutdown = False
		    app.DoEvents(10)
		  Wend
		  
		  // ==== Clean up cleanly ====
		  
		  SystemD.Send(SystemD.States.Stopping)
		End Function
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub WatchdogTimerCallback(t as timer)
		  #Pragma Unused t
		  
		  // Tell SystemD that we're still here
		  SystemD.SendWatchdog
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private WatchdogTimer As Timer
	#tag EndProperty


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
