Attribute VB_Name = "Module1"
Sub Go()
    Application.ScreenUpdating = False 'Скрыть работу
    Call OutputMode_DB
    Call Stops_DB
    Call Starts_DB
    Call EF
    Call EF2
    Call Buttons
    Call Svod
    Call Obs
    Call Otchet_po_ostanovkam
    Call vipolnenie_gtm
    Call ras_pf
    Call Dynamic_prostoev
    Application.ScreenUpdating = True 'Скрыть работу
End Sub

Sub ExportSourceToFile()
    Application.VBE.ActiveVBProject.VBComponents("Module1").Export ("D:\Объяснение сетевого графика\source\macro.vb")
End Sub

Sub Starts_DB()

    Const PATH As String = "D:\Объяснение сетевого графика\fromDB\"
    Const vFile As String = "Запуски_fromDB.xls"
    Workbooks.Open (PATH + vFile)
    Windows(vFile).Activate
    
    Application.Run "'Запуски_fromDB.xls'!Go"
    
    Range(Cells(3, 2), Cells(getRow(2), 19)).Select
    Range_to_Picture ("запуски")
    
    Windows("main.xlsm").Activate
    Range("A5").Select
    ActiveSheet.Pictures.Paste
    
    Application.CutCopyMode = False
    
    Workbooks(vFile).Close SaveChanges:=False
End Sub

Sub Stops_DB()

    Const PATH As String = "D:\Объяснение сетевого графика\fromDB\"
    Const vFile As String = "Остановки_fromDB"
    Workbooks.Open (PATH + vFile)
    Windows(vFile).Activate
    
    Application.Run "'Остановки_fromDB.xls'!Go"
    
    Range(Cells(3, 2), Cells(getRow(2), 20)).Select
    Call Range_to_Picture("остановки")
    
    Windows("main.xlsm").Activate
    Range("U5").Select
    ActiveSheet.Pictures.Paste
    
    Application.CutCopyMode = False
    
    Workbooks(vFile).Close SaveChanges:=False
End Sub

Sub OutputMode_DB()
Attribute OutputMode_DB.VB_ProcData.VB_Invoke_Func = " \n14"

Const PATH As String = "D:\Объяснение сетевого графика\fromDB\"
    Const vFile As String = "Вывод_fromDB"
    Workbooks.Open (PATH + vFile)
    Windows(vFile).Activate
    
    Application.Run "'Вывод_fromDB.xls'!Go"
    
    Range(Cells(3, 2), Cells(getRow(2), 19)).Select
    Call Range_to_Picture("вывод_на_режим")
    
    Windows("main.xlsm").Activate
    Range("A30").Select
    ActiveSheet.Pictures.Paste
    
    Application.CutCopyMode = False
    
    Workbooks(vFile).Close SaveChanges:=False
    
End Sub



Sub EF()

    Const PATH As String = "D:\Объяснение сетевого графика\"
    Const vFile As String = "ЭФ.xlsx"
    Workbooks.Open (PATH + vFile)
    Windows(vFile).Activate
    
    Columns("F:CM").Hidden = True
    Columns("CX:DD").Hidden = True
    Columns("DH:DV").Hidden = True
    
    Range(Cells(1, 1), Cells(11, 111)).Select
    Range_to_Picture ("эф")
    
    Windows("main.xlsm").Activate
    Range("U20").Select
    ActiveSheet.Pictures.Paste
    
    Application.CutCopyMode = False
    
    Workbooks(vFile).Close SaveChanges:=False
End Sub
Sub EF2()

    Const PATH As String = "D:\Объяснение сетевого графика\"
    Const vFile As String = "ЭФ2.xlsx"
    Workbooks.Open (PATH + vFile)
    Windows(vFile).Activate
    
    Columns("B:C").Hidden = True
    Columns("E:H").Hidden = True
    Columns("M:M").Hidden = True
    Columns("R:CM").Hidden = True
    Columns("CV:DD").Hidden = True
    Columns("DH:DV").Hidden = True
    
    Columns("L:L").ColumnWidth = 15
    Columns("P:P").ColumnWidth = 15
    Columns("Q:Q").ColumnWidth = 15
    Columns("N:N").ColumnWidth = 15
    
    Range(Cells(1, 1), Cells(getRowEF2(4), 111)).Select
    Range_to_Picture ("эф2")
    
    Windows("main.xlsm").Activate
    Range("U33").Select
    ActiveSheet.Pictures.Paste
    
    Application.CutCopyMode = False
    
    Workbooks(vFile).Close SaveChanges:=False

End Sub

Sub Buttons()

    Const PATH As String = "D:\Объяснение сетевого графика\"
    Const vFile As String = "Кнопочные.xlsx"
    Workbooks.Open (PATH + vFile)
    Windows(vFile).Activate
    
    Columns("T:T").ColumnWidth = 60
    
    For Each i In Range("T1:T250")
        i.Replace What:=Chr(10) & Chr(10), Replacement:=""
        i.EntireRow.AutoFit
    Next i
    
    Range(Cells(5, 2), Cells(getRowButton(3), 20)).Select
    Range_to_Picture ("кнопочные_запуски")
    
    Windows("main.xlsm").Activate
    Range("U60").Select
    ActiveSheet.Pictures.Paste
    
    Application.CutCopyMode = False
    
    Workbooks(vFile).Close SaveChanges:=False
End Sub
Sub Dynamic_prostoev()
    
    Const PATH As String = "D:\Объяснение сетевого графика\"
    Const vFile As String = "Диинамика_простоя.xlsx"
    Workbooks.Open (PATH + vFile)
    Windows(vFile).Activate
    
    Rows("5:5").RowHeight = 50
    
    Range(Cells(3, 1), Cells(9, 15)).Select
    Range_to_Picture ("диинамика_простоя")
    
    Windows("main.xlsm").Activate
    Range("AT115").Select
    ActiveSheet.Pictures.Paste
    
    Application.CutCopyMode = False
    
    Workbooks(vFile).Close SaveChanges:=False
    
End Sub
Sub Svod()

    Const PATH As String = "D:\Объяснение сетевого графика\"
    Const vFile As String = "Сводный.xlsx"
    Workbooks.Open (PATH + vFile)
    Windows(vFile).Activate
    
    ActiveSheet.Shapes.Range(Array("imageId0")).Select
    Range_to_Picture ("сводный_отчет")
    
    Selection.Copy

    Windows("main.xlsm").Activate
    Range("AK5").Select
    ActiveSheet.Pictures.Paste
    
    Application.CutCopyMode = False
    
    Workbooks(vFile).Close SaveChanges:=False
End Sub
Sub vipolnenie_gtm()
    
    Const PATH As String = "D:\Объяснение сетевого графика\"
    Const vFile As String = "Выполнение_ГТМ.xlsx"
    Workbooks.Open (PATH + vFile)
    Windows(vFile).Activate
    
    Range(Cells(4, 1), Cells(26, 30)).Select
    Range_to_Picture ("выполнение_ГТМ")
    
    Windows("main.xlsm").Activate
    Range("AQ26").Select
    ActiveSheet.Pictures.Paste
    
    Application.CutCopyMode = False
    
    Workbooks(vFile).Close SaveChanges:=False
End Sub

Sub Otchet_po_ostanovkam()
    
    Const PATH As String = "D:\Объяснение сетевого графика\"
    Const vFile As String = "Отчет_по_остановкам"
    Workbooks.Open (PATH + vFile)
    Windows(vFile).Activate
    
    Rows("5:35").Hidden = True
    
    Columns("A:A").ColumnWidth = 50
    Columns("B:I").ColumnWidth = 20
    
    Range(Cells(1, 1), Cells(41, 9)).Select
    Range_to_Picture ("отчет_по_остановкам")
    
    Windows("main.xlsm").Activate
    Range("AT56").Select
    ActiveSheet.Pictures.Paste
    
    Application.CutCopyMode = False
    
    Workbooks(vFile).Close SaveChanges:=False
End Sub

Sub ras_pf()
        
    Const PATH As String = "D:\Новые отчеты OIS\Отчеты ЦИТУ\Расшифровка_ПФ\"
    Const vFile As String = "Расшифровка_ПФ.xlsx"
    Workbooks.Open (PATH + vFile)
    Windows(vFile).Activate
    
    startRange = getRowSearch("База в ожидании  ремонта:") - 1
    endRange = getRowSearch("Итого:", startRange + 1)

    strRangeForHide = "5:" & startRange 'Наверно лучьше переделать что бы работало через Cells
    Rows(strRangeForHide).Hidden = True
        
    Columns("F:H").Hidden = True
    Columns("P").Hidden = True
    Columns("V:AA").Hidden = True
    
    Range(Cells(2, 1), Cells(endRange, 21)).Select
    Range_to_Picture ("Расшифровка_ПФ_УН")
    
    Windows("main.xlsm").Activate
    Range("AT66").Select
    ActiveSheet.Pictures.Paste
    
    Application.CutCopyMode = False
    
    Workbooks(vFile).Close SaveChanges:=False
    
End Sub

Sub Obs()

    Const PATH As String = "D:\Новые отчеты OIS\7\"
    Const vFile As String = "Удмуртнефть Объяснение сетевого графика(новая форма)"
    Workbooks.Open (PATH + vFile)
    Windows(vFile).Activate
    
    Cells.Copy
    Windows("main.xlsm").Activate
    Sheets("Лист3").Select
    Cells.Select
    ActiveSheet.Paste
    
    Sheets("Лист2").Select
    Range(Cells(1, 1), Cells(4, 27)).Select
    
    Range_to_Picture ("об1")
    
    Sheets("Лист1").Select
    Range("AK20").Select
    ActiveSheet.Pictures.Paste
    
    Sheets("Лист3").Select
    Range(Cells(1, 2), Cells(65, 20)).Select
    
    Range_to_Picture ("об2")
    
    Sheets("Лист1").Select
    Range("A80").Select
    ActiveSheet.Pictures.Paste
    
    Application.CutCopyMode = False
    
    Workbooks(vFile).Close SaveChanges:=False
    
End Sub
Sub test()
    Windows("Кнопочные").Activate
    MsgBox getRowButton(3)
End Sub

Function getRow(Optional col As Integer = 1)
    Dim row As Integer
    For Each i In Range(Cells(1, col), Cells(500, col))
        If i.Value = "Итого:" Then
            row = i.row
        End If
    Next i
    getRow = row
End Function

Function getRowSearch(searchValue, Optional ByVal start As Integer = 1, Optional col As Integer = 1)
    Dim row As Integer
    For Each i In Range(Cells(start, col), Cells(500, col))
        If i.Value = searchValue Then
            row = i.row
            getRowSearch = row - 1
            Exit For
        End If
    Next i
    getRowSearch = row
End Function

Function getRowEF2(Optional col As Integer = 1)
    Dim row As Integer
    For Each i In Range(Cells(5, col), Cells(500, col))
        If i.Value = "" And Cells(i.row, 1).Value = "" Then
            row = i.row
            getRowEF2 = row - 1
            Exit For
        End If
    Next i
    getRowEF2 = row - 1
End Function

Function getRowButton(Optional col As Integer = 1)
    Dim row As Integer
    For Each i In Range(Cells(9, col), Cells(500, col))
        If i.Value = "" And Cells(i.row, 2).Value = "" Then
            row = i.row
            getRowButton = row - 1
            Exit For
        End If
    Next i
    getRowButton = row - 1
End Function

Function Range_to_Picture(namePic, Optional fileType As String = "png")
    Dim sName As String, wsTmpSh As Worksheet
    'If TypeName(Selection) <> "Range" Then
    '    MsgBox "Выделенная область не является диапазоном!"
    '    Exit Function
    'End If
    Application.DisplayAlerts = False
    With Selection
        .CopyPicture
        Set wsTmpSh = ThisWorkbook.Sheets.Add
        sName = ThisWorkbook.PATH & "\jpgs\" & namePic
        With wsTmpSh.ChartObjects.Add(0, 0, .Width, .Height).Chart
            .ChartArea.Border.LineStyle = 0
            .Parent.Select
            .Paste
            .Export filename:=sName & "." & fileType, FilterName:=UCase(fileType)
            .Parent.Delete
        End With
    End With
    wsTmpSh.Delete
    Application.DisplayAlerts = True
End Function

