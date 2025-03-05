object DM: TDM
  Height = 411
  Width = 466
  PixelsPerInch = 120
  object MSSQLConnection: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=123456;Persist Security Info=True;U' +
      'ser ID=sa;Initial Catalog=KulcsSoftCompanyOrders;Data Source=ASU' +
      'S_TUF_F15\SQLEXPRESS'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 120
    Top = 128
  end
end
