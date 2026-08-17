{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 19/02/2002                                 }
{                                                       }
{*******************************************************}

Unit uCtrlTipObjeto;

Interface

Uses SysUtils, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet,
   uCtrlCustomRH, uDbTipoObjProcTrab;

Type
   TCtrlTipObjeto = Class(TCtrlCustomRH)
   Protected
      Procedure DoChangeDataBase; Override;
      Procedure OnCreateAppServer; Override;
   Private
      FDbTipObjeto: TDbTipoObjProcTrab;
      FCdsTipObjeto: TCMClientDataSet;
   Public
      Constructor Create; Override;
      Destructor Destroy; Override;

      Function GravarTipObjeto: boolean;
      Function ListTipObjeto(CodTipoObjeto: double = 0): OleVariant;
      Function ListRubrica(IdEmpresa: integer): OleVariant;
      Function ListGrpObjeto: OleVariant;

      Property CdsTipObjeto: TCMClientDataSet Read FCdsTipObjeto Write FCdsTipObjeto;
   End;

Implementation

Uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlTipObjeto }

Constructor TCtrlTipObjeto.Create;
Begin
   Inherited;
   FDbTipObjeto := TDbTipoObjProcTrab.Create(Self);
End;

Destructor TCtrlTipObjeto.Destroy;
Begin
   FDbTipObjeto.Free;
   If (IsAppServer) Then
      FCdsTipObjeto.Free;
   Inherited;
End;

Procedure TCtrlTipObjeto.OnCreateAppServer;
Begin
   Inherited;
   FCdsTipObjeto := TCMClientDataSet.Create(Nil);
End;

Procedure TCtrlTipObjeto.DoChangeDataBase;
Begin
   Inherited;
   FDbTipObjeto.DataBaseName := DataBaseName;
End;

Function TCtrlTipObjeto.ListTipObjeto(CodTipoObjeto: double): OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT' + IFF(CodTipoObjeto = -1, ' /*+ OPTIMIZER_MODE RULE */', '') + CR_LF +
      '  CODTIPOOBJETO, DESCRICAO, IDPROVENTO, IDGRUPOOBJETO, FLGPROVDESC, CLASSEOBJ, IDTIPOPROC, TIPCODIGO, DATAVIGENCIA ' + CR_LF +
      'FROM' + CR_LF +
      '  TIPOOBJPROCTRAB' + CR_LF +
      IFF(CodTipoObjeto = -1, 'WHERE (1 = 2)',
      IFF(CodTipoObjeto = 0, 'ORDER BY' + CR_LF + '  DESCRICAO', 'WHERE' + CR_LF +
      '  (CODTIPOOBJETO = ' + FloatToStr(CodTipoObjeto) + ')')));
End;

Function TCtrlTipObjeto.ListRubrica(IdEmpresa: integer): OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT' + CR_LF +
      '  PD.IDPROVENTO, RP.DESCRPROVDESC' + CR_LF +
      'FROM' + CR_LF +
      '   RUBRICAXPESS RP, PROVDESC PD' + CR_LF +
      'WHERE' + CR_LF +
      '  (PD.FLGTPRUBRICA LIKE ''%F%'') AND' + CR_LF +
      '  (RP.IDPESSOA        = ' + IntToStr(IdEmpresa) + ') AND' + CR_LF +
      '  (RP.IDRUBRICA       = PD.IDPROVENTO)' + CR_LF +
      'ORDER BY' + CR_LF +
      '  DESCRPROVDESC');
End;

Function TCtrlTipObjeto.ListGrpObjeto: OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT' + CR_LF +
      '  IDGRUPOOBJETO, DESCRICAO' + CR_LF +
      'FROM' + CR_LF +
      '  GRPOBJPROCJUR' + CR_LF +
      'ORDER BY' + CR_LF +
      '  DESCRICAO');
End;

Function TCtrlTipObjeto.GravarTipObjeto: boolean;
Begin
   If (ConnectionSide = cnsClient) Then
      Begin
         Result := Connection.AppServer.GravarTipObjeto(FCdsTipObjeto.Data);
         If Not (Result) Then
            MessageInfo := Connection.AppServer.MessageInfo;
      End
   Else
      Begin
         Try
            StartTransaction;
            Result := ApplyCds(FCdsTipObjeto, FDbTipObjeto, [], []);
            If (Result) Then
               Commit
            Else
               Exception.Create(FDbTipObjeto.MessageInfo);
         Except
            On E: Exception Do
               Begin
                  Rollback;
                  Result := false;
                  MessageInfo := E.Message;
               End;
         End;
      End;
End;

End.

