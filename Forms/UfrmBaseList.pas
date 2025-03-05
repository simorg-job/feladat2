unit UfrmBaseList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UfrmBase, Vcl.ToolWin, Vcl.ComCtrls,
  System.Actions, Vcl.ActnList, Data.DB, Data.Win.ADODB, System.ImageList,
  Vcl.ImgList, Vcl.Grids, Vcl.DBGrids, UDBGrid_Utils;

type
  TfrmBaseList = class(TfrmBase)
    alCommands: TActionList;
    ToolBar1: TToolBar;
    iconsNew32: TImageList;
    iconsNew32Disabled: TImageList;
    DBGrid1: TDBGrid;
    ToolButton1: TToolButton;
    acClose: TAction;
    ToolButton2: TToolButton;
    DataSource1: TDataSource;
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure acCloseExecute(Sender: TObject);
  private
    { Private declarations }
    // a gridben az oszlopok szerinti rendezést tárolja
    FFieldSort  : TColumnSortOrderList;
  public
    { Public declarations }
    constructor Create(AOwner : TComponent); override;
    constructor CreateWithParams(AOwner : TComponent; ADBConnectionLink : TADOConnection); override;
    destructor Destroy; override;
  end;


implementation

function IsControlKeyPressed: Boolean;
begin
  Result := GetKeyState(VK_CONTROL) < 0;
end;

{$R *.dfm}

{ TfrmBaseList }

procedure TfrmBaseList.acCloseExecute(Sender: TObject);
begin
  inherited;
  Close;
end;

constructor TfrmBaseList.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FFieldSort := TColumnSortOrderList.Create(True);
end;

constructor TfrmBaseList.CreateWithParams(AOwner: TComponent;
  ADBConnectionLink: TADOConnection);
begin
  inherited CreateWithParams(AOwner, ADBConnectionLink);
  FFieldSort := TColumnSortOrderList.Create(True);
end;

procedure TfrmBaseList.DBGrid1TitleClick(Column: TColumn);
var
  order : string;
  ind   : Integer;
begin
  if DBGrid1.DataSource.DataSet is TCustomADODataSet then
    begin
      with TCustomADODataSet(DBGrid1.DataSource.DataSet) do
        begin
          if IsControlKeyPressed then
            begin
              // ha úgy kattintanak a grid címsorán, hogy a CTRL gomb le van nyomva, akkor törli az
              // adott oszlop szerint a rendezést

              // törölni kell kell a mezõt a listából ha van ilyen elem a listában
              ind := FFieldSort.IndexOfByFieldName(Column.Field.FieldName);
              if (ind > -1) then
                begin
                  FFieldSort.Delete(ind);
                  Column.Title.Font.Style := Column.Title.Font.Style - [fsBold];
                  Column.Title.Font.Style := Column.Title.Font.Style - [fsItalic];
                end;
            end
          else
            begin
              FFieldSort.ToggleFieldSortOrder(Column.Field.FieldName);
              order := FFieldSort.GetSortString;
              ind := FFieldSort.IndexOfByFieldName(Column.Field.FieldName);
              if (ind > -1) then
                begin
                  if FFieldSort.Items[ind].Ascending then
                    begin
                      Column.Title.Font.Style := Column.Title.Font.Style - [fsBold];
                      Column.Title.Font.Style := Column.Title.Font.Style + [fsItalic];
                    end
                  else
                    begin
                      Column.Title.Font.Style := Column.Title.Font.Style + [fsBold];
                      Column.Title.Font.Style := Column.Title.Font.Style - [fsItalic];
                    end;
                end;

            end;
          Sort := order;
        end;
    end;
end;

destructor TfrmBaseList.Destroy;
begin
  FFieldSort.ClearAll;
  FFieldSort.Free;
  inherited Destroy;
end;

end.
