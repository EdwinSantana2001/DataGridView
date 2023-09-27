Public Class Form1
    Private Sub Form1_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        'TODO: esta línea de código carga datos en la tabla 'SolutionFinalDataSet.Provincia' Puede moverla o quitarla según sea necesario.
        Me.ProvinciaTableAdapter.Fill(Me.SolutionFinalDataSet.Provincia)

    End Sub
End Class
