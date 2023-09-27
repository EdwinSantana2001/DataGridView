<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class Form1
    Inherits System.Windows.Forms.Form

    'Form reemplaza a Dispose para limpiar la lista de componentes.
    <System.Diagnostics.DebuggerNonUserCode()> _
    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        Try
            If disposing AndAlso components IsNot Nothing Then
                components.Dispose()
            End If
        Finally
            MyBase.Dispose(disposing)
        End Try
    End Sub

    'Requerido por el Diseñador de Windows Forms
    Private components As System.ComponentModel.IContainer

    'NOTA: el Diseñador de Windows Forms necesita el siguiente procedimiento
    'Se puede modificar usando el Diseñador de Windows Forms.  
    'No lo modifique con el editor de código.
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Me.components = New System.ComponentModel.Container()
        Me.Label1 = New System.Windows.Forms.Label()
        Me.DataGridView1 = New System.Windows.Forms.DataGridView()
        Me.SolutionFinalDataSet = New Presentacion_dds8.SolutionFinalDataSet()
        Me.ProvinciaBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.ProvinciaTableAdapter = New Presentacion_dds8.SolutionFinalDataSetTableAdapters.ProvinciaTableAdapter()
        Me.CodigoprovinciaDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.NombreprovinciaDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.CodigodistritoDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.NombredistritoDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.CodigocorregimientoDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.NombrecorregimientoDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.SqlDataAdapter1 = New Microsoft.Data.SqlClient.SqlDataAdapter()
        CType(Me.DataGridView1, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.SolutionFinalDataSet, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.ProvinciaBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Font = New System.Drawing.Font("Microsoft Sans Serif", 16.2!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label1.Location = New System.Drawing.Point(550, 24)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(323, 32)
        Me.Label1.TabIndex = 0
        Me.Label1.Text = "Provincias de panamá "
        '
        'DataGridView1
        '
        Me.DataGridView1.AutoGenerateColumns = False
        Me.DataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize
        Me.DataGridView1.Columns.AddRange(New System.Windows.Forms.DataGridViewColumn() {Me.CodigoprovinciaDataGridViewTextBoxColumn, Me.NombreprovinciaDataGridViewTextBoxColumn, Me.CodigodistritoDataGridViewTextBoxColumn, Me.NombredistritoDataGridViewTextBoxColumn, Me.CodigocorregimientoDataGridViewTextBoxColumn, Me.NombrecorregimientoDataGridViewTextBoxColumn})
        Me.DataGridView1.DataSource = Me.ProvinciaBindingSource
        Me.DataGridView1.Location = New System.Drawing.Point(28, 93)
        Me.DataGridView1.Name = "DataGridView1"
        Me.DataGridView1.RowHeadersWidth = 51
        Me.DataGridView1.RowTemplate.Height = 24
        Me.DataGridView1.Size = New System.Drawing.Size(1341, 382)
        Me.DataGridView1.TabIndex = 1
        '
        'SolutionFinalDataSet
        '
        Me.SolutionFinalDataSet.DataSetName = "SolutionFinalDataSet"
        Me.SolutionFinalDataSet.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema
        '
        'ProvinciaBindingSource
        '
        Me.ProvinciaBindingSource.DataMember = "Provincia"
        Me.ProvinciaBindingSource.DataSource = Me.SolutionFinalDataSet
        '
        'ProvinciaTableAdapter
        '
        Me.ProvinciaTableAdapter.ClearBeforeFill = True
        '
        'CodigoprovinciaDataGridViewTextBoxColumn
        '
        Me.CodigoprovinciaDataGridViewTextBoxColumn.DataPropertyName = "codigo_provincia"
        Me.CodigoprovinciaDataGridViewTextBoxColumn.HeaderText = "codigo_provincia"
        Me.CodigoprovinciaDataGridViewTextBoxColumn.MinimumWidth = 6
        Me.CodigoprovinciaDataGridViewTextBoxColumn.Name = "CodigoprovinciaDataGridViewTextBoxColumn"
        Me.CodigoprovinciaDataGridViewTextBoxColumn.Width = 125
        '
        'NombreprovinciaDataGridViewTextBoxColumn
        '
        Me.NombreprovinciaDataGridViewTextBoxColumn.DataPropertyName = "nombre_provincia"
        Me.NombreprovinciaDataGridViewTextBoxColumn.HeaderText = "nombre_provincia"
        Me.NombreprovinciaDataGridViewTextBoxColumn.MinimumWidth = 6
        Me.NombreprovinciaDataGridViewTextBoxColumn.Name = "NombreprovinciaDataGridViewTextBoxColumn"
        Me.NombreprovinciaDataGridViewTextBoxColumn.Width = 125
        '
        'CodigodistritoDataGridViewTextBoxColumn
        '
        Me.CodigodistritoDataGridViewTextBoxColumn.DataPropertyName = "codigo_distrito"
        Me.CodigodistritoDataGridViewTextBoxColumn.HeaderText = "codigo_distrito"
        Me.CodigodistritoDataGridViewTextBoxColumn.MinimumWidth = 6
        Me.CodigodistritoDataGridViewTextBoxColumn.Name = "CodigodistritoDataGridViewTextBoxColumn"
        Me.CodigodistritoDataGridViewTextBoxColumn.Width = 125
        '
        'NombredistritoDataGridViewTextBoxColumn
        '
        Me.NombredistritoDataGridViewTextBoxColumn.DataPropertyName = "nombre_distrito"
        Me.NombredistritoDataGridViewTextBoxColumn.HeaderText = "nombre_distrito"
        Me.NombredistritoDataGridViewTextBoxColumn.MinimumWidth = 6
        Me.NombredistritoDataGridViewTextBoxColumn.Name = "NombredistritoDataGridViewTextBoxColumn"
        Me.NombredistritoDataGridViewTextBoxColumn.Width = 125
        '
        'CodigocorregimientoDataGridViewTextBoxColumn
        '
        Me.CodigocorregimientoDataGridViewTextBoxColumn.DataPropertyName = "codigo_corregimiento"
        Me.CodigocorregimientoDataGridViewTextBoxColumn.HeaderText = "codigo_corregimiento"
        Me.CodigocorregimientoDataGridViewTextBoxColumn.MinimumWidth = 6
        Me.CodigocorregimientoDataGridViewTextBoxColumn.Name = "CodigocorregimientoDataGridViewTextBoxColumn"
        Me.CodigocorregimientoDataGridViewTextBoxColumn.Width = 125
        '
        'NombrecorregimientoDataGridViewTextBoxColumn
        '
        Me.NombrecorregimientoDataGridViewTextBoxColumn.DataPropertyName = "nombre_corregimiento"
        Me.NombrecorregimientoDataGridViewTextBoxColumn.HeaderText = "nombre_corregimiento"
        Me.NombrecorregimientoDataGridViewTextBoxColumn.MinimumWidth = 6
        Me.NombrecorregimientoDataGridViewTextBoxColumn.Name = "NombrecorregimientoDataGridViewTextBoxColumn"
        Me.NombrecorregimientoDataGridViewTextBoxColumn.Width = 125
        '
        'Form1
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(8.0!, 16.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(1407, 478)
        Me.Controls.Add(Me.DataGridView1)
        Me.Controls.Add(Me.Label1)
        Me.Name = "Form1"
        Me.Text = "Form1"
        CType(Me.DataGridView1, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.SolutionFinalDataSet, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.ProvinciaBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub

    Friend WithEvents Label1 As Label
    Friend WithEvents DataGridView1 As DataGridView
    Friend WithEvents SolutionFinalDataSet As SolutionFinalDataSet
    Friend WithEvents ProvinciaBindingSource As BindingSource
    Friend WithEvents ProvinciaTableAdapter As SolutionFinalDataSetTableAdapters.ProvinciaTableAdapter
    Friend WithEvents CodigoprovinciaDataGridViewTextBoxColumn As DataGridViewTextBoxColumn
    Friend WithEvents NombreprovinciaDataGridViewTextBoxColumn As DataGridViewTextBoxColumn
    Friend WithEvents CodigodistritoDataGridViewTextBoxColumn As DataGridViewTextBoxColumn
    Friend WithEvents NombredistritoDataGridViewTextBoxColumn As DataGridViewTextBoxColumn
    Friend WithEvents CodigocorregimientoDataGridViewTextBoxColumn As DataGridViewTextBoxColumn
    Friend WithEvents NombrecorregimientoDataGridViewTextBoxColumn As DataGridViewTextBoxColumn
    Friend WithEvents SqlDataAdapter1 As Microsoft.Data.SqlClient.SqlDataAdapter
End Class
