#tag Class
Protected Class HotMark
Inherits menuitem
	#tag Event
		Function Action() As Boolean
		  if windowSwitch = "full" and fullWindow <> nil then
		    fullWindow.GoToURL(me.Text)
		  elseif windowSwitch = "reg" and regWindow <> nil then
		    regWindow.GoToURL(me.Text)
		  end if
		End Function
	#tag EndEvent

	#tag Event
		Sub EnableMenu()
		  me.Enable
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		fullWindow As FullscreenWindow
	#tag EndProperty

	#tag Property, Flags = &h0
		regWindow As Window1
	#tag EndProperty

	#tag Property, Flags = &h0
		windowSwitch As String
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="AutoEnable"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			InheritedFrom="menuitem"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Checked"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			InheritedFrom="menuitem"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CommandKey"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="menuitem"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			InheritedFrom="menuitem"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Icon"
			Group="Behavior"
			InitialValue="0"
			Type="Picture"
			InheritedFrom="menuitem"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			InheritedFrom="menuitem"
		#tag EndViewProperty
		#tag ViewProperty
			Name="KeyboardShortcut"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="menuitem"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="menuitem"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Text"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="menuitem"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			InheritedFrom="menuitem"
		#tag EndViewProperty
		#tag ViewProperty
			Name="windowSwitch"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_mIndex"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="menuitem"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_mName"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="menuitem"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
