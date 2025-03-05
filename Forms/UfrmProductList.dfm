inherited frmProductList: TfrmProductList
  Caption = 'frmProductList'
  StyleElements = [seFont, seClient, seBorder]
  TextHeight = 15
  inherited ToolBar1: TToolBar
    ExplicitWidth = 555
  end
  inherited DataSource1: TDataSource
    DataSet = ADOQuery1
  end
end
