unit uCtrlCargoXGrupoXCC;

interface

Uses SysUtils, Classes, uCmControlObject, uDbCargoxgrupoxcc, DbClient;

Type
  TCtrlCargoXGrupoXCC = Class(TCmControlObject)

  private
    _DbCargoxgrupoxcc: TDbCargoxgrupoxcc;
    _CdsCargoXGrupoXCC: TClientDataSet;

  protected
    procedure DoChangeDataBase; Override;

  public
    Constructor Create; Override;
    Destructor Destroy; Override;

    function ProcessaCds(OvCds: OleVariant): Boolean;
  end;

implementation

{ TCtrlCargoXGrupoXCC }

Uses uCMTypes;

constructor TCtrlCargoXGrupoXCC.Create;
begin
  inherited;
  _DbCargoxgrupoxcc := TDbCargoxgrupoxcc.Create(Self);
  _CdsCargoXGrupoXCC := TClientDataSet.Create(nil);
end;

destructor TCtrlCargoXGrupoXCC.Destroy;
begin
  _DbCargoxgrupoxcc.Free;
  _CdsCargoXGrupoXCC.Free;
  inherited;
end;

procedure TCtrlCargoXGrupoXCC.DoChangeDataBase;
begin
  inherited;
  _DbCargoxgrupoxcc.DataBaseName := DataBaseName;
end;

function TCtrlCargoXGrupoXCC.ProcessaCds(OvCds: OleVariant): Boolean;
begin
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.ProcessaCdsCargoXGrupoXCC(OvCds);
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End
   Else
   Begin
     Try
        StartTransaction;

        _CdsCargoXGrupoXCC.Data := OvCds;

        Result := ApplyCds(_CdsCargoXGrupoXCC,_DbCargoxgrupoxcc,[],[]);
        MessageInfo := _DbCargoxgrupoxcc.MessageInfo;
        If Not Result Then Raise Exception.create(MessageInfo);
        Commit;
     Except
       On E:Exception Do
       Begin
          Result := False;
          Rollback;
          MessageInfo := E.Message;
       End;
     End;
   End;
end;

end.
