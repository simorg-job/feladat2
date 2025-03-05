inherited frmFilterAndSearch: TfrmFilterAndSearch
  Caption = 'frmFilterAndSearch'
  ClientWidth = 938
  StyleElements = [seFont, seClient, seBorder]
  ExplicitLeft = 3
  ExplicitTop = 3
  ExplicitWidth = 954
  TextHeight = 15
  inherited ToolBar1: TToolBar
    Width = 938
    ButtonWidth = 52
    ExplicitWidth = 555
    inherited ToolButton1: TToolButton
      ExplicitWidth = 52
    end
    inherited ToolButton2: TToolButton
      Left = 52
      ExplicitLeft = 52
    end
    object ToolButton3: TToolButton
      Left = 60
      Top = 0
      Action = acSelect
    end
  end
  inherited DBGrid1: TDBGrid
    Top = 121
    Width = 938
    Height = 314
  end
  object pnlFilter: TPanel [2]
    Left = 0
    Top = 55
    Width = 938
    Height = 66
    Align = alTop
    BevelOuter = bvNone
    Caption = 'pnlFilter'
    ShowCaption = False
    TabOrder = 2
    object Label1: TLabel
      Left = 703
      Top = 3
      Width = 91
      Height = 15
      Caption = 'Rendel'#233's d'#225'tuma'
    end
    object edCustomerName: TLabeledEdit
      Left = 24
      Top = 24
      Width = 209
      Height = 23
      EditLabel.Width = 53
      EditLabel.Height = 15
      EditLabel.Caption = 'Vev'#337' neve'
      TabOrder = 0
      Text = ''
      OnChange = edCustomerNameChange
    end
    object edProductName: TLabeledEdit
      Left = 239
      Top = 24
      Width = 458
      Height = 23
      EditLabel.Width = 67
      EditLabel.Height = 15
      EditLabel.Caption = 'Term'#233'k neve'
      TabOrder = 1
      Text = ''
      OnChange = edProductNameChange
    end
    object dtpDateFilter: TDateTimePicker
      Left = 703
      Top = 24
      Width = 186
      Height = 23
      Date = 45720.000000000000000000
      Time = 0.743786944447492700
      ShowCheckbox = True
      Checked = False
      TabOrder = 2
      OnChange = dtpDateFilterChange
    end
  end
  inherited ADOQuery1: TADOQuery
    Left = 48
  end
  inherited alCommands: TActionList
    object acSelect: TAction
      Caption = 'Kiv'#225'laszt'
      ImageIndex = 108
      OnExecute = acSelectExecute
      OnUpdate = acSelectUpdate
    end
  end
  inherited DataSource1: TDataSource
    DataSet = ADOQuery1
  end
end
