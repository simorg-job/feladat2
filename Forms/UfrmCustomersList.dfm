inherited frmCustomersList: TfrmCustomersList
  Caption = 'frmCustomersList'
  StyleElements = [seFont, seClient, seBorder]
  TextHeight = 15
  inherited ToolBar1: TToolBar
    ExplicitWidth = 555
  end
  inherited DBGrid1: TDBGrid
    OnTitleClick = DBGrid1TitleClick
  end
  inherited DataSource1: TDataSource
    DataSet = ADOQuery1
  end
end
