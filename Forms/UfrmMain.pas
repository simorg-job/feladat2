unit UfrmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UfrmBase, Data.DB, Data.Win.ADODB,
  Vcl.ComCtrls, Vcl.ToolWin, System.ImageList, Vcl.ImgList, System.Actions,
  Vcl.ActnList;

type
  TfrmMain = class(TForm)
    sbrStatus: TStatusBar;
    ToolBar1: TToolBar;
    iconsNew32: TImageList;
    iconsNew32Disabled: TImageList;
    ToolButton1: TToolButton;
    alCommands: TActionList;
    acExit: TAction;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    acOrderList: TAction;
    ToolButton4: TToolButton;
    acCustomersList: TAction;
    acProductList: TAction;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    acQueryInfo: TAction;
    procedure acExitExecute(Sender: TObject);
    procedure acOrderListExecute(Sender: TObject);
    procedure acCustomersListExecute(Sender: TObject);
    procedure acProductListExecute(Sender: TObject);
    procedure acQueryInfoExecute(Sender: TObject);
  private
    { Private declarations }
    FDBConnectionLink : TADOConnection;
    //FFrmOrdersList    : TfrmOrdersList;
    //FFrmCustomersList : TfrmCustomersList;
    //FFrmProductList   : TfrmProductList;
    procedure OpenDBConnection;
    procedure SetDBConnectionLink(const Value: TADOConnection);
  protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  public
    { Public declarations }
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;

    property DBConnectionLink : TADOConnection read FDBConnectionLink write SetDBConnectionLink;
  end;

var
  frmMain: TfrmMain;

implementation

uses
  UfrmOrdersList, UfrmCustomersList, UfrmProductList, UfrmInfoQuery;

{$R *.dfm}

{ TfrmMain }

procedure TfrmMain.acCustomersListExecute(Sender: TObject);
var
  dlg : TfrmCustomersList;
begin
  dlg := TfrmCustomersList.CreateWithParams(Self, DBConnectionLink);
  dlg.WindowState := wsMaximized;
  dlg.SetupForm;
  dlg.ShowModal;
  dlg.Free;
end;

procedure TfrmMain.acExitExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.acOrderListExecute(Sender: TObject);
var
  dlg : TfrmOrdersList;
begin
  dlg := TfrmOrdersList.CreateWithParams(Self, DBConnectionLink);
  dlg.WindowState := wsMaximized;
  dlg.SetupForm;
  dlg.ShowModal;
  dlg.Free;
end;

procedure TfrmMain.acProductListExecute(Sender: TObject);
var
  dlg : TfrmProductList;
begin
  dlg := TfrmProductList.CreateWithParams(Self, DBConnectionLink);
  dlg.WindowState := wsMaximized;
  dlg.SetupForm;
  dlg.ShowModal;
  dlg.Free;
end;

procedure TfrmMain.acQueryInfoExecute(Sender: TObject);
var
  dlg : TfrmInfoQuery;
begin
  dlg := TfrmInfoQuery.CreateWithParams(Self,DBConnectionLink);
  dlg.SetupForm;
  dlg.ShowModal;
  dlg.Free;
end;

constructor TfrmMain.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

end;

destructor TfrmMain.Destroy;
begin
  if DBConnectionLink.Connected then
    DBConnectionLink.Connected := False;
  DBConnectionLink := nil;
  inherited Destroy;
end;

procedure TfrmMain.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = FDBConnectionLink) then
    FDBConnectionLink := nil;
end;

procedure TfrmMain.OpenDBConnection;
begin
  if Assigned(DBConnectionLink) then
    begin
      if not DBConnectionLink.Connected then
        DBConnectionLink.Connected := True;
    end;
end;

procedure TfrmMain.SetDBConnectionLink(const Value: TADOConnection);
begin
  if Assigned(DBConnectionLink) then
    DBConnectionLink.RemoveFreeNotification(Self);

  FDBConnectionLink := Value;

  if Assigned(DBConnectionLink) then
    DBConnectionLink.FreeNotification(Self);

  OpenDBConnection;
end;

end.
