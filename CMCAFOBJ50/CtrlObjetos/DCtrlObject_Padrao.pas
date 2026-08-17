unit DCtrlObject_Padrao;

interface

uses
  SysUtils, Classes, uCmCustomCdbObject, forms;

type
  TDtmCtrlObject_Padrao = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
    Constructor Create(Ctrl: TCmCustomCdbObject); Overload;
  end;

var
  DtmCtrlObject_Padrao: TDtmCtrlObject_Padrao;

implementation

uses uCmSqlParams;

{$R *.dfm}

{ TDtmCtrlObject_Padrao }

constructor TDtmCtrlObject_Padrao.Create(Ctrl: TCmCustomCdbObject);
Var
   X: Integer;
begin
   Inherited Create(nil);
   if Ctrl <> nil then
      For X:=0 to ComponentCount - 1 do
          if ( Components[x] is TCMSqlParams ) then
             TCMSqlParams( Components[x] ).ControlObject := Ctrl;

end;

end.
