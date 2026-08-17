unit uCtrlGeraXML;

interface

Uses SysUtils, uCmControlObject, uCmClientDataSet, uCmTypes, Math, uDiasUteis,
     JCLSysUtils, classes, uCMFileUtils, JCLStrings, uComunsImobiliario, uComunsImobiliarioDB,
     uFuncoesImob, uCtrlImovel;
type

   TCtrlGeraXML = class(TCmControlObject)
   protected
      procedure AfterInitialize; override;
      procedure OnCreateAppServer; override;
   private
      iPessoa               : Integer;
      DiasUteis             : TDiasUteis;
      CtrlImobiliario       : TComunsImobiliarioDB;
      CtrlImovel            : TCtrlImovel;
      sArquivo              : TextFile;
      sLinha                : String;

      FcdsDadosImovel : TCMClientDataSet;
      FcdsDadosPatro  : TCMClientDataSet;
      FcdsDadosPlano  : TCMClientDataSet;
      
      procedure SetcdsDadosImovel(const Value: TCMClientDataSet);
      procedure SetcdsDadosPatro(const Value: TCMClientDataSet);
      procedure SetcdsDadosPlano(const Value: TCMClientDataSet);

      Function GeraHeader(const sCaminho        : String;
                          const sCodCarteira    : String;
                          const dDataReferencia : TDateTime;
                          const sNomeEmpresa    : String) : Boolean;

      Function GeraDadosPlano : Boolean;

      Function GeraCarteiraImoveis(sNomeBilhete:String; dDataReferencia : TDateTime) : Boolean;

      Function GeraTrailler : Boolean;
   public
      constructor Create(const iIdEmpresa, iIdModulo, iIdUsuario, iIdEspAcesso: Integer; const bUsaPlanoPatro: Boolean); reintroduce;
      destructor  Destroy; override;

      function LookupDadosPatroXML(const sCodCarteira    : String;
                                   const dDataReferencia : TDateTime;
                                   const fPatrimonio     : Currency;
                                   const fTributos       : Currency;
                                   const fValorAtivos    : Currency;
                                   const fValorReceber   : Currency;
                                   const fValorPagar     : Currency) : OleVariant;

      function LookupDadosImoveisXML(const dDatareferencia : TDateTime) : OleVariant;

      function LookupDadosPatro : OleVariant;

      function GeraArquivoXML(const sCaminho        : String;
                              const sCodCarteira    : String;
                              const dDataReferencia : TDateTime;
                              const sNomeEmpresa    : String;
                                    sNomeBilhete    : String) : Boolean;

      property cdsDadosPatro  : TCMClientDataSet read FcdsDadosPatro  write SetcdsDadosPatro;
      property cdsDadosImovel : TCMClientDataSet read FcdsDadosImovel write SetcdsDadosImovel;
      property cdsDadosPlano  : TCMClientDataSet read FcdsDadosPlano write SetcdsDadosPlano;

   published

end;


implementation

{ TCtrlGeraXML }



procedure TCtrlGeraXML.AfterInitialize;
begin
  inherited;
   DiasUteis.InitializeAs( Self );
   CtrlImobiliario.InitializeAs( Self );
   CtrlImovel.InitializeAs( Self );
end;



constructor TCtrlGeraXML.Create(const iIdEmpresa, iIdModulo, iIdUsuario, iIdEspAcesso: Integer; const bUsaPlanoPatro: Boolean);
begin
   inherited Create;
   DiasUteis             := TDiasUteis.Create;
   CtrlImobiliario       := TComunsImobiliarioDB.Create(iIdEmpresa, iIdModulo, iIdUsuario, iIdEspAcesso, bUsaPlanoPatro);
   CtrlImovel            := TCtrlImovel.Create;
   CtrlImovel.idEmpresa  := iIdEmpresa;
end;



destructor TCtrlGeraXML.Destroy;
begin
   FreeAndNil( DiasUteis );
   FreeAndNil( CtrlImobiliario );
   FreeAndNil( CtrlImovel );
   inherited;
end;



procedure TCtrlGeraXML.OnCreateAppServer;
begin
   inherited;
end;



function TCtrlGeraXML.LookupDadosPatroXML(const sCodCarteira   : String;
                                          const dDataReferencia: TDateTime;
                                          const fPatrimonio,
                                                fTributos,
                                                fValorAtivos,
                                                fValorReceber,
                                                fValorPagar: Currency): OleVariant;
var
   sSQL : String;
begin
   sSQL :=
   'SELECT'                                                                                                     + #13 +
   '   TRIM(DOC.NUMDOCUMENTO) AS CNPJCPF,'                                                                      + #13 +
   '   ' + QuotedStr(sCodCarteira) + '  AS CODCARTEIRA,'                                                                   + #13 +
   '   ' + FormatDateTime('yyyymmdd', dDataReferencia) + ' AS DTPOSICAO,'                                       + #13 +
   '   TRIM(EMP.NOMEEMPRESA) AS NOME,'                                                                          + #13 +
   '   ''J'' AS TIPOCLI,'                                                                                           + #13 +
   '   LPAD(BCO.NUMBANCO,7-LENGTH(TRIM(BCO.NUMBANCO)),''0'') || SUBSTR(AGE.NUMAGENCIA,1,4) || LPAD(SUBSTR(CTA.CONTACORRENTE,1,5),14-LENGTH(TRIM(SUBSTR(CTA.CONTACORRENTE,1,5))),''0'') AS CODCNTCOR,' + #13 +
   '   TRIM(EMP.NOMEEMPRESA) AS NOMEGESTOR,'                                                                    + #13 +
   '   TRIM(DOC.NUMDOCUMENTO) AS CNPJGESTOR,'                                                                   + #13 +
   '   TRIM(EMP.NOMEEMPRESA) AS NOMECUSTODIANTE,'                                                               + #13 +
   '   TRIM(DOC.NUMDOCUMENTO) AS CNPJCUSTODIANTE,'                                                              + #13 +
   '   ' + NumeroIngles(fPatrimonio)   + ' AS PATLIQ,'                                                          + #13 +
   '   ' + NumeroIngles(fTributos)     + ' AS TRIBUTOS,'                                                        + #13 +
   '   ' + NumeroIngles(fValorAtivos)  + ' AS VALORATIVOS,'                                                     + #13 +
   '   ' + NumeroIngles(fValorReceber) + ' AS VALORRECEBER,'                                                    + #13 +
   '   ' + NumeroIngles(fValorPagar)   + ' AS VALORPAGAR'                                                       + #13 +
   'FROM'                                                                                                       + #13 +
   '   EMPRESAPROP EMP,'                                                                                        + #13 +
   '   DOCPESSOA DOC,'                                                                                          + #13 +
   '   CONTABANCARIA CTA,'                                                                                      + #13 +
   '   AGENCIABANCARIA AGE,'                                                                                    + #13 +
   '   BANCO BCO'                                                                                               + #13 +
   'WHERE'                                                                                                      + #13 +
   '    DOC.IDPESSOA = EMP.IDPESSOA'                                                                            + #13 +
   'AND CTA.IDPESSOA = EMP.IDPESSOA'                                                                            + #13 +
   'AND AGE.IDPESSOA = CTA.IDAGENCIA'                                                                           + #13 +
   'AND BCO.IDPESSOA = AGE.IDBANCO'                                                                             + #13;

   Result := GetDataPacket(sSQL);
end;



function TCtrlGeraXML.LookupDadosImoveisXML(const dDatareferencia: TDateTime): OleVariant;
var
   sSQL : String;
begin
   sSQL :=
  'SELECT'                                                                                                      + #13 +
  '     I.IDIMOVEL,'                                                                                            + #13 +
  '     IM.IMOLOGRADOURO,'                                                                                      + #13 +
  '     IM.IMONUMERO,'                                                                                          + #13 +
  '     I.IMONOME,'                                                                                             + #13 +
  '     CI.NOME AS CIDADE,'                                                                                     + #13 +
  '     UF.CODESTADO,'                                                                                          + #13 +
  '     IM.IMOCEP,'                                                                                             + #13 +
  '     IM.IMONOME,'                                                                                            + #13 +
  '     100.00 AS PERCPART,'                                                                                    + #13 +
  '     0 AS VALORCONTABIL,'                                                                                    + #13 +
  '     DECODE(AV.ANOMESREAV, ' + QuotedStr(FormatDateTime('yyyymm',dDataReferencia)) + ',3,1) AS JUSTIFICATIVA,' + #13 +
  '     I.IMOVLRREAVAL,'                                                                                        + #13 +
  '     I.IMODATAREAVAL,'                                                                                       + #13 +
  '     DECODE(PEA.NUMDOCUMENTO,NULL,''J'',''F'') AS TPAVALIADOR,'                                              + #13 +
  '     DECODE(DAV.NUMDOCUMENTO,NULL,DOC.NUMDOCUMENTO,DAV.NUMDOCUMENTO) AS CNPJCPFAVALIADOR,'                   + #13 +
  '     NVL(ALU.VLRALUGUEL,0) AS ALUGUELCONTRATADO,'                                                            + #13 +
  '     NVL(VENC.VLRATRASO,0) AS ALUGUELATRASADO,'                                                              + #13 +
  '     DECODE(I.FLGSTATUS,''A'',''S'',''N'') AS OPCAORECOMPRA,'                                                + #13 +
  '     DECODE(I.FLGSTATUS,''A'',DECODE(AL.CONDATAASSINATURA,NULL,NULL,AL.CONDATAASSINATURA),NULL) AS DTRECOMPRA,' + #13 +
  '     DECODE(I.CODIMOVELSPC,NULL,TI.CODIMOVELSPC,I.CODIMOVELSPC) AS TIPOIMOVEL,'                              + #13 +
  '     ''N'' AS QUESTJUR,'                                                                                     + #13 +
  '     D.CODSEGMENTO AS TIPOUSO,'                                                                              + #13 +
  '     TRIM(I.IMOMATRICULA) AS MATRICULA,'                                                                     + #13 +
  '     '' '' AS CNPJEMP'                                                                                       + #13 +
  'FROM'                                                                                                        + #13 +
  '     IMOVEL        I,'                                                                                       + #13 +
  '     IMOVEL        IM,'                                                                                      + #13 +
  '     DAIEACIDADES  DC,'                                                                                      + #13 +
  '     CIDADES       CI,'                                                                                      + #13 +
  '     ESTADO        UF,'                                                                                      + #13 +
  '     TIPOIMOVEL    TI,'                                                                                      + #13 +
  '     CARTEIRASPC   D,'                                                                                       + #13 +
  '     PARAMIMOVEL   PA,'                                                                                      + #13 +
  '     PESSOA        PEA,'                                                                                     + #13 +
  '     DOCPESSOA     DAV,'                                                                                     + #13 +
  '     DOCPESSOA     DOC,'                                                                                     + #13 +
  '     EMPRESAPROP   EPR,'                                                                                     + #13 +
  '     ('                                                                                                      + #13 +
  '      SELECT DISTINCT R.IDIMOVEL, R.IDAVALIADOR, TO_CHAR(DATAREAVALIACAO,''YYYYMM'') AS ANOMESREAV, DATAREAVALIACAO' + #13 +
  '      FROM REAVALIAXREAVALIA R'                                                                              + #13 +
  '      WHERE R.DATAREAVALIACAO IN ( SELECT MAX(DATAREAVALIACAO) AS DATAREAVALIACAO'                           + #13 +
  '                                   FROM REAVALIAXREAVALIA'                                                   + #13 +
  '                                   WHERE IDIMOVEL = R.IDIMOVEL )'                                            + #13 +
  '     ) AV,'                                                                                                  + #13 +
  '     ('                                                                                                      + #13 +
  '       SELECT CXI.IDIMOVEL, CON.CONDATAASSINATURA'                                                           + #13 +
  '       FROM CONTRATOIMOVEL CON, CONTRATOXIMOVEL CXI'                                                         + #13 +
  '       WHERE CXI.IDCONTRATOIMOVEL = CON.IDCONTRATOIMOVEL'                                                    + #13 +
  '       AND   CON.FLGTIPOCONTRATO  = ''C'''                                                                   + #13 +
  '     ) AL,'                                                                                                  + #13 +
  '     ('                                                                                                      + #13 +
  '       SELECT CXI.IDIMOVEL, CXI.CIMVLRAJUSTADO AS VLRALUGUEL'                                                + #13 +
  '       FROM CONTRATOXIMOVEL CXI'                                                                             + #13 +
  '       WHERE ' + QuotedStr(FormatDateTime('yyyymm',dDataReferencia)) + ' BETWEEN TO_CHAR(CIMDTINI,''YYYYMM'') AND' + #13 +
  '                              TO_CHAR(CIMDTFIM,''YYYYMM'')'                                                  + #13 +
  '     ) ALU,'                                                                                                 + #13 +
  '     ('                                                                                                      + #13 +
  '       SELECT LI.IDIMOVEL, SUM(NVL(LI.TOT_RECEBER,0) - NVL(LI.TOT_RECEBIDO,0) + NVL(LI.TOT_ALTERADOR,0)) AS VLRATRASO' + #13 +
  '       FROM VWLANCAMENTO LI, CONTRATOIMOVEL CON'                                                             + #13 +
  '       WHERE LI.DATAVENCIMENTO    < ' + QuotedStr(FormatDateTime('dd/mm/yyyy',dDataReferencia))                + #13 +
  '       AND   LI.IDCONTRATOIMOVEL  = CON.IDCONTRATOIMOVEL'                                                    + #13 +
  '       AND   LI.IDTIPOCUSTORECIMO = CON.IDTIPOCUSTORECIMO'                                                   + #13 +
  '       GROUP BY LI.IDIMOVEL'                                                                                 + #13 +
  '       HAVING SUM(NVL(LI.TOT_RECEBER,0) - NVL(LI.TOT_RECEBIDO,0) + NVL(LI.TOT_ALTERADOR,0)) > 0'             + #13 +
  '     ) VENC'                                                                                                 + #13 +
  'WHERE'                                                                                                       + #13 +
  '      I.IDPESSOA         = PA.IDPESSOA'                                                                      + #13 +
  '  AND I.IDIMOVELMESTRE   IS NOT NULL'                                                                        + #13 +
  '  AND I.IDIMOVELMESTRE   = IM.IDIMOVEL(+)'                                                                   + #13 +
  '  AND I.CODTIPIMOVEL     = TI.CODTIPIMOVEL(+)'                                                               + #13 +
  '  AND I.IDIMOVEL         = AV.IDIMOVEL(+)'                                                                   + #13 +
  '  AND TI.IDCARTEIRASPC   = D.IDCARTEIRASPC(+)'                                                               + #13 +
  '  AND IM.IDCIDADES       = CI.IDCIDADES(+)'                                                                  + #13 +
  '  AND CI.IDESTADO        = UF.IDESTADO(+)'                                                                   + #13 +
  '  AND CI.IDCIDADES       = DC.IDCIDADES(+)'                                                                  + #13 +
  '  AND AV.IDAVALIADOR     = PEA.IDPESSOA(+)'                                                                  + #13 +
  '  AND PEA.IDPESSOA       = DAV.IDPESSOA(+)'                                                                  + #13 +
  '  AND DAV.IDDOCUMENTO(+) = -1'                                                                               + #13 +
  '  AND EPR.IDPESSOA       = DOC.IDPESSOA(+)'                                                                  + #13 +
  '  AND I.FLGATIVO         = 1'                                                                                + #13 +
  '  AND I.IDIMOVEL         = AL.IDIMOVEL(+)'                                                                   + #13 +
  '  AND I.IDIMOVEL         = ALU.IDIMOVEL(+)'                                                                  + #13 +
  '  AND I.IDIMOVEL         = VENC.IDIMOVEL(+)'                                                                 + #13 +
  'ORDER BY IM.IMONOME'                                                                                         + #13;

   Result := GetDataPacket(sSQL);
end;



function TCtrlGeraXML.GeraArquivoXML(const sCaminho : String;
                                     const sCodCarteira: String;
                                     const dDataReferencia: TDateTime;
                                     const sNomeEmpresa: String;
                                           sNomeBilhete : String): Boolean;
begin
   Result := True;
   try
      AssignFile(sArquivo, sCaminho + 'CT' + sCodCarteira + '_' + FormatDateTime('yyyymmdd', dDataReferencia) +
                                      '_'  + FormatDateTime('yyyymmddhhnnss',Now)+ '_' + sNomeEmpresa + '.XML');

      ReWrite(sArquivo);

      DecimalSeparator := '.';
      try
         if not GeraHeader(sCaminho, sCodCarteira, dDataReferencia, sNomeEmpresa) then
            raise exception.Create('Erro ao gerar o Header do Arquivo XML');
      except
         Result      := False;
         MessageInfo := 'Erro ao gerar o Header do Arquivo XML';
      end;

      try
         if not GeraDadosPlano then
            raise exception.Create('Erro ao gerar os dados dos planos');
      except
         Result      := False;
         MessageInfo := 'Erro ao gerar os dados dos planos';
      end;

      try
         if not GeraCarteiraImoveis(sNomeBilhete, dDataReferencia) then
            raise exception.Create('Erro ao gerar os dados da carteira de imóveis');
      except
         Result      := False;
         MessageInfo := 'Erro ao gerar os dados da carteira de imóveis';
      end;

      try
         if not GeraTrailler then
            raise exception.Create('Erro ao gerar o Trailler do Arquivo XML');
      except
         Result      := False;
         MessageInfo := 'Erro ao gerar o Trailler do Arquivo XML';
      end;

   finally
      CloseFile(sArquivo);
      DecimalSeparator := ',';
   end;
end;



procedure TCtrlGeraXML.SetcdsDadosImovel(const Value: TCMClientDataSet);
begin
   FcdsDadosImovel := Value;
end;



procedure TCtrlGeraXML.SetcdsDadosPatro(const Value: TCMClientDataSet);
begin
   FcdsDadosPatro := Value;
end;



function TCtrlGeraXML.GeraHeader(const sCaminho,
                                       sCodCarteira: String;
                                 const dDataReferencia: TDateTime;
                                 const sNomeEmpresa: String): Boolean;
begin
   try
      Result := True;
      sLinha := '<?xml version="1.0" encoding="ISO-8859-1"?>';
      WriteLn(sArquivo, sLinha);
      sLinha := '<arquivoposicao_4_00><carteira><header>';
      WriteLn(sArquivo, sLinha);
      sLinha := '  <cnpjcpf>' + Trim(FcdsDadosPatro.FieldByName('CNPJCPF').AsString) + '</cnpjcpf>';
      WriteLn(sArquivo, sLinha);
      sLinha := '  <codcart>' + Trim(sCodCarteira) + '</codcart>';
      WriteLn(sArquivo, sLinha);
      sLinha := '  <dtposicao>' + FormatDateTime('yyyymmdd', dDataReferencia) + '</dtposicao>';
      WriteLn(sArquivo, sLinha);
      sLinha := '  <nome>' + Trim(FcdsDadosPatro.FieldByName('CNPJCPF').AsString) + '</nome>';
      WriteLn(sArquivo, sLinha);
      sLinha := '  <tpcli>J</tpcli>';
      WriteLn(sArquivo, sLinha);
      sLinha := '  <codcntcor>' + Trim(FcdsDadosPatro.FieldByName('CODCNTCOR').AsString) + '</codcntcor>';
      WriteLn(sArquivo, sLinha);
      sLinha := '  <nomegestor>' + Trim(FcdsDadosPatro.FieldByName('NOMEGESTOR').AsString) + '</nomegestor>';
      WriteLn(sArquivo, sLinha);
      sLinha := '  <cnpjgestor>' + Trim(FcdsDadosPatro.FieldByName('CNPJGESTOR').AsString) + '</cnpjgestor>';
      WriteLn(sArquivo, sLinha);
      sLinha := '  <nomecustodiante>' + Trim(FcdsDadosPatro.FieldByName('NOMECUSTODIANTE').AsString) + '</nomecustodiante>';
      WriteLn(sArquivo, sLinha);
      sLinha := '  <cnpjcustodiante>' + Trim(FcdsDadosPatro.FieldByName('CNPJCUSTODIANTE').AsString) + '</cnpjcustodiante>';
      WriteLn(sArquivo, sLinha);
      sLinha := '  <patliq>' + Trim(FormatFloat('#0.00',FcdsDadosPatro.FieldByName('PATLIQ').AsFloat)) + '</patliq>';
      WriteLn(sArquivo, sLinha);
      sLinha := '  <tributos>' + Trim(FormatFloat('#0.00',FcdsDadosPatro.FieldByName('TRIBUTOS').AsFloat)) + '</tributos>';
      WriteLn(sArquivo, sLinha);
      sLinha := '  <valorativos>' + Trim(FormatFloat('#0.00',FcdsDadosPatro.FieldByName('VALORATIVOS').AsFloat)) + '</valorativos>';
      WriteLn(sArquivo, sLinha);
      sLinha := '  <valorreceber>' + Trim(FormatFloat('#0.00',FcdsDadosPatro.FieldByName('VALORRECEBER').AsFloat)) + '</valorreceber>';
      WriteLn(sArquivo, sLinha);
      sLinha := '  <valorpagar>' + Trim(FormatFloat('#0.00',FcdsDadosPatro.FieldByName('VALORPAGAR').AsFloat)) + '</valorpagar></header>';
      WriteLn(sArquivo, sLinha);
   except
      Result := False;
   end;
end;



function TCtrlGeraXML.GeraTrailler: Boolean;
begin
   try
      sLinha := '</carteira>';
      WriteLn(sArquivo, sLinha);
      sLinha := '</arquivoposicao_4_00>';
      WriteLn(sArquivo, sLinha);
      Result := True;
   except
      Result := False;
   end;
end;



function TCtrlGeraXML.GeraCarteiraImoveis(sNomeBilhete : String; dDataReferencia : TDateTime) : Boolean;
var
    sErro           : String;
    iAtual, iTotReg : Integer;
begin
   try
      FcdsDadosImovel.First;

      Result  := True;
      iTotReg := FcdsDadosImovel.RecordCount;
      iAtual  := 1;

      while not FcdsDadosImovel.eof do
      begin

          FcdsDadosImovel.Edit;
          FcdsDadosImovel.FieldByName('VALORCONTABIL').AsFloat := CtrlImovel.SaldoContabil(FcdsDadosImovel.FieldByName('IDIMOVEL').AsInteger,
                                                                  -1, dDataReferencia);
          FcdsDadosImovel.Post;

         sLinha :=
         '  <imoveis>'                                                                                                      +
         '<logradouro>'        + Trim(FcdsDadosImovel.FieldByName('IMOLOGRADOURO').AsString)     + '</logradouro>'          +
         '<numero>'            + Trim(FcdsDadosImovel.FieldByName('IMONUMERO').AsString)         + '</numero>'              +
         '<complemento>'       + Trim(FcdsDadosImovel.FieldByName('IMONOME').AsString)           + '</complemento>'         +
         '<cidade>'            + Trim(FcdsDadosImovel.FieldByName('CIDADE').AsString)            + '</cidade>'              +
         '<estado>'            + Trim(FcdsDadosImovel.FieldByName('CODESTADO').AsString)         + '</estado>'              +
         '<cep>'               + Trim(FcdsDadosImovel.FieldByName('IMOCEP').AsString)            + '</cep>'                 +
         '<nomecomercial>'     + Trim(FcdsDadosImovel.FieldByName('IMONOME').AsString)           + '</nomecomercial>'       +
         '<percpart>'          + Trim(FormatFloat('#0.00',FcdsDadosImovel.FieldByName('PERCPART').AsFloat))          + '</percpart>'            +
         '<valorcontabil>'     + Trim(FormatFloat('#0.00',FcdsDadosImovel.FieldByName('VALORCONTABIL').AsFloat))     + '</valorcontabil>'       +
         '<justificativa>'     + Trim(FcdsDadosImovel.FieldByName('JUSTIFICATIVA').AsString)     + '</justificativa>'       +
         '<valoravaliacao>'    + Trim(FormatFloat('#0.00',FcdsDadosImovel.FieldByName('IMOVLRREAVAL').AsFloat))      + '</valoravaliacao>'      +
         '<dtavaliacao>'       + Trim(FcdsDadosImovel.FieldByName('IMODATAREAVAL').AsString)     + '</dtavaliacao>'         +
         '<tpavaliador>'       + Trim(FcdsDadosImovel.FieldByName('TPAVALIADOR').AsString)       + '</tpavaliador>'         +
         '<cnpjcpfavaliador>'  + Trim(FcdsDadosImovel.FieldByName('CNPJCPFAVALIADOR').AsString)  + '</cnpjcpfavaliador>'    +
         '<aluguelcontratado>' + Trim(FormatFloat('#0.00',FcdsDadosImovel.FieldByName('ALUGUELCONTRATADO').AsFloat)) + '</aluguelcontratado>'   +
         '<aluguelatrasado>'   + Trim(FormatFloat('#0.00',FcdsDadosImovel.FieldByName('ALUGUELATRASADO').AsFloat))   + '</aluguelatrasado>'     +
         '<opcaorecompra>'     + Trim(FcdsDadosImovel.FieldByName('OPCAORECOMPRA').AsString)     + '</opcaorecompra>'       +
         '<dtopcaorecompra>'   + Trim(FcdsDadosImovel.FieldByName('DTRECOMPRA').AsString)        + '</dtopcaorecompra>'     +
         '<tipoimovel>'        + Trim(FcdsDadosImovel.FieldByName('TIPOIMOVEL').AsString)        + '</tipoimovel>'          +
         '<questjur>'          + Trim(FcdsDadosImovel.FieldByName('QUESTJUR').AsString)          + '</questjur>'            +
         '<motivoquestjur></motivoquestjur>'                                                                                +
         '<tipouso>'           + Trim(FcdsDadosImovel.FieldByName('TIPOUSO').AsString)           + '</tipouso>'             +
         '<matricula>'         + Trim(FcdsDadosImovel.FieldByName('MATRICULA').AsString)         + '</matricula>'           +
         '<cnpjemp>'           + Trim(FcdsDadosImovel.FieldByName('CNPJEMP').AsString)           + '</cnpjemp>'             +
         '</imoveis>';
         WriteLn(sArquivo, sLinha);

         // Envia o identificador do registro processado para o Cliente
         DoProgresso([sNomeBilhete, iAtual, iTotReg, sErro]);
         Inc(iAtual);

         FcdsDadosImovel.Next;
      end;
   except
      Result := False;
   end;
end;



procedure TCtrlGeraXML.SetcdsDadosPlano(const Value: TCMClientDataSet);
begin
   FcdsDadosPlano := Value;
end;



function TCtrlGeraXML.LookupDadosPatro: OleVariant;
var
   sSQL : String;
begin
   sSQL :=
   'SELECT NOME, CODIGOSPC, 0 AS PERCPART FROM PLANPREV ORDER BY NOME';

   Result := GetDataPacket(sSQL);
end;



function TCtrlGeraXML.GeraDadosPlano: Boolean;
var
   sCodigoSPC : String;
begin
   try
      FcdsDadosPlano.First;
      while not FcdsDadosPlano.eof do
      begin
         sCodigoSPC := StringReplace(FcdsDadosPlano.FieldByName('CODIGOSPC').AsString,'-','',[rfReplaceAll]);
         sCodigoSPC := StringReplace(sCodigoSPC,'.','',[rfReplaceAll]);
         sLinha     :=
         '  <partplanprev>' +
         '  <cnpb>'     + sCodigoSPC + '</cnpb>' +
         '  <percpart>' + FormatFloat('###.########',FcdsDadosPlano.FieldByName('PERCPART').AsFloat) + '</percpart>' +
         '  </partplanprev>';
         WriteLn(sArquivo, sLinha);

         FcdsDadosPlano.Next;
      end;
      Result := True;
   except
      Result := False;
   end;
end;



end.






