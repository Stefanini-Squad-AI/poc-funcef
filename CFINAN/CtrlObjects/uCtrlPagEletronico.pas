Unit
  uCtrlPagEletronico;

Interface

Uses
  sysutils, uCmControlObject, uCmDbObject, DB, uDataBase, DbClient, Classes, StdCtrls,
  uCmTypes, uDtmPagEletronico, uMidasUtil, uCtrlIntBanco, uCtrlFinanc;

Type
  TCtrlPagEletronico = Class(TCmControlObject)
  Protected
    Procedure OnCreateAppServer; Override;
    Procedure AfterInitialize; Override;

  Private
    DTmPagEletronico : TDTmPagEletronico;
    CtrlLancFinanc   : TCtrlFinanc;

    sSQL             : String;

    //FCdsExcluidos     : TClientDataSet;
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

    procedure SetCdsAtualizaBarras(const Value: TClientDataSet);
    procedure SetCdsAux(const Value: TClientDataSet);
    procedure SetCdsDocumentos(const Value: TClientDataSet);
    procedure SetCdsLoteDoc(const Value: TClientDataSet);
    procedure SetCdsLotePagto(const Value: TClientDataSet);
    procedure SetCdsModelosCnab(const Value: TClientDataSet);
    procedure SetCdsPortadorForma(const Value: TClientDataSet);
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

    Procedure CdsDocumentosCalcFields;
    Procedure bbtnConfirmarClick( pbExibeBarras   : Boolean;
                                  pCmbModeloCnabText,
                                  pCmbModeloCnabLookupValue : String;
                                  pDstList : TlistBox;
                                  pRgEmisLoteItemIndex : Integer;
                                  pDtEmisText : String );
    Procedure sqlLoteDocOpen;

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
//************************************************
Constructor TCtrlPagEletronico.Create;
Begin
  Inherited;
End;
//************************************************
Destructor TCtrlPagEletronico.Destroy;
Begin

  If ( IsAppServer ) Then FreeCds( [ CdsLotePagto, CdsModelosCnab,   CdsLoteDoc,
                                     CdsAux,       CdsPortadorForma, CdsDocumentos,
                                     CdsAtualizaBarras ] );
  DTmPagEletronico.Free;
  CtrlIntBanco.Free;
  CtrlLancFinanc.Free;

  Inherited;
End;
//************************************************
Procedure TCtrlPagEletronico.AfterInitialize;
Begin
  Inherited;
  DtmPagEletronico := TDTmPagEletronico.Create( Nil );
  CtrlIntBanco     := TCtrlIntBanco.Create;
  CtrlLancFinanc   := TCtrlFinanc.Create( Idempresa, IdModulo, IdUsuario, UsaPlanoPatro );

  CtrlIntBanco.OpenTransaction   := False;
  CtrlLancFinanc.OpenTransaction := False;

  CtrlIntBanco.InitializeAs( Self );
  CtrlLancFinanc.InitializeAs( Self );

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
//************************************************
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
//************************************************
Procedure TCtrlPagEletronico.SetCdsAtualizaBarras( Const Value: TClientDataSet);
Begin
  FCdsAtualizaBarras := Value;
End;
//************************************************
Procedure TCtrlPagEletronico.SetCdsAux( Const Value: TClientDataSet);
Begin
  FCdsAux := Value;
End;
//************************************************
Procedure TCtrlPagEletronico.SetCdsDocumentos( Const Value: TClientDataSet);
Begin
  FCdsDocumentos := Value;
End;
//************************************************
Procedure TCtrlPagEletronico.SetCdsLoteDoc( Const Value: TClientDataSet);
Begin
  FCdsLoteDoc := Value;
End;
//************************************************
Procedure TCtrlPagEletronico.SetCdsLotePagto( Const Value: TClientDataSet);
Begin
  FCdsLotePagto := Value;
End;
//************************************************
Procedure TCtrlPagEletronico.SetCdsModelosCnab( Const Value: TClientDataSet);
Begin
  FCdsModelosCnab := Value;
End;
//************************************************
Procedure TCtrlPagEletronico.SetCdsPortadorForma( Const Value: TClientDataSet);
Begin
  FCdsPortadorForma := Value;
End;
//************************************************
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
              'SET CODBARRA = ' + QuotedStr(sCodigoBarra) + ', ' +
              '    CODBARRAVALOR = ' + QuotedStr(sLinhaDigitavel) +
              'WHERE (NUMLOTE = ' + sNumLote + ') AND ' +
              '      (CODDOCUMENTO = ' + sCODDOCUMENTO + ')';

      If Not ExecSQL(sSQL) Then Raise Exception.Create('Erro ao Alterar Código de Barras');
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
//************************************************
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
//************************************************
Procedure TCtrlPagEletronico.MontaQueryBoletos( pbExibeBarras   : Boolean;
                                                pCmbModeloCnabText,
                                                pCmbModeloCnabLookupValue : String;
                                                pDstList : TListBox;
                                                pPrefixoServidor : String );
Begin
  With DtmPageletronico.sqlLotePagto.SQL Do Begin

    Clear;
    {
    Append('SELECT DISTINCT                                                  ');
    Append('  LOTEPAGTO.NUMLOTE,LOTEPAGTO.CODPORTFORMA,                      ');
    Append('  PORTADORFORMA.CODFORMAPAGTO, PORTADORFORMA.CODTIPOPAGTO,       ');
    Append('  PORTADORFORMA.FLGEMITEAVISO, PORTADORFORMA.CODARQUIVOREMESSA   ');
    Append('FROM                                                             ');
    Append('  LOTEPAGTO,                                                     ');
    Append('  LOTEXDOCUM LOTEX,                                              ');
    Append('  DOCUMENTO DOC,                                                 ');
    Append('  PESSOA PESS,                                                   ');
    Append('  PARAMCAP PAR,                                                  ');
    Append('  PORTADORFORMA,                                                 ');
    Append(' (SELECT COUNT(*) AS TOTDOCUM, NUMLOTE                           ');
    Append('  FROM LOTEXDOCUM LD,                                            ');
    Append('       DOCUMENTO D                                               ');
    Append('  WHERE                                                          ');
    Append('    D.RECPAG = '+ QuotedStr( RecPag ) + ' AND          ');
    Append('    ((LD.FLGBAIXA  IN (''N'',''R'')) OR (LD.FLGBAIXA IS NULL )) AND');
    Append('    LD.CODDOCUMENTO = D.CODDOCUMENTO                             ');
    Append('  GROUP BY NUMLOTE) TOTDOCUM,                                    ');
    Append(' (SELECT COUNT(*) AS TOTDOCUM, NUMLOTE                           ');
    Append('  FROM LOTEXDOCUM LD, DOCUMENTO D                                ');
    Append('  WHERE                                                          ');
    Append('    D.RECPAG = ' + QuotedStr( RecPag ) + ' AND         ');
    Append('    ((LD.FLGBAIXA  IN (''N'',''R''))  OR (LD.FLGBAIXA IS NULL)) AND');
    Append('    LD.CODDOCUMENTO = D.CODDOCUMENTO  AND                        ');
    Append('    D.CODTIPDOC IN (SELECT CODTIPDOC                             ');
    Append('                    FROM TIPODOCRECPAG a                         ');
    Append('                    WHERE a.RECPAG = ' + QuotedStr( RecPag ) );
    Append('                          AND NOT EXISTS                         ');
    Append('                              (SELECT 1 FROM USUARIOxTPDOCTO B   ');
    Append('                               WHERE RECPAG = ' + QuotedStr( RecPag));
    Append('                                     AND B.IDUSUARIO = ' + FloatToStr( IdUsuario ) );
    Append('                    UNION                                        ');
    Append('                    SELECT CODTIPDOC  FROM TIPODOCRECPAG a       ');
    Append('                    WHERE a.RECPAG = ' + QuotedStr( RecPag ) );
    Append('                          AND EXISTS                             ');
    Append('                         (SELECT 1 FROM USUARIOxTPDOCTO b        ');
    Append('                          WHERE RECPAG = ' + QuotedStr( RecPag ) );
    Append('                                AND A.CODTIPDOC = B.CODTIPDOC    ');
    Append('                                AND B.IDUSUARIO = ' + FloatToStr( IDUsuario )+'))');
    Append('  GROUP BY NUMLOTE TOTLOTE                                      ');
    Append('WHERE                                                            ');
    Append('  (FLAGEMISSAO IS NULL OR  FLAGEMISSAO = ''0'') AND              ');
    Append('  (FLAGCANCEL IS NULL OR FLAGCANCEL = ''0'') AND                 ');
    Append('   TOTLOTE.TOTDOCUM = TOTDOCUM.TOTDOCUM AND                      ');
    Append('   TOTLOTE.NUMLOTE = TOTDOCUM.NUMLOTE AND                        ');
    Append('   TOTLOTE.NUMLOTE = LOTEPAGTO.NUMLOTE AND                       ');
    Append('  (LOTEPAGTO.IDPESSOA = ' + FloatToStr( IDEmpresa ) + ') AND ');
    Append('  (DOC.RECPAG = '+ QuotedStr( RecPag ) + ') AND   ');
    Append('  (PORTADORFORMA.CODARQUIVOREMESSA = ' + pCmbModeloCnabLookupValue + ') ');
    If CtrlIntBanco.ObrigaTipoPagto( CtrlIntBanco.IndiceDoBanco ) Then
      Append(' AND (PORTADORFORMA.CODTIPOPAGTO IS NOT NULL) ');
    If CtrlIntBanco.ObrigaFormaPagto( CtrlIntBanco.IndiceDoBanco ) Then
      Append(' AND (PORTADORFORMA.CODFORMAPAGTO IS NOT NULL) ');

    Append('   AND (LOTEPAGTO.CODPORTFORMA = PORTADORFORMA.CODPORTFORMA) AND ');
    Append('  (LOTEPAGTO.NUMLOTE  = LOTEX.NUMLOTE)    AND                    ');
    Append('  (LOTEX.CODDOCUMENTO = DOC.CODDOCUMENTO) AND                    ');
    Append('  (Par.IDPESSOA = LOTEPAGTO.IDPESSOA)     AND                    ');
    Append('  (pess.idpessoa = LOTEPAGTO.idpessoa)                           ');
    Append('ORDER BY NUMLOTE                                                 ');
    }
    Append('SELECT DISTINCT' );
    Append('  LOTEPAGTO.NUMLOTE,           LOTEPAGTO.CODPORTFORMA,' );
    Append('  PORTADORFORMA.CODFORMAPAGTO, PORTADORFORMA.CODTIPOPAGTO,' );
    Append('  PORTADORFORMA.FLGEMITEAVISO, PORTADORFORMA.CODARQUIVOREMESSA' );
    Append('FROM' );
    Append('  ' + pPrefixoServidor + 'LotePagto,' );
    Append('  ' + pPrefixoServidor + 'LOTEXDOCUM LOTEX,' );
    Append('  ' + pPrefixoServidor + 'DOCUMENTO DOC,' );
    Append('  ' + pPrefixoServidor + 'PESSOA PESS,' );
    Append('  ' + pPrefixoServidor + 'PARAMCAP PAR,' );
    Append('  ' + pPrefixoServidor + ' PortadorForma,' );
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
//************************************************
Procedure TCtrlPagEletronico.bbtnConfirmarClick( pbExibeBarras   : Boolean;
                                                 pCmbModeloCnabText,
                                                 pCmbModeloCnabLookupValue : String;
                                                 pDstList : TlistBox;
                                                 pRgEmisLoteItemIndex : Integer;
                                                 pDtEmisText : String );
Var
  x : Integer;
  iCodLancFinanc : Double;
  sNumChq, sDoc, sDataEmissao: String;
Begin
  With DtmPagEletronico.sqlLoteDoc.SQL Do Begin
    Clear;
    Append('SELECT                                                                     ');
    Append('  L.NUMLOTE,                                                               ');
    Append('  D.NODOCUMENTO,                                                           ');
    Append('  L.VALOR,                                                                 ');
    Append('  L.CODDOCUMENTO,                                                          ');
    Append('  L.CODBARRA,                                                              ');
    Append('  L.CODBARRAVALOR,                                                         ');
    Append('  LP.CODPORTFORMA                                                          ');
    Append('FROM                                                                       ');
    Append('  DOCUMENTO D,                                                             ');
    Append('  LOTEXDOCUM  L,                                                           ');
    Append('  PORTADORFORMA P,                                                         ');
    Append('  LOTEPAGTO LP                                                             ');
    Append('WHERE                                                                      ');
    Append('  (L.NUMLOTE IN ('+ sLostesSel +'))  AND                                   ');
    Append('  (D.RECPAG = ''' + RecPag + ''' ) AND                         ');
    Append('  (P.CODFORMAPAGTO IN (' + CtrlIntBanco.CodigosBarra + ') Or P.CODARQUIVOREMESSA IN (' + CtrlIntBanco.ModeloCodigoBarra + '))  AND');
    Append('  ((L.CODBARRA IS NULL)              AND                                   ');
    Append('  (L.CODBARRAVALOR IS NULL))         AND                                   ');
    Append('  (LP.NUMLOTE = L.NUMLOTE)           AND                                   ');
    Append('  (LP.CODPORTFORMA = P.CODPORTFORMA) AND                                   ');
    Append('  (D.CODDOCUMENTO = L.CODDOCUMENTO)                                        ');
    Append('ORDER BY D.NODOCUMENTO                                                     ');
  end;
  DtmPagEletronico.sqlLoteDoc.Open;
  // -------------------------
  If pbExibeBarras And not CdsLoteDoc.IsEmpty Then Begin
    //PnlCodigodeBarras.Visible := True;
    //EdtBarras.Text            := cdsLoteDoc.FieldByName('CODBARRA').AsString;
    //EdtRepBarras.Text         := cdsLoteDoc.FieldByName('CODBARRAVALOR').AsString;
    //EdtBarras.SetFocus;
    Exit;
  end;

  //frmAguarde.Max := 100;
  //frmAguarde.Min := 0;

  //frmAguarde.Mostra('Verificando Dados...');

  //pbExibeBarras := True;

  //frmAguarde.Pos := 5;

// -----------------------------------------------------------------------------
  If cdsAux.Active Then cdsAux.Close;
  DtmPagEletronico.sqlAux.SQL.Text := 'SELECT CODPORTFORMA FROM LOTEPAGTO WHERE (NUMLOTE IN ('+ sLostesSel +'))';
  DtmPagEletronico.sqlAux.Open;
// -----------------------------------------------------------------------------
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
  // -----------------------------------------------------------------------------
  if CtrlIntBanco.VerficaDadosEmpresa('P', cdsPortadorForma.FieldByName('CODPORTFORMA').AsInteger) then
  begin
    if cdsDocumentos.Active Then cdsDocumentos.Close;
     //frmAguarde.Pos := 10;
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
      Append('  D.VALORDESCONTO,                                               ');
      Append('  D.VALORJUROS,                                                  ');
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
      Append('  PC.IDBANCO,                                                    ');
      Append('  PC.NOCONTACORR,                                                ');
      Append('  TD.DEBCRE,                                                     ');
      Append('  ''                         '' as livre                         ');
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
      Append('  MOEDA M                                                        ');
      Append('WHERE                                                            ');
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
      Append('  (LXD.CODDOCUMENTO = D.CODDOCUMENTO) AND                        ');
      Append('  (PCAP.IDPESSOA = LP.IDPESSOA) AND                              ');
      Append('  (D.IDFORCLI = P.IDPESSOA) AND                                  ');
      Append('  (D.CODTIPDOC = TD.CODTIPDOC) AND                               ');
      Append('  (PF.CODPORTADOR = PC.CODPORTADOR) AND                          ');
      Append('  (E.IDPESSOA(+) = P.IDPESSOA) AND                               ');
      Append('  (E.IDENDERECO(+) = P.IDENDCOBRANCA ) AND                       ');
      Append('  (E.IDCIDADES = CID.IDCIDADES(+)) AND                           ');
      Append('  (ES.IDESTADO(+) = CID.IDESTADO)                                ');
      Append('ORDER BY PF.CODTIPOPAGTO, PF.CODFORMAPAGTO                       ');
    end;
    DtmPagEletronico.sqlDocumentos.Open;
    // -----------------------------------------------------------------------------
    //frmAguarde.Pos := 15;
    If Not CtrlIntBanco.ValidaRemessa('P',cdsDocumentos.Data,False) Then Begin
      //If frmAguarde.Visible Then frmAguarde.Apaga;
      cdsDocumentos.Close;
    End Else Begin
     //frmAguarde.Apaga;
     //Inicio do Pagamento
     Try
       StartTransaction;

       If CtrlIntBanco.MontaPagamentoEletronico( CdsModelosCnab.FieldByName('IDMODELOSCNAB' ).AsInteger,
                                         CdsPortadorForma.FieldByName('ControleRemessa').AsInteger,
                                         CdsDocumentos.Data,
                                         CdsPortadorForma.FieldByName('PathArquivoRem').AsString) Then
       Begin
          If Not CdsDocumentos.Active Then DtmPagEletronico.SqlDocumentos.Open;

          sDoc       :=  '';

          CdsDocumentos.First;
          While not CdsDocumentos.Eof Do Begin
            sDoc     := sDoc + CdsDocumentos.FieldByName('COdDocumento').AsString + ',';
            CdsDocumentos.Next;
          End;

          sDoc := Copy(sDoc,1,Length(sDoc)-1);

          If (sDoc <> '') Then
             If (Not FazQuery(CdsDocumentos,'UPDATE DOCUMENTO SET ' +
                                'EMISBLOQ = ''S'' WHERE CODDOCUMENTO IN (' + sDoc + ')')) Then Abort;

          If sLostesSel <> '' Then
          Begin
             iCodLancFinanc := 0;
             For x:=0 To pDstList.Items.Count -1 Do
             Begin
               sNumChq := pDstList.Items[x];

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
                   sDataEmissao := dtmBaseDados.Qry.FieldByname('DATAEMISSAO').AsString
               Else
                   sDataEmissao := pDtEmisText;

               If ( CdsPortadorForma.FieldByName('LancaFinanc').AsString = 'S') And
                  ( Not Financeiro ) Then Begin
                  CtrlLancFinanc.FazerRateioCAPCAR( dtmBaseDados.Cds.Data, 'C',
                                                    sNumChq,
                                                    RecPag,
                                                    StrToDate( sDataEmissao ),
                                                    StrToInt( pDstList.Items[x]),
                                                    CdsPortadorForma.FieldByName('CodPortForma').AsInteger,
                                                    iCodLancFinanc, IdEmpresa, IdModulo, IdUsuario, PlanoConta,
                                                    EstornoDocum, IntegraContabil );
                  If iCodLancFinanc = -1 Then Abort;
               End;

               CdsDocumentos.Close;
               DtmPagEletronico.SqlDocumentos.SQL.Text := 'UPDATE LOTEPAGTO SET ' +
                                         ' FLAGEMISSAO = ''1'', ' +
                                         ' NUMCHQBORDERO = ' + sNumChq +', ' +
                                         ' DATAEMISSAO = TO_DATE('''+ sDataEmissao + ''',''DD/MM/YYYY'') ';
               If (CdsPortadorForma.FieldByName('LancaFinanc').AsString = 'S') and
                   ( Not Financeiro ) Then
                   DtmPagEletronico.SqlDocumentos.SQL.Text := DtmPagEletronico.SqlDocumentos.SQL.Text +
                                            ',CODLANCFINANC = '+ FloatToStr(iCodLancFinanc) + ' ';
               DtmPagEletronico.SqlDocumentos.SQL.Text := DtmPagEletronico.SqlDocumentos.SQL.Text +
                                         ' WHERE NUMLOTE = ' + pDstList.Items[x];
               ExecSql( DtmPagEletronico.SqlDocumentos.SQL.Text );
             End;
          End;

          Commit;
          MessageInfo := 'Arquivo de Pagamento Eletrônico ' + CtrlIntBanco.NomeArquivoGerado + ' gerado com sucesso';
       End Else
          Abort;
      Except
        On E : Exception Do Begin
          Rollback;
          MessageInfo := 'Não foi possível atualizar envio' + #13 + #10 +
                         E.Message;
        End;
      End;
    End;
  End;
End;
//************************************************
Procedure TCtrlPagEletronico.sqlLoteDocOpen;
Begin
  DtmPagEletronico.sqlLoteDoc.Open;
End;
//************************************************
Procedure TCtrlPagEletronico.CdsDocumentosCalcFields;
Begin
  Inherited;
  {
  With DtmDadosBancarios Do
  Begin
     BuscaContaDoc(QryDocumentosCODDOCUMENTO.AsFloat);
     CdsDocumentosCONTACORRENTE.AsString := ContaBancaria.Numero;
     CdsDocumentosCODBANCOFAVORECIDO.AsString := ContaBancaria.Banco;
     CdsDocumentosNUMAGENCIA.AsString := ContaBancaria.Agencia;
     CdsDocumentosNOMEAGENCIA.AsString := ContaBancaria.Nomeagencia;
     CdsDocumentosTIPOCONTA.AsString := ContaBancaria.Tipo;
  End;
  }
end;
//************************************************



End.
