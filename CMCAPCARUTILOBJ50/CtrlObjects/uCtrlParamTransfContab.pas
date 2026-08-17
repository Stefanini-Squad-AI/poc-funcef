unit uCtrlParamTransfContab;

interface

Uses sysutils, uCmControlObject, uCmDbObject, DB, DbClient, Classes,
     uCmTypes, uDBParamTrfContab;

type

  TCtrlParamTransfContab = class(TCmControlObject)
  Protected
     procedure DoChangeDataBase; Override;
     procedure OnCreateAppServer;override;
  private
    _DbParamTrfContab : TDbParamTrfContab;
  Public
    _Cds              : TClientDataSet;
    constructor Create; Override;
    destructor  Destroy; Override;
    function    ListParamTransfContab(iIDParamTRFContab : Integer) : Olevariant;
    function    GravaParamTransfContab : Boolean;
end;

implementation

{ TCtrlParamTransfContab }

constructor TCtrlParamTransfContab.Create;
begin
  inherited;
  _DbParamTrfContab := TDbParamTrfContab.Create(self);
end;

destructor TCtrlParamTransfContab.Destroy;
begin
  _DbParamTrfContab.Free;
  if isAppServer then _Cds.Free;
  inherited;
end;

procedure TCtrlParamTransfContab.DoChangeDataBase;
begin
  inherited;
  _DbParamTrfContab.DataBaseName := DataBaseName;
end;

function TCtrlParamTransfContab.GravaParamTransfContab: Boolean;
var Msg : string;
begin
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.GravaParamTransfContab;
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End
   Else
   Begin
     Try
       StartTransaction;
       Result := ApplyCds(_Cds,_DbParamTrfContab,[],[]);
       Msg    := _DbParamTrfContab.MessageInfo;
       If Not Result Then Raise Exception.create(Msg);
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

function TCtrlParamTransfContab.ListParamTransfContab(
  iIDParamTRFContab: Integer): Olevariant;
var sLstSQL : TStrings;
begin
  sLstSQL := TStringList.Create;
  with sLstSQL do
  begin
    Append('SELECT                                              ');
    Append('  IDPARAMTRFCONTAB,                                 ');
    Append('  IDPESSOA,                                         ');
    Append('  RECPAG,                                           ');
    Append('  CODTIPRECDESORIG,                                 ');
    Append('  CODTIPRECDESDEST,                                 ');
    Append('  PLANOORIG,                                        ');
    Append('  PLACONTAORIG,                                     ');
    Append('  PLANODEST,                                        ');
    Append('  PLACONTADEST,                                     ');
    Append('  FLGATIVO                                          ');
    Append('FROM                                                ');
    Append('  PARAMTRFCONTAB                                    ');
    Append('WHERE                                               ');
    Append('  IDPARAMTRFCONTAB = ' + IntToStr(iIDParamTRFContab) );
  end;
  Result := GetDataPacket(sLstSQL);
  sLstSQL.Free;
end;

procedure TCtrlParamTransfContab.OnCreateAppServer;
begin
  inherited;
  _Cds := TClientDataSet.Create(nil);
end;

end.
