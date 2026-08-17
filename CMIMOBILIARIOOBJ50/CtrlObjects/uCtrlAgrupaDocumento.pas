{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Rotina............: FormCreate
N. Sol.............: 92381
N. Kintana......: 394180
Data...............: 18/09/2008
Responsável...: Cássio Camargo
Descrição........: Inclusão do Control Object CtrlImobDocumento, com o
                     objetivo de internalizar funcionalidades.
--------------------------------------------------------------------------------
Padrão      : 5.10.17 em diante...
Pendência   : 27256
Responsável : Daniel Simões
Data        : 31/03/2008
Descrição   : Passa a limpar o vetor 'vMsgCnab' antes de carregá-lo pois estava
              "sujando" o processo ao agrupar o último documento...
--------------------------------------------------------------------------------
Pendência   : 26527
Responsável : Daniel Simões
Data        : 15/10/2007
Descrição   : Passa a agrupar ou não pela Mensagem de Boleto Padrão do Contrato.
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit uCtrlAgrupaDocumento;

interface

uses
  sysutils, uCmControlObject, uCmDbObject, DB, uDataBase, dbClient, provider, wwQuery,
  uCMClientDataSet, uCMTypes,  {uCtrlDocumento,} uCtrlMensagemBoleto, Classes, uSistema,
  //Cássio Camargo - 18/09/2008 - N. Sol 92381 -  N. Kintana 394180
  uCtrlImobDocumento;

type
  TListaReceita = Record
     Receita : String;
     Valor   : Extended;
  end;

  TCtrlAgrupaDocumento = class(TCmControlObject)
     protected
        procedure onCreateAppServer; override;
        procedure AfterInitialize; override;

     private
        //Cássio Camargo - 18/09/2008 - N. Sol 92381 -  N. Kintana 394180
        //CtrlDocumento      : TCtrlDocumento;
        CtrlImobDocumento  : TCtrlImobDocumento;
        CtrlMensagemBoleto : TCtrlMensagemBoleto;
        FcdsMensagens      : TCMClientDataSet;
        FcdsDocumentos     : TCMClientDataSet;
        FcdsDocAgrup       : TCMClientDataSet;
        vMsgCnab           : array[0..9] of string;
        // Daniel - 26527
        vCuringa           : array[0..9] of string;
        vValor             : array[0..9] of string;
        // Fim.
        aListaReceita      : array of TListaReceita;
        stLista            : TStringList;

        procedure SetcdsDocumentos(const Value: TCMClientDataSet);
        procedure SetcdsMensagens(const Value: TCMClientDataSet);
        procedure SetcdsDocAgrup(const Value: TCMClientDataSet);

        procedure AgrupaReceitas(sAnoMes : String);

     public
        constructor Create; override;
        destructor  Destroy; override;
                                                                            // Daniel - 26527
        function AgrupaDocumentos(const bAgrupa:Boolean; iMes,iAno:Integer; bUsaMsgContrato:Boolean=False) : Boolean;
        function LookupDocumentos(const iModulo       : Integer;
                                  const dDataIni      : TDateTime;
                                  const dDataFim      : TDateTime;
                                  const sEmisBlq      : String;
                                  const iCodPortForma : Integer;
                                  const iContrato     : Integer;
                                  const iLocatario    : Integer;
                                  const iResponsavel  : Integer) : OleVariant;
        function LookupMensagem : OleVariant;

        property cdsDocumentos : TCMClientDataSet read FcdsDocumentos write SetcdsDocumentos;
        property cdsMensagens  : TCMClientDataSet read FcdsMensagens write SetcdsMensagens;
        property cdsDocAgrup   : TCMClientDataSet read FcdsDocAgrup write SetcdsDocAgrup;
     end;

implementation

{ TCtrlAgrupaDocumento }

procedure TCtrlAgrupaDocumento.AfterInitialize;
begin
   inherited;
   CtrlMensagemBoleto.InitializeAs( Self );
   //Cássio Camargo - 18/09/2008 - N. Sol 92381 -  N. Kintana 394180
   //CtrlDocumento.InitializeAs( Self );
   CtrlImobDocumento.InitializeAs(Self);
end;



constructor TCtrlAgrupaDocumento.Create;
begin
   inherited;

   CtrlMensagemBoleto := TCtrlMensagemBoleto.Create(Sistema.IdEmpresa,
                                                    Sistema.IdModulo,
                                                    Sistema.IdUsuario,
                                                    Sistema.IdEspAcesso,
                                                    Sistema.UsaPlanoPatro);

   //CtrlDocumento      := TCtrlDocumento.Create;
   CtrlImobDocumento  := TCtrlImobDocumento.Create;
   FcdsMensagens      := TCMClientDataSet.Create(nil);
   FcdsDocumentos     := TCMClientDataSet.Create(nil);
   FcdsDocAgrup       := TCMClientDataSet.Create(nil);
   stLista            := TStringList.Create;
end;



destructor TCtrlAgrupaDocumento.Destroy;
begin
   FreeAndNil( FcdsMensagens );
   FreeAndNil( FcdsDocumentos );
   FreeAndNil( FcdsDocAgrup );

   FreeAndNil( CtrlMensagemBoleto );
   //Cássio Camargo - 18/09/2008 - N. Sol 92381 -  N. Kintana 394180
  // FreeAndNil( CtrlDocumento );
   FreeAndNil(CtrlImobDocumento); 
   stLista.Free;
   inherited;
end;



procedure TCtrlAgrupaDocumento.onCreateAppServer;
begin
   inherited;

end;



procedure TCtrlAgrupaDocumento.SetcdsDocumentos(const Value: TCMClientDataSet);
begin
   FcdsDocumentos := Value;
end;



procedure TCtrlAgrupaDocumento.SetcdsMensagens(const Value: TCMClientDataSet);
begin
   FcdsMensagens := Value;
end;



procedure TCtrlAgrupaDocumento.SetcdsDocAgrup(const Value: TCMClientDataSet);
begin
   FcdsDocAgrup := Value;
end;



function TCtrlAgrupaDocumento.LookupDocumentos(const iModulo            : Integer;
                                               const dDataIni, dDataFim : TDateTime;
                                               const sEmisBlq           : String;
                                               const iCodPortForma      : Integer;
                                               const iContrato          : Integer;
                                               const iLocatario         : Integer;
                                               const iResponsavel       : Integer) : OleVariant;
var
   sDataIni, sDataFim, sSQL : String;
begin
   sDataIni := 'TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy',dDataIni)) + ',''dd/mm/yyyy'')';
   sDataFim := 'TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy',dDataFim)) + ',''dd/mm/yyyy'')';

   if iModulo = 64 then
   begin
      sSQL :=
      'SELECT  /*+index(D,XIE5DOCUMENTO) */ DISTINCT '                                                        + #13 +
      '    C.IDLOCATARIO, '                                                                                   + #13 +
      '    C.IDMSGBOLETO, ' +#13+ // Daniel - 26527
      '    D.IDMODULO, '    +#13+ // Daniel - 26527
      '    L.IDCONTRATOIMOVEL, '                                                                              + #13 +
      '    D.CODDOCUMENTO, '                                                                                  + #13 +
      '    D.CODPORTFORMA, '                                                                                  + #13 +
      '    C.CONNUMERO, '                                                                                     + #13 +
      '    C.CONNOME, '                                                                                       + #13 +
      '    D.DATAPROGRAMADA AS DATAVENCIMENTO, '                                                              + #13 +
      '    DECODE(C.CONNUMERO, NULL, C.CONNOME, C.CONNUMERO||'' - ''||C.CONNOME) AS CONTRATO_EXTENSO, '       + #13 +
      '    T.DESCCUSTORECIMO, '                                                                               + #13 +
      '    LD.VALOR AS VALOR_LANC, '                                                                          + #13 +
      '    1 AS FLGAGRUPAR '                                                                                  + #13 +
      'FROM '                                                                                                 + #13 +
      '    DOCUMENTO D, '                                                                                     + #13 +
      '    LANCAMENTOSIMOVEL L, '                                                                             + #13 +
      '    CONTRATOIMOVEL C, '                                                                                + #13 +
      '    TIPOCUSTORECIMOV T, '                                                                              + #13 +
      '    ( '                                                                                                + #13 +
      '     SELECT '                                                                                          + #13 +
      '         L.CODDOCUMENTO, '                                                                             + #13 +
      '         SUM(DECODE(DEBCRE,''C'',VALOR*-1,VALOR)) AS VALOR '                                           + #13 +
      '     FROM '                                                                                            + #13 +
      '         DOCUMENTO D, '                                                                                + #13 +
      '         LANCTODOCUM L '                                                                               + #13 +
      '     WHERE '                                                                                           + #13 +
      '         L.CODDOCUMENTO    = D.CODDOCUMENTO '                                                          + #13 +
      '     AND NVL(D.STATUS,''0'') <> ''2'' '                                                                + #13 +
      '     AND D.IDMODULO        = 64 '                                                                      + #13 +
      '     AND D.DATAPROGRAMADA  BETWEEN ' + sDataIni + ' AND ' + sDataFim                                   + #13 +
      '     GROUP BY L.CODDOCUMENTO '                                                                         + #13 +
      '    ) LD '                                                                                             + #13 +
      'WHERE '                                                                                                + #13 +
      '    D.DATAPROGRAMADA  BETWEEN ' + sDataIni + ' AND ' + sDataFim                                        + #13;

      if iCodPortForma > 0 then
         sSQL := sSQL +
         'AND D.CODPORTFORMA      = ' + IntToStr(iCodPortForma)                                               + #13;

      if sEmisBlq = 'S' then
         sSQL := sSQL  +
         'AND NVL(D.EMISBLOQ,''N'') <> ''S'' '                                                                + #13;

      if iContrato > 0 then
         sSQL := sSQL  +
         'AND L.IDCONTRATOIMOVEL = ' + IntToStr(iContrato)                                                    + #13;

      if iLocatario > 0 then
         sSQL := sSQL  +
         'AND C.IDLOCATARIO = ' + IntToStr(iLocatario)                                                        + #13;

      if iResponsavel > 0 then
         sSQL := sSQL  +
         'AND C.IDRESPONSAVEL = ' + IntToStr(iResponsavel)                                                    + #13;

      sSQL := sSQL +
      'AND NVL(D.STATUS,''0'')   <> ''2'' '                                                                   + #13 +
      'AND D.IDMODULO          = 64 '                                                                         + #13 +
      'AND L.IDTIPOCUSTORECIMO = T.IDTIPOCUSTORECIMO '                                                        + #13 +
      'AND L.IDCONTRATOIMOVEL  = C.IDCONTRATOIMOVEL(+) '                                                      + #13 +
      'AND L.CODDOCUMENTO      = D.CODDOCUMENTO '                                                             + #13 +
      'AND LD.CODDOCUMENTO     = D.CODDOCUMENTO '                                                             + #13 +
      'ORDER BY '                                                                                             + #13 +
      '    L.IDCONTRATOIMOVEL, '                                                                              + #13 +
      '    CONTRATO_EXTENSO, '                                                                                + #13 +
      '    T.DESCCUSTORECIMO '                                                                                + #13;
   end;
   Result := GetDataPacket(sSQL);
end;



function TCtrlAgrupaDocumento.AgrupaDocumentos(const bAgrupa:Boolean; iMes,iAno:Integer; bUsaMsgContrato:Boolean): Boolean;
var sDocumentos, sSQL : String;
    iCodGrupo         : Integer;
    iContador         : Integer;
    iContrato         : Integer;
    sAnoMes           : String;
    sMes              : String;
    sAno              : String;

    // Daniel - 26527
    sImoveis    : String;
    sDscImoveis : String;
    iDocumento  : Integer;
    // Fim.
begin
  Result := True;

  sAno := IntToStr(iAno);
  sMes := IntToStr(iMes);

  if Length(sMes) = 1 then sMes := '0' + sMes;

  sAnoMes := sAno + sMes;

  if not bAgrupa then begin
    vMsgCnab[0] := cdsMensagens.FieldByName('TEXTOLINHA_1').AsString;
    vMsgCnab[1] := cdsMensagens.FieldByName('TEXTOLINHA_2').AsString;
    vMsgCnab[2] := cdsMensagens.FieldByName('TEXTOLINHA_3').AsString;
    vMsgCnab[3] := cdsMensagens.FieldByName('TEXTOLINHA_4').AsString;
    vMsgCnab[4] := cdsMensagens.FieldByName('TEXTOLINHA_5').AsString;
    vMsgCnab[5] := cdsMensagens.FieldByName('TEXTOLINHA_6').AsString;
    vMsgCnab[6] := cdsMensagens.FieldByName('TEXTOLINHA_7').AsString;
    vMsgCnab[7] := cdsMensagens.FieldByName('TEXTOLINHA_8').AsString;
    vMsgCnab[8] := cdsMensagens.FieldByName('TEXTOLINHA_9').AsString;
  end;

  cdsDocumentos.DisableControls;
  cdsDocumentos.First;

  while not cdsDocumentos.eof do begin
    iContrato     := cdsDocumentos.FieldByName('IDCONTRATOIMOVEL').AsInteger;
    iDocumento    := cdsDocumentos.FieldByName('CODDOCUMENTO').AsInteger; // Daniel - 26527
    sDocumentos   := '';
    aListaReceita := nil;
    stLista.Clear;

    // Daniel - 26527
    if {not cdsDocumentos.FieldByName('IDMSGBOLETO').IsNull and} bUsaMsgContrato then
      _Cds.Data := CtrlMensagemBoleto.LookupMsgBoletoComLinhas(cdsDocumentos.FieldByName('IDMSGBOLETO').AsInteger,-1,
                                                               cdsDocumentos.FieldByName('IDMODULO').AsInteger);
    // Fim.

    while (iContrato = cdsDocumentos.FieldByName('IDCONTRATOIMOVEL').AsInteger) and (not cdsDocumentos.Eof) do begin
      if cdsDocumentos.FieldByName('FLGAGRUPAR').AsInteger = 1 then begin
        if sDocumentos <> '' then sDocumentos := sDocumentos + ',';

        sDocumentos := sDocumentos + cdsDocumentos.FieldByName('CODDOCUMENTO').AsString;

        if bAgrupa then AgrupaReceitas(sAnoMes);
      end;
      cdsDocumentos.Next;
    end;

    if sDocumentos <> '' then begin
      sSQL := 'SELECT CODDOCUMENTO, CODPORTFORMA FROM DOCUMENTO WHERE CODDOCUMENTO IN (' + sDocumentos + ')';
      cdsDocAgrup.Data := GetDataPacket(sSQL);

      if bAgrupa then begin
// Daniel - 26527 - Início -----------------------------------------------------
        if bUsaMsgContrato then begin
// Daniel - 27256 - Início -----------------------------------------------------
          vMsgCnab[0] := '';
          vMsgCnab[1] := '';
          vMsgCnab[2] := '';
          vMsgCnab[3] := '';
          vMsgCnab[4] := '';
          vMsgCnab[5] := '';
          vMsgCnab[6] := '';
          vMsgCnab[7] := '';
          vMsgCnab[8] := '';
// Daniel - 27256 - Fim --------------------------------------------------------
          if not _Cds.IsEmpty then begin
            // Vetor Mensagens
            vMsgCnab[0] := _Cds.FieldByName('TEXTOLINHA_1').AsString;
            vMsgCnab[1] := _Cds.FieldByName('TEXTOLINHA_2').AsString;
            vMsgCnab[2] := _Cds.FieldByName('TEXTOLINHA_3').AsString;
            vMsgCnab[3] := _Cds.FieldByName('TEXTOLINHA_4').AsString;
            vMsgCnab[4] := _Cds.FieldByName('TEXTOLINHA_5').AsString;
            vMsgCnab[5] := _Cds.FieldByName('TEXTOLINHA_6').AsString;
            vMsgCnab[6] := _Cds.FieldByName('TEXTOLINHA_7').AsString;
            vMsgCnab[7] := _Cds.FieldByName('TEXTOLINHA_8').AsString;
            vMsgCnab[8] := _Cds.FieldByName('TEXTOLINHA_9').AsString;

            // Vetor Curinga
            vCuringa[0] := '<recdes>';
            vCuringa[1] := '<tolera>';
            vCuringa[2] := '<periodo>';
            vCuringa[3] := '<imovel>';
            vCuringa[4] := '<juros>';
            vCuringa[5] := '<multa>';
            vCuringa[6] := '<comp>';
            vCuringa[7] := '<numcontrato>';
            vCuringa[8] := '<mestre>';
            vCuringa[9] := '<dscimovel>';

            _Cds.Data := GetDataPacket('SELECT DISTINCT IM.IMONOME AS NOME_MESTRE, T.DESCCUSTORECIMO, C.CONNUMERO, '     +#13+
                                       '                I.IMONOME AS NOME_IMOVEL, CXI.CIMDESCRICAO, CM.DIASTOLERANCIA, ' +#13+
                                       '                DECODE(CM.VLRJUROS,NULL,CM.PERCJUROS,CM.VLRJUROS) AS JUROS, '    +#13+
                                       '                DECODE(CM.VLRMULTA,NULL,CM.PERCMULTA,CM.VLRMULTA) AS MULTA, '    +#13+
                                       '                DECODE(CM.PERIODOJUROS,''M'',''Mês'', '                          +#13+
                                       '                                       ''D'',''Dia'') AS PERIODOJUROS, '         +#13+
                                       '                TO_CHAR(L.MESCOMPETENCIA,''00'') || ''/'' || '                   +
                                       'TO_CHAR(L.ANOCOMPETENCIA,''0000'') AS COMPETENCIA '                              +#13+
                                       'FROM IMOVEL I, IMOVEL IM, CONTRATOXIMOVEL CXI, CONTRATOXMULTA CM, '              +#13+
                                       '     LANCAMENTOSIMOVEL L, TIPOCUSTORECIMOV T, CONTRATOIMOVEL C '                 +#13+
                                       'WHERE I.IDIMOVELMESTRE    = IM.IDIMOVEL '                                        +#13+
                                       '  AND L.IDCONTRATOIMOVEL  = C.IDCONTRATOIMOVEL '                                 +#13+
                                       '  AND L.IDCONTRATOIMOVEL  = CXI.IDCONTRATOIMOVEL '                               +#13+
                                       '  AND L.IDIMOVEL          = CXI.IDIMOVEL '                                       +#13+
                                       '  AND CXI.IDIMOVEL        = I.IDIMOVEL '                                         +#13+
                                       '  AND L.IDTIPOCUSTORECIMO = T.IDTIPOCUSTORECIMO '                                +#13+
                                       '  AND C.IDCONTRATOIMOVEL  = CM.IDCONTRATOIMOVEL(+) '                             +#13+
                                       '  AND L.CODDOCUMENTO      = '+IntToStr(iDocumento));

            // Vetor Valores das mensagens
            vValor[0] := _Cds.FieldByName('DESCCUSTORECIMO').AsString;
            vValor[1] := _Cds.FieldByName('DIASTOLERANCIA').AsString;
            vValor[2] := _Cds.FieldByName('PERIODOJUROS').AsString;

            vValor[4] := _Cds.FieldByName('JUROS').AsString;
            vValor[5] := _Cds.FieldByName('MULTA').AsString;
            vValor[6] := _Cds.FieldByName('COMPETENCIA').AsString;
            vValor[7] := _Cds.FieldByName('CONNUMERO').AsString;
            vValor[8] := _Cds.FieldByName('NOME_MESTRE').AsString;

            sImoveis    := '';
            sDscimoveis := '';

            while not _Cds.Eof do begin
              if sImoveis    <> '' then sImoveis    := sImoveis    + ', ';
              if sDscimoveis <> '' then sDscimoveis := sDscimoveis + ', ';

              sImoveis    := sImoveis    + Trim(_Cds.FieldByName('NOME_IMOVEL').AsString);
              sDscimoveis := sDscimoveis + Trim(_Cds.FieldByName('CIMDESCRICAO').AsString);
              _Cds.Next;
            end;

            vValor[3] := StringReplace(sImoveis,'''','',[rfReplaceAll]);
            vValor[9] := StringReplace(sDscimoveis,'''','',[rfReplaceAll]);

            CtrlMensagemBoleto.SubstituiCuringa(vMsgCnab,vCuringa,vValor);
          end;
        end else begin
          vMsgCnab[0] := cdsMensagens.FieldByName('TEXTOLINHA_1').AsString;
          vMsgCnab[1] := cdsMensagens.FieldByName('TEXTOLINHA_2').AsString;
          vMsgCnab[2] := cdsMensagens.FieldByName('TEXTOLINHA_3').AsString;
          vMsgCnab[3] := cdsMensagens.FieldByName('TEXTOLINHA_4').AsString;
          vMsgCnab[4] := cdsMensagens.FieldByName('TEXTOLINHA_5').AsString;
          vMsgCnab[5] := cdsMensagens.FieldByName('TEXTOLINHA_6').AsString;
          vMsgCnab[6] := cdsMensagens.FieldByName('TEXTOLINHA_7').AsString;
          vMsgCnab[7] := cdsMensagens.FieldByName('TEXTOLINHA_8').AsString;
          vMsgCnab[8] := cdsMensagens.FieldByName('TEXTOLINHA_9').AsString;
        end;
// Daniel - 26527 - Fim --------------------------------------------------------

        for iContador := 0 to length(aListaReceita)-1 do begin
          vMsgCnab[iContador] :=
            aListaReceita[iContador].Receita + ': ' + FormatFloat('#,##0.00',aListaReceita[iContador].Valor);
        end;
      end;

      StartTransaction;

      try
        //Cássio Camargo - 18/09/2008 - N. Sol 92381 -  N. Kintana 394180
        {if not CtrlDocumento.IntBanco.AgrupaDocCnab(cdsDocAgrup,True,True,['CODPORTFORMA']) then
          raise Exception.Create(CtrlDocumento.MessageInfo);

        for iContador := 0 to CtrlDocumento.IntBanco.CodigosGrupo.Count-1 do begin
          iCodGrupo := StrToInt(CtrlDocumento.IntBanco.CodigosGrupo[iContador]);

          if not CtrlDocumento.IntBanco.SetaMensagensCNAB(-1,iCodGrupo,vMsgCnab) then
            raise Exception.Create(CtrlDocumento.MessageInfo);}
        if not CtrlImobDocumento.IntBanco.AgrupaDocCnab(cdsDocAgrup,True,True,['CODPORTFORMA']) then
          raise Exception.Create(CtrlImobDocumento.MessageInfo);

        for iContador := 0 to CtrlImobDocumento.IntBanco.CodigosGrupo.Count-1 do begin
          iCodGrupo := StrToInt(CtrlImobDocumento.IntBanco.CodigosGrupo[iContador]);

          if not CtrlImobDocumento.IntBanco.SetaMensagensCNAB(-1,iCodGrupo,vMsgCnab) then
            raise Exception.Create(CtrlImobDocumento.MessageInfo);
        end;

        Commit;
        Result := True;
      except
        on E : Exception do begin
          RollBack;
          Messageinfo := E.Message;
          Result      := False;
          Exit;
        end;
      end;
    end;
  end;

  cdsDocumentos.First;
  cdsDocumentos.EnableControls;
end;



function TCtrlAgrupaDocumento.LookupMensagem: OleVariant;
var
   sSQL : String;
begin
   sSQL :=
   'SELECT '                                                                                       + #13 +
   '   ''                                                                     '' AS TEXTOLINHA_1,' + #13 +
   '   ''                                                                     '' AS TEXTOLINHA_2,' + #13 +
   '   ''                                                                     '' AS TEXTOLINHA_3,' + #13 +
   '   ''                                                                     '' AS TEXTOLINHA_4,' + #13 +
   '   ''                                                                     '' AS TEXTOLINHA_5,' + #13 +
   '   ''                                                                     '' AS TEXTOLINHA_6,' + #13 +
   '   ''                                                                     '' AS TEXTOLINHA_7,' + #13 +
   '   ''                                                                     '' AS TEXTOLINHA_8,' + #13 +
   '   ''                                                                     '' AS TEXTOLINHA_9 ' + #13 +
   'FROM DUAL '                                                                                    + #13 +
   'WHERE 1 = 2 '                                                                                  + #13;
   Result := GetDataPacket(sSQL);
end;



procedure TCtrlAgrupaDocumento.AgrupaReceitas(sAnoMes : String);
var
    iIndice       : Integer;
    sReceita      : String;
    sPeriodo      : String;
begin

   sReceita := cdsDocumentos.FieldByName('DESCCUSTORECIMO').AsString;

   sPeriodo := FormatDateTime('yyyymm',cdsDocumentos.FieldByName('DATAVENCIMENTO').AsDateTime);

   if sAnoMes > sPeriodo then sReceita := 'Débitos Anteriores';

   iIndice := stLista.IndexOf(sReceita);

   if iIndice = -1 then begin
     stLista.Add(sReceita);
     SetLength(aListaReceita, stLista.Count);
     aListaReceita[Length(aListaReceita)-1].Receita := sReceita;
     aListaReceita[Length(aListaReceita)-1].Valor   := cdsDocumentos.FieldByName('VALOR_LANC').AsFloat;
   end else
     aListaReceita[iIndice].Valor   := aListaReceita[iIndice].Valor + cdsDocumentos.FieldByName('VALOR_LANC').AsFloat;
end;

end.
