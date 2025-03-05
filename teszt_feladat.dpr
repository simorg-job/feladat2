program teszt_feladat;

uses
  Vcl.Forms,
  UfrmMain in 'Forms\UfrmMain.pas' {frmMain},
  UDM in 'DataModule\UDM.pas' {DM: TDataModule},
  UfrmBase in 'Forms\UfrmBase.pas' {frmBase},
  UfrmBaseList in 'Forms\UfrmBaseList.pas' {frmBaseList},
  UfrmOrdersList in 'Forms\UfrmOrdersList.pas' {frmOrdersList},
  UfrmCustomersList in 'Forms\UfrmCustomersList.pas' {frmCustomersList},
  UDBGrid_Utils in 'DataType\UDBGrid_Utils.pas',
  UfrmProductList in 'Forms\UfrmProductList.pas' {frmProductList},
  UfrmFilterAndSearch in 'Forms\UfrmFilterAndSearch.pas' {frmFilterAndSearch},
  UfrmInfoQuery in 'Forms\UfrmInfoQuery.pas' {frmInfoQuery};

{$R *.res}

begin
  DM := TDM.Create(Application);
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  frmMain.DBConnectionLink := DM.MSSQLConnection;
  Application.Run;
end.
