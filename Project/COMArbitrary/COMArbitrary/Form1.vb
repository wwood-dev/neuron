Public Class Form1
    Private Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Integer)
    Dim C As New IO.Ports.SerialPort
    Dim WrBuf(0), RdBuf(0) As Byte

    Private Sub Button_Connect_Click(sender As Object, e As EventArgs) Handles Button_Connect.Click
        If C.IsOpen Then
            C.Close()
            Label_COMStatus.Text = "Status: Disconnected"
            Button_ReceiveByte.Enabled = False
            Button_SendByte.Enabled = False
            Return
        End If
        C = My.Computer.Ports.OpenSerialPort(TextBox_COM.Text)
        C.Close()
        C.ReadTimeout = 200
        C.WriteTimeout = 200
        C.ReadBufferSize = 1024
        C.WriteBufferSize = 1024
        C.BaudRate = CInt(TextBox_COMFreq.Text)
        C.StopBits = IO.Ports.StopBits.Two
        C.Parity = IO.Ports.Parity.None
        C.DataBits = 8
        C.Open()
        Label_COMStatus.Text = "Status: Connected"
        Button_ReceiveByte.Enabled = True
        Button_SendByte.Enabled = True
    End Sub

    Private Sub CheckBox1_CheckedChanged(sender As Object, e As EventArgs) Handles CheckBox1.CheckedChanged, CheckBox2.CheckedChanged, CheckBox3.CheckedChanged, CheckBox4.CheckedChanged, CheckBox5.CheckedChanged, CheckBox6.CheckedChanged, CheckBox7.CheckedChanged, CheckBox8.CheckedChanged
        Dim a(7) As Byte
        Dim i, r As Byte
        If CheckBox1.Checked Then a(0) = 1 Else a(0) = 0
        If CheckBox2.Checked Then a(1) = 1 Else a(1) = 0
        If CheckBox3.Checked Then a(2) = 1 Else a(2) = 0
        If CheckBox4.Checked Then a(3) = 1 Else a(3) = 0
        If CheckBox5.Checked Then a(4) = 1 Else a(4) = 0
        If CheckBox6.Checked Then a(5) = 1 Else a(5) = 0
        If CheckBox7.Checked Then a(6) = 1 Else a(6) = 0
        If CheckBox8.Checked Then a(7) = 1 Else a(7) = 0
        r = 0
        For i = 0 To 7
            r = r + 2 ^ i * a(i)
        Next
        Label_SendNum.Text = "= " + CStr(r)
        WrBuf(0) = r
    End Sub

    Private Sub Button_SendByte_Click(sender As Object, e As EventArgs) Handles Button_SendByte.Click
        C.Write(WrBuf, 0, 1)
        ListBox1.Items.Add(CStr(WrBuf(0)))
    End Sub

    Private Sub Button_ReceiveByte_Click(sender As Object, e As EventArgs) Handles Button_ReceiveByte.Click
        Try
            RdBuf(0) = C.ReadByte
        Catch er As SystemException
            Label_ErrorText.Text = er.ToString
            Return
        End Try

        Dim r As Byte = RdBuf(0)
        If r >= 128 Then CheckBox16.Checked = True : r = r - 128 Else CheckBox16.Checked = False
        If r >= 64 Then CheckBox15.Checked = True : r = r - 64 Else CheckBox15.Checked = False
        If r >= 32 Then CheckBox14.Checked = True : r = r - 32 Else CheckBox14.Checked = False
        If r >= 16 Then CheckBox13.Checked = True : r = r - 16 Else CheckBox13.Checked = False
        If r >= 8 Then CheckBox12.Checked = True : r = r - 8 Else CheckBox12.Checked = False
        If r >= 4 Then CheckBox11.Checked = True : r = r - 4 Else CheckBox11.Checked = False
        If r >= 2 Then CheckBox10.Checked = True : r = r - 2 Else CheckBox10.Checked = False
        If r >= 1 Then CheckBox9.Checked = True : r = r - 1 Else CheckBox9.Checked = False
        Label_ReceiveNum.Text = "= " + CStr(RdBuf(0))
        ListBox2.Items.Add(CStr(RdBuf(0)))
    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        CheckBox1.Checked = Not CheckBox1.Checked
        CheckBox2.Checked = Not CheckBox2.Checked
        CheckBox3.Checked = Not CheckBox3.Checked
        CheckBox4.Checked = Not CheckBox4.Checked
        CheckBox5.Checked = Not CheckBox5.Checked
        CheckBox6.Checked = Not CheckBox6.Checked
        CheckBox7.Checked = Not CheckBox7.Checked
        CheckBox8.Checked = Not CheckBox8.Checked
    End Sub

    Private Sub Label_ErrorText_Click(sender As Object, e As EventArgs) Handles Label_ErrorText.Click
        Label_ErrorText.Text = "Reset"
        ListBox1.Items.Clear()
        ListBox2.Items.Clear()
    End Sub

    Private Sub Button_SetAll1_Click(sender As Object, e As EventArgs) Handles Button_SetAll1.Click
        Dim a(35) As Byte
        Dim i As Byte
        a(0) = 1
        For i = 1 To 35
            a(i) = 15
        Next
        C.Write(a, 0, 36)
        ListBox1.Items.Add("All Ones")

        Try
            RdBuf(0) = C.ReadByte
        Catch er As SystemException
            Label_ErrorText.Text = er.ToString
            Return
        End Try
        ListBox2.Items.Add(CStr(RdBuf(0)))
    End Sub

    Private Sub Button_SetAll0_Click(sender As Object, e As EventArgs) Handles Button_SetAll0.Click
        Dim a(35) As Byte
        Dim i As Byte
        a(0) = 1
        For i = 1 To 35
            a(i) = 0
        Next
        C.Write(a, 0, 36)
        ListBox1.Items.Add("All Zeros")

        Try
            RdBuf(0) = C.ReadByte
        Catch er As SystemException
            Label_ErrorText.Text = er.ToString
            Return
        End Try
        ListBox2.Items.Add(CStr(RdBuf(0)))
    End Sub

    Private Sub Button_AllZ_Click(sender As Object, e As EventArgs) Handles Button_AllZ.Click
        Dim a(35) As Byte
        Dim i As Byte
        a(0) = 1
        For i = 1 To 35
            a(i) = 240
        Next
        C.Write(a, 0, 36)
        ListBox1.Items.Add("All Zs")

        Try
            RdBuf(0) = C.ReadByte
        Catch er As SystemException
            Label_ErrorText.Text = er.ToString
            Return
        End Try
        ListBox2.Items.Add(CStr(RdBuf(0)))
    End Sub

    Private Sub Button_FIM_Click(sender As Object, e As EventArgs) Handles Button_FIM.Click
        Dim a(35) As Byte
        Dim i, j As Integer
        a(0) = 1
        For j = 1 To 10000

            For i = 1 To 35
                If a(i) = 0 Then a(i) = 15 Else a(i) = 0
            Next
            C.Write(a, 0, 36)

            Try
                RdBuf(0) = C.ReadByte
            Catch er As SystemException
                Label_ErrorText.Text = er.ToString
                ListBox2.Items.Add("Error at i=" + CStr(j))
                Return
            End Try

        Next


    End Sub

    Private Sub Button_Read_Click(sender As Object, e As EventArgs) Handles Button_Read.Click
        Dim a(18) As Byte
        Dim i As Integer
        a(0) = 32
        C.Write(a, 0, 1)
        ListBox1.Items.Add(a(0))
        Sleep(10)
        C.Read(a, 0, 18)
        ListBox2.Items.Add(a(0))
        For i = 1 To 17
            ListBox2.Items.Add(i.ToString + ". " + Dec2Bin(a(i)))
        Next
    End Sub

    Function Dec2Bin(ByVal Dec As Long) As String
        Dim a As Long = 1
        Dim S As String = ""
        While Dec / a > 1
            a = a * 2
        End While
        a = a / 2
        If a > 0 Then
            While a > 1
                If Dec - a > 0 Then
                    Dec = Dec - a
                    S = "1" + S
                Else
                    S = "0" + S
                End If
                a = a / 2
            End While
        Else
            S = "00000000"
        End If
        Return S
    End Function


End Class
