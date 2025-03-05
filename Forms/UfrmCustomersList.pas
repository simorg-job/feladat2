unit UfrmCustomersList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UfrmBaseList, Data.DB, System.ImageList,
  Vcl.ImgList, System.Actions, Vcl.ActnList, Data.Win.ADODB, Vcl.Grids,
  Vcl.DBGrids, Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls;

type


  TfrmCustomersList = class(TfrmBaseList)
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetupForm; override;
  end;

var
  frmCustomersList: TfrmCustomersList;

implementation

uses
  System.WideStrUtils;

{$R *.dfm}

{ TfrmCustomersList }

procedure TfrmCustomersList.SetupForm;
begin
  if ADOQuery1.Active then
    ADOQuery1.Active := False;

  if ADOQuery2.Active then
    ADOQuery2.Active := False;

  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('SELECT * FROM Customers');
  ADOQuery1.Open;
  ADOQuery1.First;
end;

end.
