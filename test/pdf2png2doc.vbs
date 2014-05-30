Option Explicit

MsgBox "确定后开始，直到再次弹出成功对话框结束。"
Dim BatRunner
set BatRunner=createobject("wscript.shell")
BatRunner.run "cmd /c mkdir temp",0,true
BatRunner.run "cmd /c convert -resize 1654x2339 -density 200x200 -units PixelsPerInch thesis.pdf .\temp\thesis.png",0,true

Dim wdApp
Dim doc
Dim wshShell
Set wdApp = WSH.CreateObject( "Word.Application")
Set wshShell = CreateObject("wscript.shell")

Dim fso,f
set fso=CreateObject("Scripting.FileSystemObject")
set f = fso.GetFolder(wshShell.CurrentDirectory & "\temp")

Set doc= fso.CreateTextFile(wshShell.CurrentDirectory & "\thesis.doc")
doc.Close 

Set doc = wdApp.Documents.Open(wshShell.CurrentDirectory & "\thesis.doc")

doc.Activate ' 激活打开的文档
doc.PageSetup.TopMargin = 0
doc.PageSetup.BottomMargin = 0
doc.PageSetup.LeftMargin = 0
doc.PageSetup.RightMargin = 0
Dim png
Dim num:num = -1
For Each png In f.Files
	num = num +1
Next
Dim counter

for counter = num to 0 step -1
doc.InlineShapes.AddPicture(wshShell.CurrentDirectory & "\temp\thesis-" & counter & ".png")
Next

doc.Save ' 保存刚才的修改
doc.Close ' 关闭文档

Set doc = Nothing
 
wdApp.visible = True
wdApp.Quit
Set wdApp = Nothing
MsgBox "转换成功"