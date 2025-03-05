unit UfrmBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB;

type
  TfrmBase = class(TForm)
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;
  private
    { Private declarations }
    FDBConnectionLink : TADOConnection;
    procedure SetDBConnectionLink(const Value: TADOConnection);

  protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  public
    { Public declarations }
    constructor Create(AOwner : TComponent); override;
    constructor CreateWithParams(AOwner : TComponent; ADBConnectionLink : TADOConnection); virtual;
    destructor Destroy; override;

    procedure SetupForm; virtual; abstract;
    // adatbázis kapcsolatra mutató link
    property DBConnectionLink : TADOConnection read FDBConnectionLink write SetDBConnectionLink;
  end;


implementation

{$R *.dfm}

{ TfrmBase }

constructor TfrmBase.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

constructor TfrmBase.CreateWithParams(AOwner: TComponent; ADBConnectionLink: TADOConnection);
begin
  inherited Create(AOwner);
  DBConnectionLink := ADBConnectionLink;
end;

destructor TfrmBase.Destroy;
begin
  DBConnectionLink := nil;
  inherited Destroy;
end;

procedure TfrmBase.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = FDBConnectionLink) then
    FDBConnectionLink := nil;
end;

procedure TfrmBase.SetDBConnectionLink(const Value: TADOConnection);
begin
  if Assigned(DBConnectionLink) then
    DBConnectionLink.RemoveFreeNotification(Self);

  FDBConnectionLink := Value;

  if Assigned(DBConnectionLink) then
    DBConnectionLink.FreeNotification(Self);

  ADOQuery1.Connection := DBConnectionLink;
  ADOQuery2.Connection := DBConnectionLink;
end;

end.
