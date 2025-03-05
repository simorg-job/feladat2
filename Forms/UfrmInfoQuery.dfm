inherited frmInfoQuery: TfrmInfoQuery
  BorderStyle = bsDialog
  Caption = 'frmInfoQuery'
  ClientWidth = 513
  Position = poScreenCenter
  StyleElements = [seFont, seClient, seBorder]
  ExplicitLeft = 3
  ExplicitTop = 3
  ExplicitWidth = 529
  TextHeight = 15
  object btnOK: TButton [0]
    Left = 219
    Top = 272
    Width = 75
    Height = 25
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 0
  end
  object mmoInfo: TMemo [1]
    Left = 8
    Top = 8
    Width = 497
    Height = 249
    Lines.Strings = (
      'mmoInfo')
    TabOrder = 1
  end
end
