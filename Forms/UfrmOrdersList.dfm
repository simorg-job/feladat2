inherited frmOrdersList: TfrmOrdersList
  Caption = 'frmOrdersList'
  ClientHeight = 514
  ClientWidth = 678
  StyleElements = [seFont, seClient, seBorder]
  ExplicitLeft = 3
  ExplicitTop = 3
  ExplicitWidth = 694
  ExplicitHeight = 553
  TextHeight = 15
  object Splitter1: TSplitter [0]
    Left = 0
    Top = 275
    Width = 678
    Height = 3
    Cursor = crVSplit
    Align = alTop
    ExplicitWidth = 239
  end
  inherited ToolBar1: TToolBar
    Width = 678
    ButtonWidth = 40
    ExplicitWidth = 555
    inherited ToolButton1: TToolButton
      ExplicitWidth = 40
    end
    inherited ToolButton2: TToolButton
      Left = 40
      ExplicitLeft = 40
    end
    object ToolButton3: TToolButton
      Left = 48
      Top = 0
      Action = acSearch
    end
  end
  inherited DBGrid1: TDBGrid
    Top = 113
    Width = 678
    Height = 162
    Align = alTop
  end
  object DBGrid2: TDBGrid [3]
    Left = 0
    Top = 297
    Width = 678
    Height = 217
    Align = alClient
    DataSource = DataSource2
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object pnlOrderDetail: TPanel [4]
    Left = 0
    Top = 278
    Width = 678
    Height = 19
    Align = alTop
    Caption = 'pnlOrderDetail'
    ShowCaption = False
    TabOrder = 3
    object Label1: TLabel
      Left = 1
      Top = 1
      Width = 676
      Height = 17
      Align = alClient
      Caption = 'Rendel'#233's r'#233'szletei'
      ExplicitWidth = 92
      ExplicitHeight = 15
    end
  end
  object pnlFilter: TPanel [5]
    Left = 0
    Top = 55
    Width = 678
    Height = 58
    Align = alTop
    Caption = 'pnlFilter'
    ShowCaption = False
    TabOrder = 4
    ExplicitWidth = 557
  end
  inherited ADOQuery2: TADOQuery
    Top = 160
  end
  inherited alCommands: TActionList
    object acSearch: TAction
      Caption = 'Sz'#369'r'#233's'
      ImageIndex = 95
      OnExecute = acSearchExecute
    end
  end
  inherited iconsNew32: TImageList
    Left = 136
    Top = 80
  end
  inherited iconsNew32Disabled: TImageList
    Left = 208
    Top = 104
  end
  inherited DataSource1: TDataSource
    DataSet = ADOQuery1
    OnDataChange = DataSource1DataChange
    Left = 304
    Top = 104
  end
  object DataSource2: TDataSource
    DataSet = ADOQuery2
    Left = 392
    Top = 168
  end
end
