#include <GUIConstantsEx.au3>
#include <GDIPlus.au3>

_Main()

Func _Main()
	Local $hGUI, $hGraphic, $hBrush, $hFormat, $hFamily, $hFont, $tLayout, $aInfo
	Local $sString = "Hello world"

	; 创建 GUI
	$hGUI = GUICreate("GDI+", 400, 300)
	GUISetState()

	; 描绘字符串
	_GDIPlus_Startup()
	$hGraphic = _GDIPlus_GraphicsCreateFromHWND($hGUI)
	$hBrush = _GDIPlus_BrushCreateSolid(0xFF00007F)
	$hFormat = _GDIPlus_StringFormatCreate()
	$hFamily = _GDIPlus_FontFamilyCreate("Arial")
	$hFont = _GDIPlus_FontCreate($hFamily, 12, 2)
	$tLayout = _GDIPlus_RectFCreate(140, 110, 0, 0)
	$aInfo = _GDIPlus_GraphicsMeasureString($hGraphic, $sString, $hFont, $tLayout, $hFormat)
	_GDIPlus_GraphicsDrawStringEx($hGraphic, $sString, $hFont, $aInfo[0], $hFormat, $hBrush)

	; 循环直到用户退出
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	; 清理资源
	_GDIPlus_FontDispose($hFont)
	_GDIPlus_FontFamilyDispose($hFamily)
	_GDIPlus_StringFormatDispose($hFormat)
	_GDIPlus_BrushDispose($hBrush)
	_GDIPlus_GraphicsDispose($hGraphic)
	_GDIPlus_Shutdown()

EndFunc   ;==>_Main
