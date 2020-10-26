#include "wd_core.au3"
#include "wd_helper.au3"
#include <MsgBoxConstants.au3>

Local $sDesiredCapabilities, $sSession

SetupGecko()

_WD_Startup()

$sSession = _WD_CreateSession($sDesiredCapabilities)
_WD_Navigate($sSession, "https://192.168.14.1/")
_InputValueById($sSession, 'usernamefld', 'admin')
_InputValueById($sSession, 'passwordfld', 'b4281btx')
$sButton = _WD_FindElement($sSession, $_WD_LOCATOR_ByXPath, "//input[@name='login']")
 _WD_ElementAction($sSession,$sButton, 'click')

_WD_Navigate($sSession, 'https://192.168.14.1/firewall_rules_edit.php?id=7')


$sElement = _WD_FindElement($sSession, $_WD_LOCATOR_ByXPath, "//input[@id='disabled']")
$sValue = _WD_ElementAction($sSession, $sElement, 'selected')
;MsgBox(0, 'result', $sValue)
If $sValue = False Then
   _WD_ElementAction($sSession,$sElement, 'click')
EndIf



$sButton = _WD_FindElement($sSession, $_WD_LOCATOR_ByXPath, "//button[@id='save']")
_WD_ElementAction($sSession,$sButton, 'click')

_WD_Navigate($sSession, 'https://192.168.14.1/firewall_rules.php?if=lan')
$sButton = _WD_FindElement($sSession, $_WD_LOCATOR_ByXPath, "//button[@name='apply']")
 _WD_ElementAction($sSession,$sButton, 'click')

_WD_DeleteSession($sSession)
_WD_Shutdown()

Func SetupGecko()
_WD_Option('Driver', 'geckodriver.exe')
_WD_Option('DriverParams', '--log trace')
_WD_Option('Port', 4444)

$sDesiredCapabilities = '{"capabilities": {"alwaysMatch": {"browserName": "firefox", "acceptInsecureCerts":true}}}'
EndFunc

Func _InputValueById($sSession,$Id,$Value)
 $sButton = _WD_FindElement($sSession, $_WD_LOCATOR_ByXPath, "//input[@id='"&$Id&"']")
 _WD_ElementAction($sSession,$sButton,'value', $Value)
EndFunc
