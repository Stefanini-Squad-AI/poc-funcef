// Alterações
{ ------------------------------------------------------------------------------
Data      : 08.03.2018
Autor     : Everson Luiz Pereira da Cunha
Pendência : SIG TIBERO
Descrição : Melhoria TIBERO.
            Inserir Alias nas tabelas e campos.
            Retirar INDEX, +rule etc
--------------------------------------------------------------------------------}

Unit uCtrlTPDOCXALTXMODULO;

Interface

Uses sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase,
  DbClient, uCMTypes, uDbTpdocxaltxmodulo;

Type
  TCtrlTPDOCXALTXMODULO = Class(TCmControlObject)
  Protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;Override;
  private
    _DbTpdocxaltxmodulo : TDbTpdocxaltxmodulo;
    Fcds: TClientDataSet;
    Procedure Setcds(Const Value: TClientDataSet);

  public
    Constructor Create;  Override;
    Destructor  Destroy; Override;

    Property cds: TClientDataSet read Fcds write Setcds;
    Function ListaAteradores(IdModulo, iTipoDoc: Integer): Olevariant;
    Function GravaTPDOCXALTXMODULO (sTIPODOC, sCODALTDESC, sCODALTJUROS,
                                    sTIPOALTCORREC, sIDMODULO, sCODALTABAT : Integer ): Boolean;
    Function ListaModulos        : OleVariant;
    function ListaTipoDoc        : OleVariant;
    function ListaTipoAlt        : Olevariant;
    function ListaTipoAltxModulo(icodDocumento : integer): OleVariant;
  End;

Implementation

{ TCtrlAlteraVenc }


Constructor TCtrlTPDOCXALTXMODULO.Create;
Begin
  Inherited;
  _DbTpdocxaltxmodulo := TDbTpdocxaltxmodulo.Create(Self);
End;

Destructor TCtrlTPDOCXALTXMODULO.Destroy;
Begin
  Inherited;
   _DbTpdocxaltxmodulo.Free;
  if IsAppServer then FCds.free;
End;

Function TCtrlTPDOCXALTXMODULO.GravaTPDOCXALTXMODULO (sTIPODOC, sCODALTDESC, sCODALTJUROS,
                                    sTIPOALTCORREC, sIDMODULO, sCODALTABAT : Integer ): Boolean;
Var
  _CdsLocal: TClientDataSet;
  Msg : String;
Begin
  Msg := '';
  If ConnectionSide = cnsClient Then
  Begin
    Result := Connection.AppServer.GravarPortadorforma(fcds.Data, sTIPODOC, sCODALTDESC, sCODALTJUROS,
                                                       sTIPOALTCORREC, sIDMODULO, sCODALTABAT);
    If Not Result Then
      MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
  Begin
    Try
      StartTransaction;
      Result := ApplyCds(FCds, _DbTpdocxaltxmodulo, [], []);

      Msg := _DbTpdocxaltxmodulo.MessageInfo;
      If Not Result Then
        Raise Exception.create(Msg);

      Commit;
    Except
      On E: Exception Do
      Begin
        Result := False;
        Rollback;
        MessageInfo := E.Message;
      End;
    End;
  End;
End;


Function TCtrlTPDOCXALTXMODULO.ListaAteradores(IdModulo, iTipoDoc: Integer): Olevariant;
Var
  ssql: String;
  _CdsLocal: TClientDataSet;
Begin
  sSql := ' SELECT * FROM TPDOCXALTXMODULO WHERE IDMODULO = '+ intToStr(IdModulo)+
          ' AND TIPODOC = '+ intToStr(iTipoDoc);
  _CdsLocal := TClientDataSet.Create(Nil);
  _CdsLocal.data := GetDataPacket(sSql);
  Result := _CdsLocal.data;
  _CdsLocal.Free;
End;


function TCtrlTPDOCXALTXMODULO.ListaModulos: OleVariant;
Var
  ssql: String;
  _CdsLocal : TClientDataSet;
begin
  sSql := ' SELECT IDMODULO, NOMEMODULO FROM MODULO ORDER BY NOMEMODULO ';
  _CdsLocal := TClientDataSet.Create(nil);
  _CdsLocal.Data := GetDataPacket(sSql);
  Result := _CdsLocal.data;
  _CdsLocal.Free;
end;

function TCtrlTPDOCXALTXMODULO.ListaTipoDoc: OleVariant;
Var
  ssql: String;
  _CdsLocal : TClientDataSet;
begin
  sSql := ' SELECT CODTIPDOC, DESCRICAO FROM TIPODOCRECPAG WHERE RECPAG = ''R'' ORDER BY DESCRICAO ';
  _CdsLocal := TClientDataSet.Create(nil);
  _CdsLocal.Data := GetDataPacket(sSql);
  Result := _CdsLocal.data;
  _CdsLocal.Free;
end;

function TCtrlTPDOCXALTXMODULO.ListaTipoAlt: Olevariant;
Var
  ssql: String;
  _CdsLocal : TClientDataSet;
begin
  sSql := ' SELECT CODALTERADOR, DESCRICAO FROM TIPOALTERADOR WHERE RECPAG = ''R'' ORDER BY DESCRICAO ';
  _CdsLocal := TClientDataSet.Create(nil);
  _CdsLocal.Data := GetDataPacket(sSql);
  Result := _CdsLocal.data;
  _CdsLocal.Free;
end;


Procedure TCtrlTPDOCXALTXMODULO.Setcds(Const Value: TClientDataSet);
Begin
  Fcds := Value;
End;

procedure TCtrlTPDOCXALTXMODULO.DoChangeDataBase;
begin
  inherited;
  _DbTpdocxaltxmodulo.DatabaseName := DataBaseName;
end;

procedure TCtrlTPDOCXALTXMODULO.OnCreateAppServer;
begin
  inherited;
  FCds := TClientDataSet.Create(nil);
end;


function TCtrlTPDOCXALTXMODULO.ListaTipoAltxModulo(icodDocumento : integer): OleVariant;
Var
  ssql: String;
  _CdsLocal : TClientDataSet;
begin

//  sSql := ' SELECT CODALTJUROS, CODALTDESC, CODALTABAT, CODALTOUTROS '+       //Everson TIBERO
  sSql := ' SELECT T.CODALTJUROS, T.CODALTDESC, T.CODALTABAT, T.CODALTOUTROS '+ //Everson TIBERO
          ' FROM DOCUMENTO D, TPDOCXALTXMODULO T                     '+
          ' WHERE D.CODTIPDOC    = T.TIPODOC  AND                    '+
          ' D.IDMODULO     = T.IDMODULO AND                          '+
          ' D.CODDOCUMENTO = ' + intToStr(icodDocumento);

  _CdsLocal := TClientDataSet.Create(nil);
  _CdsLocal.Data := GetDataPacket(sSql);
  Result := _CdsLocal.data;
  _CdsLocal.Free;
end;

End.

