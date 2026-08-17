//***************************************************************************************
//Rotina.............: ListPortadorforma
//N. SIG.............: 125387
//Data da Alteração..: 08/07/2022
//Responsável........: André Imakawa
//Descrição..........: Ajuste no campo FLGATIVO e parametro para ordenação
//==================================================================================
//Rotina.............: ListPortadorforma
//N. SIG.............: 99868
//Data da Alteração..: 02/09/2020
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Inclusão de novos campos para parametrização de Convênio Bancário.
//==================================================================================
//Analista : Helio Lima Custódio
//Data     : 23/06/2015
//SOL      : 253577/17359
//PPM      : 842402
//Descrição: Geração dos boletos separado e envio de e-mail para o participante
//==============================================================================
//Analista : Marcus Oliveira
//Data     : 29/06/2007
//Pendência: 25226
//Descrição: Desativado a rotina de grava seqremessa, pois não vi em nenhum momento
//           a necessidade disso
//==============================================================================
//Analista : Antonio Marcos(amf)
//Data     : 19.06.2007
//Descrição: O cdsSeqRemessa estava referenciando um ponteiro inválido (nil).
//==============================================================================
//Analista : Marcus Oliveira
//Data     : 15/05/2007
//Pendência: 25226
//Descrição: Fazendo a chamada para SeqPortador por dentro dessa Ctrl.
//==============================================================================
//Analista : Marcus Oliveira
//Data     : 12/04/2007
//Pendência: 24823
//Descrição: Adicionado o campo FlgAtivo no método ListPortadorforma.
//==============================================================================

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
  DbClient, uCMTypes, Classes, uCtrlPadroes, dBaseDados, uctrlSeqRemessa;

Type
  TCtrlPortadorforma = Class(TCmControlObject)
  protected
    Procedure DoChangeDataBase; override;
    Procedure OnCreateAppServer; override;
    Procedure AfterInitialize; override;
  private
    //Marcus Oliveira P. 25266 15/05/2007
    ctrlSeqRemessa        : TCtrlSeqRemessa;

    _DbPortadorforma: TDbPortadorforma;
    _Padroes: TCtrlPadroes;
    Fcds: TClientDataSet;
    FCdsSeqRemessa: TClientDataSet;
    // Eventos dos ClientDataSet´s
    Procedure Setcds(Const Value: TClientDataSet);
    procedure SetCdsSeqRemessa(const Value: TClientDataSet);

  public
  // Andre Tavares - prendência - 15099
    CodPortForma : integer;
    Property cds: TClientDataSet read Fcds write Setcds;
    Property CdsSeqRemessa: TClientDataSet read FCdsSeqRemessa write SetCdsSeqRemessa;
    // Métodos
    Constructor Create; override;
    Destructor Destroy; override;
    //  Informa os Compradore existentes
    Function ListPortadorforma(RECPAG: String = ''; Codportforma: double = 0; idpessoa: double = 0; iOrdenaAtivo: integer = 0): OleVariant;
    Function ListPortadorformaParamCap(RecPag: String = ''; IDPessoa: double = 0): OleVariant;
    Function ListPortadorformaPortadorConta(RecPag: String = ''; IDPessoa: double = 0): OleVariant;
    Function GravarPortadorforma(IdPessoa, IdModulo, IdUsuario: Integer): Boolean;

    //verifica se os portadorfoma de encontro de contas possuem a mesma conta bancária associada - pendência 22486 - 17/11/2006
    Function MesmaContaCorrente(const codportForma1: integer; codPortForma2: integer): Boolean;
  End;

Implementation

{ TCtrlPortadorforma }

Constructor TCtrlPortadorforma.Create;
Begin
  Inherited;
  _DbPortadorforma := TDbPortadorforma.Create(self);
  _Padroes := TCtrlPadroes.Create;

  //Marcus Oliveira P. 25266 15/05/2007
  CtrlSeqRemessa    := TCtrlSeqRemessa.Create;

  //amf 19.06.2007
  ctrlSeqRemessa.InitializeAs(Padroes);

End;

Destructor TCtrlPortadorforma.Destroy;
Begin

  //Marcus Oliveira P. 25266 15/05/2007
  CtrlSeqRemessa.Free;

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

Function TCtrlPortadorforma.ListPortadorforma(RECPAG: String = ''; Codportforma: double = 0; idpessoa: double = 0; iOrdenaAtivo: integer = 0): OleVariant;
Var
  ssql: String;
Begin
  ssql := ' SELECT   ' + #13 +
    // Marcus Oliveira 12/04/2007 Pendência: 24823
    // Nilton 19/11/08  Pendencia: 99772 inclui o Campo: FLGOBSERVOBRIGATORIA
    //'   FLGATIVO,  ' + #13 +                       // Andre Imakawa - SIG 125387
    '   NVL(FLGATIVO,''S'') AS FLGATIVO,  ' + #13 +  // Andre Imakawa - SIG 125387
    '   CODPORTFORMA,  IDPESSOA, IDEMPRESA, CODCENTROCUSTO,    ' + #13 +
    '   PLANO, PLACONTA, CODBLOQCHE,  CODPORTADOR,  CODFORMA,CODTIPDOC,  ' + #13 +
    '   RECPAG,  LANCAFINANC,  DMAIS,  IDUSUARIOINCLUSAO,      ' + #13 +
    '   DESCRICAO, IDTEMPLCHEQUE, NUMEMPRESABANCO, UNIDNEGOC,  ' + #13 +
    '   NOSSONUMERO, JUROSPORDIA, PRAZOPROTESTO, PATHARQUIVOREM, PATHARQUIVORET,  ' + #13 +
    '   CONTROLEREMESSA, DATACONTRREMESSA, CODARQUIVOREMESSA, CODTIPOPAGTO,       ' + #13 +
    '   CODFORMAPAGTO, FLGEMITEAVISO, NUMRAZAOCC, DESCFINAN, CODSUBCONTA,         ' + #13 +
    '   FLGCHEQUEDIFERIDO, PLACONTACONTABCHQ, PLANOCONTABCHQ , FLGCONTABEMISCHQ,  ' + #13 +
    '   IDFORCLI, IDCONFIGBARRAS, DIASEMANALANCTO, FLGOBSERVOBRIGATORIA, DIASUTEISLANCTO, FLGOBRIGAFAV, FLGCONTROLACHEQUE,    ' + #13 +
//início 01/08/2003 - André Tavares - pendência 14643
    '   VALORMAXIMO, CODFORMAPGTOALT, DMAISALT,    ' + #13 +
//fim 01/08/2003 - André Tavares - pendência 14643
//início 22/03/2004 - André Tavares - pendência 16244
    '   NVL(FLGUSAALTENVIO, 0) AS FLGUSAALTENVIO,    ' + #13 +
//fim 22/03/2004 - André Tavares - pendência 16244
//início 21/06/2004 - André Tavares - pendência 17041
    '   NVL(FLGMENSAGEMVERSO, 0) AS FLGMENSAGEMVERSO,    ' + #13 +
//fim 21/06/2004 - André Tavares - pendência 17041
    '   NVL(FLGENCCONTAS, ''N'') AS FLGENCCONTAS, ' + #13 + //andré tavares - pendência 22486 - 17/11/2006

    //início - andré tavares - pendência 21782 - 23/03/2007 - flag para indicar se utiliza float para fazer com que a data de crédito na conta do fornecedor seja igual à data programada do documento.
    '   NVL(FLGFLOATARQBANC, ''N'') AS FLGFLOATARQBANC, '+ #13 + //
    '   NVL(FLGDATATDEBCRED, ''C'') AS FLGDATATDEBCRED, '+ #13 + //
    //fim - andré tavares - pendência 21782 - 23/03/2007 - flag para indicar se utiliza float para fazer com que a data de crédito na conta do fornecedor seja igual à data programada do documento.

    //Inicio - Helio - SOL Nº 253577-17359 PPM Nº 842402
    '   FLGAGRUPAANEXOS,    ' + #13 +
    '   FLGENVIAEMAIL    ' + #13 +
    //Fim - Helio - SOL Nº 253577-17359 PPM Nº 842402
    '   , NVL(FLGARQUIVO, ''N'') AS FLGARQUIVO '  + #13 +     //Cássio Rovaroto - SIG nº 99868
    ' FROM   ' + #13 +
    '   PORTADORFORMA  ' + #13 +
    'WHERE  (1=1)      ';
  If trim(RECPAG) <> '' Then
    ssql := ssql + ' AND RECPAG = ' + quotedstr(RECPAG);
  If Codportforma <> 0 Then
    ssql := ssql + ' AND CODPORTFORMA = ' + floattostr(Codportforma);
  If idpessoa <> 0 Then
    ssql := ssql + ' AND IDPESSOA = ' + floattostr(IDPESSOA);

  // Andre Imakawa - SIG 125387 - Inicio
  If iOrdenaAtivo = 0 Then
    ssql := ssql + ' ORDER BY DESCRICAO               '
  Else
    ssql := ssql + ' ORDER BY FLGATIVO DESC, DESCRICAO               ';
  // Andre Imakawa - SIG 125387 - Fim

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

      //amf 19.06.2007
      ctrlSeqRemessa.cds := FCdsSeqRemessa;

      //início - andré tavares - 23/02/2006 - Pendência 22019 - não deixar decrescer o campo nossonúmero
      if cds.fieldByName('NOSSONUMERO').Value < cds.fieldByName('NOSSONUMERO').OldValue then
      begin
        self.messageInfo := 'Nosso Número Não Pode Ser Decrescido!';
        Raise Exception.Create(self.messageInfo);
      end;
      //fim - andré tavares - 23/02/2006 - Pendência 22019


      if ( Cds.FieldByName('CODARQUIVOREMESSA').AsInteger=-1)
       and (Cds.FieldByName('CODPORTFORMA').AsString<>'') then // Daniel - 22893 - 26/08/2006
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

  //Marcus Oliveira P. 25266 15/05/2007
  CtrlSeqRemessa.InitializeAs(Self);
  ctrlSeqRemessa.OpenTransaction := false;


End;

//verifica se os portadorfoma de encontro de contas possuem a mesma conta bancária associada - pendência 22486 - 17/11/2006
function TCtrlPortadorforma.MesmaContaCorrente(const codportForma1: integer; codPortForma2: integer): Boolean;
var cds1, cds2 : TClientDataSet;
begin
  result := false;
  cds1 := TClientDataSet.Create(nil);
  cds2 := TClientDataSet.Create(nil);
  try
    cds1.data := getDataPacket(' SELECT PF.CODPORTFORMA, PC.NOCONTACORR, PC.IDAGENCIA, PC.IDBANCO '+
                               ' FROM PORTADORFORMA PF, PORTADORCONTA PC '+
                               ' WHERE PF.FLGENCCONTAS = ''S'' AND '+
                               ' PF.CODPORTADOR = PC.CODPORTADOR AND '+
                               ' PF.CODPORTFORMA = ' + intToStr(codportForma1) );

    cds2.data := getDataPacket(' SELECT PF.CODPORTFORMA, PC.NOCONTACORR, PC.IDAGENCIA, PC.IDBANCO '+
                               ' FROM PORTADORFORMA PF, PORTADORCONTA PC '+
                               ' WHERE PF.FLGENCCONTAS = ''S'' AND '+
                               ' PF.CODPORTADOR = PC.CODPORTADOR AND '+
                               ' PF.CODPORTFORMA = ' + intToStr(codportForma2) );

    result := (trim(cds1.FieldByName('NOCONTACORR').asString) = trim(cds2.FieldByName('NOCONTACORR').asString)) and
              (cds1.FieldByName('IDAGENCIA').asInteger = cds2.FieldByName('IDAGENCIA').asInteger) and
              (cds1.FieldByName('IDBANCO').asInteger = cds2.FieldByName('IDBANCO').asInteger);
  finally
    cds1.free;
    cds2.free;
  end;
end;


procedure TCtrlPortadorforma.SetCdsSeqRemessa(const Value: TClientDataSet);
begin
  FCdsSeqRemessa := Value;
end;

End.

