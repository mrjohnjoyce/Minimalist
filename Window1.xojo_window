#tag Window
Begin Window Window1
   BackColor       =   &c7F7F7F00
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   True
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   800
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   688643258
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   ""
   Visible         =   True
   Width           =   1050
   Begin HTMLViewer HTMLViewer1
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   788
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Renderer        =   0
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      Visible         =   True
      Width           =   1050
   End
   Begin ProgressBar ProgressBar1
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   10
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Maximum         =   0
      Scope           =   0
      TabPanelIndex   =   0
      Top             =   788
      Value           =   0
      Visible         =   True
      Width           =   1050
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Activate()
		  Width = setwidth
		  
		  MenuBar1.Child("HotMarks").close
		  MenuBar1.Append(new MenuItem("HotMarks"))
		  MenuBar1.Child("HotMarks").Name = "HotMarks"
		  
		  dim i as Integer
		  dim hm() as HotMark
		  for i = 0 to UBound(app.HotMarks)
		    hm.Append(new HotMark)
		    hm(i).regWindow = self
		    hm(i).windowSwitch = "reg"
		    hm(i).Text = app.HotMarks(i)
		    hm(i).KeyboardShortcut = str(i+1)
		    MenuBar1.Child("HotMarks").Insert(i,hm(i))
		  next
		End Sub
	#tag EndEvent

	#tag Event
		Sub EnableMenuItems()
		  if GoMenuEnabled then
		    Go.Enable
		  end
		  FileClose.Enable
		  FileRefresh.Enable
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  self.Height = screen(0).AvailableHeight - 30
		  self.Left = ((Screen(0).AvailableWidth/2) - (self.Width/2))
		  GoToURL("http://facebook.com")
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resized()
		  self.Left = ((Screen(0).AvailableWidth/2) - (self.Width/2))
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function FileClose() As Boolean Handles FileClose.Action
			self.Close
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileRefresh() As Boolean Handles FileRefresh.Action
			self.HTMLViewer1.LoadURL(URLLoading)
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FullScreen() As Boolean Handles FullScreen.Action
			dim w as new FullscreenWindow
			w.GoToURL(URLLoading)
			w.setwidth = self.Width
			w.Show
			self.Close
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function Go() As Boolean Handles Go.Action
			dim UW as new URLWindow
			uw.target=self
			uw.URLField.Text=URLLoading
			uw.ShowModal
			Return True
			
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h0
		Sub GoToURL(url as string)
		  if ((left(url,7) <> "http://") And (left(url,8) <> "https://")) then url = "http://" + url
		  ProgressBar1.Maximum = 0
		  htmlviewer1.loadURL(url)
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		GoMenuEnabled As Boolean = true
	#tag EndProperty

	#tag Property, Flags = &h0
		setwidth As Integer = 1100
	#tag EndProperty

	#tag Property, Flags = &h0
		URLLoading As String
	#tag EndProperty


#tag EndWindowCode

#tag Events HTMLViewer1
	#tag Event
		Sub DocumentComplete(URL as String)
		  ProgressBar1.Value = 0
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  dim agent as string
		  
		  agent = "Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_8; en-us) AppleWebKit/533.16 (KHTML, like Gecko) Version/5.0 Safari/533.16"
		  
		  me.UserAgent = agent
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function NewWindow() As HTMLViewer
		  Dim w as New Window1
		  Title = "new Window" //Title property of new window
		  w.Show
		  Return w.HTMLViewer1
		End Function
	#tag EndEvent
	#tag Event
		Sub DocumentBegin(URL as String)
		  URLLoading = URL
		  ProgressBar1.Value = 0
		End Sub
	#tag EndEvent
	#tag Event
		Sub DocumentProgressChanged(URL as String, percentageComplete as Integer)
		  If percentageComplete = -1 then //if it cannot be determined
		    ProgressBar1.Maximum = 0 //display indeterminate progress
		  Else
		    ProgressBar1.Maximum = 100
		  End if
		  
		  ProgressBar1.Value = percentageComplete
		End Sub
	#tag EndEvent
	#tag Event
		Sub TitleChanged(newTitle as String)
		  Title=newTitle
		End Sub
	#tag EndEvent
	#tag Event
		Sub Error(errorNumber as Integer, errorMessage as String)
		  if errorNumber <> -999 then
		    MsgBox("Error: "+str(errorNumber)+" "+errorMessage)
		  end
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="BackColor"
		Visible=true
		Group="Appearance"
		InitialValue="&hFFFFFF"
		Type="Color"
		InheritedFrom="Window"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Appearance"
		Type="Picture"
		EditorType="Picture"
		InheritedFrom="Window"
	#tag EndViewProperty
	#tag ViewProperty
		Name="CloseButton"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
		InheritedFrom="Window"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		InheritedFrom="Window"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Frame"
		Visible=true
		Group="Appearance"
		InitialValue="0"
		Type="Integer"
		EditorType="Enum"
		InheritedFrom="Window"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Metal Window"
			"10 - Drawer Window"
			"11 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
		InheritedFrom="Window"
	#tag EndViewProperty
	#tag ViewProperty
		Name="GoMenuEnabled"
		Group="Behavior"
		InitialValue="true"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackColor"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		InheritedFrom="Window"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Position"
		InitialValue="400"
		Type="Integer"
		InheritedFrom="Window"
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
		InheritedFrom="Window"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Interfaces"
		Visible=true
		Group="ID"
		Type="String"
		InheritedFrom="Window"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LiveResize"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
		InheritedFrom="Window"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Visible=true
		Group="Appearance"
		InitialValue="0"
		Type="Integer"
		InheritedFrom="Window"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxHeight"
		Visible=true
		Group="Position"
		InitialValue="32000"
		Type="Integer"
		InheritedFrom="Window"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximizeButton"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
		InheritedFrom="Window"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxWidth"
		Visible=true
		Group="Position"
		InitialValue="32000"
		Type="Integer"
		InheritedFrom="Window"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Appearance"
		Type="MenuBar"
		EditorType="MenuBar"
		InheritedFrom="Window"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
		InheritedFrom="Window"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinHeight"
		Visible=true
		Group="Position"
		InitialValue="64"
		Type="Integer"
		InheritedFrom="Window"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimizeButton"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
		InheritedFrom="Window"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinWidth"
		Visible=true
		Group="Position"
		InitialValue="64"
		Type="Integer"
		InheritedFrom="Window"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		Type="String"
		InheritedFrom="Window"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Placement"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType="Enum"
		InheritedFrom="Window"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
		InheritedFrom="Window"
	#tag EndViewProperty
	#tag ViewProperty
		Name="setwidth"
		Group="Behavior"
		InitialValue="1100"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		Type="String"
		InheritedFrom="Window"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Appearance"
		InitialValue="Untitled"
		Type="String"
		InheritedFrom="Window"
	#tag EndViewProperty
	#tag ViewProperty
		Name="URLLoading"
		Group="Behavior"
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
		InheritedFrom="Window"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Position"
		InitialValue="600"
		Type="Integer"
		InheritedFrom="Window"
	#tag EndViewProperty
#tag EndViewBehavior
