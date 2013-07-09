#tag Class
Protected Class Mininalist
Inherits Application
	#tag Event
		Sub Activate()
		  HotMarks.Append("facebook.com")
		  HotMarks.Append("google.com")
		  HotMarks.Append("brennaninc.com")
		  HotMarks.Append("brennaninc.com/wp-admin")
		  HotMarks.Append("linkedin.com")
		  HotMarks.Append("john-joyce.com")
		End Sub
	#tag EndEvent

	#tag Event
		Sub EnableMenuItems()
		  FileNewWindow.Enable
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function FileNewWindow() As Boolean Handles FileNewWindow.Action
			dim w as new Window1
			w.show
			Return True
			
		End Function
	#tag EndMenuHandler


	#tag Property, Flags = &h0
		HotMarks() As String
	#tag EndProperty


	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&Delete", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Delete"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&Delete"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"&Quit", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"E&xit"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
