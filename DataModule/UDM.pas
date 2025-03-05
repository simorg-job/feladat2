unit UDM;

interface

uses
  System.SysUtils, System.Classes, Data.DB,
  Data.Win.ADODB;

type
  TDM = class(TDataModule)
    MSSQLConnection: TADOConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
