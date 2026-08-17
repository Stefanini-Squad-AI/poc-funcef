Unit uCtrlRelatoriosCAPCAR;

Interface

Uses sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase,
  DbClient, uCMTypes;

Type
  TCtrlRelatoriosCAPCAR = Class(TCmControlObject)
  protected
  private
  public
    Constructor Create; override;
    Destructor Destroy; override;
    Function SetNumSlip(sDocs: String): Boolean;
    Function SetNumSlipLoop(oDocs: OleVariant): Boolean;
    Function SetNumSlipNumLote(oNumLote: OleVariant): Boolean;          
    Function SetSEQAPGR(iDoc: Integer; sNumFatura: String; Var iCodApGr: Integer): Boolean;
    Function PegaSEQAPGR: integer;
    Function PegaSEQCPBAIXA: integer;
    Function SetApGr(sNumChqBord, RecPag, sNumApGr: String): Boolean;
    Function SetCpBaixa(sNumChqBord, RecPag, sNumApGr: String): Boolean;
    Function AtuaOrdemPgtoNova( Const pCdsOrdemPago : OleVariant ) : OleVariant;

    // Rodolpho da Silva - P: 24143 - 18/05/2007
    function ListaLogoEmpresa(iIdPessoa: integer): OleVariant;
    function ListaValoresxCCusto(dDataIni,dDataFim: Tdatetime; iIdPessoa, iIdUsuario, iIdFornecedor, iStatusDoc: integer; cRecPag: Char; sCodCentCusto: string): OleVariant;

  End;

Implementation                               

{ TCtrlAlteraVenc }

Function TCtrlRelatoriosCAPCAR.SetNumSlip(sDocs: String): Boolean;
Begin
  If ConnectionSide = cnsClient Then
  Begin
    Result := Connection.AppServer.SetNumSlip(sDocs);
    If Not Result Then
      MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
  Begin
    Result := True;
    Try
      StartTransacao;
      ExecSQL('UPDATE DOCUMENTO SET NUMSLIP = ' +
        FloatToStr(GetSequence('SLIPDOCUMENTO')) +
        ' WHERE CODDOCUMENTO IN (' + sDocs + ')');
      Commit;
    Except
      On E: Exception Do
      Begin
        Rollback;
        Result := False;
        MessageInfo := E.Message;
      End;
    End;
  End;
End;

Constructor TCtrlRelatoriosCAPCAR.Create;
Begin
  Inherited;

End;

Destructor TCtrlRelatoriosCAPCAR.Destroy;
Begin
  Inherited;

End;

Function TCtrlRelatoriosCAPCAR.SetNumSlipLoop(oDocs: OleVariant): Boolean;
Var
  _CdsDoc: TClientDataSet;
Begin
  If ConnectionSide = cnsClient Then
  Begin
    Result := Connection.AppServer.SetNumSlipLoop(oDocs);
    If Not Result Then
      MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
  Begin
    Result := True;
    Try
      _CdsDoc := TClientDataSet.Create(Nil);
      _CdsDoc.data := oDocs;
      StartTransacao;
      While Not _CdsDoc.eof Do
      Begin
        ExecSQL('UPDATE DOCUMENTO SET NUMSLIP = ' +
          FloatToStr(GetSequence('SLIPDOCUMENTO')) +
          ' WHERE CODDOCUMENTO = (' + _CdsDoc.Fields[0].AsString + ')');
        _CdsDoc.Next;
      End;
      Commit;
      _CdsDoc.Free;
    Except
      On E: Exception Do
      Begin
        Rollback;
        Result := False;
        _CdsDoc.Free;
        MessageInfo := E.Message;
      End;
    End;
  End;
End;

Function TCtrlRelatoriosCAPCAR.SetNumSlipNumLote(
  oNumLote: OleVariant): Boolean;
Var
  sNumSlip: String;
  _CdsNumLote: TClientDataSet;
Begin
  If ConnectionSide = cnsClient Then
  Begin
    Result := Connection.AppServer.SetNumSlipNumLote(oNumLote);
    If Not Result Then
      MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
  Begin
    Result := True;
    Try
      _CdsNumLote := TClientDataSet.Create(Nil);
      _CdsNumLote.data := oNumLote;
      _CdsNumLote.First;
      StartTransaction;
      While Not _CdsNumLote.eof Do
      Begin
        sNumSlip := FloatToStr(GetSequence('SLIPDOCUMENTO'));
        ExecSQL('UPDATE DOCUMENTO ' +
          'SET NUMSLIP = ''' + sNumSlip + ''' ' +
          'WHERE CODDOCUMENTO IN ' +
          '(SELECT CODDOCUMENTO FROM LOTEXDOCUM ' +
          'WHERE NUMLOTE = (' + _CdsNumLote.Fields[0].AsString + '))' + ' AND ' +
          'NUMSLIP IS NULL');
        ExecSQL('UPDATE LOTEPAGTO SET NUMSLIP = ''' + sNumSlip + ''' ' +
          'WHERE NUMLOTE = ' + _CdsNumLote.Fields[0].AsString + ' AND ' +
          'NUMSLIP IS NULL');
        _CdsNumLote.Next;
      End;
      _CdsNumLote.Free;
      Commit;
    Except
      On E: Exception Do
      Begin
        Rollback;
        Result := False;
        _CdsNumLote.Free;
        MessageInfo := E.Message;
      End;
    End;
  End;
End;

Function TCtrlRelatoriosCAPCAR.SetSEQAPGR(iDoc: Integer; sNumFatura: String; Var iCodApGr: Integer): Boolean;
Var
  vNumApGr: Integer;
Begin
  If ConnectionSide = cnsClient Then
  Begin
    Result := Connection.AppServer.SetSEQAPGR(iDoc, sNumFatura, iCodApGr);
    If Not Result Then
      MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
  Begin
    Result := True;
    Try
      StartTransaction;
      vNumApGr := GetSequence('SEQAPGR');
      iCodApGr := vNumApGr;
      ExecSQL('update documento set numapgr = ' + FloatToStr(vNumApGR) +
        ' WHERE CODDOCUMENTO = ' + IntToStr(iDoc));
      If Trim(sNumFatura) <> '' Then
        ExecSQL('update documento set numapgr = ' + FloatToStr(vNumApGR) +
          ' where numfatura = ' + sNumFatura + ' and operacao = ''1 ''');
      Commit;
    Except
      On E: Exception Do
      Begin
        Rollback;
        Result := False;
        MessageInfo := E.Message;
      End;
    End;
  End;
End;

Function TCtrlRelatoriosCAPCAR.PegaSEQAPGR: integer;
Begin
    Result := GetSequence('SEQAPGR');
End;

Function TCtrlRelatoriosCAPCAR.PegaSEQCPBAIXA: integer;
Begin
    Result := GetSequence('SEQCPBAIXA');
End;

Function TCtrlRelatoriosCAPCAR.SetApGr(sNumChqBord, RecPag, sNumApGr: String): Boolean;
Begin
  If ConnectionSide = cnsClient Then
  Begin
    Result := Connection.AppServer.SetApGr(sNumChqBord, RecPag, sNumApGr);
    If Not Result Then
      MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
  Begin
    Result := True;
    Try
      StartTransacao;
      ExecSQL('UPDATE DOCUMENTO D SET D.NUMAPGR = ' + sNumApGr +
        ' WHERE (D.RECPAG = ''' + RECPAG + ''') AND   ' +
        '       (D.NUMAPGR IS NULL OR D.NUMAPGR = 0) AND  ' +
        '       (D.CODDOCUMENTO in ' +
        '             (SELECT R.CODDOCUMENTO  ' +
        '              FROM RECBTOPAGTO R     ' +
        '              WHERE (LTRIM(RTRIM(R.NUMCHQBORDERO)) = ''' + sNumChqBord + ''')) ) ');
      Commit;
    Except
      On E: Exception Do
      Begin
        Rollback;
        Result := False;
        MessageInfo := E.Message;
      End;
    End;
  End;
End;

Function TCtrlRelatoriosCAPCAR.SetCpBaixa(sNumChqBord, RecPag, sNumApGr: String): Boolean;
Begin
  If ConnectionSide = cnsClient Then
  Begin
    Result := Connection.AppServer.SetCpBaixa(sNumChqBord, RecPag, sNumApGr);
    If Not Result Then
      MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
  Begin
    Result := True;
    Try
      StartTransacao;
      ExecSQL('UPDATE DOCUMENTO D SET D.numcpbaixa = ' + sNumApGr +
        ' WHERE (D.RECPAG = ''' + RECPAG + ''') AND   ' +
        '       (D.numcpbaixa IS NULL OR D.numcpbaixa = 0) AND  ' +
        '       (D.CODDOCUMENTO in ' +
        '             (SELECT R.CODDOCUMENTO  ' +
        '              FROM RECBTOPAGTO R     ' +
        '              WHERE (LTRIM(RTRIM(R.NUMCHQBORDERO)) = ''' + sNumChqBord + ''')) ) ');
      Commit;
    Except
      On E: Exception Do
      Begin
        Rollback;
        Result := False;
        MessageInfo := E.Message;
      End;
    End;
  End;
End;

Function TCtrlRelatoriosCAPCAR.AtuaOrdemPgtoNova( Const pCdsOrdemPago : OleVariant): OleVariant;
Var
  iNumLote : Double;
  sNumSlip : String;
  CdsOrdemPago : TClientDataSet;
Begin
  If ConnectionSide = cnsClient Then Begin

    Result := Connection.AppServer.AtuaOrdemPgtoNova( pCdsOrdemPago );
    MessageInfo := Connection.AppServer.MessageInfo;
  End Else Begin

    CdsOrdemPago := TClientDataSet.Create( Nil );
    CdsOrdemPago.Data := pCdsOrdemPago;
    Try
      StartTransaction;
      iNumLote := -1;
      sNumSlip:='';
      CdsOrdemPago.First;
      While Not CdsOrdemPago.Eof Do Begin
        If CdsOrdemPago.FieldByName('NUMSLIP').isNull then begin
          If (CdsOrdemPago.FieldByName('NUMLOTE').AsFloat <> iNumLote) then begin

            sNumSlip := FloatToStr( GetSequence( 'SLIPDOCUMENTO' ) );
            If Not ExecSql('UPDATE DOCUMENTO ' +
                        'SET NUMSLIP = ''' + sNumSlip + ''' ' +
                        'WHERE CODDOCUMENTO IN ' +
                        '(SELECT CODDOCUMENTO FROM LOTEXDOCUM ' +
                        'WHERE NUMLOTE = (' + CdsOrdemPago.FieldByName('NUMLOTE').AsString + '))' + ' AND ' +
                        'NUMSLIP IS NULL') Then Abort;
            If Not ExecSql('UPDATE LOTEPAGTO SET NUMSLIP = ''' + sNumSlip + ''' ' +
                 'WHERE NUMLOTE = ' + CdsOrdemPago.FieldByName('NUMLOTE').AsString + ' AND ' +
                 'NUMSLIP IS NULL') Then Abort;
            iNumLote := CdsOrdemPago.FieldByName('NUMLOTE').AsFloat;
          End;
          CdsOrdemPago.Edit;
          CdsOrdemPago.FieldByName('NUMSLIP').AsString := sNumSlip;
          CdsOrdemPago.Post;
        End;
        CdsOrdemPago.Next;
      End;
      CdsOrdemPago.First;
      Commit;
      MessageInfo := 'Dados atualizados';
    Except
      On E : Exception Do Begin
        RollBack;
        CdsOrdemPago.EmptyDataSet;
        CdsOrdemPago.Free;
        MessageInfo := 'Não foi possível atualizar a tabela' + #13 + #10 + E.Message;
      End;
    End;
    Result := CdsOrdemPago.Data;
    CdsOrdemPago.Free;
  End;
End;



function TCtrlRelatoriosCAPCAR.ListaLogoEmpresa(iIdPessoa: integer): OleVariant;
begin
   Result := GetDataPacket('select ' +
                           '   i.imagem ' +
                           'from ' +
                           '   imagens i, ' +
                           '   pessoa p ' +
                           'where ' +
                           '  (p.idimagem = i.idimagem) and ' +
                           '  (p.idpessoa = ' + IntToStr(iIdPessoa)+ ') ');
end;




function TCtrlRelatoriosCAPCAR.ListaValoresxCCusto(dDataIni,dDataFim: Tdatetime; iIdPessoa, iIdUsuario, iIdFornecedor, iStatusDoc: integer;
                                                   cRecPag: Char; sCodCentCusto: string): OleVariant;
var
  sSQL: string;
begin
  sSQL := ' SELECT ' +
          '    CC.CODEXTERNO, ' +
          '    DECODE(TRIM(CC.CODEXTERNO),'''',''000 - Centro de custo não informado'',TRIM(CC.CODEXTERNO) || '' - '' || CC.NOME) AS CENTCUST, ' +
          '    L.DATALANCTO, ';

          if iStatusDoc = 0 then
             sSQL := sSQL + '    ''   '' AS PORTFORMA, ' +
                            '    ''   '' AS NUMCHQBORDERO, '
          else
             sSQL := sSQL + '    PF.DESCRICAO AS PORTFORMA, ' +
                            '    RP.NUMCHQBORDERO, ';

          sSQL := sSQL +
          '    DECODE(D.COMPLDOCUMENTO,'''',TRIM(TO_CHAR(D.NODOCUMENTO)), ' +
          '                                 TRIM(TO_CHAR(D.NODOCUMENTO)) || '' - '' || D.COMPLDOCUMENTO) AS DOCCOMPL, ' +
          '    P.RAZAOSOCIAL, ' +
          '    P.IDPESSOA, ' +
          '    L.HISTORICOCOMPL, ' +
          '    VLRDOCORIG.VALOR, ' +

          //DAVID - Pendência 25623
          '    R.VALOR as VALORRATEIO, ' +

          '    CBA.NUMBANCO, ' +
          '    CBA.NUMAGENCIA, ' +
          '    CBA.CONTACORRENTE ' +

          ' FROM ' +
          '    PESSOA P, ' +
          '    DOCUMENTO D, ' +
          '    LANCTODOCUM L, ' +
          '    RATEIODOCUM R, ';


          if iStatusDoc = 1 then
             sSQL := sSQL + '    PORTADORFORMA PF, ' +
                            '    RECBTOPAGTO RP, ';

          sSQL := sSQL +
          '    CENTCUST CC, ' +
          '   (SELECT LANC.VALOR, DOC.CODDOCUMENTO ' +
          '    FROM DOCUMENTO DOC, ' +
          '         LANCTODOCUM LANC ' +
          '    WHERE LANC.CODDOCUMENTO = DOC.CODDOCUMENTO AND ' +
          '          LANC.OPERACAO IN (''1'',''2'',''3'',''10'',''11'')) VLRDOCORIG, ' +

          '   (SELECT  CB.IDPESSOA, CB.IDCBANCARIA,CB.CONTACORRENTE, ' +
          '            CB.IDAGENCIA, AGE.IDBANCO, AGE.NUMAGENCIA, BAN.NUMBANCO ' +
          '    FROM CONTABANCARIA CB, AGENCIABANCARIA AGE, BANCO BAN ' +
          '    WHERE CB.FLGCONTAPREF = 1 AND ' +
          '          CB.IDAGENCIA    = AGE.IDPESSOA AND ' +
          '          AGE.IDBANCO     = BAN.IDPESSOA) CBA ' +

          ' WHERE ' +
          '    (D.IDPESSOA = ' + InttoStr(iIdPessoa) + ') AND ';

          // 0-Em aberto; 1-Baixado
          case iStatusDoc of
             0: sSQL := sSQL + '    (L.OPERACAO IN (''1'',''2'',''3'',''11'',''12'')) AND ';
             1: sSQL := sSQL + '    (L.OPERACAO IN (''5'',''10'',''15'')) AND ' +
                               '    (RP.CODPORTFORMA     = PF.CODPORTFORMA) AND ';
          end;

          if iIdFornecedor <> 0 then
             sSQL := sSQL + '    (D.IDFORCLI = ' + IntToStr(iIdFornecedor) + ') AND ';

          if Trim(sCodCentCusto) <> '' then
             sSQL := sSQL + '    (TRIM(R.CODCENTROCUSTO) = ' + QuotedStr(sCodCentCusto) + ') AND ';

          if dDataIni <> 0 then
             sSQL := sSQL + '    (L.DATALANCTO >= TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy',dDataIni)) + ',''DD/MM/YYYY''))  AND ';

          if dDataFim <> 0 then
             sSQL := sSQL + '    (L.DATALANCTO <= TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy',dDataFim)) + ',''DD/MM/YYYY''))  AND ';


          sSQL := sSQL +
          '    (D.RECPAG = ' + QuotedStr(cRecPag) + ')  AND ' +
          '    (EXISTS (SELECT CODTIPDOC ' +
          '             FROM USUARIOXTPDOCTO UXD ' +
          '             WHERE (UXD.RECPAG    = ' + QuotedStr(cRecPag) + ') AND ' +
          '                   (D.CODTIPDOC   = UXD.CODTIPDOC) AND ' +
          '                   (UXD.IDUSUARIO = ' + InttoStr(iIdUsuario) + '))) AND ' +
          '    (D.IDFORCLI        = P.IDPESSOA) AND ' +
          '    (L.ESTORNO IS NULL) AND ' +
          '    (D.CODDOCUMENTO          = L.CODDOCUMENTO) AND ' +
          '    (D.CODDOCUMENTO          = R.CODDOCUMENTO) AND ' +
          '    (VLRDOCORIG.CODDOCUMENTO = D.CODDOCUMENTO) AND ' +
          '    (D.IDFORCLI              = CBA.IDPESSOA(+)) AND ' +

          //DAVID - Pendência 25623
          '    (R.CODCENTROCUSTO        = CC.CODCENTROCUSTO(+))  AND ' +

          '    (R.IDPESSOA              = CC.IDEMPRESA(+)) ';

          if iStatusDoc = 1 then
             sSQL := sSQL + '    AND (L.CODDOCUMENTO = RP.CODDOCUMENTO)' +
                            '    AND (L.NUMLANCTO    = RP.NUMLANCTO) ';

          sSQL := sSQL +
          'GROUP BY ' +
          '   L.DATALANCTO,CC.NOME, ' +
          '   D.CODCENTROCUSTO,  ';

          if iStatusDoc = 1 then
             sSQL := sSQL + '   PF.DESCRICAO, ' +
                            '   RP.NUMCHQBORDERO, ';

          sSQL := sSQL +
          '   L.HISTORICOCOMPL, D.NODOCUMENTO, ' +
          '   D.COMPLDOCUMENTO, P.RAZAOSOCIAL, L.DEBCRE, ' +
          '   L.HISTORICOCOMPL, CC.CODEXTERNO, P.IDPESSOA, VLRDOCORIG.VALOR, ' +

          //DAVID - Pendência 25623
          '   R.VALOR, ' +

          '   CBA.CONTACORRENTE,CBA.NUMBANCO, CBA.NUMAGENCIA ' +

          'ORDER BY ' +
          '   CENTCUST, L.DATALANCTO, P.RAZAOSOCIAL ';



  Result := GetDataPacket(sSQL);
end;

End.

