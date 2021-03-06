#include <GuiConstantsEx.au3>
#include <WinApiEx.au3>
#include <WindowsConstants.au3>

Global $iMemo

_Main()

Func _Main()
	Local $hGUI
	Local $info = _WinAPI_ShellAppBarMessage($ABM_GETTASKBARPOS)

	; 创建界面
	$hGUI = GUICreate(" Taskbar Pos Info ", 400, 300)

	; 创建memo控件
	$iMemo = GUICtrlCreateEdit("", 2, 2, 396, 296, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New ")
	GUISetState()

	; 获取任务栏位置及大小
	Switch $info[0]
		Case 0
			MemoWrite('Taskbar Pos => LEFT')
		Case 1
			MemoWrite('Taskbar Pos => TOP')
		Case 2
			MemoWrite('Taskbar Pos => RIGHT')
		Case 3
			MemoWrite('Taskbar Pos => BOTTOM')
	EndSwitch
	MemoWrite('Taskbar Left Edge =>' & $info[1])
	MemoWrite('Taskbar Top Edge =>' & $info[2])
	MemoWrite('Taskbar Right Edge =>' & $info[3])
	MemoWrite('Taskbar bottom Edge =>' & $info[4])

	; 循环至用户退出
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
endfunc   ;==>_Main

; 向memo控件写入信息
Func MemoWrite($sMessage = "")
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
endfunc   ;==>MemoWrite

