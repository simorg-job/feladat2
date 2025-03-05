// db grid-hez kieg�sz�t� adat t�pus
unit UDBGrid_Utils;

interface

uses
  System.Classes, System.Generics.Collections;

type
  // oszlop rendez�si elemet le�r� oszt�ly
  TColumnSortOrder = class(TPersistent)
  private
    FFieldName  : string;
    FAscending  : Boolean;
  public
    constructor Create(AFieldName : string; AAscending : Boolean);
    destructor Destroy; override;
    // mez� neve
    property FieldName : string read FFieldName write FFieldName;
    // n�vekv� sorrend-e
    property Ascending : Boolean read FAscending write FAscending;
  end;

  // oszlop rendez�seket t�rol� lista
  TColumnSortOrderList = TObjectList<TColumnSortOrder>;

  TColumnSortOrderListHelper = class helper for TColumnSortOrderList
    // keres� f�ggv�ny mez� n�v alapj�n
    function IndexOfByFieldName(AFieldName : string) : Integer;
    // visszaadja a list�ban t�rolt mez�nevek rendez�s�hez a sort string-et
    function GetSortString : string;
    procedure ClearAll;
    // egy mez�t rendez�st ki / be kapcsolgat, ha nem l�tezik, akkor l�trehozza
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
      // m�g nincs a list�ban
      Self.Add(TColumnSortOrder.Create(AFieldName, False));
    end
  else
    begin
      // m�r benne van a list�ban, kapcsolgatni kell
      Self.Items[findex].Ascending := not Self.Items[findex].Ascending;
    end;
end;

end.
