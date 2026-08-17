unit uCtrlGeraInformeEmptmo;

interface

Uses sysutils, uCmControlObject, uSistema, DB, uDataBase, DbClient, JclStrings, fProgresso, Forms,
     ComCtrls, uCMMath,
     {$IFNDEF VERSAO0505} uCMTypes {$ENDIF};

  Type
    TCtrlGeraInformeEmptmo = Class(TCmControlObject)

    private
      cdsContratos   : TClientDataSet;
      cdsHistorico   : TClientDataSet;
      cdsAux         : TClientDataSet;
      cdsAux2        : TClientDataSet;
      cdsAux3        : TClientDataSet;
      cdsAux4        : TClientDataSet;
      wAno, wMes, wDia: Word;
      ArqInformeAtivo, ArqInformeAtivoCaixa, ArqInformeFacultativo, ArqInformeAssistido, ArqInformeOutros : TextFile;
    protected
      procedure DoChangeDataBase; Override;
      procedure AfterInitialize;override;
    public
      Constructor Create; Override;
      Destructor Destroy; Override;

      function BuscaTipoContrato(psIdContrato: String): OleVariant;
      function BuscaDadosOutros(psAno: String): OleVariant;
      function BuscaDados(psAno, psNumDoc, psNomeArqAtivo, psNomeArqAtivoCaixa, psNomeArqFacultativo, psNomeArqAssistido, psNomeArqOutrasSit : String): OleVariant;
      function BuscaDadosPessoais(psIdPessoa, psIdBenef, psIdPatro: String): OleVariant;
      function BuscaSaldoDevedor(psIdContratoEmptmo, psAno: String): OleVariant;
      function BuscaDadoshistorico(psIdContratoEmptmo, psAno: String): OleVariant;
      procedure GeraArquivo(pbSoAtivo: boolean; psNumDoc, psAno, psNomeArqAtivo, psNomeArqAtivoCaixa, psNomeArqFacultativo, psNomeArqAssistido, psNomeArqOutrasSit: String; var pProgessBar: TProgressBar);
      procedure ProcContrEmergencial(var prAmortizacao, prAbateAmortizacao, prJuro, prJuroItem23, prMora, prMulta, prSeguro, prAmortExtra, prCorrecao, prCorrecaoItem4, prTotPagtoAno, prEncargoAtraso: Double; prValor, prValorEfet: Double; piIdItemEmptmo, piOrigem: Integer; psAno: String);
      procedure ProcContrEspecial(var prAmortizacao, prAbateAmortizacao, prJuro, prJuroItem23, prMora, prMulta, prSeguro, prAmortExtra, prCorrecao, prCorrecaoItem4, prTotPagtoAno, prEncargoAtraso: Double; prValor, prValorEfet: Double; piIdItemEmptmo, piOrigem: Integer; psAno: String);
      procedure ProcContrCreditoParticipante(var prAmortizacao, prAbateAmortizacao, prAmortizacaoItem64, prJuro, prJuroItem62, prMora, prMulta, prSeguro, prAmortExtra, prCorrecao, prCorrecaoItem61, prTotPagtoAno, prEncargoAtraso: Double; prValor, prValorEfet: Double; piIdItemEmptmo, piOrigem: Integer; psAno: String);
      procedure ProcContrConsigEspecial(var prAmortizacao, prAbateAmortizacao, prJuro, prJuroItem23, prMora, prMulta, prSeguro, prAmortExtra, prCorrecao, prCorrecaoItem4,  prTotPagtoAno, prEncargoAtraso: Double;  prValor, prValorEfet: Double; piIdItemEmptmo, piOrigem: Integer; psAno: String);
      procedure GravaArquivoAtivo(psNomeArquivo, psAno: String; prAmortizacao, prJuro, prMora, prMulta, prSeguro, prAmortExtra, prCorrecao, prTotPagtoAno, prEncargoAtraso, prSaldoDev: Double; var piTotReg2: Integer);
      procedure GravaArquivoAtivoCaixa(psNomeArquivo, psAno: String; prAmortizacao, prJuro, prMora, prMulta, prSeguro, prAmortExtra, prCorrecao, prTotPagtoAno, prEncargoAtraso, prSaldoDev: Double; var piTotReg2: Integer);
      procedure GravaArquivoFacultativo(psNomeArquivo, psAno: String; prAmortizacao, prJuro, prMora, prMulta, prSeguro, prAmortExtra, prCorrecao, prTotPagtoAno, prEncargoAtraso, prSaldoDev: Double; var piTotReg2: Integer);
      procedure GravaArquivoAssistido(psNomeArquivo, psAno: String; prAmortizacao, prJuro, prMora, prMulta, prSeguro, prAmortExtra, prCorrecao, prTotPagtoAno, prEncargoAtraso, prSaldoDev: Double; var piTotReg2: Integer);
      procedure GravaArquivoOutros(psNomeArquivo, psAno: String; prAmortizacao, prJuro, prMora, prMulta, prSeguro, prAmortExtra, prCorrecao, prTotPagtoAno, prEncargoAtraso, prSaldoDev: Double; var piTotReg2: Integer);
      procedure GravaUltimoRegArquivos(piTipoArq, piTotReg2Ativo, piTotReg2AtivoCaixa, piTotReg2Facultativo, piTotReg2Assistido, piTotReg2Outros : Integer; psNomeArqAtivo, psNomeArqAtivoCaixa, psNomeArqFacultativo, psNomeArqAssistido, psNomeArqOutrasSit : String);
      procedure GravaRegistro1Ativo(psAno: String);
      procedure GravaRegistro1AtivoCaixa(psAno: String);
      procedure GravaRegistro1Facultativo(psAno: String);
      procedure GravaRegistro1Assistido(psAno: String);
      procedure GravaRegistro1Outros(psAno: String);

    protected

    End;

implementation

{ TCtrlGeraInformeEmptmo }

procedure TCtrlGeraInformeEmptmo.AfterInitialize;
begin
  inherited;
end;

function TCtrlGeraInformeEmptmo.BuscaDados(psAno, psNumDoc, psNomeArqAtivo, psNomeArqAtivoCaixa, psNomeArqFacultativo, psNomeArqAssistido, psNomeArqOutrasSit : String): OleVariant;
Var
  sSql, sSqlWhere : String;

begin
  If (psNumDoc <> '0' ) And
     (psNumDoc <> '-1') Then
  Begin
    sSql := 'SELECT * FROM CONTRATOS2005 ';
    sSql := sSql + 'WHERE CPF = '+QuotedStr(psNumDoc);
    Result := GetDataPacket(sSql);
    Exit;
  End;

  If (Trim(psNomeArqAtivo)      <> '') and
     (Trim(psNomeArqAtivoCaixa) <> '') and
     (Trim(psNomeArqAssistido)  <> '') and
     (Trim(psNomeArqFacultativo)<> '') and
     (Trim(psNomeArqOutrasSit)  <> '') Then
  Begin
    sSql := 'SELECT * FROM CONTRATOS2005 ';
    If psNumDoc = '-1' Then
      sSql := sSql + 'WHERE MARCADO = 1 ';

    Result := GetDataPacket(sSql);
    Exit;
  End;

  sSql := 'SELECT * FROM CONTRATOS2005 WHERE ';
  ssqlWhere := '';

  If (Trim(psNomeArqAtivo)     <> '') Then
    sSqlWhere := sSqlWhere + ' (FLGINTERNO = ''AT'' AND IDPATRO = 1 AND nvl(IDPESSJURCEDIDO, 0) <> 1) ';

  If (Trim(psNomeArqAtivoCaixa) <> '') Then
  Begin
    If sSqlwhere <> '' Then
      sSqlWhere := sSqlWhere + ' OR ';
    sSqlWhere := sSqlWhere + ' (FLGINTERNO = ''AT'' AND IDPATRO = 91008 AND nvl(IDPESSJURCEDIDO, 0) <> 1) OR '+
                             ' (FLGINTERNO = ''MP'' AND IDPATRO = 91008) ';
  End;

  If (Trim(psNomeArqAssistido) <> '') Then
  Begin
    If sSqlwhere <> '' Then
      sSqlWhere := sSqlWhere + ' OR ';
    sSqlWhere := sSqlWhere + ' ((FLGINTERNO = ''AS'') OR (FLGINTERNO IS NULL)) ';
  End;

  If (Trim(psNomeArqFacultativo) <> '') Then
  Begin
    If sSqlwhere <> '' Then
      sSqlWhere := sSqlWhere + ' OR ';
    sSqlWhere := sSqlWhere + ' ((FLGINTERNO = ''MA'') OR (FLGINTERNO = ''CA'') OR (FLGINTERNO = ''MS''))';
  End;

  If (Trim(psNomeArqOutrasSit) <> '') Then
  Begin
    If sSqlwhere <> '' Then
      sSqlWhere := sSqlWhere + ' OR ';
    sSqlWhere := sSqlWhere + ' (nvl(IDPESSJURCEDIDO, 0) = 1)';
  End;

  If psNumDoc = '-1' Then
    sSqlWhere := sSqlWhere + ' AND MARCADO = 1 ';

  Result := GetDataPacket(sSql+sSqlWhere);
end;

function TCtrlGeraInformeEmptmo.BuscaDadoshistorico(psIdContratoEmptmo,
  psAno: String): OleVariant;
Var
  sSql : String;

begin
  sSql := ' SELECT '+#13#10+
          '   H.HMECENTRALIZA,     H.HMEDESTACADO, '+#13#10+
          '   H.HMEDATAQUITABONO,  '+#13#10+
          '   H.HMEANOCOMPETENCIA, H.IDTIPOSUSPEMPTMO,  '+#13#10+
          '   H.IDCONTRATOEMPTMO,  H.IDITEMEMPTMO,      H.HMEVLREFETIVO, '+#13#10+
          '   H.HMEVLRPREVISTO,    H.FLGESTORNADO,      H.HMEANOCOBRANCA, '+#13#10+
          '   H.HMEDATAEFETIVA,    H.HMEDATAPREVISTA,   H.HMEORIGEM, '+#13#10+
          '   H.HMETIPOMOV,        H.HMECENTRALIZA,     H.HMEDESTACADO, '+#13#10+
          '   nvl(H.FLGQUITADO,0) as FLGQUITADO,        H.HMEDATAQUITABONO, '+
          '   nvl(H.FLGABONADO,0) as flgabonado, '+#13#10+
          '   nvl(H.FLGSUSPENSAO, 0) as flgsuspensao, nvl(H.IDTIPOSUSPEMPTMO, 0) as IDTIPOSUSPEMPTMO, '+#13#10+
          '   DECODE(H.HMECENTRALIZA, 0, '+#13#10+
          '     DECODE(H.HMEDESTACADO, 0, '+#13#10+
          '       H.HMEVLRPREVISTO, DECODE(H.HMEVLREFETIVO, NULL, H.HMEVLRPREVISTO, H.HMEVLREFETIVO)), DECODE(H.HMEVLREFETIVO, NULL, H.HMEVLRPREVISTO, H.HMEVLREFETIVO)) AS VALOR, '+#13#10+
          '   H.HMEMESCOMPETENCIA, '+#13#10+
          '   DECODE(H.IDITEMEMPTMO, 4, 1, 23, 2, 13, 4, 3) AS ORDEM, '+
          '   H.HMEMESCOBRANCA '+#13#10+
          ' FROM HISTMOVEMPTMO H '+#13#10+
          ' WHERE H.IDCONTRATOEMPTMO  = '+psIdContratoEmptmo+
          ' and ((H.HMEANOCOMPETENCIA = 2005 OR '+
          ' (H.HMEDATAEFETIVA BETWEEN ''01/01/2005'' AND ''31/12/2005'') OR '+
          ' (H.IDITEMEMPTMO IN (64,4,23)) OR '+
          ' (H.FLGQUITADO = 1 AND (H.HMEDATAQUITABONO BETWEEN ''01/01/2005'' AND ''31/12/2005'')) AND '+
          ' NVL(H.FLGESTORNADO,0) = 0) '+
          ' or ((H.HMEANOCOMPETENCIA < 2005) AND '+
          '  (H.IDITEMEMPTMO IN (13, 31, 42, 43, 44, 46)) AND '+
          ' ((H.HMECENTRALIZA        = 1) OR (H.HMEDESTACADO = 1)) AND '+
          '  (H.HMETIPOMOV           IN (1, 2, 3, 4, 6, 7)) AND '+
          '  (H.HMEDATAPREVISTA      <= ''31/12/2005'') AND '+
          '  (H.HMEDATAEFETIVA       IS NULL OR H.HMEDATAEFETIVA   > ''31/12/2005'') AND '+
          '  (H.HMEDATAQUITABONO     IS NULL OR H.HMEDATAQUITABONO > ''31/12/2005'') AND '+
          '  (NVL(H.FLGESTORNADO,0)  = 0))) '+

          '   UNION ALL SELECT '+#13#10+
          '   H.HMECENTRALIZA,     H.HMEDESTACADO, '+#13#10+
          '   H.HMEDATAQUITABONO,  '+#13#10+
          '   H.HMEANOCOMPETENCIA, H.IDTIPOSUSPEMPTMO,  '+#13#10+
          '   H.IDCONTRATOEMPTMO,  H.IDITEMEMPTMO,      H.HMEVLREFETIVO, '+#13#10+
          '   H.HMEVLRPREVISTO,    H.FLGESTORNADO,      H.HMEANOCOBRANCA, '+#13#10+
          '   H.HMEDATAEFETIVA,    H.HMEDATAPREVISTA,   H.HMEORIGEM, '+#13#10+
          '   H.HMETIPOMOV,        H.HMECENTRALIZA,     H.HMEDESTACADO, '+#13#10+
          '   nvl(H.FLGQUITADO,0) as FLGQUITADO,        H.HMEDATAQUITABONO, '+
          '   nvl(H.FLGABONADO,0) as flgabonado, '+#13#10+
          '   nvl(H.FLGSUSPENSAO, 0) as flgsuspensao, nvl(H.IDTIPOSUSPEMPTMO, 0) as IDTIPOSUSPEMPTMO, '+#13#10+
          '   DECODE(H.HMECENTRALIZA, 0, '+#13#10+
          '     DECODE(H.HMEDESTACADO, 0, '+#13#10+
          '       H.HMEVLRPREVISTO, DECODE(H.HMEVLREFETIVO, NULL, H.HMEVLRPREVISTO, H.HMEVLREFETIVO)), DECODE(H.HMEVLREFETIVO, NULL, H.HMEVLRPREVISTO, H.HMEVLREFETIVO)) AS VALOR, '+#13#10+
          '   H.HMEMESCOMPETENCIA, '+#13#10+
          '   DECODE(H.IDITEMEMPTMO, 4, 1, 23, 2, 13, 4, 3) AS ORDEM, '+
          '   H.HMEMESCOBRANCA '+#13#10+
          ' FROM HISTMOVEMPTMOEXT H '+#13#10+
          ' WHERE H.IDCONTRATOEMPTMO  = '+psIdContratoEmptmo+
          '   AND H.IDITEMEMPTMO     IN (4, 23) '+#13#10+
          'ORDER BY HMEANOCOMPETENCIA, HMEMESCOMPETENCIA, HMEDATAPREVISTA, ORDEM ';
  Result := GetDataPacket(sSql);
end;

function TCtrlGeraInformeEmptmo.BuscaDadosOutros(psAno: String): OleVariant;
Var
  sSql : String;

begin
  sSql := ' SELECT DISTINCT '+
          '    EL.MATRICULA, '+
          '    PE.NOME, '+
          '    PE.NUMDOCUMENTO AS CPF, '+
          '    EP.LOGRADOURO, '+
          '    CI.NOME AS CIDADE, '+
          '    CI.UF, '+
          '    EP.CEP, '+
          '    HE.TOTALPAGO '+

          '  FROM '+
          '    CONTRATOEMPTMO CE, '+
          '    PESSOA         PE, '+
          '    ELEGPATRO      EL, '+
          '    ENDPESS        EP, '+
          '    CIDADES        CI, '+
          '   (SELECT SUM(HMEVLREFETIVO) AS TOTALPAGO, IDCONTRATOEMPTMO '+
          '    FROM HISTMOVEMPTMO '+
          '    WHERE HMEANOCOMPETENCIA = '+psAno+
          '    GROUP BY IDCONTRATOEMPTMO) HE '+

          '  WHERE HE.IDCONTRATOEMPTMO  = CE.IDCONTRATOEMPTMO '+
          '    AND CE.IDPESSOA          = PE.IDPESSOA '+
          '    AND CE.IDPESSOA          = EL.IDPESSOA '+
          '    AND CE.IDPATRO           = EL.IDPESSJUR '+
          '    AND PE.IDENDCORRESP      = EP.IDENDERECO '+
          '    AND EP.IDCIDADES         = CI.IDCIDADES '+

          '  ORDER BY '+
          '    PE.NOME, '+
          '    EL.MATRICULA ';
  Result := GetDataPacket(sSql);
end;

function TCtrlGeraInformeEmptmo.BuscaDadosPessoais(psIdPessoa, psIdBenef,
  psIdPatro: String): OleVariant;
Var
  sSql : String;
begin
  sSql := ' SELECT '+#13#10+
          '   EL.MATRICULA, '+#13#10+
          '   PT.NOME AS TITULAR, '+#13#10+
          '   PB.NOME AS NOMEBENEF, '+#13#10+
          '   PB.NUMDOCUMENTO AS CPF, '+#13#10+
          '   EP.LOGRADOURO, '+#13#10+
          '   EP.CEP, '+#13#10+
          '   CI.NOME AS CIDADE, '+#13#10+
          '   ES.CODESTADO AS UF, '+#13#10+
          '   SP.FLGINTERNO, '+#13#10+
          '   LO.NOME AS LOTACAO '+#13#10+
          ' FROM '+#13#10+
          '   PESSOA PT, '+#13#10+
          '   PESSOA PB, '+#13#10+
          '   PESSOA LO, '+#13#10+
          '   ENDPESS EP, '+#13#10+
          '   ELEGPATRO EL, '+#13#10+
          '   PARTPREVPLAN PP, '+#13#10+
          '   CIDADES CI, '+#13#10+
          '   ESTADO ES, '+#13#10+
          '   SITPART SP '+#13#10+
          ' WHERE PP.IDPESSOA      = '+psIdPessoa+#13#10+
          '   AND PP.IDPESSJUR     = '+psIdPatro+#13#10+
          '   AND PP.FLGDESATIVADO = 0 '+#13#10+
          '   AND PP.IDPESSOA      = EL.IDPESSOA '+#13#10+
          '   AND PP.IDPESSJUR     = EL.IDPESSJUR '+#13#10+
          '   AND PT.IDPESSOA      = PP.IDPESSOA '+#13#10+
          '   AND PP.IDSITPART     = SP.IDSITPART '+#13#10+
          '   AND PB.IDPESSOA      = '+psIdBenef+#13#10+
          '   AND PB.IDENDCORRESP  = EP.IDENDERECO '+#13#10+
          '   AND EP.IDCIDADES     = CI.IDCIDADES '+#13#10+
          '   AND CI.IDESTADO      = ES.IDESTADO '+#13#10+
          '   AND LO.IDPESSOA      = EL.IDESTAB ';

  Result := GetDataPacket(sSql);
end;

function TCtrlGeraInformeEmptmo.BuscaSaldoDevedor(
  psIdContratoEmptmo, psAno: String): OleVariant;
Var
  sSql : String;

begin
  sSql := ' SELECT '+#13#10+
          '   HMEDATAATUALIZA, '+#13#10+
          '   HMESALDODEV, '+#13#10+
          '   HMETXJUROS, '+#13#10+
          '   HMEPARCELA, '+#13#10+
          '   HMEPARCELAALT, '+#13#10+
          '   HMENUMPARCELAS '+#13#10+
          'FROM '+#13#10+
          '   ( '+#13#10+
          '   SELECT '+#13#10+
          '      HME.HMEDATAATUALIZA, '+#13#10+
          '      HME.HMESALDODEV, '+#13#10+
          '      HME.HMETXJUROS, '+#13#10+
          '      HME.HMEPARCELA, '+#13#10+
          '      HME.HMEPARCELAALT, '+#13#10+
          '      HME.HMENUMPARCELAS, '+#13#10+
          '      HME.IDCONTRATOEMPTMO '+#13#10+
          '   FROM '+#13#10+
          '      HISTMOVEMPTMO HME, '+#13#10+
          '      ( '+#13#10+
          '      SELECT '+#13#10+
          '         MAX(HME.IDHISTMOVEMPTMO) AS IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO '+#13#10+
          '      FROM '+#13#10+
          '         HISTMOVEMPTMO   HME '+#13#10+
          '      WHERE '+#13#10+
          '             ( HME.IDCONTRATOEMPTMO     ='+psIdContratoEmptmo+' ) '+#13#10+
          '         AND ( HME.HMETIPOMOV           IN (1, 2, 3, 6, 8) ) '+#13#10+
          '         AND ( NVL(HME.FLGESTORNADO, 0) = 0 ) '+#13#10+
          '         AND ( HME.HMEDATAATUALIZA      ='+QuotedStr('31/12/'+psAno)+' ) '+#13#10+
          '      GROUP BY '+#13#10+
          '         HME.IDCONTRATOEMPTMO '+#13#10+
          '      ) MAXIMO, '+#13#10+
          '      ( '+#13#10+
          '      SELECT '+#13#10+
          '         MAX(HME.IDHISTMOVEMPTMO) AS IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO '+#13#10+
          '      FROM '+#13#10+
          '         HISTMOVEMPTMO   HME '+#13#10+
          '      WHERE '+#13#10+
          '             ( HME.IDCONTRATOEMPTMO     ='+psIdContratoEmptmo+' ) '+#13#10+
          '         AND ( HME.HMETIPOMOV           IN (0, 5) ) '+#13#10+
          '         AND ( NVL(HME.FLGESTORNADO, 0) = 0 ) '+#13#10+
          '         AND ( HME.HMEDATAATUALIZA      ='+QuotedStr('31/12/'+psAno)+' ) '+#13#10+
          '      GROUP BY '+#13#10+
          '         HME.IDCONTRATOEMPTMO '+#13#10+
          '      ) MAXDIA '+#13#10+
          '   WHERE '+#13#10+
          '          HME.IDCONTRATOEMPTMO          = '+psIdContratoEmptmo+#13#10+
          '      AND HME.IDCONTRATOEMPTMO          = MAXIMO.IDCONTRATOEMPTMO(+) '+#13#10+
          '      AND HME.IDCONTRATOEMPTMO          = MAXDIA.IDCONTRATOEMPTMO(+) '+#13#10+
          '      AND (HME.IDHISTMOVEMPTMO          = MAXIMO.IDHISTMOVEMPTMO OR HME.IDHISTMOVEMPTMO = MAXDIA.IDHISTMOVEMPTMO) '+#13#10+
          '   ORDER BY '+#13#10+
          '      DECODE(HMETIPOMOV, 0, 0, 1, 2, 2, 6, 3, 9, 4, 7, 5, 1, 6, 3, 7, 4, 8, 5, 8) DESC '+#13#10+
          '   ) '+#13#10+
          'WHERE '+#13#10+
          '   ROWNUM = 1 ';

  Result := GetDataPacket(sSql);          
end;

function TCtrlGeraInformeEmptmo.BuscaTipoContrato(psIdContrato: String): OleVariant;
Var
  sSql : String;
begin
  sSql := ' SELECT IDCONTRATOEMPTMO, IDTIPOCONTREMPTMO, IDPESSOA, IDBENEF, IDPATRO '+
          ' FROM CONTRATOEMPTMO '+
          ' WHERE IDCONTRATOEMPTMO = '+psIdContrato;
  Result := GetDataPacket(sSql);
end;

constructor TCtrlGeraInformeEmptmo.Create;
begin
  inherited;
  cdsContratos   := TClientDataSet.Create(nil);
  cdsHistorico   := TClientDataSet.Create(nil);
  cdsAux         := TClientDataSet.Create(nil);
  cdsAux2        := TClientDataSet.Create(nil);
  cdsAux3        := TClientDataSet.Create(nil);
  cdsAux4        := TClientDataSet.Create(nil);
  DecodeDate(Date, wAno, wMes, wDia);
end;

destructor TCtrlGeraInformeEmptmo.Destroy;
begin
  inherited;
  cdsContratos.Free;
  cdsHistorico.Free;
  cdsAux.Free;
  cdsAux2.Free;
  cdsAux3.Free;
  cdsAux4.Free;
end;

procedure TCtrlGeraInformeEmptmo.DoChangeDataBase;
begin
  inherited;
end;

procedure TCtrlGeraInformeEmptmo.GeraArquivo(pbSoAtivo: boolean; psNumDoc, psAno, psNomeArqAtivo, psNomeArqAtivoCaixa, psNomeArqFacultativo, psNomeArqAssistido, psNomeArqOutrasSit: String; var pProgessBar: TProgressBar);
Var
  sUltIdContrato, sIdPessoa, sIdBenef, sIdPatro : String;
  rCorrecaoMes, rCorrecaoItem4, rCorrecaoItem61, rAbateAmortizacaoMes, rAmortizacaoMes, rJuroMes, rJuroMesItem23, rJuroMesItem62, rMoraMes, rMultaMes, rSeguroMes, rAmortExtraMes, rTotPagtoAno, rEncargoAtrasoMes: Double;
  rValorItem17, rAmortizacaoItem64, rAmortizacaoAno: Double;
  iContador, iTotReg2Outros, iTotReg2Facultativo, iTotReg2Assistido, iTotReg2Ativo, iTotReg2AtivoCaixa, iTotReg2, iMes : Integer;
  bTemItem13NoMes, bTemItem13NoMesExcec, bTemItem13NoMesAbonado, bJaZerou: Boolean;

begin
  cdsContratos.Data := BuscaDados(psAno, psNumDoc, psNomeArqAtivo,
                                  psNomeArqAtivoCaixa, psNomeArqFacultativo,
                                  psNomeArqAssistido, psNomeArqOutrasSit);

  If Trim(psNomeArqAtivo) <> '' Then
  Begin
    AssignFile(ArqInformeAtivo, psNomeArqAtivo);
    ReWrite(ArqInformeAtivo);
  End;

  If Trim(psNomeArqAtivoCaixa) <> '' Then
  Begin
    AssignFile(ArqInformeAtivoCaixa, psNomeArqAtivoCaixa);
    ReWrite(ArqInformeAtivoCaixa);
  end;

  If Trim(psNomeArqFacultativo) <> '' Then
  Begin
    AssignFile(ArqInformeFacultativo, psNomeArqFacultativo);
    ReWrite(ArqInformeFacultativo);
  End;

  If Trim(psNomeArqAssistido) <> '' Then
  Begin
    AssignFile(ArqInformeAssistido, psNomeArqAssistido);
    ReWrite(ArqInformeAssistido);
  end;

  If Trim(psNomeArqOutrasSit) <> '' Then
  Begin
    AssignFile(ArqInformeOutros, psNomeArqOutrasSit);
    ReWrite(ArqInformeOutros);
  End;

  If Trim(psNomeArqAtivo) <> '' Then
    GravaRegistro1Ativo(psAno);

  If Trim(psNomeArqAtivoCaixa) <> '' Then
    GravaRegistro1AtivoCaixa(psAno);

  If Trim(psNomeArqFacultativo) <> '' Then
    GravaRegistro1Facultativo(psAno);

  If Trim(psNomeArqAssistido) <> '' Then
    GravaRegistro1Assistido(psAno);

  If Trim(psNomeArqOutrasSit) <> '' Then
    GravaRegistro1Outros(psAno);

  cdsContratos.First;
  iContador            := 0;
  iTotReg2Outros       := 0;
  iTotReg2Facultativo  := 0;
  iTotReg2Assistido    := 0;
  iTotReg2Ativo        := 0;
  iTotReg2AtivoCaixa   := 0;
  bTemItem13NoMes      := False;
  bTemItem13NoMesAbonado:= False;
  bTemItem13NoMesExcec := False;
  bJazerou             := False;  
  pProgessBar.Position := 0;
  pProgessBar.Max      := cdsContratos.RecordCount;
  frmProgresso.MostraFormProgresso('Processando',True,False,True,0,cdsContratos.RecordCount);

  While (not cdsContratos.Eof) Do
  Begin
    sUltIdContrato      := cdsContratos.FieldByName('IDCONTRATOEMPTMO').AsString;
    cdsHistorico.Data   := BuscaDadoshistorico(cdsContratos.FieldByName('IDCONTRATOEMPTMO').AsString, psAno);
    rValorItem17        := 0; 
    rCorrecaoMes        := 0;
    rCorrecaoItem4      := 0;
    rCorrecaoItem61     := 0;
    rAmortizacaoItem64  := 0;    
    rAbateAmortizacaoMes:= 0;
    rAmortizacaoMes     := 0;
    rJuroMes            := 0;
    rJuroMesItem23      := 0;
    rJuroMesItem62      := 0;
    rMoraMes            := 0;
    rMultaMes           := 0;
    rSeguroMes          := 0;
    rAmortExtraMes      := 0;
    rTotPagtoAno        := 0;
    rEncargoAtrasoMes   := 0;
    rAmortizacaoAno     := 0;
    iMes                := cdsHistorico.FieldByName('HMEMESCOMPETENCIA').AsInteger;
    While (not cdsHistorico.Eof) Do
    Begin
        If cdsContratos.FieldByName('IDTIPOCONTREMPTMO').AsInteger in [1, 2, 3, 4, 6] Then
        Begin
          If Copy(FormatDateTime('dd/mm/yyyy', cdsHistorico.FieldByName('HMEDATAPREVISTA').AsDateTime), 1, 2) = '21' Then
          Begin
            If bTemItem13NoMes Then
            Begin
              rAmortizacaoAno      := rAmortizacaoAno + (rAmortizacaoMes - rAbateAmortizacaoMes);
              rJuroMes             := rJuroMes + rJuroMesItem23;
              rCorrecaoMes         := rCorrecaoMes + rCorrecaoItem4;
              rAmortizacaoMes      := 0;
              rAbateAmortizacaoMes := 0;
              rJuroMesItem23       := 0;
              rCorrecaoItem4       := 0;
              bTemItem13NoMes      := False;
              bJazerou             := True;
            End
            Else
            Begin
              If cdsHistorico.FieldByName('ORDEM').AsInteger = 1 Then
              Begin
                rAmortizacaoMes      := 0;
                rAbateAmortizacaoMes := 0;
                rJuroMesItem23       := 0;
                rCorrecaoItem4       := 0;
              End;
            End;
          End
        End
        Else
        Begin
          If iMes <> cdsHistorico.FieldByName('HMEMESCOMPETENCIA').AsInteger Then
          Begin

            If (bTemItem13NoMesAbonado) or (not bTemItem13NoMesExcec) Then
            Begin
              rAmortizacaoMes := 0;
              rJuroMesItem62  := 0;
              rCorrecaoItem61 := 0;
              rAmortizacaoItem64:= 0;
            End;

            rAmortizacaoAno      := rAmortizacaoAno + (rAmortizacaoItem64 + rAmortizacaoMes - rAbateAmortizacaoMes);
            rAmortizacaoMes      := 0;
            rAbateAmortizacaoMes := 0;
            rAmortizacaoItem64   := 0;

            rJuroMes             := rJuroMes + rJuroMesItem23 + rJuroMesItem62;
            rJuroMesItem23       := 0;
            rJuroMesItem62       := 0;

            rCorrecaoMes         := rCorrecaoMes + rCorrecaoItem4 + rCorrecaoItem61;
            rCorrecaoItem4       := 0;
            rCorrecaoItem61      := 0;

            bTemItem13NoMes      := False;
            bTemItem13NoMesAbonado:= False;
            bTemItem13NoMesExcec := False;
          End;
        End;
      iMes := cdsHistorico.FieldByName('HMEMESCOMPETENCIA').AsInteger;

      {Só processar registro não estornado}
      if cdsHistorico.FieldByName('FLGESTORNADO').AsInteger = 0 Then
      Begin
        Case cdsContratos.FieldByName('IDTIPOCONTREMPTMO').AsInteger of
          {Tipo de Contrato Emergencial}
          1, 3, 6: Begin
                     ProcContrEmergencial(rAmortizacaoMes,
                                          rAbateAmortizacaoMes,
                                          rJuroMes,
                                          rJuroMesItem23,
                                          rMoraMes,
                                          rMultaMes,
                                          rSeguroMes,
                                          rAmortExtraMes,
                                          rCorrecaoMes,
                                          rCorrecaoItem4,
                                          rTotPagtoAno,
                                          rEncargoAtrasoMes,
                                          cdsHistorico.FieldByName('VALOR').AsFloat,
                                          cdsHistorico.FieldByName('HMEVLREFETIVO').AsFloat,
                                          cdsHistorico.FieldByName('IDITEMEMPTMO').AsInteger,
                                          cdsHistorico.FieldByName('HMEORIGEM').AsInteger,
                                          cdsHistorico.FieldByName('HMEANOCOMPETENCIA').AsString);
                    If (cdsHistorico.FieldByName('IDITEMEMPTMO').AsInteger = 13) And
                       (not ((cdsHistorico.FieldByName('IDTIPOSUSPEMPTMO').AsInteger = 6) And
                        (cdsHistorico.FieldByName('FLGSUSPENSAO').AsInteger = 1))) And
                        (cdsHistorico.FieldByName('FLGABONADO').AsInteger = 0) And
                        (((cdsHistorico.FieldByName('HMEDATAEFETIVA').AsDateTime >  StrToDate('31/12/2004')) And
                         (cdsHistorico.FieldByName('HMEDATAEFETIVA').AsDateTime <= StrToDate('31/12/2005'))) or
                        ((cdsHistorico.FieldByName('FLGQUITADO').AsInteger = 1) And
                        (cdsHistorico.FieldByName('HMEDATAQUITABONO').AsDateTime >  StrToDate('31/12/2004')) And
                        (cdsHistorico.FieldByName('HMEDATAQUITABONO').AsDateTime <= StrToDate('31/12/2005')))) And
                        (cdsHistorico.FieldByName('VALOR').AsFloat > 0) Then
                    Begin
                      bTemItem13NoMes := True;
                      bTemItem13NoMesExcec:= True;
                    End;
                  End;

          {Tipo de Contrato Consignação Especial}
          2 : Begin
                ProcContrConsigEspecial(rAmortizacaoMes,
                                        rAbateAmortizacaoMes,
                                        rJuroMes,
                                        rJuroMesItem23,
                                        rMoraMes,
                                        rMultaMes,
                                        rSeguroMes,
                                        rAmortExtraMes,
                                        rCorrecaoMes,
                                        rCorrecaoItem4,
                                        rTotPagtoAno,
                                        rEncargoAtrasoMes,
                                        cdsHistorico.FieldByName('VALOR').AsFloat,
                                        cdsHistorico.FieldByName('HMEVLREFETIVO').AsFloat,
                                        cdsHistorico.FieldByName('IDITEMEMPTMO').AsInteger,
                                        cdsHistorico.FieldByName('HMEORIGEM').AsInteger,
                                        cdsHistorico.FieldByName('HMEANOCOMPETENCIA').AsString);
                  If (cdsHistorico.FieldByName('IDITEMEMPTMO').AsInteger = 13) And
                     (not ((cdsHistorico.FieldByName('IDTIPOSUSPEMPTMO').AsInteger = 6) And
                      (cdsHistorico.FieldByName('FLGSUSPENSAO').AsInteger = 1))) And
                      (cdsHistorico.FieldByName('FLGABONADO').AsInteger = 0) And
                      (((cdsHistorico.FieldByName('HMEDATAEFETIVA').AsDateTime >  StrToDate('31/12/2004')) And
                       (cdsHistorico.FieldByName('HMEDATAEFETIVA').AsDateTime <= StrToDate('31/12/2005'))) or
                      ((cdsHistorico.FieldByName('FLGQUITADO').AsInteger = 1) And
                      (cdsHistorico.FieldByName('HMEDATAQUITABONO').AsDateTime >  StrToDate('31/12/2004')) And
                      (cdsHistorico.FieldByName('HMEDATAQUITABONO').AsDateTime <= StrToDate('31/12/2005')))) And
                      (cdsHistorico.FieldByName('VALOR').AsFloat > 0) Then
                  Begin
                    bTemItem13NoMes := True;
                    bTemItem13NoMesExcec:= True;
                  End;
              End;

          {Tipo de Contrato Especial}
          4 : Begin
                ProcContrEspecial(rAmortizacaoMes,
                                  rAbateAmortizacaoMes,
                                  rJuroMes,
                                  rJuroMesItem23,
                                  rMoraMes,
                                  rMultaMes,
                                  rSeguroMes,
                                  rAmortExtraMes,
                                  rCorrecaoMes,
                                  rCorrecaoItem4,
                                  rTotPagtoAno,
                                  rEncargoAtrasoMes,
                                  cdsHistorico.FieldByName('VALOR').AsFloat,
                                  cdsHistorico.FieldByName('HMEVLREFETIVO').AsFloat,
                                  cdsHistorico.FieldByName('IDITEMEMPTMO').AsInteger,
                                  cdsHistorico.FieldByName('HMEORIGEM').AsInteger,
                                  cdsHistorico.FieldByName('HMEANOCOMPETENCIA').AsString);

                  If (cdsHistorico.FieldByName('IDITEMEMPTMO').AsInteger = 13) And
                     (not ((cdsHistorico.FieldByName('IDTIPOSUSPEMPTMO').AsInteger = 6) And
                      (cdsHistorico.FieldByName('FLGSUSPENSAO').AsInteger = 1))) And
                      (cdsHistorico.FieldByName('FLGABONADO').AsInteger = 0) And
                      (((cdsHistorico.FieldByName('HMEDATAEFETIVA').AsDateTime >  StrToDate('31/12/2004')) And
                       (cdsHistorico.FieldByName('HMEDATAEFETIVA').AsDateTime <= StrToDate('31/12/2005'))) or
                      ((cdsHistorico.FieldByName('FLGQUITADO').AsInteger = 1) And
                      (cdsHistorico.FieldByName('HMEDATAQUITABONO').AsDateTime >  StrToDate('31/12/2004')) And
                      (cdsHistorico.FieldByName('HMEDATAQUITABONO').AsDateTime <= StrToDate('31/12/2005')))) And
                      (cdsHistorico.FieldByName('VALOR').AsFloat > 0) Then
                  Begin
                    bTemItem13NoMes := True;
                    bTemItem13NoMesExcec:= True;
                  End;
              End;

          {Tipo de Contrato de Crédito ao Participante}
          8, 9, 10, 11, 12, 13, 14, 15, 16: begin
                                              ProcContrCreditoParticipante(rAmortizacaoMes,
                                                                         rAbateAmortizacaoMes,
                                                                         rAmortizacaoItem64,
                                                                         rJuroMes,
                                                                         rJuroMesItem62,
                                                                         rMoraMes,
                                                                         rMultaMes,
                                                                         rSeguroMes,
                                                                         rAmortExtraMes,
                                                                         rCorrecaoMes,
                                                                         rCorrecaoItem61,
                                                                         rTotPagtoAno,
                                                                         rEncargoAtrasoMes,
                                                                         cdsHistorico.FieldByName('VALOR').AsFloat,
                                                                         cdsHistorico.FieldByName('HMEVLREFETIVO').AsFloat,
                                                                         cdsHistorico.FieldByName('IDITEMEMPTMO').AsInteger,
                                                                         cdsHistorico.FieldByName('HMEORIGEM').AsInteger,
                                                                         cdsHistorico.FieldByName('HMEANOCOMPETENCIA').AsString);

                                                   If (cdsHistorico.FieldByName('IDITEMEMPTMO').AsInteger = 13) And
                                                      (not ((cdsHistorico.FieldByName('IDTIPOSUSPEMPTMO').AsInteger = 6) And
                                                      (cdsHistorico.FieldByName('FLGSUSPENSAO').AsInteger = 1))) And
                                                      (cdsHistorico.FieldByName('FLGABONADO').AsInteger = 1) Then
                                                     bTemItem13NoMesAbonado := True;

                                                   If (cdsHistorico.FieldByName('IDITEMEMPTMO').AsInteger = 13) And
                                                      (not ((cdsHistorico.FieldByName('IDTIPOSUSPEMPTMO').AsInteger = 6) And
                                                      (cdsHistorico.FieldByName('FLGSUSPENSAO').AsInteger = 1))) And
                                                      (cdsHistorico.FieldByName('FLGABONADO').AsInteger = 0) And

                                                       (((cdsHistorico.FieldByName('HMEDATAEFETIVA').AsDateTime >  StrToDate('31/12/2004')) And
                                                        (cdsHistorico.FieldByName('HMEDATAEFETIVA').AsDateTime <= StrToDate('31/12/2005'))) or
                                                      ((cdsHistorico.FieldByName('FLGQUITADO').AsInteger = 1) And
                                                       (cdsHistorico.FieldByName('HMEDATAQUITABONO').AsDateTime >  StrToDate('31/12/2004')) And
                                                       (cdsHistorico.FieldByName('HMEDATAQUITABONO').AsDateTime <= StrToDate('31/12/2005')))) Then
                                                     bTemItem13NoMesExcec := True;
                                            End;
         End;
      End
      Else
      begin
        cdsHistorico.Next;
        Continue;
      End;
      cdsHistorico.Next;
    End;
    If bTemItem13NoMes Then
    Begin
      rAmortizacaoAno      := rAmortizacaoAno + (rAmortizacaoMes - rAbateAmortizacaoMes);
      rJuroMes             := rJuroMes + rJuroMesItem23;
      rCorrecaoMes         := rCorrecaoMes + rCorrecaoItem4;
    End
    Else
      If cdsContratos.FieldByName('IDTIPOCONTREMPTMO').AsInteger in [8, 9, 10, 11, 12, 13, 14, 15, 16] Then
      Begin
        If (not bTemItem13NoMesAbonado) And (bTemItem13NoMesExcec) Then
        Begin
          rJuroMes     := rJuroMes + rJuroMesItem62;
          rCorrecaoMes := rCorrecaoMes + rCorrecaoItem61;
          rAmortizacaoAno := rAmortizacaoAno + rAmortizacaoMes + rAmortizacaoItem64;
        End;
      End;

    rTotPagtoAno    := rAmortizacaoAno + rJuroMes + rMoraMes + rMultaMes + rSeguroMes + rAmortExtraMes + rCorrecaoMes;
    cdsAux2.Data    := BuscaSaldoDevedor(sUltIdContrato, psAno);
    if cdsContratos.FieldByName('IDPESSJURCEDIDO').AsString = '1' Then
    Begin
      If Trim(psNomeArqOutrasSit) <> '' Then
        GravaArquivoOutros(psNomeArqOutrasSit, psAno, rAmortizacaoAno, rJuroMes, rMoraMes, rMultaMes, rSeguroMes, rAmortExtraMes, rCorrecaoMes, rTotPagtoAno, rEncargoAtrasoMes, cdsAux2.FieldByName('HMESALDODEV').AsFloat, iTotReg2Outros)
    End
    Else
      if (cdsContratos.FieldByName('FLGINTERNO').AsString = 'AT') or
         (cdsContratos.FieldByName('FLGINTERNO').AsString = 'MP') Then
      Begin
        If cdsContratos.FieldByName('IDPATRO').AsInteger = 1 Then
        Begin
          If Trim(psNomeArqAtivo) <> '' Then
            GravaArquivoAtivo(psNomeArqAtivo, psAno, rAmortizacaoAno, rJuroMes, rMoraMes, rMultaMes, rSeguroMes, rAmortExtraMes, rCorrecaoMes, rTotPagtoAno, rEncargoAtrasoMes, cdsAux2.FieldByName('HMESALDODEV').AsFloat, iTotReg2Ativo);
        End
        Else
        Begin
          If Trim(psNomeArqAtivoCaixa) <> '' Then
            GravaArquivoAtivoCaixa(psNomeArqAtivoCaixa, psAno, rAmortizacaoAno, rJuroMes, rMoraMes, rMultaMes, rSeguroMes, rAmortExtraMes, rCorrecaoMes, rTotPagtoAno, rEncargoAtrasoMes, cdsAux2.FieldByName('HMESALDODEV').AsFloat, iTotReg2AtivoCaixa);
        End;
      End
      Else
      Begin
        if (cdsContratos.FieldByName('FLGINTERNO').AsString = 'MA') or
           (cdsContratos.FieldByName('FLGINTERNO').AsString = 'CA') or
           (cdsContratos.FieldByName('FLGINTERNO').AsString = 'MS') Then
        Begin
          If Trim(psNomeArqFacultativo) <> '' Then
            GravaArquivoFacultativo(psNomeArqFacultativo, psAno, rAmortizacaoAno, rJuroMes, rMoraMes, rMultaMes, rSeguroMes, rAmortExtraMes, rCorrecaoMes, rTotPagtoAno, rEncargoAtrasoMes, cdsAux2.FieldByName('HMESALDODEV').AsFloat, iTotReg2Facultativo);
        End
        Else
        Begin
          if (cdsContratos.FieldByName('FLGINTERNO').AsString = 'AS') or
             (cdsContratos.FieldByName('FLGINTERNO').AsString = '') Then
            If Trim(psNomeArqAssistido) <> '' Then
              GravaArquivoAssistido(psNomeArqAssistido, psAno, rAmortizacaoAno, rJuroMes, rMoraMes, rMultaMes, rSeguroMes, rAmortExtraMes, rCorrecaoMes, rTotPagtoAno, rEncargoAtrasoMes, cdsAux2.FieldByName('HMESALDODEV').AsFloat, iTotReg2Assistido);
        End;
      End;

    inc(iContador);
    frmProgresso.AndaFormProgresso(iContador);
    Application.ProcessMessages;

    pProgessBar.Position:=pProgessBar.Position + 1;

    cdsContratos.Next;
  End;
  GravaUltimoRegArquivos(1, iTotReg2Ativo, iTotReg2AtivoCaixa, iTotReg2Facultativo, iTotReg2Assistido, iTotReg2Outros, psNomeArqAtivo, psNomeArqAtivoCaixa, psNomeArqFacultativo, psNomeArqAssistido, psNomeArqOutrasSit);
  frmProgresso.EscondeFormProgresso;
  If Trim(psNomeArqAtivo) <> '' Then
    CloseFile(ArqInformeAtivo);

  If Trim(psNomeArqAtivoCaixa) <> '' Then
    CloseFile(ArqInformeAtivoCaixa);

  If Trim(psNomeArqFacultativo) <> '' Then
    CloseFile(ArqInformeFacultativo);

  If Trim(psNomeArqAssistido) <> '' Then
    CloseFile(ArqInformeAssistido);

  If Trim(psNomeArqOutrasSit) <> '' Then
    CloseFile(ArqInformeOutros);
end;

procedure TCtrlGeraInformeEmptmo.GravaArquivoAssistido(psNomeArquivo,
  psAno: String; prAmortizacao, prJuro, prMora, prMulta, prSeguro,
  prAmortExtra, prCorrecao, prTotPagtoAno, prEncargoAtraso,
  prSaldoDev: Double; var piTotReg2: Integer);
Var
  sReg2: String;
  iPosVirg: Integer;

begin
  sReg2 := '2'+
           StrPadLeft(Copy(cdscontratos.FieldByName('MATRICULA').AsString, 1, 7), 7, '0')+
           StrPadRight(Copy(cdscontratos.FieldByName('NOMEBENEF').AsString, 1, 40), 40, ' ')+
           StrPadLeft(Copy(cdscontratos.FieldByName('CPF').AsString, 1, 11), 11, '0')+
           StrPadRight(Copy(cdscontratos.FieldByName('LOGRADOURO').AsString, 1, 50), 50, ' ')+
           StrPadRight(Copy(cdscontratos.FieldByName('CIDADE').AsString, 1, 25), 25, ' ')+
           StrPadRight(Copy(cdscontratos.FieldByName('UF').AsString, 1, 2), 2, ' ')+
           StrPadRight(Copy(cdscontratos.FieldByName('CEP').AsString, 1, 8), 8, ' ');

           {grava amortização}
           iPosVirg := Pos(',', FloatToStr(prAmortizacao));
           If iPosVirg > 0 Then
             sReg2 := sReg2 +
             StrPadLeft(Copy(FloatToStr(prAmortizacao),1,Pos(',', FloatToStr(prAmortizacao))-1), 8, '0')+
             StrPadRight(Copy(FloatToStr(prAmortizacao),Pos(',', FloatToStr(prAmortizacao))+1, 2), 2, '0')
           Else
             sReg2 := sReg2 + StrPadLeft(FloatToStr(prAmortizacao) + '00', 10, '0');

           {grava juro}
           iPosVirg := Pos(',', FloatToStr(prJuro));
           If iPosVirg > 0 Then
             sReg2 := sReg2 +
             StrPadLeft(Copy(FloatToStr(prJuro),1,Pos(',', FloatToStr(prJuro))-1), 8, '0')+
             StrPadRight(Copy(FloatToStr(prJuro),Pos(',', FloatToStr(prJuro))+1, 2), 2, '0')
           Else
             sReg2 := sReg2 + StrPadLeft(FloatToStr(prJuro) + '00', 10, '0');

           {grava correção monetária}
           iPosVirg := Pos(',', FloatToStr(prCorrecao));
           If iPosVirg > 0 Then
             sReg2 := sReg2 +
             StrPadLeft(Copy(FloatToStr(prCorrecao),1,Pos(',', FloatToStr(prCorrecao))-1), 8, '0')+
             StrPadRight(Copy(FloatToStr(prCorrecao),Pos(',', FloatToStr(prCorrecao))+1, 2), 2, '0')
           Else
             sReg2 := sReg2 + StrPadLeft(FloatToStr(prCorrecao) + '00', 10, '0');

           {grava mora}
           iPosVirg := Pos(',', FloatToStr(prMora));
           If iPosVirg > 0 Then
             sReg2 := sReg2 +
             StrPadLeft(Copy(FloatToStr(prMora),1,Pos(',', FloatToStr(prMora))-1), 8, '0')+
             StrPadRight(Copy(FloatToStr(prMora),Pos(',', FloatToStr(prMora))+1, 2), 2, '0')
           Else
             sReg2 := sReg2 + StrPadLeft(FloatToStr(prMora) + '00', 10, '0');

           {grava multa}
           iPosVirg := Pos(',', FloatToStr(prMulta));
           If iPosVirg > 0 Then
             sReg2 := sReg2 +
             StrPadLeft(Copy(FloatToStr(prMulta),1,Pos(',', FloatToStr(prMulta))-1), 8, '0')+
             StrPadRight(Copy(FloatToStr(prMulta),Pos(',', FloatToStr(prMulta))+1, 2), 2, '0')
           Else
             sReg2 := sReg2 + StrPadLeft(FloatToStr(prMulta) + '00', 10, '0');

           {grava seguro}
           iPosVirg := Pos(',', FloatToStr(prSeguro));
           If iPosVirg > 0 Then
             sReg2 := sReg2 +
             StrPadLeft(Copy(FloatToStr(prSeguro),1,Pos(',', FloatToStr(prSeguro))-1), 8, '0')+
             StrPadRight(Copy(FloatToStr(prSeguro),Pos(',', FloatToStr(prSeguro))+1, 2), 2, '0')
           Else
             sReg2 := sReg2 + StrPadLeft(FloatToStr(prSeguro) + '00', 10, '0');

           {grava amortização extra}
           iPosVirg := Pos(',', FloatToStr(prAmortExtra));
           If iPosVirg > 0 Then
             sReg2 := sReg2 +
             StrPadLeft(Copy(FloatToStr(prAmortExtra),1,Pos(',', FloatToStr(prAmortExtra))-1), 8, '0')+
             StrPadRight(Copy(FloatToStr(prAmortExtra),Pos(',', FloatToStr(prAmortExtra))+1, 2), 2, '0')
           Else
             sReg2 := sReg2 + StrPadLeft(FloatToStr(prAmortExtra) + '00', 10, '0');

           {grava total pago no ano}
           iPosVirg := Pos(',', FloatToStr(prTotPagtoAno));
           If iPosVirg > 0 Then
             sReg2 := sReg2 +
             StrPadLeft(Copy(FloatToStr(prTotPagtoAno),1,Pos(',', FloatToStr(prTotPagtoAno))-1), 8, '0')+
             StrPadRight(Copy(FloatToStr(prTotPagtoAno),Pos(',', FloatToStr(prTotPagtoAno))+1, 2), 2, '0')
           Else
             sReg2 := sReg2 + StrPadLeft(FloatToStr(prTotPagtoAno) + '00', 10, '0');

           {Saldo Devedor}
           iPosVirg := Pos(',', FloatToStr(prSaldoDev));
           If iPosVirg > 0 Then
             sReg2 := sReg2 +
             StrPadLeft(Copy(FloatToStr(prSaldoDev),1,Pos(',', FloatToStr(prSaldoDev))-1), 8, '0')+
             StrPadRight(Copy(FloatToStr(prSaldoDev),Pos(',', FloatToStr(prSaldoDev))+1, 2), 2, '0')
           Else
             sReg2 := sReg2 + StrPadLeft(FloatToStr(prSaldoDev) + '00', 10, '0');

           {grava encargos por atraso}
           prEncargoAtraso := RoundCM(prEncargoAtraso,2);
           iPosVirg := Pos(',', FloatToStr(prEncargoAtraso));
           If iPosVirg > 0 Then
             sReg2 := sReg2 +
             StrPadLeft(Copy(FloatToStr(prEncargoAtraso),1,Pos(',', FloatToStr(prEncargoAtraso))-1), 8, '0')+
             StrPadRight(Copy(FloatToStr(prEncargoAtraso),Pos(',', FloatToStr(prEncargoAtraso))+1, 2), 2, '0')
           Else
             sReg2 := sReg2 + StrPadLeft(FloatToStr(prEncargoAtraso) + '00', 10, '0');

  Writeln(ArqInformeAssistido, sReg2);
  Inc(piTotReg2);
end;

procedure TCtrlGeraInformeEmptmo.GravaArquivoAtivo(psNomeArquivo, psAno: String;
  prAmortizacao, prJuro, prMora, prMulta, prSeguro, prAmortExtra,
  prCorrecao, prTotPagtoAno, prEncargoAtraso, prSaldoDev: Double; var piTotReg2: Integer);
Var
  sReg2: String;
  iPosVirg: Integer;

begin
  sReg2 := '2'+
           StrPadLeft(Copy(cdscontratos.FieldByName('MATRICULA').AsString, 1, 7), 7, '0')+
           StrPadRight(Copy(cdscontratos.FieldByName('NOMEBENEF').AsString, 1, 40), 40, ' ')+
           StrPadLeft(Copy(cdscontratos.FieldByName('CPF').AsString, 1, 11), 11, '0')+
           StrPadLeft(Copy(cdscontratos.FieldByName('CODLOTACAO').AsString, 1, 4), 4, '0')+
           StrPadRight(Copy(cdscontratos.FieldByName('LOTACAO').AsString, 1, 50), 50, ' ')+
           StrPadRight(Copy(cdscontratos.FieldByName('UF_LOTACAO').AsString, 1, 25), 25, ' ');

           {grava amortização}
           iPosVirg := Pos(',', FloatToStr(prAmortizacao));
           If iPosVirg > 0 Then
             sReg2 := sReg2 +
             StrPadLeft(Copy(FloatToStr(prAmortizacao),1,Pos(',', FloatToStr(prAmortizacao))-1), 8, '0')+
             StrPadRight(Copy(FloatToStr(prAmortizacao),Pos(',', FloatToStr(prAmortizacao))+1, 2), 2, '0')
           Else
             sReg2 := sReg2 + StrPadLeft(FloatToStr(prAmortizacao) + '00', 10, '0');

           {grava juro}
           iPosVirg := Pos(',', FloatToStr(prJuro));
           If iPosVirg > 0 Then
             sReg2 := sReg2 +
             StrPadLeft(Copy(FloatToStr(prJuro),1,Pos(',', FloatToStr(prJuro))-1), 8, '0')+
             StrPadRight(Copy(FloatToStr(prJuro),Pos(',', FloatToStr(prJuro))+1, 2), 2, '0')
           Else
             sReg2 := sReg2 + StrPadLeft(FloatToStr(prJuro) + '00', 10, '0');

           {grava correção monetária}
           iPosVirg := Pos(',', FloatToStr(prCorrecao));
           If iPosVirg > 0 Then
             sReg2 := sReg2 +
             StrPadLeft(Copy(FloatToStr(prCorrecao),1,Pos(',', FloatToStr(prCorrecao))-1), 8, '0')+
             StrPadRight(Copy(FloatToStr(prCorrecao),Pos(',', FloatToStr(prCorrecao))+1, 2), 2, '0')
           Else
             sReg2 := sReg2 + StrPadLeft(FloatToStr(prCorrecao) + '00', 10, '0');

           {grava mora}
           iPosVirg := Pos(',', FloatToStr(prMora));
           If iPosVirg > 0 Then
             sReg2 := sReg2 +
             StrPadLeft(Copy(FloatToStr(prMora),1,Pos(',', FloatToStr(prMora))-1), 8, '0')+
             StrPadRight(Copy(FloatToStr(prMora),Pos(',', FloatToStr(prMora))+1, 2), 2, '0')
           Else
             sReg2 := sReg2 + StrPadLeft(FloatToStr(prMora) + '00', 10, '0');

           {grava multa}
           iPosVirg := Pos(',', FloatToStr(prMulta));
           If iPosVirg > 0 Then
             sReg2 := sReg2 +
             StrPadLeft(Copy(FloatToStr(prMulta),1,Pos(',', FloatToStr(prMulta))-1), 8, '0')+
             StrPadRight(Copy(FloatToStr(prMulta),Pos(',', FloatToStr(prMulta))+1, 2), 2, '0')
           Else
             sReg2 := sReg2 + StrPadLeft(FloatToStr(prMulta) + '00', 10, '0');

           {grava seguro}
           iPosVirg := Pos(',', FloatToStr(prSeguro));
           If iPosVirg > 0 Then
             sReg2 := sReg2 +
             StrPadLeft(Copy(FloatToStr(prSeguro),1,Pos(',', FloatToStr(prSeguro))-1), 8, '0')+
             StrPadRight(Copy(FloatToStr(prSeguro),Pos(',', FloatToStr(prSeguro))+1, 2), 2, '0')
           Else
             sReg2 := sReg2 + StrPadLeft(FloatToStr(prSeguro) + '00', 10, '0');

           {grava amortização extra}
           iPosVirg := Pos(',', FloatToStr(prAmortExtra));
           If iPosVirg > 0 Then
             sReg2 := sReg2 +
             StrPadLeft(Copy(FloatToStr(prAmortExtra),1,Pos(',', FloatToStr(prAmortExtra))-1), 8, '0')+
             StrPadRight(Copy(FloatToStr(prAmortExtra),Pos(',', FloatToStr(prAmortExtra))+1, 2), 2, '0')
           Else
             sReg2 := sReg2 + StrPadLeft(FloatToStr(prAmortExtra) + '00', 10, '0');

           {grava total pago no ano}
           iPosVirg := Pos(',', FloatToStr(prTotPagtoAno));
           If iPosVirg > 0 Then
             sReg2 := sReg2 +
             StrPadLeft(Copy(FloatToStr(prTotPagtoAno),1,Pos(',', FloatToStr(prTotPagtoAno))-1), 8, '0')+
             StrPadRight(Copy(FloatToStr(prTotPagtoAno),Pos(',', FloatToStr(prTotPagtoAno))+1, 2), 2, '0')
           Else
             sReg2 := sReg2 + StrPadLeft(FloatToStr(prTotPagtoAno) + '00', 10, '0');

           {Saldo Devedor}
           iPosVirg := Pos(',', FloatToStr(prSaldoDev));
           If iPosVirg > 0 Then
             sReg2 := sReg2 +
             StrPadLeft(Copy(FloatToStr(prSaldoDev),1,Pos(',', FloatToStr(prSaldoDev))-1), 8, '0')+
             StrPadRight(Copy(FloatToStr(prSaldoDev),Pos(',', FloatToStr(prSaldoDev))+1, 2), 2, '0')
           Else
             sReg2 := sReg2 + StrPadLeft(FloatToStr(prSaldoDev) + '00', 10, '0');

           {grava encargos por atraso}
           prEncargoAtraso := RoundCM(prEncargoAtraso,2);
           iPosVirg := Pos(',', FloatToStr(prEncargoAtraso));
           If iPosVirg > 0 Then
             sReg2 := sReg2 +
             StrPadLeft(Copy(FloatToStr(prEncargoAtraso),1,Pos(',', FloatToStr(prEncargoAtraso))-1), 8, '0')+
             StrPadRight(Copy(FloatToStr(prEncargoAtraso),Pos(',', FloatToStr(prEncargoAtraso))+1, 2), 2, '0')
           Else
             sReg2 := sReg2 + StrPadLeft(FloatToStr(prEncargoAtraso) + '00', 10, '0');

  Writeln(ArqInformeAtivo, sReg2);
  Inc(piTotReg2);
end;

procedure TCtrlGeraInformeEmptmo.GravaArquivoAtivoCaixa(psNomeArquivo,
  psAno: String; prAmortizacao, prJuro, prMora, prMulta, prSeguro,
  prAmortExtra, prCorrecao, prTotPagtoAno, prEncargoAtraso,
  prSaldoDev: Double; var piTotReg2: Integer);
Var
  sReg2: String;
  iPosVirg : Integer;

begin

  sReg2 := '2'+
           StrPadLeft(Copy(cdscontratos.FieldByName('MATRICULA').AsString, 1, 7), 7, '0')+
           StrPadRight(Copy(cdscontratos.FieldByName('NOMEBENEF').AsString, 1, 40), 40, ' ')+
           StrPadLeft(Copy(cdscontratos.FieldByName('CPF').AsString, 1, 11), 11, '0')+
           StrPadLeft(Copy(cdscontratos.FieldByName('CODLOTACAO').AsString, 1, 4), 4, '0')+
           StrPadRight(Copy(cdscontratos.FieldByName('LOTACAO').AsString, 1, 50), 50, ' ')+
           StrPadRight(Copy(cdscontratos.FieldByName('UF_LOTACAO').AsString, 1, 25), 25, ' ');

           {grava amortização}
           iPosVirg := Pos(',', FloatToStr(prAmortizacao));
           If iPosVirg > 0 Then
             sReg2 := sReg2 +
             StrPadLeft(Copy(FloatToStr(prAmortizacao),1,Pos(',', FloatToStr(prAmortizacao))-1), 8, '0')+
             StrPadRight(Copy(FloatToStr(prAmortizacao),Pos(',', FloatToStr(prAmortizacao))+1, 2), 2, '0')
           Else
             sReg2 := sReg2 + StrPadLeft(FloatToStr(prAmortizacao) + '00', 10, '0');

           {grava juro}
           iPosVirg := Pos(',', FloatToStr(prJuro));
           If iPosVirg > 0 Then
             sReg2 := sReg2 +
             StrPadLeft(Copy(FloatToStr(prJuro),1,Pos(',', FloatToStr(prJuro))-1), 8, '0')+
             StrPadRight(Copy(FloatToStr(prJuro),Pos(',', FloatToStr(prJuro))+1, 2), 2, '0')
           Else
             sReg2 := sReg2 + StrPadLeft(FloatToStr(prJuro) + '00', 10, '0');

           {grava correção monetária}
           iPosVirg := Pos(',', FloatToStr(prCorrecao));
           If iPosVirg > 0 Then
             sReg2 := sReg2 +
             StrPadLeft(Copy(FloatToStr(prCorrecao),1,Pos(',', FloatToStr(prCorrecao))-1), 8, '0')+
             StrPadRight(Copy(FloatToStr(prCorrecao),Pos(',', FloatToStr(prCorrecao))+1, 2), 2, '0')
           Else
             sReg2 := sReg2 + StrPadLeft(FloatToStr(prCorrecao) + '00', 10, '0');

           {grava mora}
           iPosVirg := Pos(',', FloatToStr(prMora));
           If iPosVirg > 0 Then
             sReg2 := sReg2 +
             StrPadLeft(Copy(FloatToStr(prMora),1,Pos(',', FloatToStr(prMora))-1), 8, '0')+
             StrPadRight(Copy(FloatToStr(prMora),Pos(',', FloatToStr(prMora))+1, 2), 2, '0')
           Else
             sReg2 := sReg2 + StrPadLeft(FloatToStr(prMora) + '00', 10, '0');

           {grava multa}
           iPosVirg := Pos(',', FloatToStr(prMulta));
           If iPosVirg > 0 Then
             sReg2 := sReg2 +
             StrPadLeft(Copy(FloatToStr(prMulta),1,Pos(',', FloatToStr(prMulta))-1), 8, '0')+
             StrPadRight(Copy(FloatToStr(prMulta),Pos(',', FloatToStr(prMulta))+1, 2), 2, '0')
           Else
             sReg2 := sReg2 + StrPadLeft(FloatToStr(prMulta) + '00', 10, '0');

           {grava seguro}
           iPosVirg := Pos(',', FloatToStr(prSeguro));
           If iPosVirg > 0 Then
             sReg2 := sReg2 +
             StrPadLeft(Copy(FloatToStr(prSeguro),1,Pos(',', FloatToStr(prSeguro))-1), 8, '0')+
             StrPadRight(Copy(FloatToStr(prSeguro),Pos(',', FloatToStr(prSeguro))+1, 2), 2, '0')
           Else
             sReg2 := sReg2 + StrPadLeft(FloatToStr(prSeguro) + '00', 10, '0');

           {grava amortização extra}
           iPosVirg := Pos(',', FloatToStr(prAmortExtra));
           If iPosVirg > 0 Then
             sReg2 := sReg2 +
             StrPadLeft(Copy(FloatToStr(prAmortExtra),1,Pos(',', FloatToStr(prAmortExtra))-1), 8, '0')+
             StrPadRight(Copy(FloatToStr(prAmortExtra),Pos(',', FloatToStr(prAmortExtra))+1, 2), 2, '0')
           Else
             sReg2 := sReg2 + StrPadLeft(FloatToStr(prAmortExtra) + '00', 10, '0');

           {grava total pago no ano}
           iPosVirg := Pos(',', FloatToStr(prTotPagtoAno));
           If iPosVirg > 0 Then
             sReg2 := sReg2 +
             StrPadLeft(Copy(FloatToStr(prTotPagtoAno),1,Pos(',', FloatToStr(prTotPagtoAno))-1), 8, '0')+
             StrPadRight(Copy(FloatToStr(prTotPagtoAno),Pos(',', FloatToStr(prTotPagtoAno))+1, 2), 2, '0')
           Else
             sReg2 := sReg2 + StrPadLeft(FloatToStr(prTotPagtoAno) + '00', 10, '0');

           {Saldo Devedor}
           iPosVirg := Pos(',', FloatToStr(prSaldoDev));
           If iPosVirg > 0 Then
             sReg2 := sReg2 +
             StrPadLeft(Copy(FloatToStr(prSaldoDev),1,Pos(',', FloatToStr(prSaldoDev))-1), 8, '0')+
             StrPadRight(Copy(FloatToStr(prSaldoDev),Pos(',', FloatToStr(prSaldoDev))+1, 2), 2, '0')
           Else
             sReg2 := sReg2 + StrPadLeft(FloatToStr(prSaldoDev) + '00', 10, '0');

           {grava encargos por atraso}
           prEncargoAtraso := RoundCM(prEncargoAtraso,2);
           iPosVirg := Pos(',', FloatToStr(prEncargoAtraso));
           If iPosVirg > 0 Then
             sReg2 := sReg2 +
             StrPadLeft(Copy(FloatToStr(prEncargoAtraso),1,Pos(',', FloatToStr(prEncargoAtraso))-1), 8, '0')+
             StrPadRight(Copy(FloatToStr(prEncargoAtraso),Pos(',', FloatToStr(prEncargoAtraso))+1, 2), 2, '0')
           Else
             sReg2 := sReg2 + StrPadLeft(FloatToStr(prEncargoAtraso) + '00', 10, '0');

  Writeln(ArqInformeAtivoCaixa, sReg2);
  Inc(piTotReg2);
end;

procedure TCtrlGeraInformeEmptmo.GravaArquivoFacultativo(psNomeArquivo,
  psAno: String; prAmortizacao, prJuro, prMora, prMulta, prSeguro,
  prAmortExtra, prCorrecao, prTotPagtoAno, prEncargoAtraso,
  prSaldoDev: Double; var piTotReg2: Integer);
Var
  sReg2 : String;
  iPosVirg: Integer;

begin
  sReg2 := '2'+
           StrPadLeft(Copy(cdscontratos.FieldByName('MATRICULA').AsString, 1, 7), 7, '0')+
           StrPadRight(Copy(cdscontratos.FieldByName('NOMEBENEF').AsString, 1, 40), 40, ' ')+
           StrPadLeft(Copy(cdscontratos.FieldByName('CPF').AsString, 1, 11), 11, '0')+
           StrPadRight(Copy(cdscontratos.FieldByName('LOGRADOURO').AsString, 1, 50), 50, ' ')+
           StrPadRight(Copy(cdscontratos.FieldByName('CIDADE').AsString, 1, 25), 25, ' ')+
           StrPadRight(Copy(cdscontratos.FieldByName('UF').AsString, 1, 2), 2, ' ')+
           StrPadRight(Copy(cdscontratos.FieldByName('CEP').AsString, 1, 8), 8, ' ');

           {grava amortização}
           iPosVirg := Pos(',', FloatToStr(prAmortizacao));
           If iPosVirg > 0 Then
             sReg2 := sReg2 +
             StrPadLeft(Copy(FloatToStr(prAmortizacao),1,Pos(',', FloatToStr(prAmortizacao))-1), 8, '0')+
             StrPadRight(Copy(FloatToStr(prAmortizacao),Pos(',', FloatToStr(prAmortizacao))+1, 2), 2, '0')
           Else
             sReg2 := sReg2 + StrPadLeft(FloatToStr(prAmortizacao) + '00', 10, '0');

           {grava juro}
           iPosVirg := Pos(',', FloatToStr(prJuro));
           If iPosVirg > 0 Then
             sReg2 := sReg2 +
             StrPadLeft(Copy(FloatToStr(prJuro),1,Pos(',', FloatToStr(prJuro))-1), 8, '0')+
             StrPadRight(Copy(FloatToStr(prJuro),Pos(',', FloatToStr(prJuro))+1, 2), 2, '0')
           Else
             sReg2 := sReg2 + StrPadLeft(FloatToStr(prJuro) + '00', 10, '0');

           {grava correção monetária}
           iPosVirg := Pos(',', FloatToStr(prCorrecao));
           If iPosVirg > 0 Then
             sReg2 := sReg2 +
             StrPadLeft(Copy(FloatToStr(prCorrecao),1,Pos(',', FloatToStr(prCorrecao))-1), 8, '0')+
             StrPadRight(Copy(FloatToStr(prCorrecao),Pos(',', FloatToStr(prCorrecao))+1, 2), 2, '0')
           Else
             sReg2 := sReg2 + StrPadLeft(FloatToStr(prCorrecao) + '00', 10, '0');

           {grava mora}
           iPosVirg := Pos(',', FloatToStr(prMora));
           If iPosVirg > 0 Then
             sReg2 := sReg2 +
             StrPadLeft(Copy(FloatToStr(prMora),1,Pos(',', FloatToStr(prMora))-1), 8, '0')+
             StrPadRight(Copy(FloatToStr(prMora),Pos(',', FloatToStr(prMora))+1, 2), 2, '0')
           Else
             sReg2 := sReg2 + StrPadLeft(FloatToStr(prMora) + '00', 10, '0');

           {grava multa}
           iPosVirg := Pos(',', FloatToStr(prMulta));
           If iPosVirg > 0 Then
             sReg2 := sReg2 +
             StrPadLeft(Copy(FloatToStr(prMulta),1,Pos(',', FloatToStr(prMulta))-1), 8, '0')+
             StrPadRight(Copy(FloatToStr(prMulta),Pos(',', FloatToStr(prMulta))+1, 2), 2, '0')
           Else
             sReg2 := sReg2 + StrPadLeft(FloatToStr(prMulta) + '00', 10, '0');

           {grava seguro}
           iPosVirg := Pos(',', FloatToStr(prSeguro));
           If iPosVirg > 0 Then
             sReg2 := sReg2 +
             StrPadLeft(Copy(FloatToStr(prSeguro),1,Pos(',', FloatToStr(prSeguro))-1), 8, '0')+
             StrPadRight(Copy(FloatToStr(prSeguro),Pos(',', FloatToStr(prSeguro))+1, 2), 2, '0')
           Else
             sReg2 := sReg2 + StrPadLeft(FloatToStr(prSeguro) + '00', 10, '0');

           {grava amortização extra}
           iPosVirg := Pos(',', FloatToStr(prAmortExtra));
           If iPosVirg > 0 Then
             sReg2 := sReg2 +
             StrPadLeft(Copy(FloatToStr(prAmortExtra),1,Pos(',', FloatToStr(prAmortExtra))-1), 8, '0')+
             StrPadRight(Copy(FloatToStr(prAmortExtra),Pos(',', FloatToStr(prAmortExtra))+1, 2), 2, '0')
           Else
             sReg2 := sReg2 + StrPadLeft(FloatToStr(prAmortExtra) + '00', 10, '0');

           {grava total pago no ano}
           iPosVirg := Pos(',', FloatToStr(prTotPagtoAno));
           If iPosVirg > 0 Then
             sReg2 := sReg2 +
             StrPadLeft(Copy(FloatToStr(prTotPagtoAno),1,Pos(',', FloatToStr(prTotPagtoAno))-1), 8, '0')+
             StrPadRight(Copy(FloatToStr(prTotPagtoAno),Pos(',', FloatToStr(prTotPagtoAno))+1, 2), 2, '0')
           Else
             sReg2 := sReg2 + StrPadLeft(FloatToStr(prTotPagtoAno) + '00', 10, '0');

           {Saldo Devedor}
           iPosVirg := Pos(',', FloatToStr(prSaldoDev));
           If iPosVirg > 0 Then
             sReg2 := sReg2 +
             StrPadLeft(Copy(FloatToStr(prSaldoDev),1,Pos(',', FloatToStr(prSaldoDev))-1), 8, '0')+
             StrPadRight(Copy(FloatToStr(prSaldoDev),Pos(',', FloatToStr(prSaldoDev))+1, 2), 2, '0')
           Else
             sReg2 := sReg2 + StrPadLeft(FloatToStr(prSaldoDev) + '00', 10, '0');

           {grava encargos por atraso}
           prEncargoAtraso := RoundCM(prEncargoAtraso,2);
           iPosVirg := Pos(',', FloatToStr(prEncargoAtraso));
           If iPosVirg > 0 Then
             sReg2 := sReg2 +
             StrPadLeft(Copy(FloatToStr(prEncargoAtraso),1,Pos(',', FloatToStr(prEncargoAtraso))-1), 8, '0')+
             StrPadRight(Copy(FloatToStr(prEncargoAtraso),Pos(',', FloatToStr(prEncargoAtraso))+1, 2), 2, '0')
           Else
             sReg2 := sReg2 + StrPadLeft(FloatToStr(prEncargoAtraso) + '00', 10, '0');

  Writeln(ArqInformeFacultativo, sReg2);
  Inc(piTotReg2);
end;

procedure TCtrlGeraInformeEmptmo.GravaArquivoOutros(psNomeArquivo,
  psAno: String; prAmortizacao, prJuro, prMora, prMulta, prSeguro,
  prAmortExtra, prCorrecao, prTotPagtoAno, prEncargoAtraso, prSaldoDev: Double; var piTotReg2: Integer);
Var
  sReg2 : String;
  iPosVirg: INteger;

begin
  sReg2 := '2'+
           StrPadLeft(Copy(cdscontratos.FieldByName('MATRICULA').AsString, 1, 7), 7, '0')+
           StrPadRight(Copy(cdscontratos.FieldByName('NOMEBENEF').AsString, 1, 40), 40, ' ')+
           StrPadLeft(Copy(cdscontratos.FieldByName('CPF').AsString, 1, 11), 11, '0')+
           StrPadLeft(Copy(cdscontratos.FieldByName('CODLOTACAO').AsString, 1, 4), 4, '0')+
           StrPadRight(Copy(cdscontratos.FieldByName('LOTACAO').AsString, 1, 50), 50, ' ')+
           StrPadRight(Copy(cdscontratos.FieldByName('UF_LOTACAO').AsString, 1, 25), 25, ' ');

           {grava amortização}
           iPosVirg := Pos(',', FloatToStr(prAmortizacao));
           If iPosVirg > 0 Then
             sReg2 := sReg2 +
             StrPadLeft(Copy(FloatToStr(prAmortizacao),1,Pos(',', FloatToStr(prAmortizacao))-1), 8, '0')+
             StrPadRight(Copy(FloatToStr(prAmortizacao),Pos(',', FloatToStr(prAmortizacao))+1, 2), 2, '0')
           Else
             sReg2 := sReg2 + StrPadLeft(FloatToStr(prAmortizacao) + '00', 10, '0');

           {grava juro}
           iPosVirg := Pos(',', FloatToStr(prJuro));
           If iPosVirg > 0 Then
             sReg2 := sReg2 +
             StrPadLeft(Copy(FloatToStr(prJuro),1,Pos(',', FloatToStr(prJuro))-1), 8, '0')+
             StrPadRight(Copy(FloatToStr(prJuro),Pos(',', FloatToStr(prJuro))+1, 2), 2, '0')
           Else
             sReg2 := sReg2 + StrPadLeft(FloatToStr(prJuro) + '00', 10, '0');

           {grava correção monetária}
           iPosVirg := Pos(',', FloatToStr(prCorrecao));
           If iPosVirg > 0 Then
             sReg2 := sReg2 +
             StrPadLeft(Copy(FloatToStr(prCorrecao),1,Pos(',', FloatToStr(prCorrecao))-1), 8, '0')+
             StrPadRight(Copy(FloatToStr(prCorrecao),Pos(',', FloatToStr(prCorrecao))+1, 2), 2, '0')
           Else
             sReg2 := sReg2 + StrPadLeft(FloatToStr(prCorrecao) + '00', 10, '0');

           {grava mora}
           iPosVirg := Pos(',', FloatToStr(prMora));
           If iPosVirg > 0 Then
             sReg2 := sReg2 +
             StrPadLeft(Copy(FloatToStr(prMora),1,Pos(',', FloatToStr(prMora))-1), 8, '0')+
             StrPadRight(Copy(FloatToStr(prMora),Pos(',', FloatToStr(prMora))+1, 2), 2, '0')
           Else
             sReg2 := sReg2 + StrPadLeft(FloatToStr(prMora) + '00', 10, '0');

           {grava multa}
           iPosVirg := Pos(',', FloatToStr(prMulta));
           If iPosVirg > 0 Then
             sReg2 := sReg2 +
             StrPadLeft(Copy(FloatToStr(prMulta),1,Pos(',', FloatToStr(prMulta))-1), 8, '0')+
             StrPadRight(Copy(FloatToStr(prMulta),Pos(',', FloatToStr(prMulta))+1, 2), 2, '0')
           Else
             sReg2 := sReg2 + StrPadLeft(FloatToStr(prMulta) + '00', 10, '0');

           {grava seguro}
           iPosVirg := Pos(',', FloatToStr(prSeguro));
           If iPosVirg > 0 Then
             sReg2 := sReg2 +
             StrPadLeft(Copy(FloatToStr(prSeguro),1,Pos(',', FloatToStr(prSeguro))-1), 8, '0')+
             StrPadRight(Copy(FloatToStr(prSeguro),Pos(',', FloatToStr(prSeguro))+1, 2), 2, '0')
           Else
             sReg2 := sReg2 + StrPadLeft(FloatToStr(prSeguro) + '00', 10, '0');

           {grava amortização extra}
           iPosVirg := Pos(',', FloatToStr(prAmortExtra));
           If iPosVirg > 0 Then
             sReg2 := sReg2 +
             StrPadLeft(Copy(FloatToStr(prAmortExtra),1,Pos(',', FloatToStr(prAmortExtra))-1), 8, '0')+
             StrPadRight(Copy(FloatToStr(prAmortExtra),Pos(',', FloatToStr(prAmortExtra))+1, 2), 2, '0')
           Else
             sReg2 := sReg2 + StrPadLeft(FloatToStr(prAmortExtra) + '00', 10, '0');

           {grava total pago no ano}
           iPosVirg := Pos(',', FloatToStr(prTotPagtoAno));
           If iPosVirg > 0 Then
             sReg2 := sReg2 +
             StrPadLeft(Copy(FloatToStr(prTotPagtoAno),1,Pos(',', FloatToStr(prTotPagtoAno))-1), 8, '0')+
             StrPadRight(Copy(FloatToStr(prTotPagtoAno),Pos(',', FloatToStr(prTotPagtoAno))+1, 2), 2, '0')
           Else
             sReg2 := sReg2 + StrPadLeft(FloatToStr(prTotPagtoAno) + '00', 10, '0');

           {Saldo Devedor}
           iPosVirg := Pos(',', FloatToStr(prSaldoDev));
           If iPosVirg > 0 Then
             sReg2 := sReg2 +
             StrPadLeft(Copy(FloatToStr(prSaldoDev),1,Pos(',', FloatToStr(prSaldoDev))-1), 8, '0')+
             StrPadRight(Copy(FloatToStr(prSaldoDev),Pos(',', FloatToStr(prSaldoDev))+1, 2), 2, '0')
           Else
             sReg2 := sReg2 + StrPadLeft(FloatToStr(prSaldoDev) + '00', 10, '0');

           {grava encargos por atraso}
           prEncargoAtraso := RoundCM(prEncargoAtraso,2);
           iPosVirg := Pos(',', FloatToStr(prEncargoAtraso));
           If iPosVirg > 0 Then
             sReg2 := sReg2 +
             StrPadLeft(Copy(FloatToStr(prEncargoAtraso),1,Pos(',', FloatToStr(prEncargoAtraso))-1), 8, '0')+
             StrPadRight(Copy(FloatToStr(prEncargoAtraso),Pos(',', FloatToStr(prEncargoAtraso))+1, 2), 2, '0')
           Else
             sReg2 := sReg2 + StrPadLeft(FloatToStr(prEncargoAtraso) + '00', 10, '0');

  Writeln(ArqInformeOutros, sReg2);
  Inc(piTotReg2);
end;

procedure TCtrlGeraInformeEmptmo.GravaRegistro1Assistido(psAno: String);
Var
  sLinha : String;

begin
  sLinha := '1FUNCEFEMPR_END  ';                                                           //Campo 1 - Valor passado pelo Cliente
  sLinha := sLinha + StrPadLeft(IntToStr(wDia), 2, '0') +
                     StrPadLeft(IntToStr(wMes), 2, '0') +
                     IntToStr(wAno);                                                       //Data DDMMAAAA
  sLinha := sLinha + IntToStr(wAno);                                                       //Ano Atual AAAA
  sLinha := sLinha + psAno;                                                                //Ano Base AAAA
  sLinha := sLinha + StrPadRight('Demonstrativo Anual para o Imposto de Renda', 211, ' '); //Campo 5 - Valor passado pelo Cliente
  Writeln(ArqInformeAssistido, sLinha);
end;

procedure TCtrlGeraInformeEmptmo.GravaRegistro1Ativo(psAno: String);
Var
  sLinha : String;

begin
  sLinha := '1FUNCEFEMPR_U_L  ';                                                           //Campo 1 - Valor passado pelo Cliente
  sLinha := sLinha + StrPadLeft(IntToStr(wDia), 2, '0') +
                     StrPadLeft(IntToStr(wMes), 2, '0') +
                     IntToStr(wAno);                                                       //Data DDMMAAAA
  sLinha := sLinha + IntToStr(wAno);                                                       //Ano Atual AAAA
  sLinha := sLinha + psAno;                                                                //Ano Base AAAA
  sLinha := sLinha + StrPadRight('Demonstrativo Anual para o Imposto de Renda', 201, ' '); //Campo 5 - Valor passado pelo Cliente
  Writeln(ArqInformeAtivo, sLinha);
end;

procedure TCtrlGeraInformeEmptmo.GravaRegistro1AtivoCaixa(psAno: String);
Var
  sLinha : String;

begin
  sLinha := '1FUNCEFEMPR_U_L  ';                                                           //Campo 1 - Valor passado pelo Cliente
  sLinha := sLinha + StrPadLeft(IntToStr(wDia), 2, '0') +
                     StrPadLeft(IntToStr(wMes), 2, '0') +
                     IntToStr(wAno);                                                       //Data DDMMAAAA
  sLinha := sLinha + IntToStr(wAno);                                                       //Ano Atual AAAA
  sLinha := sLinha + psAno;                                                                //Ano Base AAAA
  sLinha := sLinha + StrPadRight('Demonstrativo Anual para o Imposto de Renda', 201, ' '); //Campo 5 - Valor passado pelo Cliente
  Writeln(ArqInformeAtivoCaixa, sLinha);
end;

procedure TCtrlGeraInformeEmptmo.GravaRegistro1Facultativo(psAno: String);
Var
  sLinha : String;

begin
  sLinha := '1FUNCEFEMPR_END  ';                                                           //Campo 1 - Valor passado pelo Cliente
  sLinha := sLinha + StrPadLeft(IntToStr(wDia), 2, '0') +
                     StrPadLeft(IntToStr(wMes), 2, '0') +
                     IntToStr(wAno);                                                       //Data DDMMAAAA
  sLinha := sLinha + IntToStr(wAno);                                                       //Ano Atual AAAA
  sLinha := sLinha + psAno;                                                                //Ano Base AAAA
  sLinha := sLinha + StrPadRight('Demonstrativo Anual para o Imposto de Renda', 211, ' '); //Campo 5 - Valor passado pelo Cliente
  Writeln(ArqInformeFacultativo, sLinha);
end;

procedure TCtrlGeraInformeEmptmo.GravaRegistro1Outros(psAno: String);
Var
  sLinha : String;

begin
  sLinha := '1FUNCEFEMPR_U_L  ';                                                           //Campo 1 - Valor passado pelo Cliente
  sLinha := sLinha + StrPadLeft(IntToStr(wDia), 2, '0') +
                     StrPadLeft(IntToStr(wMes), 2, '0') +
                     IntToStr(wAno);                                                       //Data DDMMAAAA
  sLinha := sLinha + IntToStr(wAno);                                                       //Ano Atual AAAA
  sLinha := sLinha + psAno;                                                                //Ano Base AAAA
  sLinha := sLinha + StrPadRight('Demonstrativo Anual para o Imposto de Renda', 201, ' '); //Campo 5 - Valor passado pelo Cliente
  Writeln(ArqInformeOutros, sLinha);
end;

procedure TCtrlGeraInformeEmptmo.GravaUltimoRegArquivos(piTipoArq,
  piTotReg2Ativo, piTotReg2AtivoCaixa, piTotReg2Facultativo,
  piTotReg2Assistido, piTotReg2Outros: Integer;
  psNomeArqAtivo, psNomeArqAtivoCaixa, psNomeArqFacultativo, psNomeArqAssistido, psNomeArqOutrasSit : String);
begin
  If Trim(psNomeArqAtivo) <> '' Then
    Writeln(ArqInformeAtivo,       '9' + StrPadRight(IntToStr(piTotReg2Ativo), 233, ' '));

  If Trim(psNomeArqAtivoCaixa) <> '' Then
    Writeln(ArqInformeAtivoCaixa , '9' + StrPadRight(IntToStr(piTotReg2AtivoCaixa), 233, ' '));

  If Trim(psNomeArqFacultativo) <> '' Then
    Writeln(ArqInformeFacultativo, '9' + StrPadRight(IntToStr(piTotReg2Facultativo), 243, ' '));

  If Trim(psNomeArqAssistido) <> '' Then
    Writeln(ArqInformeAssistido,   '9' + StrPadRight(IntToStr(piTotReg2Assistido), 243, ' '));

  If Trim(psNomeArqOutrasSit) <> '' Then
    Writeln(ArqInformeOutros,      '9' + StrPadRight(IntToStr(piTotReg2Outros), 233, ' '));
end;

procedure TCtrlGeraInformeEmptmo.ProcContrConsigEspecial(var prAmortizacao,
  prAbateAmortizacao, prJuro, prJuroItem23, prMora, prMulta, prSeguro,
  prAmortExtra, prCorrecao, prCorrecaoItem4, prTotPagtoAno,
  prEncargoAtraso: Double; prValor, prValorEfet: Double; piIdItemEmptmo,
  piOrigem: Integer; psAno: String);
begin
  If Not ((cdsHistorico.FieldByName('FLGSUSPENSAO').AsInteger     = 1)  And
          (cdsHistorico.FieldByName('IDTIPOSUSPEMPTMO').AsInteger = 6)) Then
  Begin
    Case piIdItemEmptmo Of
      {Busca Itens de Amortização}
      13, 35               : If (piIdItemEmptmo = 35) And
                                (piOrigem       =  8) Then
                               prAmortizacao   := prAmortizacao   + prValor
                             Else
                               if (piIdItemEmptmo = 13) And
                                  (cdsHistorico.FieldByName('FLGABONADO').AsInteger = 0) And
                                  (((cdsHistorico.FieldByName('HMEDATAEFETIVA').AsDateTime >  StrToDate('31/12/2004')) And
                                   (cdsHistorico.FieldByName('HMEDATAEFETIVA').AsDateTime <= StrToDate('31/12/2005'))) or
                                  ((cdsHistorico.FieldByName('FLGQUITADO').AsInteger = 1) And
                                   (cdsHistorico.FieldByName('HMEDATAQUITABONO').AsDateTime >  StrToDate('31/12/2004')) And
                                   (cdsHistorico.FieldByName('HMEDATAQUITABONO').AsDateTime <= StrToDate('31/12/2005')))) And
                                  (prValor > 0) Then
                                 prAmortizacao   := prAmortizacao   + prValor;

      {Busca Itens para abater na Amortização}
       4, 23    : prAbateAmortizacao := prAbateAmortizacao + prValor;

      {Busca Itens de Juros}
      38, 43    : If (piIdItemEmptmo = 43) And
                           (((cdsHistorico.FieldByName('HMEDATAEFETIVA').AsDateTime >  StrToDate('31/12/2004')) And
                            (cdsHistorico.FieldByName('HMEDATAEFETIVA').AsDateTime <= StrToDate('31/12/2005'))) or
                           ((cdsHistorico.FieldByName('FLGQUITADO').AsInteger = 1) And
                           (cdsHistorico.FieldByName('HMEDATAQUITABONO').AsDateTime >  StrToDate('31/12/2004')) And
                           (cdsHistorico.FieldByName('HMEDATAQUITABONO').AsDateTime <= StrToDate('31/12/2005')))) And
                           (cdsHistorico.FieldByName('FLGABONADO').AsInteger = 0) Then
                        begin
                          if cdsHistorico.FieldByName('FLGQUITADO').AsInteger = 1 Then
                            prJuro := prJuro + prValor
                          Else
                            prJuro := prJuro + prValorEfet;
                        End
                        Else
                          If (piIdItemEmptmo = 38) Then
                            prJuro := prJuro + prValor;

      {Busca Correção Monetária}
      39, 42          : If (piIdItemEmptmo = 42) And
                           (((cdsHistorico.FieldByName('HMEDATAEFETIVA').AsDateTime >  StrToDate('31/12/2004')) And
                            (cdsHistorico.FieldByName('HMEDATAEFETIVA').AsDateTime <= StrToDate('31/12/2005'))) or
                          ((cdsHistorico.FieldByName('FLGQUITADO').AsInteger = 1) And
                           (cdsHistorico.FieldByName('HMEDATAQUITABONO').AsDateTime >  StrToDate('31/12/2004')) And
                           (cdsHistorico.FieldByName('HMEDATAQUITABONO').AsDateTime <= StrToDate('31/12/2005')))) And
                           (cdsHistorico.FieldByName('FLGABONADO').AsInteger = 0) Then
                        begin
                          if cdsHistorico.FieldByName('FLGQUITADO').AsInteger = 1 Then
                            prCorrecao := prCorrecao + prValor
                          Else
                            prCorrecao := prCorrecao + prValorEfet;
                        End
                        Else
                          If (piIdItemEmptmo = 39) Then
                            prCorrecao := prCorrecao + prValor;

      {Busca Itens de Mora}
      40, 46          : If (piIdItemEmptmo = 46) And
                           (((cdsHistorico.FieldByName('HMEDATAEFETIVA').AsDateTime >  StrToDate('31/12/2004')) And
                            (cdsHistorico.FieldByName('HMEDATAEFETIVA').AsDateTime <= StrToDate('31/12/2005'))) or
                          ((cdsHistorico.FieldByName('FLGQUITADO').AsInteger = 1) And
                           (cdsHistorico.FieldByName('HMEDATAQUITABONO').AsDateTime >  StrToDate('31/12/2004')) And
                           (cdsHistorico.FieldByName('HMEDATAQUITABONO').AsDateTime <= StrToDate('31/12/2005')))) And
                           (cdsHistorico.FieldByName('FLGABONADO').AsInteger = 0) Then
                        begin
                          if cdsHistorico.FieldByName('FLGQUITADO').AsInteger = 1 Then
                            prMora := prMora + prValor
                          Else
                            prMora := prMora + prValorEfet;
                        End
                        Else
                          If (piIdItemEmptmo = 40) Then
                            prMora := prMora + prValor;

      {Busca Itens de Multa}
      37, 44          : If (piIdItemEmptmo = 44) And
                           (((cdsHistorico.FieldByName('HMEDATAEFETIVA').AsDateTime >  StrToDate('31/12/2004')) And
                            (cdsHistorico.FieldByName('HMEDATAEFETIVA').AsDateTime <= StrToDate('31/12/2005'))) or
                          ((cdsHistorico.FieldByName('FLGQUITADO').AsInteger = 1) And
                           (cdsHistorico.FieldByName('HMEDATAQUITABONO').AsDateTime >  StrToDate('31/12/2004')) And
                           (cdsHistorico.FieldByName('HMEDATAQUITABONO').AsDateTime <= StrToDate('31/12/2005')))) And
                           (cdsHistorico.FieldByName('FLGABONADO').AsInteger = 0) Then
                        begin
                          if cdsHistorico.FieldByName('FLGQUITADO').AsInteger = 1 Then
                            prMulta := prMulta + prValor
                          Else
                            prMulta := prMulta + prValorEfet;
                        End
                        Else
                          If (piIdItemEmptmo = 37) Then
                            prMulta := prMulta + prValor;


      {Busca Itens de Seguro}
      20, 31 : begin
                           if psAno = '2005' Then
                           Begin
                             case piIdItemEmptmo of
                               20, 31, 50: prSeguro        := prSeguro           + prValor;
                               25, 29: If (piIdItemEmptmo = 25) And
                                          (piOrigem       =  3) Then
                                         prSeguro := prSeguro - prValor
                                       Else
                                         If (piIdItemEmptmo = 29) Then
                                           prSeguro := prSeguro - prValor;
                             End;
                           end;
                         end;

      {Busca Itens de Amortização Extraordinária}
      1          : If ((cdsHistorico.FieldByName('HMEDATAEFETIVA').AsDateTime >  StrToDate('31/12/2004')) And
                           (cdsHistorico.FieldByName('HMEDATAEFETIVA').AsDateTime <= StrToDate('31/12/2005'))) Then
                         prAmortExtra    := prAmortExtra    + prValorEfet;

    End;
    If piIdItemEmptmo = 23 Then
      prJuroItem23 := prJuroItem23 + prValor;

    If piIdItemEmptmo = 4  Then
      prCorrecaoItem4 := prCorrecaoItem4 + prValor;

    If (piIdItemEmptmo = 35) And
       (piOrigem      <>  8) Then
      prAmortExtra    := prAmortExtra    + prValor;
  End;

  If ((piIdItemEmptmo = 13) And
     (prValor > 0)) or
     (piIdItemEmptmo in [31, 42, 43, 44, 46]) Then
  Begin
    if ((cdsHistorico.FieldByName('HMETIPOMOV').AsInteger in [1, 2, 3, 4, 6, 7]) And
       ((cdsHistorico.FieldByName('HMECENTRALIZA').AsInteger = 1) Or
        (cdsHistorico.FieldByName('HMEDESTACADO').AsInteger = 1)) And
        (cdsHistorico.FieldByName('HMEDATAPREVISTA').AsDateTime <= StrToDate('31/12/2005'))) And

       ((cdsHistorico.FieldByName('HMEDATAEFETIVA').AsDateTime > StrToDate('31/12/2005')) Or
        (cdsHistorico.FieldByName('HMEDATAEFETIVA').IsNull)) And

       ((cdsHistorico.FieldByName('FLGQUITADO').AsInteger = 0) or
        ((cdsHistorico.FieldByName('FLGQUITADO').AsInteger = 1) And
         (cdsHistorico.FieldByName('HMEDATAQUITABONO').AsDateTime > StrToDate('31/12/2005')))) And

       ((cdsHistorico.FieldByName('FLGABONADO').AsInteger = 0) or
       ((cdsHistorico.FieldByName('FLGABONADO').AsInteger = 1) And
        (cdsHistorico.FieldByName('HMEDATAQUITABONO').AsDateTime > StrToDate('31/12/2005'))))
    Then
    Begin
      If cdsHistorico.FieldByName('IDTIPOSUSPEMPTMO').AsInteger > 0 Then
        cdsAux.Data :=
          GetDataPacket(' SELECT nvl(flgemaberto, 0) as flgemaberto FROM TIPOSUSPEMPTMO WHERE IDTIPOSUSPEMPTMO = '+cdsHistorico.FieldByName('IDTIPOSUSPEMPTMO').AsString)
      Else
      Begin
        prEncargoAtraso := prEncargoAtraso + prValor;
        Exit;
      End;

      If ((cdsHistorico.FieldByName('FLGSUSPENSAO').AsInteger = 0) Or
         ((cdsHistorico.FieldByName('FLGSUSPENSAO').AsInteger <> 0) And
          (cdsAux.FieldByName('FLGEMABERTO').AsInteger = 1))) Then
        prEncargoAtraso := prEncargoAtraso + prValor;
    End;
  End;
end;

procedure TCtrlGeraInformeEmptmo.ProcContrCreditoParticipante(
  var prAmortizacao, prAbateAmortizacao, prAmortizacaoItem64, prJuro, prJuroItem62, prMora, prMulta, prSeguro, prAmortExtra,
  prCorrecao, prCorrecaoItem61, prTotPagtoAno, prEncargoAtraso: Double; prValor, prValorEfet: Double;
  piIdItemEmptmo, piOrigem: Integer; psAno: String);
begin
  If Not ((cdsHistorico.FieldByName('FLGSUSPENSAO').AsInteger     = 1)  And
          (cdsHistorico.FieldByName('IDTIPOSUSPEMPTMO').AsInteger = 6)) Then
  Begin
    Case piIdItemEmptmo Of
      {Busca Itens de Amortização}
      35, 64         : If (piIdItemEmptmo = 35) And
                                (piOrigem       =  8) Then
                               prAmortizacao   := prAmortizacao   + prValor
                             Else
                               if (piIdItemEmptmo = 64) Then
                                 prAmortizacaoItem64 := prAmortizacaoItem64 + prValor;

      {Busca Itens de Juros}
      38, 43, 62           : If (piIdItemEmptmo = 43) And
                                (((cdsHistorico.FieldByName('HMEDATAEFETIVA').AsDateTime >  StrToDate('31/12/2004')) And
                                 (cdsHistorico.FieldByName('HMEDATAEFETIVA').AsDateTime <= StrToDate('31/12/2005'))) or
                                ((cdsHistorico.FieldByName('FLGQUITADO').AsInteger = 1) And
                                 (cdsHistorico.FieldByName('HMEDATAQUITABONO').AsDateTime >  StrToDate('31/12/2004')) And
                                 (cdsHistorico.FieldByName('HMEDATAQUITABONO').AsDateTime <= StrToDate('31/12/2005')))) And
                                (cdsHistorico.FieldByName('FLGABONADO').AsInteger = 0) Then
                             begin
                               if cdsHistorico.FieldByName('FLGQUITADO').AsInteger = 1 Then
                                 prJuro := prJuro + prValor
                               Else
                                 prJuro := prJuro + prValorEfet;
                             End
                             Else
                             Begin
                               If (piIdItemEmptmo = 38) Then
                                 prJuro := prJuro + prValor
                               Else
                                 If (piIdItemEmptmo = 62) Then
                                   prJuroItem62 := prJuroItem62 + prValor;
                             End;

      {Busca Correção Monetária}
      39, 42, 61           : If (piIdItemEmptmo = 42) And
                                (((cdsHistorico.FieldByName('HMEDATAEFETIVA').AsDateTime >  StrToDate('31/12/2004')) And
                                 (cdsHistorico.FieldByName('HMEDATAEFETIVA').AsDateTime <= StrToDate('31/12/2005'))) or
                                ((cdsHistorico.FieldByName('FLGQUITADO').AsInteger = 1) And
                                 (cdsHistorico.FieldByName('HMEDATAQUITABONO').AsDateTime >  StrToDate('31/12/2004')) And
                                 (cdsHistorico.FieldByName('HMEDATAQUITABONO').AsDateTime <= StrToDate('31/12/2005')))) And
                                (cdsHistorico.FieldByName('FLGABONADO').AsInteger = 0) Then
                             begin
                               if cdsHistorico.FieldByName('FLGQUITADO').AsInteger = 1 Then
                                 prCorrecao := prCorrecao + prValor
                               Else
                                 prCorrecao := prCorrecao + prValorEfet;
                             End
                             Else
                             Begin
                               If (piIdItemEmptmo = 39) Then
                                 prCorrecao := prCorrecao + prValor
                               Else
                                 If (piIdItemEmptmo = 61) Then
                                   prCorrecaoItem61 := prCorrecaoItem61 + prValor;
                             End;

      {Busca Itens de Mora}
      40, 46               : If (piIdItemEmptmo = 46) And
                                (((cdsHistorico.FieldByName('HMEDATAEFETIVA').AsDateTime >  StrToDate('31/12/2004')) And
                                 (cdsHistorico.FieldByName('HMEDATAEFETIVA').AsDateTime <= StrToDate('31/12/2005'))) or
                                ((cdsHistorico.FieldByName('FLGQUITADO').AsInteger = 1) And
                                 (cdsHistorico.FieldByName('HMEDATAQUITABONO').AsDateTime >  StrToDate('31/12/2004')) And
                                 (cdsHistorico.FieldByName('HMEDATAQUITABONO').AsDateTime <= StrToDate('31/12/2005')))) And
                                (cdsHistorico.FieldByName('FLGABONADO').AsInteger = 0) Then
                             begin
                               if cdsHistorico.FieldByName('FLGQUITADO').AsInteger = 1 Then
                                 prMora := prMora + prValor
                               Else
                                 prMora := prMora + prValorEfet;
                             End
                             Else
                               If (piIdItemEmptmo = 40) Then
                                 prMora := prMora + prValor;

      {Busca Itens de Multa}
      37, 44               : If (piIdItemEmptmo = 44) And
                                (((cdsHistorico.FieldByName('HMEDATAEFETIVA').AsDateTime >  StrToDate('31/12/2004')) And
                                 (cdsHistorico.FieldByName('HMEDATAEFETIVA').AsDateTime <= StrToDate('31/12/2005'))) or
                                ((cdsHistorico.FieldByName('FLGQUITADO').AsInteger = 1) And
                                 (cdsHistorico.FieldByName('HMEDATAQUITABONO').AsDateTime >  StrToDate('31/12/2004')) And
                                 (cdsHistorico.FieldByName('HMEDATAQUITABONO').AsDateTime <= StrToDate('31/12/2005')))) And
                                (cdsHistorico.FieldByName('FLGABONADO').AsInteger = 0) Then
                             begin
                               if cdsHistorico.FieldByName('FLGQUITADO').AsInteger = 1 Then
                                 prMulta := prMulta + prValor
                               Else
                                 prMulta := prMulta + prValorEfet;
                             End
                             Else
                               If (piIdItemEmptmo = 37) Then
                                 prMulta := prMulta + prValor;


      {Busca Itens de Seguro}
      20, 31  : begin
                            if psAno = '2005' Then
                            Begin
                              case piIdItemEmptmo of
                                20, 31: prSeguro        := prSeguro           + prValor;
                                25, 29: If (piIdItemEmptmo = 25) And
                                           (piOrigem       =  3) Then
                                          prSeguro := prSeguro - prValor
                                        Else
                                          If (piIdItemEmptmo = 29) Then
                                            prSeguro := prSeguro - prValor;
                              End;
                            end;
                          End;

      {Busca Itens de Amortização Extraordinária}
      1          : If ((cdsHistorico.FieldByName('HMEDATAEFETIVA').AsDateTime >  StrToDate('31/12/2004')) And
                           (cdsHistorico.FieldByName('HMEDATAEFETIVA').AsDateTime <= StrToDate('31/12/2005'))) Then
                         prAmortExtra    := prAmortExtra    + prValorEfet;
    End;
  End;

  If (piIdItemEmptmo = 35) And
     (piOrigem      <>  8) Then
    prAmortExtra := prAmortExtra + prValor;

  If ((piIdItemEmptmo = 13) And
     (prValor > 0)) or
     (piIdItemEmptmo in [31, 42, 43, 44, 46]) Then
  Begin
    if ((cdsHistorico.FieldByName('HMETIPOMOV').AsInteger in [1, 2, 3, 4, 6, 7]) And
       ((cdsHistorico.FieldByName('HMECENTRALIZA').AsInteger = 1) Or
        (cdsHistorico.FieldByName('HMEDESTACADO').AsInteger = 1)) And
        (cdsHistorico.FieldByName('HMEDATAPREVISTA').AsDateTime <= StrToDate('31/12/2005'))) And

       ((cdsHistorico.FieldByName('HMEDATAEFETIVA').AsDateTime > StrToDate('31/12/2005')) Or
        (cdsHistorico.FieldByName('HMEDATAEFETIVA').IsNull)) And

       ((cdsHistorico.FieldByName('FLGQUITADO').AsInteger = 0) or
        ((cdsHistorico.FieldByName('FLGQUITADO').AsInteger = 1) And
         (cdsHistorico.FieldByName('HMEDATAQUITABONO').AsDateTime > StrToDate('31/12/2005')))) And

       ((cdsHistorico.FieldByName('FLGABONADO').AsInteger = 0) or
       ((cdsHistorico.FieldByName('FLGABONADO').AsInteger = 1) And
        (cdsHistorico.FieldByName('HMEDATAQUITABONO').AsDateTime > StrToDate('31/12/2005'))))
    Then
    Begin
      If cdsHistorico.FieldByName('IDTIPOSUSPEMPTMO').AsInteger > 0 Then
        cdsAux.Data :=
          GetDataPacket(' SELECT nvl(flgemaberto, 0) as flgemaberto FROM TIPOSUSPEMPTMO WHERE IDTIPOSUSPEMPTMO = '+cdsHistorico.FieldByName('IDTIPOSUSPEMPTMO').AsString)
      Else
      Begin
        prEncargoAtraso := prEncargoAtraso + prValor;
        Exit;
      End;

      If ((cdsHistorico.FieldByName('FLGSUSPENSAO').AsInteger = 0) Or
         ((cdsHistorico.FieldByName('FLGSUSPENSAO').AsInteger <> 0) And
          (cdsAux.FieldByName('FLGEMABERTO').AsInteger = 1))) Then
        prEncargoAtraso := prEncargoAtraso + prValor;
    End;
  End;
end;

procedure TCtrlGeraInformeEmptmo.ProcContrEmergencial(var prAmortizacao, prAbateAmortizacao,
  prJuro, prJuroItem23, prMora, prMulta, prSeguro, prAmortExtra, prCorrecao, prCorrecaoItem4,
  prTotPagtoAno, prEncargoAtraso: Double;
  prValor, prValorEfet: Double; piIdItemEmptmo, piOrigem: Integer; psAno: String);
begin
  If Not ((cdsHistorico.FieldByName('FLGSUSPENSAO').AsInteger     = 1)   And
          (cdsHistorico.FieldByName('IDTIPOSUSPEMPTMO').AsInteger  = 6)) Then
  Begin
    Case piIdItemEmptmo Of
      {Busca Itens de Amortização}
      13, 35         : If (piIdItemEmptmo = 35) And
                                (piOrigem       =  8) Then
                               prAmortizacao   := prAmortizacao   + prValor
                             Else
                               if (piIdItemEmptmo = 13) And
                                  (cdsHistorico.FieldByName('FLGABONADO').AsInteger = 0) And
                                  (((cdsHistorico.FieldByName('HMEDATAEFETIVA').AsDateTime >  StrToDate('31/12/2004')) And
                                    (cdsHistorico.FieldByName('HMEDATAEFETIVA').AsDateTime <= StrToDate('31/12/2005'))) or
                                  ((cdsHistorico.FieldByName('FLGQUITADO').AsInteger = 1) And
                                   (cdsHistorico.FieldByName('HMEDATAQUITABONO').AsDateTime >  StrToDate('31/12/2004')) And
                                   (cdsHistorico.FieldByName('HMEDATAQUITABONO').AsDateTime <= StrToDate('31/12/2005')))) And
                                  (prValor > 0) Then
                                 prAmortizacao   := prAmortizacao   + prValor;

      {Busca Itens para abater na Amortização}
       4, 23    : prAbateAmortizacao := prAbateAmortizacao + prValor;

      {Busca Itens de Juros}
      38, 43    : If (piIdItemEmptmo = 43) And
                           (((cdsHistorico.FieldByName('HMEDATAEFETIVA').AsDateTime >  StrToDate('31/12/2004')) And
                            (cdsHistorico.FieldByName('HMEDATAEFETIVA').AsDateTime <= StrToDate('31/12/2005'))) or
                           ((cdsHistorico.FieldByName('FLGQUITADO').AsInteger = 1) And
                            (cdsHistorico.FieldByName('HMEDATAQUITABONO').AsDateTime >  StrToDate('31/12/2004')) And
                            (cdsHistorico.FieldByName('HMEDATAQUITABONO').AsDateTime <= StrToDate('31/12/2005')))) And
                            (cdsHistorico.FieldByName('FLGABONADO').AsInteger = 0) Then
                        begin
                          if cdsHistorico.FieldByName('FLGQUITADO').AsInteger = 1 Then
                            prJuro := prJuro + prValor
                          Else
                            prJuro := prJuro + prValorEfet;
                        End
                        Else
                          If (piIdItemEmptmo = 38) Then
                            prJuro := prJuro + prValor;

      {Busca Correção Monetária}
      39, 42          : If (piIdItemEmptmo = 42) And
                           (((cdsHistorico.FieldByName('HMEDATAEFETIVA').AsDateTime >  StrToDate('31/12/2004')) And
                            (cdsHistorico.FieldByName('HMEDATAEFETIVA').AsDateTime <= StrToDate('31/12/2005'))) or
                           ((cdsHistorico.FieldByName('FLGQUITADO').AsInteger = 1) And
                            (cdsHistorico.FieldByName('HMEDATAQUITABONO').AsDateTime >  StrToDate('31/12/2004')) And
                            (cdsHistorico.FieldByName('HMEDATAQUITABONO').AsDateTime <= StrToDate('31/12/2005')))) And
                           (cdsHistorico.FieldByName('FLGABONADO').AsInteger = 0) Then
                        begin
                          if cdsHistorico.FieldByName('FLGQUITADO').AsInteger = 1 Then
                            prCorrecao := prCorrecao + prValor
                          else
                            prCorrecao := prCorrecao + prValorEfet;
                        End
                        Else
                          If (piIdItemEmptmo = 39) Then
                            prCorrecao := prCorrecao + prValor;

      {Busca Itens de Mora}
      40, 46          : If (piIdItemEmptmo = 46) And
                           (((cdsHistorico.FieldByName('HMEDATAEFETIVA').AsDateTime >  StrToDate('31/12/2004')) And
                            (cdsHistorico.FieldByName('HMEDATAEFETIVA').AsDateTime <= StrToDate('31/12/2005'))) or
                           ((cdsHistorico.FieldByName('FLGQUITADO').AsInteger = 1) And
                            (cdsHistorico.FieldByName('HMEDATAQUITABONO').AsDateTime >  StrToDate('31/12/2004')) And
                            (cdsHistorico.FieldByName('HMEDATAQUITABONO').AsDateTime <= StrToDate('31/12/2005')))) And
                           (cdsHistorico.FieldByName('FLGABONADO').AsInteger = 0) Then
                        begin
                          if cdsHistorico.FieldByName('FLGQUITADO').AsInteger = 1 Then
                            prMora := prMora + prValor
                          Else
                            prMora := prMora + prValorEfet;
                        End
                        Else
                          If (piIdItemEmptmo = 40) Then
                            prMora := prMora + prValor;

      {Busca Itens de Multa}
      37, 44          : If (piIdItemEmptmo = 44) And
                           (((cdsHistorico.FieldByName('HMEDATAEFETIVA').AsDateTime >  StrToDate('31/12/2004')) And
                            (cdsHistorico.FieldByName('HMEDATAEFETIVA').AsDateTime <= StrToDate('31/12/2005'))) or
                           ((cdsHistorico.FieldByName('FLGQUITADO').AsInteger = 1) And
                            (cdsHistorico.FieldByName('HMEDATAQUITABONO').AsDateTime >  StrToDate('31/12/2004')) And
                            (cdsHistorico.FieldByName('HMEDATAQUITABONO').AsDateTime <= StrToDate('31/12/2005')))) And
                           (cdsHistorico.FieldByName('FLGABONADO').AsInteger = 0) Then
                        begin
                          if cdsHistorico.FieldByName('FLGQUITADO').AsInteger = 1 Then
                            prMulta := prMulta + prValor
                          Else
                            prMulta := prMulta + prValorEfet;
                        End
                        Else
                          If (piIdItemEmptmo = 37) Then
                            prMulta := prMulta + prValor;

      {Busca Itens de Seguro}
      20, 31  : begin
                          if psAno = '2005' Then
                          Begin
                            case piIdItemEmptmo of
                              20, 31: prSeguro        := prSeguro           + prValor;
                              25, 29: If (piIdItemEmptmo = 25) And
                                         (piOrigem       =  3) Then
                                        prSeguro := prSeguro - prValor
                                      Else
                                        If (piIdItemEmptmo = 29) Then
                                          prSeguro := prSeguro - prValor;
                            end;
                          End;  
                        End;

      {Busca Itens de Amortização Extraordinária}
      1          : If ((cdsHistorico.FieldByName('HMEDATAEFETIVA').AsDateTime >  StrToDate('31/12/2004')) And
                           (cdsHistorico.FieldByName('HMEDATAEFETIVA').AsDateTime <= StrToDate('31/12/2005'))) Then
                         prAmortExtra    := prAmortExtra    + prValorEfet;

    End;
    If piIdItemEmptmo = 23 Then
      prJuroItem23 := prJuroItem23 + prValor;

    If piIdItemEmptmo = 4  Then
      prCorrecaoItem4 := prCorrecaoItem4 + prValor;

    If (piIdItemEmptmo = 35) And
       (piOrigem      <>  8) Then
      prAmortExtra    := prAmortExtra    + prValor;

  End;
  If ((piIdItemEmptmo = 13) And
     (prValor > 0)) or
     (piIdItemEmptmo in [31, 42, 43, 44, 46]) Then
  Begin
    if ((cdsHistorico.FieldByName('HMETIPOMOV').AsInteger in [1, 2, 3, 4, 6, 7]) And
       ((cdsHistorico.FieldByName('HMECENTRALIZA').AsInteger = 1) Or
        (cdsHistorico.FieldByName('HMEDESTACADO').AsInteger = 1)) And
        (cdsHistorico.FieldByName('HMEDATAPREVISTA').AsDateTime <= StrToDate('31/12/2005'))) And

       ((cdsHistorico.FieldByName('HMEDATAEFETIVA').AsDateTime > StrToDate('31/12/2005')) Or
        (cdsHistorico.FieldByName('HMEDATAEFETIVA').IsNull)) And

       ((cdsHistorico.FieldByName('FLGQUITADO').AsInteger = 0) or
        ((cdsHistorico.FieldByName('FLGQUITADO').AsInteger = 1) And
         (cdsHistorico.FieldByName('HMEDATAQUITABONO').AsDateTime > StrToDate('31/12/2005')))) And

       ((cdsHistorico.FieldByName('FLGABONADO').AsInteger = 0) or
       ((cdsHistorico.FieldByName('FLGABONADO').AsInteger = 1) And
        (cdsHistorico.FieldByName('HMEDATAQUITABONO').AsDateTime > StrToDate('31/12/2005'))))
    Then
    Begin
      If cdsHistorico.FieldByName('IDTIPOSUSPEMPTMO').AsInteger > 0 Then
        cdsAux.Data :=
          GetDataPacket(' SELECT nvl(flgemaberto, 0) as flgemaberto FROM TIPOSUSPEMPTMO WHERE IDTIPOSUSPEMPTMO = '+cdsHistorico.FieldByName('IDTIPOSUSPEMPTMO').AsString)
      Else
      Begin
        prEncargoAtraso := prEncargoAtraso + prValor;
        Exit;
      End;

      If ((cdsHistorico.FieldByName('FLGSUSPENSAO').AsInteger = 0) Or
         ((cdsHistorico.FieldByName('FLGSUSPENSAO').AsInteger <> 0) And
          (cdsAux.FieldByName('FLGEMABERTO').AsInteger = 1))) Then
        prEncargoAtraso := prEncargoAtraso + prValor;
    End;
  End;
end;

procedure TCtrlGeraInformeEmptmo.ProcContrEspecial(var prAmortizacao, prAbateAmortizacao,
  prJuro, prJuroItem23, prMora, prMulta, prSeguro, prAmortExtra, prCorrecao, prCorrecaoItem4,
  prTotPagtoAno, prEncargoAtraso: Double;
  prValor, prValorEfet: Double; piIdItemEmptmo, piOrigem: Integer; psAno: String);
begin
  If Not ((cdsHistorico.FieldByName('FLGSUSPENSAO').AsInteger     = 1)  And
          (cdsHistorico.FieldByName('IDTIPOSUSPEMPTMO').AsInteger = 6)) Then
  Begin
    Case piIdItemEmptmo Of
      {Busca Itens de Amortização}
      13, 35         : If (piIdItemEmptmo = 35) And
                                (piOrigem       =  8) Then
                               prAmortizacao   := prAmortizacao   + prValor
                             Else
                               if (piIdItemEmptmo = 13) And
                                  (cdsHistorico.FieldByName('FLGABONADO').AsInteger = 0) And
                                  (((cdsHistorico.FieldByName('HMEDATAEFETIVA').AsDateTime >  StrToDate('31/12/2004')) And
                                   (cdsHistorico.FieldByName('HMEDATAEFETIVA').AsDateTime <= StrToDate('31/12/2005'))) or
                                  ((cdsHistorico.FieldByName('FLGQUITADO').AsInteger = 1) And
                                   (cdsHistorico.FieldByName('HMEDATAQUITABONO').AsDateTime >  StrToDate('31/12/2004')) And
                                   (cdsHistorico.FieldByName('HMEDATAQUITABONO').AsDateTime <= StrToDate('31/12/2005')))) And
                                  (prValor > 0) Then
                                 prAmortizacao   := prAmortizacao   + prValor;

      {Busca Itens para abater na Amortização}
       4, 23    : prAbateAmortizacao := prAbateAmortizacao + prValor;

      {Busca Itens de Juros}
      38, 43    : If (piIdItemEmptmo = 43) And
                           (((cdsHistorico.FieldByName('HMEDATAEFETIVA').AsDateTime >  StrToDate('31/12/2004')) And
                            (cdsHistorico.FieldByName('HMEDATAEFETIVA').AsDateTime <= StrToDate('31/12/2005'))) or
                           ((cdsHistorico.FieldByName('FLGQUITADO').AsInteger = 1) And
                            (cdsHistorico.FieldByName('HMEDATAQUITABONO').AsDateTime >  StrToDate('31/12/2004')) And
                            (cdsHistorico.FieldByName('HMEDATAQUITABONO').AsDateTime <= StrToDate('31/12/2005')))) And
                           (cdsHistorico.FieldByName('FLGABONADO').AsInteger = 0) Then
                        begin
                          if cdsHistorico.FieldByName('FLGQUITADO').AsInteger = 1 Then
                            prJuro := prJuro + prValor
                          Else
                            prJuro := prJuro + prValorEfet;
                        End
                        Else
                          If (piIdItemEmptmo = 38) Then
                            prJuro := prJuro + prValor;

      {Busca Correção Monetária}
      39, 42          : If (piIdItemEmptmo = 42) And
                           (((cdsHistorico.FieldByName('HMEDATAEFETIVA').AsDateTime >  StrToDate('31/12/2004')) And
                            (cdsHistorico.FieldByName('HMEDATAEFETIVA').AsDateTime <= StrToDate('31/12/2005'))) or
                           ((cdsHistorico.FieldByName('FLGQUITADO').AsInteger = 1) And
                            (cdsHistorico.FieldByName('HMEDATAQUITABONO').AsDateTime >  StrToDate('31/12/2004')) And
                            (cdsHistorico.FieldByName('HMEDATAQUITABONO').AsDateTime <= StrToDate('31/12/2005')))) And
                           (cdsHistorico.FieldByName('FLGABONADO').AsInteger = 0) Then
                        begin
                          if cdsHistorico.FieldByName('FLGQUITADO').AsInteger = 1 Then
                            prCorrecao := prCorrecao + prValor
                          Else
                            prCorrecao := prCorrecao + prValorEfet;
                        End
                        Else
                          If (piIdItemEmptmo = 39) Then
                            prCorrecao := prCorrecao + prValor;

      {Busca Itens de Mora}
      40, 46          : If (piIdItemEmptmo = 46) And
                           (((cdsHistorico.FieldByName('HMEDATAEFETIVA').AsDateTime >  StrToDate('31/12/2004')) And
                            (cdsHistorico.FieldByName('HMEDATAEFETIVA').AsDateTime <= StrToDate('31/12/2005'))) or
                           ((cdsHistorico.FieldByName('FLGQUITADO').AsInteger = 1) And
                            (cdsHistorico.FieldByName('HMEDATAQUITABONO').AsDateTime >  StrToDate('31/12/2004')) And
                            (cdsHistorico.FieldByName('HMEDATAQUITABONO').AsDateTime <= StrToDate('31/12/2005')))) And
                           (cdsHistorico.FieldByName('FLGABONADO').AsInteger = 0) Then
                        begin
                          if cdsHistorico.FieldByName('FLGQUITADO').AsInteger = 1 Then
                            prMora := prMora + prValor
                          Else
                            prMora := prMora + prValorEfet;
                        End
                        Else
                          If (piIdItemEmptmo = 40) Then
                            prMora := prMora + prValor;

      {Busca Itens de Multa}
      37, 44          : If (piIdItemEmptmo = 44) And
                           (((cdsHistorico.FieldByName('HMEDATAEFETIVA').AsDateTime >  StrToDate('31/12/2004')) And
                            (cdsHistorico.FieldByName('HMEDATAEFETIVA').AsDateTime <= StrToDate('31/12/2005'))) or
                           ((cdsHistorico.FieldByName('FLGQUITADO').AsInteger = 1) And
                           (cdsHistorico.FieldByName('HMEDATAQUITABONO').AsDateTime >  StrToDate('31/12/2004')) And
                           (cdsHistorico.FieldByName('HMEDATAQUITABONO').AsDateTime <= StrToDate('31/12/2005')))) And
                           (cdsHistorico.FieldByName('FLGABONADO').AsInteger = 0) Then
                        begin
                          if cdsHistorico.FieldByName('FLGQUITADO').AsInteger = 1 Then
                            prMulta := prMulta + prValor
                          Else
                            prMulta := prMulta + prValorEfet;
                        End
                        Else
                          If (piIdItemEmptmo = 37) Then
                            prMulta := prMulta + prValor;


      {Busca Itens de Seguro}
      20, 31, 50 : begin
                               if psAno = '2005' Then
                               Begin
                                 case piIdItemEmptmo of
                                   20, 31, 50: prSeguro        := prSeguro           + prValor;
                                   25, 29: If (piIdItemEmptmo = 25) And
                                              (piOrigem       =  3) Then
                                             prSeguro := prSeguro - prValor
                                           Else
                                             If (piIdItemEmptmo = 29) Then
                                               prSeguro := prSeguro - prValor;
                                 End;
                               end;
                             End;

      {Busca Itens de Amortização Extraordinária}
      1          : If ((cdsHistorico.FieldByName('HMEDATAEFETIVA').AsDateTime >  StrToDate('31/12/2004')) And
                           (cdsHistorico.FieldByName('HMEDATAEFETIVA').AsDateTime <= StrToDate('31/12/2005'))) Then
                         prAmortExtra    := prAmortExtra    + prValorEfet;
    End;
    If piIdItemEmptmo = 23 Then
      prJuroItem23 := prJuroItem23 + prValor;

    If piIdItemEmptmo = 4  Then
      prCorrecaoItem4 := prCorrecaoItem4 + prValor;

    If (piIdItemEmptmo = 35) And
       (piOrigem      <>  8) Then
      prAmortExtra    := prAmortExtra    + prValor;
  End;

  If ((piIdItemEmptmo = 13) And
     (prValor > 0)) or
     (piIdItemEmptmo in [31, 42, 43, 44, 46]) Then
  Begin
    if ((cdsHistorico.FieldByName('HMETIPOMOV').AsInteger in [1, 2, 3, 4, 6, 7]) And
       ((cdsHistorico.FieldByName('HMECENTRALIZA').AsInteger = 1) Or
        (cdsHistorico.FieldByName('HMEDESTACADO').AsInteger = 1)) And
        (cdsHistorico.FieldByName('HMEDATAPREVISTA').AsDateTime <= StrToDate('31/12/2005'))) And

       ((cdsHistorico.FieldByName('HMEDATAEFETIVA').AsDateTime > StrToDate('31/12/2005')) Or
        (cdsHistorico.FieldByName('HMEDATAEFETIVA').IsNull)) And

       ((cdsHistorico.FieldByName('FLGQUITADO').AsInteger = 0) or
        ((cdsHistorico.FieldByName('FLGQUITADO').AsInteger = 1) And
         (cdsHistorico.FieldByName('HMEDATAQUITABONO').AsDateTime > StrToDate('31/12/2005')))) And

       ((cdsHistorico.FieldByName('FLGABONADO').AsInteger = 0) or
       ((cdsHistorico.FieldByName('FLGABONADO').AsInteger = 1) And
        (cdsHistorico.FieldByName('HMEDATAQUITABONO').AsDateTime > StrToDate('31/12/2005'))))
    Then
    Begin
      If cdsHistorico.FieldByName('IDTIPOSUSPEMPTMO').AsInteger > 0 Then
        cdsAux.Data :=
          GetDataPacket(' SELECT nvl(flgemaberto, 0) as flgemaberto FROM TIPOSUSPEMPTMO WHERE IDTIPOSUSPEMPTMO = '+cdsHistorico.FieldByName('IDTIPOSUSPEMPTMO').AsString)
      Else
      Begin
        prEncargoAtraso := prEncargoAtraso + prValor;
        Exit;
      End;

      If ((cdsHistorico.FieldByName('FLGSUSPENSAO').AsInteger = 0) Or
         ((cdsHistorico.FieldByName('FLGSUSPENSAO').AsInteger <> 0) And
          (cdsAux.FieldByName('FLGEMABERTO').AsInteger = 1))) Then
        prEncargoAtraso := prEncargoAtraso + prValor;
    End;
  End;
end;

end.





