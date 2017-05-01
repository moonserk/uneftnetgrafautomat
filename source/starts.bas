Attribute VB_Name = "Module1"
Private Sub Connect_to_Oracle()

Dim cn As ADODB.Connection
Dim qSQL As String
Dim rs As ADODB.Recordset

Set cn = New ADODB.Connection
Set rs = New ADODB.Recordset

' Connection
cn.ConnectionString = "Provider=MSDAORA.1;Data Source=OIS_OISBASE.uneft.ru;User ID=cds;Password=cds"
cn.Mode = adModeRead
cn.Open

' SQL запрос - перед написание лучше протестировать его непосредственно в oracle например чрез PL\SQL Developer
qSQL = read_file("D:\Объяснение сетевого графика\sql\starts.sql")

' Замена интервала даты на текущую
qSQL = Replace(qSQL, "##.##.####", Date - 1)

rs.Open qSQL, cn
    
'вот и все теперь информация находится в рекордсете rs и поступить с ней мы можем так как нам нужно) на примере просто копирует в рабочую книг у в 1 ячейку весь рекорсет, после нужно закрыть рекордсет и подключение.
ThisWorkbook.Worksheets(1).Range("B6").CopyFromRecordset rs
  
rs.Close
cn.Close
   
Set cn = Nothing
Set rs = Nothing

End Sub
Private Sub Format_Table()
    Dim endRow As Integer
    endRow = getRow()
    Dim sum As Integer
    
    Range(Cells(endRow + 1, 2), Cells(endRow + 1, 4)).Merge
    Cells(endRow + 1, 2).Value = "Итого:"
    
    For Each i In Range(Cells(6, 5), Cells(endRow, 5))
        sum = sum + 1
    Next i
    
    Cells(endRow + 1, 5).Value = Cells(endRow, 2).Value
    Cells(endRow + 1, 10).FormulaLocal = "=СУММ(J6:J" & endRow & ")"
    Cells(endRow + 1, 11).FormulaLocal = "=СУММ(K6:K" & endRow & ")"
    Cells(endRow + 1, 14).FormulaLocal = "=СУММ(N6:N" & endRow & ")"
    Cells(endRow + 1, 15).FormulaLocal = "=СУММ(O6:O" & endRow & ")"
    
    For Each i In Range(Cells(6, 2), Cells(endRow + 1, 19))
        i.EntireColumn.AutoFit
    Next i
    
    Columns("S:S").Select
    Selection.NumberFormat = "dd/mm/yy h:mm;@"
    
    Range(Cells(endRow + 1, 2), Cells(endRow + 1, 19)).Select
    With Selection.Interior
        .Pattern = xlSolid
        .PatternColorIndex = xlAutomatic
        .ThemeColor = xlThemeColorDark1
        .TintAndShade = -0.149998474074526
        .PatternTintAndShade = 0
    End With
    
    Range(Cells(6, 2), Cells(endRow + 1, 19)).Select
    With Selection.Borders(xlEdgeLeft)
        .LineStyle = xlContinuous
        .ColorIndex = 0
        .TintAndShade = 0
        .Weight = xlMedium
    End With
    With Selection.Borders(xlEdgeTop)
        .LineStyle = xlContinuous
        .ColorIndex = 0
        .TintAndShade = 0
        .Weight = xlMedium
    End With
    With Selection.Borders(xlEdgeBottom)
        .LineStyle = xlContinuous
        .ColorIndex = 0
        .TintAndShade = 0
        .Weight = xlMedium
    End With
    With Selection.Borders(xlEdgeRight)
        .LineStyle = xlContinuous
        .ColorIndex = 0
        .TintAndShade = 0
        .Weight = xlMedium
    End With
    With Selection.Borders(xlInsideVertical)
        .LineStyle = xlContinuous
        .ColorIndex = 0
        .TintAndShade = 0
        .Weight = xlThin
    End With
    With Selection.Borders(xlInsideHorizontal)
        .LineStyle = xlContinuous
        .ColorIndex = 0
        .TintAndShade = 0
        .Weight = xlThin
    End With
    
    
End Sub
Private Function read_file(ByVal filename As String) As String
    Set fso = CreateObject("scripting.filesystemobject")
    Set ts = fso.OpenTextFile(filename, 1, True): read_file = ts.ReadAll: ts.Close
    Set ts = Nothing: Set fso = Nothing
End Function
 Sub Go()
    Application.ScreenUpdating = False
    Call clear
    Call Connect_to_Oracle
    Call Format_Table
End Sub
Private Sub test()
    MsgBox getRow
End Sub
Private Sub clear()
    Range(Cells(6, 2), Cells(500, 19)).clear
End Sub
Private Function getRow(Optional col As Integer = 2)
    Dim row As Integer
    For Each i In Range(Cells(6, col), Cells(500, col))
        If Cells(i.row, 2).Value = "" Then
            row = i.row
            getRow = row - 1
            Exit For
        End If
    Next i
    getRow = row - 1
End Function
