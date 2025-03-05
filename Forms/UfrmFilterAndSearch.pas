unit UfrmFilterAndSearch;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UfrmBaseList, Data.DB, System.ImageList,
  Vcl.ImgList, System.Actions, Vcl.ActnList, Data.Win.ADODB, Vcl.Grids,
  Vcl.DBGrids, Vcl.ComCtrls, Vcl.ToolWin, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask;

type
  TfrmFilterAndSearch = class(TfrmBaseList)
    pnlFilter: TPanel;
    edCustomerName: TLabeledEdit;
    edProductName: TLabeledEdit;
    dtpDateFilter: TDateTimePicker;
    Label1: TLabel;
    ToolButton3: TToolButton;
    acSelect: TAction;
    procedure edCustomerNameChange(Sender: TObject);
    procedure edProductNameChange(Sender: TObject);
    procedure dtpDateFilterChange(Sender: TObject);
    procedure acSelectExecute(Sender: TObject);
    procedure acSelectUpdate(Sender: TObject);
  private
    { Private declarations }
    FSel_OrderID  : Integer;
    procedure ApplyParams;
  public
    { Public declarations }
    procedure SetupForm; override;

    property Sel_OrderID : Integer read FSel_OrderID;
  end;

implementation

{$R *.dfm}

{ TfrmFilterAndSearch }

procedure TfrmFilterAndSearch.acSelectExecute(Sender: TObject);
begin
  if not DataSource1.DataSet.IsEmpty then
    begin
      FSel_OrderID := DataSource1.DataSet.FieldByName('OrderID').AsInteger;
    end;
  ModalResult := mrClose;
end;

procedure TfrmFilterAndSearch.acSelectUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := (not DataSource1.DataSet.IsEmpty);
end;

procedure TfrmFilterAndSearch.ApplyParams;
var
  dstr  : string;
begin
  ADOQuery1.Close;

  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('SELECT CONCAT(Customers.LastName, '' '', Customers.FirstName) AS custName,');
  ADOQuery1.SQL.Add('       OrderItems.OrderID, Orders.OrderNum, Orders.OrderDate, ');
  ADOQuery1.SQL.Add('       Products.Name');
  ADOQuery1.SQL.Add('FROM OrderItems');
  ADOQuery1.SQL.Add('JOIN Orders ON (Orders.OrderID=OrderItems.OrderID)');
  ADOQuery1.SQL.Add('JOIN Products ON (OrderItems.ProductID=Products.ProductID)');
  ADOQuery1.SQL.Add('JOIN Customers ON (Orders.CustomerID=Customers.CustomerID)');
  ADOQuery1.SQL.Add('WHERE (CONCAT(Customers.LastName, '' '', Customers.FirstName) LIKE :custname)');
  ADOQuery1.SQL.Add('     AND (Products.Name LIKE :productname)');
  if dtpDateFilter.Checked then
    //ADOQuery1.SQL.Add('     AND (Orders.OrderDate=:orderdate)');   a rendelés dátum mezõbõl egy string alapu keresõ mezõt készítek
    ADOQuery1.SQL.Add('     AND (FORMAT(Orders.OrderDate, ''yyyyMMdd'')=:orderdate)');
  ADOQuery1.Parameters.ParamByName('custname').Value := '%' + edCustomerName.Text + '%';
  ADOQuery1.Parameters.ParamByName('productname').Value := '%' + edProductName.Text + '%';
  if dtpDateFilter.Checked then
    begin
      dstr := FormatDateTime('yyyymmdd', dtpDateFilter.Date);
      ADOQuery1.Parameters.ParamByName('orderdate').Value := dstr;
      //ADOQuery1.Parameters.ParamByName('orderdate').DataType := ftDateTime;
    end;
  ADOQuery1.Open;
end;

procedure TfrmFilterAndSearch.dtpDateFilterChange(Sender: TObject);
begin
  ApplyParams;
end;

procedure TfrmFilterAndSearch.edCustomerNameChange(Sender: TObject);
begin
  ApplyParams;
end;

procedure TfrmFilterAndSearch.edProductNameChange(Sender: TObject);
begin
  ApplyParams;
end;

procedure TfrmFilterAndSearch.SetupForm;
begin
  if ADOQuery1.Active then
    ADOQuery1.Active := False;

  if ADOQuery2.Active then
    ADOQuery2.Active := False;

  FSel_OrderID := -1;
  ApplyParams;

end;

end.
