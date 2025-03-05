unit UfrmInfoQuery;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UfrmBase, Data.DB, Data.Win.ADODB,
  Vcl.StdCtrls;

type
  TfrmInfoQuery = class(TfrmBase)
    btnOK: TButton;
    mmoInfo: TMemo;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetupForm; override;
  end;


implementation

uses
  System.DateUtils;

{$R *.dfm}

{ TfrmInfoQuery }

procedure TfrmInfoQuery.SetupForm;
var
  curr        : TDateTime;
  month_start : TDateTime;
begin
  if ADOQuery1.Active then
    ADOQuery1.Active := False;

  if ADOQuery2.Active then
    ADOQuery2.Active := False;

  mmoInfo.Clear;
  // legrégebbi rendelés
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('SELECT MIN(OrderDate) AS OldestOrderDate');
  ADOQuery1.SQL.Add('FROM Orders');
  ADOQuery1.Open;
  mmoInfo.Lines.Add('Legrégebbi rendelés dátuma: ' + FormatDateTime('yyyy.mm.dd hh:nn:ss', ADOQuery1.FieldByName('OldestOrderDate').AsDateTime));

  // legnagyobb összegû rendelés összege
  ADOQuery1.Close;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('SELECT MAX(t1.ord_sum) AS max_ord_amount');
  ADOQuery1.SQL.Add('FROM (');
  ADOQuery1.SQL.Add('     SELECT OrderItems.OrderID, SUM( OrderItems.Price * OrderItems.Quantity) AS ord_sum');
  ADOQuery1.SQL.Add('FROM OrderItems');
  ADOQuery1.SQL.Add('GROUP by OrderItems.OrderID');
  ADOQuery1.SQL.Add(') AS t1');

  ADOQuery1.Open;
  mmoInfo.Lines.Add('Legnagyobb összegû rendelés összege: ' + FormatFloat('0.00', ADOQuery1.FieldByName('max_ord_amount').AsFloat));

  // aktuális hónapban (rendszerdátum alapján) eddig beérkezett megrendelések száma
  ADOQuery1.Close;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('SELECT COUNT(*) AS cnt');
  ADOQuery1.SQL.Add('FROM Orders');
  ADOQuery1.SQL.Add('WHERE CAST(OrderDate as date) BETWEEN :from_date AND :end_date ');

  // ISO-8601 dátum formátumra alakítás
  curr := Now;
  month_start := StartOfTheMonth(curr);
  ADOQuery1.Parameters.ParamByName('from_date').Value := FormatDateTime('yyyymmdd', month_start);
  ADOQuery1.Parameters.ParamByName('end_date').Value := FormatDateTime('yyyymmdd', curr);

  ADOQuery1.Open;
  mmoInfo.Lines.Add('Rendelések száma az aktuális hónapban (' + FormatDateTime('mmmm', curr)  + '): ' + ADOQuery1.FieldByName('cnt').AsString + ' db');
end;

end.
