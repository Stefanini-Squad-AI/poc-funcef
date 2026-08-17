//------------------------------------------------------------------------------
//  Autor      : Antonio Marcos (amf)
//  Rotina     : CtrlLancFinanc.bbtnConfirmarClick
//  Data       : 05.07.2007
//  Descrição  : Correção do Access Violation que impedia a geração do arquivo da remessa de pagamento.
//------------------------------------------------------------------------------
//  Autor      : Marcus Oliveira
//  Rotina     : CtrlLancFinanc.bbtnConfirmarClick
//  Data       : 19/06/2007
//  Pendência  : 25399
//  Descrição  : O Parâmetro estava sendo cravado na query.
//------------------------------------------------------------------------------
//  Autor      : Marcus Oliveira
//  Rotina     : CtrlLancFinanc.FazerRateioCAPCAR
//  Data       : 30/04/2007
//  Pendência  : 25094
//  Descrição  : Corrigida a data de disponibilidade antes estava passando -1
//------------------------------------------------------------------------------
//  Autor      : Rodolpho da Silva
//  Rotina     : TCtrlPagEletronico.bbtnConfirmarClick
//  Data       : 06/03/2006
//  Pendência  : 21667
//  Descrição  : Inserido uma nova descrição (LOTES DIVERSOS) para lançamentos no
//               financeiro para remessas com mais de um lote.
//------------------------------------------------------------------------------
//  Autor      : Cátia Azevedo
//  Rotina     : Diversas
//  Data       : 02/03/2006
//  Pendência  : 21634
//  Descrição  : Comentada  linha 743
//  o fechamento do cdsdocumentos estava ocasionando erro na geração de arquivo
//  remessa de lotes no contas a pagar.
//------------------------------------------------------------------------------
//  Autor      : André Tavares
//  Rotina     : Diversas
//  Data       : 31/01/2006
//  Pendência  : 21352
//  Descrição  : No Cap não estava considerando o float nos lançamentos no Financeiro.
//               Aproveitei pra colocar o filtro idpessoa na query.
//------------------------------------------------------------------------------
{
========================================================================================================
Data      : 28/01/2005
Autor     : Rodolpho da SIlva
Pendência : 18498
Descrição : Inserir documento no CFinan conforme parâmetro do momento do lançamento 
========================================================================================================

 andre tavares - 16/07/2003 - reslução pendência 14332
 andre tavares - 01/08/2003 - pendência 14643
 andre tavares - 21/12/2004 - pendencia 17884
}

Unit
  uCtrlPagEletronico;

Interface

Uses
  sysutils, uCmControlObject, uCmDbObject, DB, uDataBase, DbClient, Classes, StdCtrls,
  uCmTypes, uDtmPagEletronico, uMidasUtil, uCtrlIntBanco, uCtrlFinanc, DDadosBancarios,
  uCtrlParamCap, uCtrlDocumento;

Type
  TCtrlPagEletronico = Class(TCmControlObject)
  Protected
    Procedure OnCreateAppServer; Override;
    Procedure AfterInitialize; Override;

  Private
    DTmPagEletronico : TDTmPagEletronico;
    CtrlLancFinanc   : TCtrlFinanc;
    _ParamCap: TCtrlParamCap;
    sSQL             : String;

    FIdEmpresa        : Double;
    FIdModulo         : Double;
    FIdUsuario        : Double;
    FIdEspAcesso      : Double;
    FUsaPlanoPatro    : Boolean;
    FPlanoConta       : Double;
    FRecPag           : String;
    FFinanceiro       : Boolean;
    FEstornoDocum     : Boolean;
    FIntegraContabil  : Boolean;

    FCdsLotePagto      : TClientDataSet;
    FCdsModelosCnab    : TClientDataSet;
    FCdsLoteDoc        : TClientDataSet;
    FCdsAux            : TClientDataSet;
    FCdsPortadorForma  : TClientDataSet;
    FCdsDocumentos     : TClientDataSet;
    FCdsAtualizaBarras : TClientDataSet;
    FdDataDisp: TdateTime;


    Function AtualizaTabela( pSql : String ) : Boolean;
    Procedure CdsDocumentosCalcFields;
    Function LancaFinanc(RecPAg: String; IdPessoa: double): String;

    procedure SetCdsAtualizaBarras(const Value: TClientDataSet);
    procedure SetCdsAux(const Value: TClientDataSet);
    procedure SetCdsDocumentos(const Value: TClientDataSet);
    procedure SetCdsLoteDoc(const Value: TClientDataSet);
    procedure SetCdsLotePagto(const Value: TClientDataSet);
    procedure SetCdsModelosCnab(const Value: TClientDataSet);
    procedure SetCdsPortadorForma(const Value: TClientDataSet);
    procedure SetdDataDisp(const Value: TdateTime);

  Public
    CtrlIntBanco     : TCtrlIntBanco;
    sLostesSel       : String;

    Constructor Create; Override;
    Destructor Destroy; Override;

    Function UpdateCodBarra( sCodigoBarra, sLinhaDigitavel,
                             sNumLote,     sCODDOCUMENTO   : String ) : Boolean;
    Function ChkDocClick( pChkDocChecked            : Boolean;
                          pCmbModeloCnabLookupValue : String ): Boolean;
    Procedure MontaQueryBoletos( pbExibeBarras   : Boolean;
                                 pCmbModeloCnabText,
                                 pCmbModeloCnabLookupValue : String;
                                 pDstList : TListBox;
                                 pPrefixoServidor : String );

    Procedure bbtnConfirmarClick( pbExibeBarras   : Boolean;
                                  pCmbModeloCnabText,
                                  pCmbModeloCnabLookupValue : String;
                                  pDstList : TlistBox;
                                  pRgEmisLoteItemIndex : Integer;
                                  pDtEmisText : String; sHistFinanc: String = '');
    Procedure sqlLoteDocOpen;

    //Marcus Oliveira P.25094 30/04/2007
    property dDataDisp         : TdateTime read FdDataDisp write SetdDataDisp;

    Property IdEmpresa         : Double         Read FIdEmpresa         Write FIdEmpresa;
    Property IdModulo          : Double         Read FIdModulo          Write FIdModulo;
    Property IdUsuario         : Double         Read FIdUsuario         Write FIdUsuario;
    Property IdEspAcesso       : Double         Read FIdEspAcesso       Write FIdEspAcesso;
    Property UsaPlanoPatro     : Boolean        Read FUsaPlanoPatro     Write FUsaPlanoPatro;
    Property PlanoConta        : Double         Read FPlanoConta        Write FPlanoConta;
    Property RecPag            : String         Read FRecPag            Write FRecPag;
    Property Financeiro        : Boolean        Read FFinanceiro        Write FFinanceiro;
    Property EstornoDocum      : Boolean        Read FEstornoDocum      Write FEstornoDocum;
    Property IntegraContabil   : Boolean        Read FIntegraContabil   Write FIntegraContabil;
    Property CdsLotePagto      : TClientDataSet Read FCdsLotePagto      Write SetCdsLotePagto;
    Property CdsModelosCnab    : TClientDataSet Read FCdsModelosCnab    Write SetCdsModelosCnab;
    Property CdsLoteDoc        : TClientDataSet Read FCdsLoteDoc        Write SetCdsLoteDoc;
    Property CdsAux            : TClientDataSet Read FCdsAux            Write SetCdsAux;
    Property CdsPortadorForma  : TClientDataSet Read FCdsPortadorForma  Write SetCdsPortadorForma;
    Property CdsDocumentos     : TClientDataSet Read FCdsDocumentos     Write SetCdsDocumentos;
    Property CdsAtualizaBarras : TClientDataSet Read FCdsAtualizaBarras Write SetCdsAtualizaBarras;
End;

Implementation

Uses
  DBaseDados;

{ TCtrlPagEletronico }

Constructor TCtrlPagEletronico.Create;
Begin
  Inherited;

End;

Destructor TCtrlPagEletronico.Destroy;
Begin

  If ( IsAppServer ) Then FreeCds( [ CdsLotePagto, CdsModelosCnab,   CdsLoteDoc,
                                     CdsAux,       CdsPortadorForma, CdsDocumentos,
                                     CdsAtualizaBarras ] );
  DTmPagEletronico.Free;
  CtrlLancFinanc.Free;
  _ParamCap.Free;

  if assigned(CtrlIntBanco) then
    freeAndNil(CtrlIntBanco);

  Inherited;
End;

Procedure TCtrlPagEletronico.AfterInitialize;
Begin
  Inherited;
  DtmPagEletronico := TDTmPagEletronico.Create( Nil );
  CtrlIntBanco     := TCtrlIntBanco.Create;
  CtrlIntBanco.ExibeArquivoGerado := true; // andre tavares - pendencia 17884 - 21/12/2004
  
  CtrlLancFinanc   := TCtrlFinanc.Create( Idempresa, IdModulo, IdUsuario, UsaPlanoPatro );
  _ParamCap := TCtrlParamCap.Create;
  _ParamCap.InitializeAs(self);

  CtrlIntBanco.InitializeAs( Self );
  CtrlLancFinanc.InitializeAs( Self );

  CtrlIntBanco.OpenTransaction   := False;
  CtrlLancFinanc.OpenTransaction := False;


  With DtmPagEletronico Do Begin
    SqlLotePagto.ClientDataSet      := CdsLotePagto;
    SqlModelosCnab.ClientDataSet    := CdsModelosCnab;
    SqlLoteDoc.ClientDataSet        := CdsLoteDoc;
    SqlAux.ClientDataSet            := CdsAux;
    SqlPortadorForma.ClientDataSet  := CdsPortadorForma;
    SqlDocumentos.ClientDataSet     := CdsDocumentos;
    SqlAtualizaBarras.ClientDataSet := CdsAtualizaBarras;

    sqlModelosCnab.Open;
  End;
End;

Procedure TCtrlPagEletronico.OnCreateAppServer;
Begin
  Inherited;
  CdsLotePagto      := TClientDataSet.Create( Nil );
  CdsModelosCnab    := TClientDataSet.Create( Nil );
  CdsLoteDoc        := TClientDataSet.Create( Nil );
  CdsAux            := TClientDataSet.Create( Nil );
  CdsPortadorForma  := TClientDataSet.Create( Nil );
  CdsDocumentos     := TClientDataSet.Create( Nil );
  CdsAtualizaBarras := TClientDataSet.Create( Nil );
End;

Procedure TCtrlPagEletronico.SetCdsAtualizaBarras( Const Value: TClientDataSet);
Begin
  FCdsAtualizaBarras := Value;
End;

Procedure TCtrlPagEletronico.SetCdsAux( Const Value: TClientDataSet);
Begin
  FCdsAux := Value;
End;

Procedure TCtrlPagEletronico.SetCdsDocumentos( Const Value: TClientDataSet);
Begin
  FCdsDocumentos := Value;
End;

Procedure TCtrlPagEletronico.SetCdsLoteDoc( Const Value: TClientDataSet);
Begin
  FCdsLoteDoc := Value;
End;

Procedure TCtrlPagEletronico.SetCdsLotePagto( Const Value: TClientDataSet);
Begin
  FCdsLotePagto := Value;
End;

Procedure TCtrlPagEletronico.SetCdsModelosCnab( Const Value: TClientDataSet);
Begin
  FCdsModelosCnab := Value;
End;

Procedure TCtrlPagEletronico.SetCdsPortadorForma( Const Value: TClientDataSet);
Begin
  FCdsPortadorForma := Value;
End;

Function TCtrlPagEletronico.UpdateCodBarra( sCodigoBarra, sLinhaDigitavel,
                                            sNumLote,     sCODDOCUMENTO   : String ) : Boolean;
Var
  sSQL : String;
Begin
  If ConnectionSide = cnsClient Then Begin
    Result := Connection.AppServer.UpdateCodBarra( sCodigoBarra, sLinhaDigitavel,
                                                   sNumLote,     sCODDOCUMENTO );
    If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
  End Else Begin
    Result := True;
    Try
      StartTransaction;

      sSql := 'UPDATE LOTEXDOCUM' +
              ' SET CODBARRA = ' + QuotedStr(sCodigoBarra) + ', ' +
              '    CODBARRAVALOR = ' + QuotedStr(sLinhaDigitavel) +
              ' WHERE (NUMLOTE = ' + sNumLote + ') AND ' +
              '      (CODDOCUMENTO = ' + sCODDOCUMENTO + ')';

      If Not AtualizaTabela(sSQL) Then Raise Exception.Create('Erro ao Alterar Código de Barras' + #13 + MessageInfo);
      Commit;
    Except
      On E:Exception Do Begin
        Result := False;
        Rollback;
        MessageInfo := E.Message;
      End;
    End;
  End;
End;

Function TCtrlPagEletronico.ChkDocClick( pChkDocChecked            : Boolean;
                                         pCmbModeloCnabLookupValue : String ) : Boolean;
Begin
  With DtmPagEletronico.sqlLoteDoc.SQL Do Begin
    If ( Not pChkDocChecked ) Then Begin
      Clear;
      Append('SELECT                                                           ');
      Append('  L.NUMLOTE,                                                     ');
      Append('  D.NODOCUMENTO,                                                 ');
      Append('  L.VALOR,                                                       ');
      Append('  L.CODDOCUMENTO,                                                ');
      Append('  L.CODBARRA,                                                    ');
      Append('  L.CODBARRAVALOR                                                ');
      Append('FROM                                                             ');
      Append('  DOCUMENTO D,                                                   ');
      Append('  LOTEXDOCUM  L,                                                 ');
      Append('  PORTADORFORMA P,                                               ');
      Append('  LOTEPAGTO LP                                                   ');
      Append('WHERE                                                            ');
      Append(' (P.CODARQUIVOREMESSA = ' + pCmbModeloCnabLookupValue + ') AND   ');
      Append(' (L.NUMLOTE IN ('+ sLostesSel +'))  AND                          ');
      Append(' (P.CODFORMAPAGTO IN (' + CtrlIntBanco.CodigosBarra + '))       AND     ');
      Append(' (LP.NUMLOTE = L.NUMLOTE)           AND                          ');
      Append(' (LP.CODPORTFORMA = P.CODPORTFORMA) AND                          ');
      Append(' (D.CODDOCUMENTO = L.CODDOCUMENTO)                               ');
      Append('ORDER BY D.NODOCUMENTO                                           ');
    End Else Begin
      Clear;
      Append('SELECT                                                           ');
      Append('  L.NUMLOTE,                                                     ');
      Append('  D.NODOCUMENTO,                                                 ');
      Append('  L.VALOR,                                                       ');
      Append('  L.CODDOCUMENTO,                                                ');
      Append('  L.CODBARRA,                                                    ');
      Append('  L.CODBARRAVALOR                                                ');
      Append('FROM                                                             ');
      Append('  DOCUMENTO D,                                                   ');
      Append('  LOTEXDOCUM  L,                                                 ');
      Append('  PORTADORFORMA P,                                               ');
      Append('  LOTEPAGTO LP                                                   ');
      Append('WHERE                                                            ');
      Append('  (P.CODARQUIVOREMESSA = ' + pCmbModeloCnabLookupValue + ') AND  ');
      Append('  (L.NUMLOTE IN ('+ sLostesSel +'))  AND                         ');
      Append('  (P.CODFORMAPAGTO IN (' + CtrlIntBanco.CodigosBarra + '))     AND      ');
      Append('  ((L.CODBARRA IS NULL)              AND                         ');
      Append('  (L.CODBARRAVALOR IS NULL))         AND                         ');
      Append('  (LP.NUMLOTE = L.NUMLOTE)           AND                         ');
      Append('  (LP.CODPORTFORMA = P.CODPORTFORMA) AND                         ');
      Append('  (D.CODDOCUMENTO = L.CODDOCUMENTO)                              ');
      Append('ORDER BY D.NODOCUMENTO                                           ');
    End;
    Try
      DtmPagEletronico.sqlLoteDoc.Open;
      Result := True;
    Except
      On E : Exception Do Begin
        Result := False;
        MessageInfo := E.Message;
      End;
    End;
  End;
End;

Procedure TCtrlPagEletronico.MontaQueryBoletos( pbExibeBarras   : Boolean;
                                                pCmbModeloCnabText,
                                                pCmbModeloCnabLookupValue : String;
                                                pDstList : TListBox;
                                                pPrefixoServidor : String );
Begin
  With DtmPageletronico.sqlLotePagto.SQL Do Begin

    Clear;
    Append('SELECT DISTINCT' );
    Append('  LOTEPAGTO.NUMLOTE,           LOTEPAGTO.CODPORTFORMA,' );
    Append('  PORTADORFORMA.CODFORMAPAGTO, PORTADORFORMA.CODTIPOPAGTO,' );
    Append('  PORTADORFORMA.FLGEMITEAVISO, PORTADORFORMA.CODARQUIVOREMESSA' );
    Append('FROM' );
    Append('  LotePagto,' );
    Append('  LOTEXDOCUM LOTEX,' );
    Append('  DOCUMENTO DOC,' );
    Append('  PESSOA PESS,' );
    Append('  PARAMCAP PAR,' );
    Append('  PortadorForma,' );
    Append('  ( select count(*) as totdocum , numlote' );
    Append('    from lotexdocum ld , documento d' );
    Append('    where D.RECPAG         = ' + QuotedStr( RecPag ) + '  AND' );
    Append('      ((LD.FLGBAIXA  IN (''N'',''R''))  OR (LD.FLGBAIXA IS NULL ))  AND' );
    Append('      ld.CODDOCUMENTO = D.CODDOCUMENTO' );
    Append('    group by numlote  ) totdocum,' );
    Append('  ( select count(*) as totdocum , numlote' );
    Append('    from lotexdocum ld , documento d' );
    Append('    where D.RECPAG         = ' + QuotedStr( RecPag ) + '  AND ' );
    Append('      ((LD.FLGBAIXA  IN (''N'',''R''))  OR (LD.FLGBAIXA IS NULL)) AND' );
    Append('      ld.CODDOCUMENTO = D.CODDOCUMENTO  and' );
    Append('      d.codtipdoc in (SELECT CODTIPDOC FROM TIPODOCRECPAG a WHERE a.RECPAG =   ' + QuotedStr( RecPag ) + ' and' );
    Append('                 not exists  (select 1 from UsuarioxTpdocto b where recpag=' + QuotedStr( RecPag ) + ' and b.idusuario=' );
    Append(                FloatToStr( IdUsuario )+') union  SELECT CODTIPDOC  FROM TIPODOCRECPAG a WHERE a.RECPAG =   ' + QuotedStr( RecPag ) + ' and ' );
    Append(                'exists (select 1 from UsuarioxTpdocto b where recpag=' + QuotedStr( RecPag ) + ' and a.codtipdoc=b.codtipdoc and b.idusuario=' );
    Append(                FloatTostr( Idusuario)+')) group by numlote  ) totlote ' );
    Append(          ' WHERE (FLAGEMISSAO IS NULL OR  FLAGEMISSAO = ''0'') AND                  ' );
    Append(          '       (FLAGCANCEL IS NULL OR FLAGCANCEL = ''0'')    AND                  ' );
    Append(          ' totlote.totdocum=totdocum.totdocum and' );
    Append(          ' totlote.numlote=totdocum.numlote and   totlote.numlote=  lotepagto.NUMLOTE and' );
    Append(          '       (LotePagto.IDPESSOA = ' + FloatToStr(IdEmpresa) + ') AND' );
    Append(          '       (DOC.RECPAG         = ' + QuotedStr( RecPag ) + ')                     AND' );
    Append(          '       (PORTADORFORMA.CODARQUIVOREMESSA = ' + pCmbModeloCnabLookupValue + ') ' );

     If CtrlIntBanco.ObrigaTipoPagto( CtrlIntBanco.IndiceDoBanco ) Then
      Append(        ' AND (PORTADORFORMA.CODTIPOPAGTO IS NOT NULL) ' );

     If CtrlIntBanco.ObrigaFormaPagto( CtrlIntBanco.IndiceDoBanco ) Then
     Append( ' AND (PORTADORFORMA.CODFORMAPAGTO IS NOT NULL) ' );

    Append('  AND (LOTEPAGTO.CODPORTFORMA = PORTADORFORMA.CODPORTFORMA) AND ' );
    Append(           '       (LOTEPAGTO.NUMLOTE  = LOTEX.NUMLOTE)                           AND ' );
    Append(           '       (LOTEX.CODDOCUMENTO = DOC.CODDOCUMENTO)                        AND ' );
    Append(           '       (Par.IDPESSOA = LOTEPAGTO.IDPESSOA)                            AND ' );
    Append(           '       (pess.idpessoa = LOTEPAGTO.idpessoa)                               ' );
    Append(           ' ORDER BY NUMLOTE' );
  End;

  DtmPagEletronico.sqlLotePagto.Open;
End;

Procedure TCtrlPagEletronico.bbtnConfirmarClick( pbExibeBarras   : Boolean;
                                                 pCmbModeloCnabText,
                                                 pCmbModeloCnabLookupValue : String;
                                                 pDstList : TlistBox;
                                                 pRgEmisLoteItemIndex : Integer;
                                                 pDtEmisText : String; sHistFinanc: String = '');
Var
  x : Integer;
  iCodLancFinanc : Double;
  sNumChq, sDoc, sDataEmissao: String;
  DataFloat : TdateTime; // andre tavares - pendência 21352 - 31/01/2006
  sHistCompl: string; // Rodolpho da Silva - P: 21667 - 06/03/2006


//Marcus Oliveira P.25399 - 19/06/2007
  _CdsFlgStatusFinanc: TClientDataSet;

Begin

  //Criar o _CdsParamCap
  _CdsFlgStatusFinanc := TClientDataSet.Create(nil);
  _CdsFlgStatusFinanc.data := GetDataPacket( 'SELECT FLGSTATUSFINANC FROM PARAMCAP WHERE IDPESSOA = ' + FloatToStr(IdEmpresa) );


  If cdsAux.Active Then cdsAux.Close;
  DtmPagEletronico.sqlAux.SQL.Text := 'SELECT CODPORTFORMA FROM LOTEPAGTO WHERE (NUMLOTE IN ('+ sLostesSel +'))';
  DtmPagEletronico.sqlAux.Open;

  With DtmPagEletronico.sqlPortadorForma.SQL Do Begin
    Clear;
    Append('SELECT DISTINCT                                                    ');
    Append('  PC.CONTROLEREMESSA,                                              ');
    Append('  PF.PATHARQUIVOREM,                                               ');
    Append('  CODPORTFORMA,                                                    ');
    Append('  LANCAFINANC                                                      ');
    Append('FROM                                                               ');
    Append('   PORTADORFORMA PF,                                               ');
    Append('   PORTADORCONTA PC                                                ');
    Append('WHERE                                                              ');
    Append(' (PC.CODPORTADOR = PF.CODPORTADOR) AND                             ');
    Append(' (PF.RECPAG = ' + QuotedStr(RecPag) + ') AND          ');
    Append(' (PF.IDPESSOA = '+ FloatToStr(IDEmpresa)+ ') AND             ');
    Append(' (PF.CODPORTFORMA = ' + cdsAux.Fields[0].AsString + ')             ');
    if CtrlIntBanco.ObrigaTipoPagto(CtrlIntBanco.IndiceDoBanco) then
      Append(' AND (CODTIPOPAGTO IS NOT NULL) ');
    if CtrlIntBanco.ObrigaFormaPagto(CtrlIntBanco.IndiceDoBanco) then
      Append(' AND (CODFORMAPAGTO IS NOT NULL) ');
  end;
  DtmPagEletronico.sqlPortadorForma.Open;
  cdsAux.Close;

  if CtrlIntBanco.VerficaDadosEmpresa('P', cdsPortadorForma.FieldByName('CODPORTFORMA').AsInteger) then
  begin
    if cdsDocumentos.Active Then cdsDocumentos.Close;

    With DtmPagEletronico.sqlDocumentos.SQL Do Begin
      Clear;
      Append('SELECT DISTINCT                                                  ');
      Append('  P.IDPESSOA,                                                    ');
      Append('  P.NOME,                                                        ');
      Append('  P.RAZAOSOCIAL,                                                 ');
      Append('  P.TIPO,                                                        ');
      Append('  DECODE(P.TIPO,''J'',DECODE(P.NUMDOCUMENTO,NULL,''00000000000000'',P.NUMDOCUMENTO),DECODE(P.NUMDOCUMENTO,NULL,''00000000000'',P.NUMDOCUMENTO)) AS NUMDOCUMENTO, ');
      Append('  E.LOGRADOURO,                                                  ');
      Append('  E.NUMERO,                                                      ');
      Append('  E.COMPLEMENTO,                                                 ');
      Append('  E.BAIRRO,                                                      ');
      Append('  E.CEP,                                                         ');
      Append('  CID.NOME AS CIDADE,                                            ');
      Append('  ES.CODESTADO,                                                  ');
      Append('  LXD.VALOR,                                                     ');
      Append('  LXD.CODBARRA,                                                  ');
      Append('  LXD.CODBARRAVALOR,                                             ');
      Append('  D.IDFORCLI,                                                    ');
      Append('  D.CODDOCUMENTO,                                                ');
      Append('  ALT.VALORDESCONTO,                                               ');
      Append('  D.INDICECORRECAO,                                              ');
      Append('  D.VLRMULTA,                                                    ');
      Append('  ALT.VALORJUROS,                                                  ');
      Append('  D.DATAVENCTO,                                                  ');
      Append('  D.DATAPROGRAMADA,                                              ');
      Append('  D.MOECODIGO AS TIPOMOEDA,                                      ');
      Append('  D.NODOCUMENTO,                                                 ');
      Append('  D.COMPLDOCUMENTO,                                              ');
      Append('  LP.NUMLOTE,                                                    ');
      Append('  LP.CODPORTFORMA,                                               ');
      Append('  PF.CODFORMAPAGTO,                                              ');
      Append('  PF.CODTIPOPAGTO,                                               ');
      Append('  PF.FLGEMITEAVISO,                                              ');
      Append('  PF.CODARQUIVOREMESSA,                                          ');
      Append('  PF.CODPORTADOR,                                                ');
      Append('  PF.CODPORTFORMA,                                               ');
      Append('  PF.NUMEMPRESABANCO,                                            ');

    // inicio - tavares - 01/08/2003 - pendência 14643
      Append('  PF.VALORMAXIMO,                                                ');
      Append('  PF.CODFORMAPGTOALT,                                            ');
    // fim - tavares - 01/08/2003 - pendência 14643

    // inicio - tavares - 26/11/2003 - pendência 15675
      Append('  PF.DMAISALT,                                                   ');
      Append('  PF.DMAIS,                                                   ');
    // fim - tavares - 26/11/2003 - pendência 15675

      Append('  PC.IDBANCO,                                                    ');
      Append('  PC.NOCONTACORR,                                                ');
      Append('  TD.DEBCRE,                                                     ');
      Append('  ''                         '' as livre,                        ');
      Append('  ''               '' As CONTACORRENTE,                          ');
      Append('  ''          ''      As CODBANCOFAVORECIDO,                     ');
      Append('  ''               '' As NUMAGENCIA,                             ');
      Append('  ''                                                            '' As NOMEAGENCIA,');
      Append('  '' '' As TIPOCONTA                                             ');
      Append('FROM                                                             ');
      Append('  PESSOA P,                                                      ');
      Append('  TIPODOCRECPAG TD,                                              ');
      Append('  DOCUMENTO D,                                                   ');
      Append('  LOTEPAGTO LP,                                                  ');
      Append('  LOTEXDOCUM LXD,                                                ');
      Append('  PARAMCAP PCAP,                                                 ');
      Append('  PORTADORFORMA PF,                                              ');
      Append('  PORTADORCONTA PC,                                              ');
      Append('  CIDADES CID,                                                   ');
      Append('  ESTADO ES,                                                     ');
      Append('  ENDPESS E,                                                     ');
      Append('  MOEDA M ,                                                      ');

      //início - andre tavares - pendência 21789 - 20/03/2006
      Append('    ( SELECT      ');
      Append('        L.CODDOCUMENTO, ');
      Append('        SUM(DECODE(A.RECPAG, ''P'', DECODE(A.ACRESDECRES, ''D'', L.VALOR, 0), DECODE(A.ACRESDECRES, ''C'', L.VALOR, 0))) AS VALORDESCONTO, ');
      Append('        SUM(DECODE(A.RECPAG, ''P'', DECODE(A.ACRESDECRES, ''C'', L.VALOR, 0), DECODE(A.ACRESDECRES, ''D'', L.VALOR, 0))) AS VALORJUROS ');
      Append('      FROM LANCTODOCUM L, TIPOALTERADOR A  ');
      Append('      WHERE L.CODALTERADOR = A.CODALTERADOR ');
      Append('      GROUP BY L.CODDOCUMENTO  )            ');
      Append('  ALT     ');
      //fim - andre tavares - pendência 21789 - 20/03/2006

      Append(' WHERE                                                            ');
      Append('  (FLAGEMISSAO IS NULL OR FLAGEMISSAO = ''0'')AND                ');
      Append('  (LXD.NUMLOTE IN ('+ sLostesSel +'))  AND                       ');
      Append('  (LP.IDPESSOA = ' + FloatToStr(IDEmpresa)+ ') AND         ');
      Append('  (FLAGCANCEL IS NULL OR FLAGCANCEL = ''0'')  AND                ');
      Append('  (D.RECPAG = ' + QuotedStr(RecPag) + ')            ');
      if CtrlIntBanco.ObrigaTipoPagto(CtrlIntBanco.IndiceDoBanco) then
        Append('AND  (PF.CODTIPOPAGTO IS NOT NULL)                             ');
      if CtrlIntBanco.ObrigaFormaPagto(CtrlIntBanco.IndiceDoBanco) then
        Append('AND (PF.CODFORMAPAGTO IS NOT NULL)                             ');
      Append('  AND (LP.CODPORTFORMA = PF.CODPORTFORMA) AND                    ');
      Append('  (LP.NUMLOTE = LXD.NUMLOTE) AND                                 ');
      //início - andre tavares - pendência 21789 - 20/03/2006
      Append('  (D.CODDOCUMENTO = ALT.CODDOCUMENTO(+)) AND                     '); //pendência 21873 - coloquei o right join
      //fim - andre tavares - pendência 21789 - 20/03/2006
      Append('  (LXD.CODDOCUMENTO = D.CODDOCUMENTO) AND                        ');
      Append('  (PCAP.IDPESSOA = LP.IDPESSOA) AND                              ');
      Append('  (D.IDFORCLI = P.IDPESSOA) AND                                  ');
      Append('  (D.CODTIPDOC = TD.CODTIPDOC) AND                               ');
      Append('  (PF.CODPORTADOR = PC.CODPORTADOR) AND                          ');
      Append('  (E.IDPESSOA(+) = P.IDPESSOA) AND                               ');
      Append('  (E.IDENDERECO(+) = P.IDENDCOBRANCA ) AND                       ');
      Append('  (E.IDCIDADES = CID.IDCIDADES(+)) AND                           ');
      Append('  (ES.IDESTADO(+) = CID.IDESTADO)                                ');

      if (CtrlIntBanco.IndiceDoBanco = 58) then // Banco Besc
         Append('ORDER BY  PF.CODTIPOPAGTO, PF.CODFORMAPAGTO, LXD.VALOR DESC ') //amf 26.06.2007 - ordenei desta forma para acertar a quebra do lote
      else
        Append('ORDER BY LXD.VALOR DESC, PF.CODTIPOPAGTO, PF.CODFORMAPAGTO       '); //andre tavares pendência 21187 - coloquei o campo LXD.VALOR na ordenação
    end;

    DtmPagEletronico.sqlDocumentos.Open;

    if cdsDocumentos.IsEmpty then
    begin
      MessageInfo := 'Não há documentos selecionados com esses parâmetros';
      Raise Exception.Create(MessageInfo)
    end;
    cdsDocumentos.fieldbyname('NOME').Tag := 9;
    cdsDocumentos.fieldbyname('RAZAOSOCIAL').Tag := 9;
    cdsDocumentos.fieldbyname('NUMDOCUMENTO').Tag := 9;
    cdsDocumentos.fieldbyname('VALOR').Tag := 9;
    cdsDocumentos.fieldbyname('DATAVENCTO').Tag := 9;
    CdsDocumentosCalcFields;

    If Not CtrlIntBanco.ValidaRemessa('P',cdsDocumentos.Data,False) Then Begin
      cdsDocumentos.Close;
    End Else Begin
     Try
       StartTransaction;

       If CtrlIntBanco.MontaPagamentoEletronico( CdsModelosCnab.FieldByName('IDMODELOSCNAB' ).AsInteger,
                                         CdsPortadorForma.FieldByName('ControleRemessa').AsInteger,
                                         CdsDocumentos.Data,
                                         CdsPortadorForma.FieldByName('PathArquivoRem').AsString) Then
       Begin
          If Not CdsDocumentos.Active Then DtmPagEletronico.SqlDocumentos.Open;
          CdsDocumentosCalcFields;

          sDoc       :=  '';

          CdsDocumentos.First;
          While not CdsDocumentos.Eof Do Begin
            sDoc     := sDoc + CdsDocumentos.FieldByName('COdDocumento').AsString + ',';
            CdsDocumentos.Next;
          End;

          sDoc := Copy(sDoc,1,Length(sDoc)-1);

          If (sDoc <> '') Then
             If (Not AtualizaTabela( 'UPDATE DOCUMENTO SET EMISBLOQ = ''S'' WHERE CODDOCUMENTO IN (' + sDoc + ')')) Then
                Raise Exception.Create(MessageInfo);

          If sLostesSel <> '' Then
          Begin
             iCodLancFinanc := 0;
             For x:=0 To pDstList.Items.Count -1 Do
             Begin
               sNumChq := pDstList.Items[x];

               if pDstList.Items.Count > 1 then
               begin
                if trim(sHistFinanc) <> '' then  //pendência 22823 - 19/11/2007
                  sHistCompl := sHistFinanc
                else
                  sHistCompl := 'LOTES DIVERSOS';
                end;


               if RecPag = 'P' then
                  sSql       := ' SELECT  (''D'') as DEBCRE, '
               else
                  sSql       := ' SELECT  (''C'') as DEBCRE, ';

               sSql := sSql +  ' DOC.DATAPROGRAMADA,                               '+
                                     ' lote.codportforma ,            '+
                                     ' DOC.IDPESSOA,  pess.nome,                         '+
                                     ' DOC.DATAVENCTO,                                   '+
                                     ' DOC.NoDOCUMENTO,                                  '+
                                     ' DOC.COMPLDOCUMENTO,                               '+
                                     ' DOC.CODDOCUMENTO,                                 '+
                                     ' DOC.OPERACAO, LOTE.NUMLOTE,                       '+
                                     ' DOC.PLANO , DOC.PLACONTA,  DOC.CODCENTROCUSTO,    '+
                                     ' LOTE.CODLANCFINANC,                               '+
                                     ' LOTEX.VALOR,lote.numchqbordero,                   '+
                                     ' LOTEX.FLGBAIXA, LOTE.DATAEMISSAO, DOC.CODTIPDOC   '+
                                     ' FROM  ' +
                                     'DOCUMENTO DOC, ' +
                                     'PESSOA PESS, ' +
                                     'LOTEXDOCUM LOTEX , ' +
                                     'lotepagto lote' +
                                     ' WHERE LOTEX.NUMLOTE = '+ pDstList.Items[x] +' AND ' +
                                     '       DOC.IDPESSOA = '+FloattoStr( IdEmpresa) + ' AND '+
                                     '       DOC.RECPAG = ''' + RecPag +''''               + ' AND '+
                                     '       (LOTEX.FLGBAIXA = '' ''  OR LOTEX.FLGBAIXA IS NULL)     AND '+
                                     '       lote.numlote    = lotex.numlote                         and '+
                                     '       DOC.IDFORCLI = PESS.IDPESSOA                         AND '+
                                     '       LOTEX.CODDOCUMENTO = DOC.CODDOCUMENTO                    ';
               FazQuery( dtmBaseDados.Cds , sSql);

               If ( pRgEmisLoteItemIndex = 0) Or ( pDtEmisText = '') Then
                   sDataEmissao := dtmBaseDados.Cds.FieldByname('DATAEMISSAO').AsString
               Else
                   sDataEmissao := pDtEmisText;

               If ( CdsPortadorForma.FieldByName('LancaFinanc').AsString = 'S') Then
               Begin
                  if LancaFinanc(RecPag, IdEmpresa) <> 'N' then  // na baixa

                  //  Início - Rodolpho - P: 18498 - 28/01/2005
                  begin
                     try
                       with TCtrlDocumento.Create do
                       begin
                         initializeAs(self);
                         with TClientDataSet.Create(nil) do
                         begin
                           data := getDataPacket('SELECT LANCAFINANC, FLGFLOATDIAUTIL FROM PARAMCAP WHERE IDPESSOA = '+ FloatToStr(IdEmpresa) + ' AND RECPAG = ' + quotedStr(RecPag));

                           if fieldByName('LANCAFINANC').asString = 'S' then
                           begin
                             if (FRecPag = 'R') then
                             begin
                               DataFloat := strToDate(sDataEmissao) + cdsDocumentos.FieldByName('DMAIS').AsInteger;
                               //  Verifica se o flg que indica  que o Float só pode cair em dias
                               //úteis, está ativado e se estiver, ajusta a data do Float...
                               if (fieldByName('FLGFLOATDIAUTIL').asInteger = 1) then
                                  DataFloat := AjustaDataFloat(strToDate(sDataEmissao), cdsDocumentos.FieldByName('DMAIS').AsInteger, slCAR);
                             end //if
                             else begin
                               DataFloat := AjustaDataFloat(strToDate(sDataEmissao), cdsDocumentos.FieldByName('DMAIS').AsInteger, slCAP);
                             end; //else
                           end; //if
                           free;
                         end; //with
                         free;
                       end; //with
                       //fim - andre tavares - pendência 21352

                       if not  CtrlLancFinanc.FazerRateioCAPCAR( dtmBaseDados.Cds.Data,
                                                                 //Marcus Oliveira P. 25399 19/06/2007
                                                                 _CdsFlgStatusFinanc.fieldbyname('FLGSTATUSFINANC').Asstring ,
                                                                 sNumChq,
                                                                 RecPag,
                                                                 DataFloat,
                                                                 StrToInt( pDstList.Items[x]),
                                                                 CdsPortadorForma.FieldByName('CodPortForma').AsInteger,
                                                                 iCodLancFinanc, IdEmpresa, IdModulo, IdUsuario, PlanoConta,
                                                                 //Marcus Oliveira Pend. 25094 30/04/2007
                                                                 EstornoDocum, IntegraContabil,dDataDisp,0,
                                                                 sHistCompl
                                                                 ) Then Raise Exception.Create(CtrlLancFinanc.MessageInfo);
                     except
                       Raise Exception.Create('Erro ao Lançar no Financeiro' + #13 + MessageInfo);
                     end;
                  end;
                  //  Fim    - Rodolpho - P: 18498 - 28/01/2005

               End;

               // Cátia Azevedo - Pendência 21634 - 02/03/2005
               DtmPagEletronico.SqlDocumentos.SQL.Text := 'UPDATE LOTEPAGTO SET ' +
                                         ' FLAGEMISSAO = ''1'', ' +
                                         ' NUMCHQBORDERO = ' + sNumChq +', ' +
                                         ' DATAEMISSAO = TO_DATE('''+ sDataEmissao + ''',''DD/MM/YYYY'') ';
               If (CdsPortadorForma.FieldByName('LancaFinanc').AsString = 'S') and
                   ( Not Financeiro ) Then
                   DtmPagEletronico.SqlDocumentos.SQL.Text := DtmPagEletronico.SqlDocumentos.SQL.Text;
                   if iCodLancFinanc > 0 then
                      DtmPagEletronico.SqlDocumentos.SQL.Text := DtmPagEletronico.SqlDocumentos.SQL.Text +
                                            ',CODLANCFINANC = '+ FloatToStr(iCodLancFinanc) + ' ';
               DtmPagEletronico.SqlDocumentos.SQL.Text := DtmPagEletronico.SqlDocumentos.SQL.Text +
                                         ' WHERE NUMLOTE = ' + pDstList.Items[x];
               if not AtualizaTabela( DtmPagEletronico.SqlDocumentos.SQL.Text ) then Raise Exception.Create(MessageInfo);
             End;
          End;

          Commit;
          MessageInfo := 'Arquivo de Pagamento Eletrônico ' + CtrlIntBanco.NomeArquivoGerado + ' gerado com sucesso';

         //amf 05.07.2007 - destrói o objeto criado.
         _CdsFlgStatusFinanc.Free;

       End Else
          Raise Exception.Create(CtrlIntBanco.MessageInfo)
      Except
        On E : Exception Do Begin
          Rollback;
          MessageInfo := 'Não foi possível atualizar envio' + #13 + #10 +
                         E.Message;

         //amf 05.07.2007 - destrói o objeto criado.
         _CdsFlgStatusFinanc.Free;
         freeAndNil(CtrlIntBanco);
        End;
      End;
    End;
  End;
End;

Procedure TCtrlPagEletronico.sqlLoteDocOpen;
Begin
  DtmPagEletronico.sqlLoteDoc.Open;
End;

Procedure TCtrlPagEletronico.CdsDocumentosCalcFields;
Begin
  Inherited;
  CdsDocumentos.First;
  While ( Not CdsDocumentos.EOF ) Do Begin

    With DtmDadosBancarios Do Begin
      BuscaContaDoc( CdsDocumentos.FieldByName('CODDOCUMENTO' ).AsFloat);

      CdsDocumentos.Edit;
      CdsDocumentos.FieldByName('CONTACORRENTE' ).AsString      := ContaBancaria.Numero;
      CdsDocumentos.FieldByName('CODBANCOFAVORECIDO' ).AsString := ContaBancaria.Banco;
      CdsDocumentos.FieldByName('NUMAGENCIA' ).AsString         := ContaBancaria.Agencia;
      CdsDocumentos.FieldByName('NOMEAGENCIA' ).AsString        := ContaBancaria.Nomeagencia;
      CdsDocumentos.FieldByName('TIPOCONTA' ).AsString          := ContaBancaria.Tipo;
      CdsDocumentos.Post;
    End;
    CdsDocumentos.Next;
  End;
  CdsDocumentos.First;
End;

Function TCtrlPagEletronico.AtualizaTabela( pSql : String ) : Boolean;
Begin
  If ( ConnectionSide = cnsClient ) Then Begin
    Result := Connection.AppServer.AtualizaTabela( pSql );
    If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
  End Else Begin
    Result := ExecSql( pSql ) ;
  End;
End;

Function TCtrlPagEletronico.LancaFinanc(RecPAg: String;
  IdPessoa: double): String;
var
  _CdsLocal: TClientDataSet;
Begin
  _CdsLocal := TClientDataSet.Create(Nil);
  _CdsLocal.Data := _ParamCap.ListParamCAP( RecPag,StrToInt(FloatToStr(IdPessoa)));
  _CdsLocal.First;
  result := _CdsLocal.FieldByName('LANCAFINANC').AsString;
End;

procedure TCtrlPagEletronico.SetdDataDisp(const Value: TdateTime);
begin
  FdDataDisp := Value;
end;

End.











