#include <GUIConstantsEx.au3>
#include <GuiListView.au3>

$Debug_LV = False ; 检查传递给 ListView 函数的类名, 设置为True并输出到一个控件的句柄,用于检查它是否工作

_Main()

Func _Main()
	Local $aInfo, $hListView

	GUICreate("ListView Justify Column", 400, 300)
	$hListView = GUICtrlCreateListView("", 2, 2, 394, 268)
	GUISetState()

	; 添加列
	_GUICtrlListView_AddColumn($hListView, "Column 1", 100)
	_GUICtrlListView_AddColumn($hListView, "Column 2", 100)
	_GUICtrlListView_AddColumn($hListView, "Column 3", 100)

	; Change column
	$aInfo = _GUICtrlListView_GetColumn($hListView, 0)
	MsgBox(4160, "信息", "Column 1 Justification: " & $aInfo[0])
	_GUICtrlListView_JustifyColumn($hListView, 0, 2)
	$aInfo = _GUICtrlListView_GetColumn($hListView, 0)
	MsgBox(4160, "信息", "Column 1 Justification: " & $aInfo[0])

	; 循环直到用户退出
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main
