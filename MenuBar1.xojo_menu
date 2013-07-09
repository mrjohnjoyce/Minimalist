#tag Menu
Begin Menu MenuBar1
   Begin MenuItem FileMenu
      SpecialMenu = 0
      Text = "&File"
      Index = -2147483648
      AutoEnable = True
      Begin MenuItem FileNewWindow
         SpecialMenu = 0
         Text = "New Window"
         Index = -2147483648
         ShortcutKey = "N"
         Shortcut = "Cmd+N"
         MenuModifier = True
         AutoEnable = False
      End
      Begin MenuItem FileRefresh
         SpecialMenu = 0
         Text = "Refresh"
         Index = -2147483648
         ShortcutKey = "r"
         Shortcut = "Cmd+r"
         MenuModifier = True
         AutoEnable = True
      End
      Begin MenuItem Go
         SpecialMenu = 0
         Text = "Go"
         Index = -2147483648
         ShortcutKey = "G"
         Shortcut = "Cmd+G"
         MenuModifier = True
         AutoEnable = False
      End
      Begin MenuItem FullScreen
         SpecialMenu = 0
         Text = "Full Screen"
         Index = -2147483648
         ShortcutKey = "F"
         Shortcut = "Cmd+F"
         MenuModifier = True
         AutoEnable = True
      End
      Begin MenuItem FileClose
         SpecialMenu = 0
         Text = "Close"
         Index = -2147483648
         ShortcutKey = "W"
         Shortcut = "Cmd+W"
         MenuModifier = True
         AutoEnable = True
      End
      Begin QuitMenuItem FileQuit
         SpecialMenu = 0
         Text = "#App.kFileQuit"
         Index = -2147483648
         ShortcutKey = "#App.kFileQuitShortcut"
         Shortcut = "#App.kFileQuitShortcut"
         AutoEnable = True
      End
   End
   Begin HotMark HotMarks
      SpecialMenu = 0
      Text = "HotMarks"
      Index = -2147483648
      AutoEnable = True
   End
   Begin MenuItem EditMenu
      SpecialMenu = 0
      Text = "&Edit"
      Index = -2147483648
      AutoEnable = True
      Begin MenuItem EditUndo
         SpecialMenu = 0
         Text = "&Undo"
         Index = -2147483648
         ShortcutKey = "Z"
         Shortcut = "Cmd+Z"
         MenuModifier = True
         AutoEnable = True
      End
      Begin MenuItem UntitledMenu1
         SpecialMenu = 0
         Text = "-"
         Index = -2147483648
         AutoEnable = True
      End
      Begin MenuItem EditCut
         SpecialMenu = 0
         Text = "Cu&t"
         Index = -2147483648
         ShortcutKey = "X"
         Shortcut = "Cmd+X"
         MenuModifier = True
         AutoEnable = True
      End
      Begin MenuItem EditCopy
         SpecialMenu = 0
         Text = "&Copy"
         Index = -2147483648
         ShortcutKey = "C"
         Shortcut = "Cmd+C"
         MenuModifier = True
         AutoEnable = True
      End
      Begin MenuItem EditPaste
         SpecialMenu = 0
         Text = "&Paste"
         Index = -2147483648
         ShortcutKey = "V"
         Shortcut = "Cmd+V"
         MenuModifier = True
         AutoEnable = True
      End
      Begin MenuItem EditClear
         SpecialMenu = 0
         Text = "#App.kEditClear"
         Index = -2147483648
         AutoEnable = True
      End
      Begin MenuItem UntitledMenu0
         SpecialMenu = 0
         Text = "-"
         Index = -2147483648
         AutoEnable = True
      End
      Begin MenuItem EditSelectAll
         SpecialMenu = 0
         Text = "Select &All"
         Index = -2147483648
         ShortcutKey = "A"
         Shortcut = "Cmd+A"
         MenuModifier = True
         AutoEnable = True
      End
   End
End
#tag EndMenu
