{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 04/08/2003 -  André Tavares - 28/07/2003 - pendência 14217 }
{ Atualizado Em: 20/04/2006 -  André Tavares - Pendência 22019 - não deixar decrescer o campo nossonúmero }
{*******************************************************}
Unit uCtrlPortadorforma;

Interface

Uses sysutils, uCmControlObject, uCmDbObject, uDbPortadorforma, uSistema, DB, uDataBase,
  DbClient, uCMTypes, Classes, uCtrlPadroes;

Type
  TCtrlPortadorforma = Class(TCmControlObject)
  protected
    Procedure DoChangeDataBase; override;
    Procedure OnCreateAppServer; override;
    Procedure AfterInitialize; override;
  private
    _DbPortadorforma: TDbPortadorforma;
    _Padroes: TCtrlPadroes;
    Fcds: TClientDataSet;
    // Eventos dos ClientDataSet´s
    Procedure Setcds(Const Value: TClientDataSet);

  public
  // Andre Tavares - prendência - 15099
    CodPortForma : integer;
    Property cds: TClientDataSet read Fcds write Setcds;
    // Métodos
    Constructor Create; override;
    Destructor Destroy; override;
    //  Informa os Compradore existentes
    Function ListPortadorforma(RECPAG: String = ''; Codportforma: double = 0; idpessoa: double = 0): OleVariant;
    Function ListPortadorformaParamCap(RecPag: String = ''; IDPessoa: double = 0): OleVariant;
    Function ListPortadorformaPortadorConta(RecPag: String = ''; IDPessoa: double = 0): OleVariant;
    Function GravarPortadorforma(IdPessoa, IdModulo, IdUsuario: Integer): Boolean;
  End;

Implementation

{ TCtrlPortadorforma }

Constructor TCtrlPortadorforma.Create;
Begin
  Inherited;
  _DbPortadorforma := TDbPortadorforma.Create(self);
  _Padroes := TCtrlPadroes.Create;
End;

Destructor TCtrlPortadorforma.Destroy;
Begin
  _DbPortadorforma.Free;
  _Padroes.Free;
  If isAppServer Then
    FCds.Free;
  Inherited;
End;

Procedure TCtrlPortadorforma.DoChangeDataBase;
Begin
  Inherited;
  _DbPortadorforma.DataBaseName := DataBaseName;
End;

Function TCtrlPortadorforma.ListPortadorforma(RECPAG: String = ''; Codportforma: double = 0; idpessoa: double = 0): OleVariant;
Var
  ssql: String;
Begin
  ssql := ' SELECT   ' + #13 +
    '   CODPORTFORMA,  IDPESSOA, IDEMPRESA, CODCENTROCUSTO,    ' + #13 +
    '   PLANO, PLACONTA, CODBLOQCHE,  CODPORTADOR,  CODFORMA,  ' + #13 +
    '   RECPAG,  LANCAFINANC,  DMAIS,  IDUSUARIOINCLUSAO,      ' + #13 +
    '   DESCRICAO, IDTEMPLCHEQUE, NUMEMPRESABANCO, UNIDNEGOC,  ' + #13 +
    '   NOSSONUMERO, JUROSPORDIA, PRAZOPROTESTO, PATHARQUIVOREM, PATHARQUIVORET,  ' + #13 +
    '   CONTROLEREMESSA, DATACONTRREMESSA, CODARQUIVOREMESSA, CODTIPOPAGTO,       ' + #13 +
    '   CODFORMAPAGTO, FLGEMITEAVISO, NUMRAZAOCC, DESCFINAN, CODSUBCONTA,         ' + #13 +
    '   FLGCHEQUEDIFERIDO, PLACONTACONTABCHQ, PLANOCONTABCHQ , FLGCONTABEMISCHQ,  ' + #13 +
    '   IDFORCLI, IDCONFIGBARRAS, DIASEMANALANCTO, DIASUTEISLANCTO, FLGOBRIGAFAV, FLGCONTROLACHEQUE,    ' + #13 +
//início 01/08/2003 - André Tavares - pendência 14643
    '   VALORMAXIMO, CODFORMAPGTOALT, DMAISALT,    ' + #13 +
//fim 01/08/2003 - André Tavares - pendência 14643
//início 22/03/2004 - André Tavares - pendência 16244
    '   NVL(FLGUSAALTENVIO, 0) AS FLGUSAALTENVIO,    ' + #13 +
//fim 22/03/2004 - André Tavares - pendência 16244
//início 21/06/2004 - André Tavares - pendência 17041
    '   NVL(FLGMENSAGEMVERSO, 0) AS FLGMENSAGEMVERSO    ' + #13 +
//fim 21/06/2004 - André Tavares - pendência 17041
    ' FROM   ' + #13 +
    '   PORTADORFORMA  ' + #13 +                
    'WHERE  (1=1)      ';
  If trim(RECPAG) <> '' Then
    ssql := ssql + ' and RECPAG = ' + quotedstr(RECPAG);
  If Codportforma <> 0 Then
    ssql := ssql + ' and Codportforma = ' + floattostr(Codportforma);
  If idpessoa <> 0 Then
    ssql := ssql + ' and IDPESSOA = ' + floattostr(IDPESSOA);
  ssql := ssql + ' ORDER BY DESCRICAO               ';
  Result := GetDataPacket(ssql);
End;

Procedure TCtrlPortadorforma.Setcds(Const Value: TClientDataSet);
Begin
  Fcds := Value;
End;

Function TCtrlPortadorforma.GravarPortadorforma(IdPessoa, IdModulo, IdUsuario: Integer): Boolean;
Var
  Msg: String;
  sDscLog: String;
Begin
  If ConnectionSide = cnsClient Then
  Begin
    Result := Connection.AppServer.GravarPortadorforma(cds.Data, IdPessoa, IdModulo, IdUsuario);
    If Not Result Then
      MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
  Begin
    Try
      StartTransaction;
      Result := ApplyCds(Cds, _DbPortadorforma, [], []);

      //início - andré tavares - 23/02/2006 - Pendência 22019 - não deixar decrescer o campo nossonúmero
      if cds.fieldByName('NOSSONUMERO').Value < cds.fieldByName('NOSSONUMERO').OldValue then
      begin
        self.messageInfo := 'Nosso Número Não Pode Ser Decrescido!';
        Raise Exception.Create(self.messageInfo);
      end;
      //fim - andré tavares - 23/02/2006 - Pendência 22019


      if Cds.FieldByName('CODARQUIVOREMESSA').AsInteger = -1 then
         ExecSQL('Update PORTADORFORMA set CODARQUIVOREMESSA = null  WHERE CODPORTFORMA = ' +
                       Cds.FieldByName('CODPORTFORMA').AsString);

      sDscLog := '';
      If Cds.IsEmpty Then
        sDscLog := 'Exclusao de Portador Forma'
      Else If Cds.UpdateStatus = usInserted Then
        sDscLog := 'Inclusao de Portador Forma'
      Else
        sDscLog := 'Alteracao de Portador Forma';

      Msg := _DbPortadorforma.MessageInfo;
      If Not Result Then
        Raise Exception.create(Msg);
      If Not _Padroes.GravaLogOperacoes(IdPessoa, IdModulo, IdUsuario, sDscLog, False) Then
        Raise Exception.Create(_Padroes.MessageInfo);

      Commit;
      // André Tavares - Pendência - 15099
      CodPortForma := _dbPortadorForma.CODPORTFORMA.asInteger;
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

Procedure TCtrlPortadorforma.OnCreateAppServer;
Begin
  Inherited;
  FCds := TClientDataSet.Create(Nil);
End;

Function TCtrlPortadorforma.ListPortadorformaParamCap(RecPag: String;
  IDPessoa: double): OleVariant;
Var
  sSQL: TStrings;
Begin
  sSQL := TStringList.Create;
  With sSQL Do
  Begin
    Append('SELECT');
    Append(' P.CODPORTFORMA, P.IDTEMPLCHEQUE, P.DESCRICAO, C.QTDEDIGITOSANO, P.LANCAFINANC,');
    Append(' P.CODPORTADOR, P.CODSUBCONTA, P.CODCENTROCUSTO, P.PLACONTA, C.FLGIMPCONDENSADO,');
    Append(' C.NUMCHQSALTO, C.NUMLINHASSALTO, P.PLACONTACONTABCHQ, P.PLANOCONTABCHQ, P.FLGCONTABEMISCHQ,');
    Append(' P.DMAIS, p.FLGCONTROLACHEQUE');
    Append('FROM');
    Append(' PORTADORFORMA P,');
    Append(' TEMPLCHEQUE C');
    Append('WHERE');
    Append('  (P.IDPESSOA = ' + FloatToStr(IDPessoa) + ') AND');
    Append('  (P.RECPAG = ' + QuotedStr(RecPag) + ') AND');
    Append('  (P.IDTEMPLCHEQUE IS NOT NULL) AND');
    Append('  (P.IDTEMPLCHEQUE = C.IDTEMPLCHEQUE)');
    Append('ORDER BY');
    Append('  P.DESCRICAO');
  End;
  Result := GetDataPacket(sSQL);
  sSQL.Free;
End;

Function TCtrlPortadorforma.ListPortadorformaPortadorConta(RecPag: String;
  IDPessoa: double): OleVariant;
Var
  ssql: String;
Begin
  ssql := 'SELECT B.RAZAOSOCIAL, PF.DESCRICAO, PF.CODPORTFORMA, PF.IDTEMPLCHEQUE, ' + #13 +
    '  PF.CODFORMA, PF.FLGCHEQUEDIFERIDO, PF.FLGOBRIGAFAV ' + #13 +
    ' FROM PORTADORFORMA PF, PORTADORCONTA PC, PESSOA B  ' + #13 +
    ' WHERE (1=1) ';
  If idpessoa <> 0 Then
    ssql := ssql + ' AND PF.IDPESSOA = ' + floattostr(IDPESSOA);
  If trim(RECPAG) <> '' Then
    ssql := ssql + ' AND PF.RECPAG = ' + quotedstr(RECPAG);
  ssql := ssql + ' AND PF.CODPORTADOR = PC.CODPORTADOR(+) ' + #13 +
    ' AND PC.IDBANCO = B.IDPESSOA(+) ORDER BY PF.DESCRICAO';
  Result := GetDataPacket(ssql);
End;

Procedure TCtrlPortadorforma.AfterInitialize;
Begin
  Inherited;
  _Padroes.InitializeAs(Self);
  _Padroes.OpenTransaction := false;
End;

End.

