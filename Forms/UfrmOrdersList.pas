unit UfrmOrdersList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UfrmBaseList, Data.DB, System.ImageList,
  Vcl.ImgList, System.Actions, Vcl.ActnList, Data.Win.ADODB, Vcl.Grids,
  Vcl.DBGrids, Vcl.ComCtrls, Vcl.ToolWin, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask;

type
  TfrmOrdersList = class(TfrmBaseList)
    DataSource2: TDataSource;
    DBGrid2: TDBGrid;
    pnlOrderDetail: TPanel;
    pnlFilter: TPanel;
    Splitter1: TSplitter;
    ToolButton3: TToolButton;
    acSearch: TAction;
    Label1: TLabel;
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure acSearchExecute(Sender: TObject);
  private
    { Private declarations }
    procedure FillUpOrderDetail;
  public
    { Public declarations }
    procedure SetupForm; override;
  end;


implementation

uses
  UfrmFilterAndSearch;

{$R *.dfm}

{ TfrmOrdersList }

procedure TfrmOrdersList.acSearchExecute(Sender: TObject);
var
  dlg : TfrmFilterAndSearch;
begin
  dlg := TfrmFilterAndSearch.CreateWithParams(Self, DBConnectionLink);
  dlg.SetupForm;
  dlg.WindowState := wsMaximized   ;
  dlg.ShowModal;
  if (dlg.Sel_OrderID > -1) then
    //ShowMessage('van id');
    DataSource1.DataSet.Locate('OrderID', dlg.Sel_OrderID, []);
  dlg.Free;
end;

procedure TfrmOrdersList.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  if DataSource1.State in [dsBrowse] then
    begin
      FillUpOrderDetail;
    end;

end;

procedure TfrmOrdersList.FillUpOrderDetail;
begin
  if not DataSource1.DataSet.IsEmpty then
    begin
      ADOQuery2.Close;
      ADOQuery2.Parameters.ParamByName('orderid').Value := DataSource1.DataSet.FieldByName('OrderID').AsInteger;
      ADOQuery2.Open;
      ADOQuery2.First;
    end;
end;

procedure TfrmOrdersList.SetupForm;
begin
  if ADOQuery1.Active then
    ADOQuery1.Active := False;

  if ADOQuery2.Active then
    ADOQuery2.Active := False;

  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('SELECT Orders.OrderID, Orders.OrderNum, Orders.OrderDate, ');
  ADOQuery1.SQL.Add('       Customers.LastName, Customers.FirstName');
  ADOQuery1.SQL.Add('FROM Orders');
  ADOQuery1.SQL.Add('JOIN Customers ON (Orders.CustomerID=Customers.CustomerID)');

  ADOQuery2.SQL.Clear;
  ADOQuery2.SQL.Add('SELECT Products.Name, OrderItems.Quantity, OrderItems.Price');
  ADOQuery2.SQL.Add('FROM OrderItems');
  ADOQuery2.SQL.Add('JOIN Products ON (OrderItems.ProductID=Products.ProductID)');
  ADOQuery2.SQL.Add('WHERE OrderItems.OrderID=:orderid');

  ADOQuery1.Open;
  ADOQuery1.First;
end;

end.
