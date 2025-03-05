// db grid-hez kiegészítõ adat típus
unit UDBGrid_Utils;

interface

uses
  System.Classes, System.Generics.Collections;

type
  // oszlop rendezési elemet leíró osztály
  TColumnSortOrder = class(TPersistent)
  private
    FFieldName  : string;
    FAscending  : Boolean;
  public
    constructor Create(AFieldName : string; AAscending : Boolean);
    destructor Destroy; override;
    // mezõ neve
    property FieldName : string read FFieldName write FFieldName;
    // növekvõ sorrend-e
    property Ascending : Boolean read FAscending write FAscending;
  end;

  // oszlop rendezéseket tároló lista
  TColumnSortOrderList = TObjectList<TColumnSortOrder>;

  TColumnSortOrderListHelper = class helper for TColumnSortOrderList
    // keresõ függvény mezõ név alapján
    function IndexOfByFieldName(AFieldName : string) : Integer;
    // visszaadja a listában tárolt mezõnevek rendezéséhez a sort string-et
    function GetSortString : string;
    procedure ClearAll;
    // egy mezõt rendezést ki / be kapcsolgat, ha nem létezik, akkor létrehozza
    procedure ToggleFieldSortOrder(AFieldName : string);
  end;

implementation

uses
  System.SysUtils;

{ TColumnSortOrder }

constructor TColumnSortOrder.Create(AFieldName : string; AAscending : Boolean);
begin
  FFieldName := AFieldName;
  FAscending := AAscending;
end;

destructor TColumnSortOrder.Destroy;
begin

  inherited Destroy;
end;

{ TColumnSortOrderListHelper }

procedure TColumnSortOrderListHelper.ClearAll;
begin
  while Self.Count > 0 do
    Self.Delete(0);
end;

function TColumnSortOrderListHelper.GetSortString: string;
var
  i : Integer;
begin
  Result := '';
  for i := 0 to Self.Count - 1 do
    begin
      if (not Result.IsEmpty) then
        Result := Result + ', ';
      Result := Result + Self.Items[i].FieldName;
      if Self.Items[i].Ascending then
        Result := Result + ' ASC'
      else
        Result := Result + ' DESC'
    end;
end;

function TColumnSortOrderListHelper.IndexOfByFieldName(
  AFieldName: string): Integer;
var
  i : Integer;
begin
  Result := -1;
  for i := 0 to Self.Count - 1 do
    begin
      if (CompareStr(Self.Items[i].FieldName, AFieldName) = 0) then
        begin
          Result := i;
          Break;
        end;
    end;
end;

procedure TColumnSortOrderListHelper.ToggleFieldSortOrder(AFieldName: string);
var
  findex  : Integer;
begin
  findex := IndexOfByFieldName(AFieldName);
  if (findex = -1) then
    begin
      // még nincs a listában
      Self.Add(TColumnSortOrder.Create(AFieldName, False));
    end
  else
    begin
      // már benne van a listában, kapcsolgatni kell
      Self.Items[findex].Ascending := not Self.Items[findex].Ascending;
    end;
end;

end.
