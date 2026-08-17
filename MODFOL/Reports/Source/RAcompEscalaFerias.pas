// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit RAcompEscalaFerias;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport,
  uCmRptManager, TXComp, CmParamReport, Db, DBClient, uCMClientDataSet, uCmSqlParams,
  Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppCtrls, ppBands, ppClass, ppVar, ppPrnabl, ppCache,
  ppComm, ppRelatv, ppProd, ppReport, TXRB, USistema;

type
  TRptAcompEscalaFerias = class(TFrmCmReport)
    rpAcompEscalaFerias: TppReport;
    ppHeaderBand9: TppHeaderBand;
    rpAcompEscalaFeriasLabel1: TppLabel;
    ppLabel25: TppLabel;
    ppDBText42: TppDBText;
    rpAcompEscalaFeriasDBText43: TppDBText;
    rpAcompEscalaFeriasDBText46: TppDBText;
    rpAcompEscalaFeriasDBText47: TppDBText;
    ppLabel26: TppLabel;
    ppCalc3: TppCalc;
    ppLabel27: TppLabel;
    ppCalc4: TppCalc;
    ppLabel55: TppLabel;
    ppDBText48: TppDBText;
    ppDBText49: TppDBText;
    rpAcompEscalaFeriasDBText24: TppDBText;
    ppDetailBand9: TppDetailBand;
    rpAcompEscalaFeriasShape16: TppShape;
    rpAcompEscalaFeriasShape17: TppShape;
    rpAcompEscalaFeriasShape15: TppShape;
    ppDBText50: TppDBText;
    ppDBText51: TppDBText;
    ppDBText53: TppDBText;
    rpAcompEscalaFeriasShape18: TppShape;
    rpAcompEscalaFeriasDBText1: TppDBText;
    rpAcompEscalaFeriasShape19: TppShape;
    rpAcompEscalaFeriasDBText2: TppDBText;
    rpAcompEscalaFeriasShape20: TppShape;
    rpAcompEscalaFeriasDBText3: TppDBText;
    rpAcompEscalaFeriasShape21: TppShape;
    rpAcompEscalaFeriasDBText4: TppDBText;
    rpAcompEscalaFeriasShape22: TppShape;
    rpAcompEscalaFeriasDBText5: TppDBText;
    rpAcompEscalaFeriasShape23: TppShape;
    rpAcompEscalaFeriasDBText6: TppDBText;
    rpAcompEscalaFeriasShape24: TppShape;
    rpAcompEscalaFeriasDBText7: TppDBText;
    rpAcompEscalaFeriasShape25: TppShape;
    rpAcompEscalaFeriasDBText8: TppDBText;
    rpAcompEscalaFeriasShape26: TppShape;
    rpAcompEscalaFeriasDBText9: TppDBText;
    rpAcompEscalaFeriasShape27: TppShape;
    rpAcompEscalaFeriasDBText10: TppDBText;
    rpAcompEscalaFeriasShape28: TppShape;
    rpAcompEscalaFeriasDBText11: TppDBText;
    rpAcompEscalaFeriasLinePer1: TppLine;
    rpAcompEscalaFeriasLinePer2: TppLine;
    rpAcompEscalaFeriasLinePer3: TppLine;
    rpAcompEscalaFeriasLinePer4: TppLine;
    rpAcompEscalaFeriasLinePer5: TppLine;
    ppFooterBand9: TppFooterBand;
    ppGroup7: TppGroup;
    ppGroupHeaderBand7: TppGroupHeaderBand;
    rpAcompEscalaFeriasShape14: TppShape;
    rpAcompEscalaFeriasShape1: TppShape;
    rpAcompEscalaFeriasShape13: TppShape;
    rpAcompEscalaFeriasShape9: TppShape;
    rpAcompEscalaFeriasShape10: TppShape;
    rpAcompEscalaFeriasShape11: TppShape;
    rpAcompEscalaFeriasShape12: TppShape;
    rpAcompEscalaFeriasShape5: TppShape;
    rpAcompEscalaFeriasShape6: TppShape;
    rpAcompEscalaFeriasShape7: TppShape;
    rpAcompEscalaFeriasShape8: TppShape;
    rpAcompEscalaFeriasShape4: TppShape;
    rpAcompEscalaFeriasShape3: TppShape;
    rpAcompEscalaFeriasShape2: TppShape;
    ppLabel59: TppLabel;
    ppDBText57: TppDBText;
    ppLabel60: TppLabel;
    ppLabel61: TppLabel;
    ppDBText58: TppDBText;
    AcompEscalaFeriasShapeJaProcess: TppShape;
    AcompEscalaFeriasShapeNaoProcess: TppShape;
    rpAcompEscalaFeriasLabel12: TppLabel;
    rpAcompEscalaFeriasLabel13: TppLabel;
    rpAcompEscalaFeriasDBText12: TppDBText;
    rpAcompEscalaFeriasDBText13: TppDBText;
    rpAcompEscalaFeriasDBText14: TppDBText;
    rpAcompEscalaFeriasDBText15: TppDBText;
    rpAcompEscalaFeriasDBText16: TppDBText;
    rpAcompEscalaFeriasDBText17: TppDBText;
    rpAcompEscalaFeriasDBText18: TppDBText;
    rpAcompEscalaFeriasDBText19: TppDBText;
    rpAcompEscalaFeriasDBText20: TppDBText;
    rpAcompEscalaFeriasDBText21: TppDBText;
    rpAcompEscalaFeriasDBText22: TppDBText;
    rpAcompEscalaFeriasDBText23: TppDBText;
    ppGroupFooterBand7: TppGroupFooterBand;
    ppLine9: TppLine;
    ppLabel69: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppAcompEscalaFerias: TppBDEPipeline;
    dsAcompEscalaFerias: TwwDataSource;
    sqlAcompEscalaFerias: TCMSqlParams;
    CdsAcompEscalaFerias: TCMClientDataSet;
    rpAcompEscalaFeriasSmryBnd: TppSummaryBand;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure rpAcompEscalaFeriasBeforePrint(Sender: TObject);
    procedure ppDetailBand9BeforePrint(Sender: TObject);
    procedure CdsAcompEscalaFeriasAfterScroll(DataSet: TDataSet);
    procedure rpAcompEscalaFeriasSmryBndAfterPrint(Sender: TObject);
  private
    sDataInicial, sDataFinal: string;

    procedure GerarDadosRelat;    
  end;

var
  RptAcompEscalaFerias: TRptAcompEscalaFerias;

implementation

uses uCtrlFuncoesRH, fAguarde, dCds, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TRptAcompEscalaFerias.CrmRptCMBeforePrint(Sender: TObject);
var
  DocID: array [1..2] of integer;
begin
  inherited;
  rpAcompEscalaFeriasDBText43.Visible := Pos(',', CmpRptCM.ParamByName('ListaIdEstab').asString) = 0;
  rpAcompEscalaFeriasDBText46.Visible := Pos(',', CmpRptCM.ParamByName('ListaIdEstab').asString) = 0;
  rpAcompEscalaFeriasDBText47.Visible := Pos(',', CmpRptCM.ParamByName('ListaIdEstab').asString) = 0;

  DocID[1] := 0;
  DocID[2] := 0;

  sDataInicial := '01/'+FU.PoeZero(CmpRptCM.ParamByName('MesRef').asInteger) +'/'+
    CmpRptCM.ParamByName('AnoRef').asString;
  sDataFinal := DateToStr(StrToDate(FU.IncData(sDataInicial,0,0,1))-1);

  // Documentos
  with (dmCds.sql) do
  begin
    SQL.Clear;
    SQL.Add('SELECT TDO.IDDOCUMENTO, TDO.SIGLADOCUMENTO, TDP.MASCARA');
    SQL.Add('FROM   TIPODOCPESSOA TDP, TIPODOCOFICIAL TDO');
    SQL.Add('WHERE ((TDO.SIGLADOCUMENTO = ''ESTADUAL:'') OR');
    SQL.Add('       (TDO.SIGLADOCUMENTO = ''MUNICIPAL:'')) AND');
    SQL.Add('      (TDO.IDDOCUMENTO     = TDP.IDDOCUMENTO)');
    Open;
  end;

  with (dmCds.Cds) do
  begin
    while not(EOF) do
    begin
      if (FieldByName('SIGLADOCUMENTO').asString = 'ESTADUAL:') then
        DocID[1] := FieldByName('IDDOCUMENTO').asInteger
      else
      if (FieldByName('SIGLADOCUMENTO').asString = 'MUNICIPAL:') then
        DocID[2] := FieldByName('IDDOCUMENTO').asInteger;
      Next;
    end;
  end;

  with (dmCds.sql.SQL) do
  begin
    Clear;
    Add('SELECT DISTINCT');
    // Dados do Estabelecimento
    Add('  RTRIM(PJ.RAZAOSOCIAL) AS EMPRESA,');
    Add('  DECODE(PJ.NUMDOCUMENTO,NULL,NULL,''CNPJ: '' || PJ.NUMDOCUMENTO) AS CGC,');
    Add('  RTRIM(DECODE(RTRIM(ESTADUAL.NUMDOCUMENTO),NULL,');
    Add('    DECODE(RTRIM(MUNICIPAL.NUMDOCUMENTO),NULL,NULL,');
    Add('    ''Inscrição Municipal: '' || MUNICIPAL.NUMDOCUMENTO),');
    Add('    ''Inscrição Estadual: '' || ESTADUAL.NUMDOCUMENTO)) AS ESTADUALMUNICIPAL,');
    Add('  RTRIM(END.LOGRADOURO) ||'', ''|| END.NUMERO || DECODE(END.COMPLEMENTO,NULL,NULL,'' - '' ||');
    Add('    RTRIM(END.COMPLEMENTO)) ||'' - ''|| RTRIM(END.BAIRRO) ||'' - ''|| RTRIM(CIDADES.NOME) ||');
    Add('    '' - CEP:'' || RTRIM(SUBSTR(END.CEP,1,5)) ||''-''|| RTRIM(SUBSTR(END.CEP,6,3)) AS ENDERECO,');
    Add('  ES.CODESTADO AS UF,');
    // Dados do Funcionário
    Add('  F.MATRICULA,');
    Add('  UPPER(PF.NOME) AS EMPREGADO,');
    Add('  RTRIM(CC.NOME) AS NOMECENTROCUSTO,');
    Add('  CC.CODCENTROCUSTO,');
    Add('  FE.FLGOCORRIDA,');
    Add('  FE.INIGOZOFERIAS,');
    Add('  FE.FIMGOZOFERIAS,');
    Add('  TO_CHAR(FE.INIGOZOFERIAS,''DD/MM/YYYY'') AS INI_PER,');
    Add('  TO_CHAR(FE.FIMGOZOFERIAS,''DD/MM/YYYY'') AS FIN_PER');
    Add('FROM');
    Add('  PESSOA PJ, PESSOA PF, ENDPESS END, FUNCIONARIO F, FERIAS FE, CIDADES,');
    Add('  ESTADO ES, CENTCUST CC, SITFUNC ST,');
    // ------------------------------------------------------------------------------- //
    // Inscrição Estadual do(s) Estabelecimento(s)
    Add('  (SELECT IDPESSOA, NUMDOCUMENTO');
    Add('   FROM   DOCPESSOA');
    Add('   WHERE (IDDOCUMENTO = ' +IntToStr(DocID[1])+ ')) ESTADUAL,');
    // -------------------------------------------------------------------------- //
    // Inscrição Municipal do(s) Estabelecimento(s)
    Add('  (SELECT IDPESSOA, NUMDOCUMENTO');
    Add('   FROM   DOCPESSOA');
    Add('   WHERE (IDDOCUMENTO = ' +IntToStr(DocID[2])+ ')) MUNICIPAL');
    // -------------------------------------------------------------------------- //
    Add('WHERE');
    Add('  (PJ.IDPESSOA IN (' +CmpRptCM.ParamByName('ListaIdEstab').asString+ ')) AND');

    // C. Custo(s) selecionado(s)
    if (CmpRptCM.ParamByName('ListaCodCCusto').asString <> '') then
    begin
      if (Pos(',', CmpRptCM.ParamByName('ListaCodCCusto').asString) > 0) then
        Add('  (CC.CODCENTROCUSTO  IN (' +CmpRptCM.ParamByName('ListaCodCCusto').asString+ ')) AND')
      else
        Add('  (CC.CODCENTROCUSTO   = ' +CmpRptCM.ParamByName('ListaCodCCusto').asString+ ') AND');
    end
    else
    begin
      // C. de Custo(s) habilitado(s) para o usuário
      if (CtrlUsoGeralRH.UsuXCCusto <> '') then
      begin
        if (Pos(',',CtrlUsoGeralRH.UsuXCCusto) > 0) then
          Add('  (F.CODCENTROCUSTO IN ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND')
        else
          Add('  (F.CODCENTROCUSTO  = ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND');
      end;
    end;

    // Funcionário(s) selecionado(s)
    if (CmpRptCM.ParamByName('ListaIdFunc').asString <> '') then
    begin
      if (Pos(',', CmpRptCM.ParamByName('ListaIdFunc').asString) > 0) then
      begin
        Add('  (F.IDPESSOA         IN (' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ')) AND');
        Add('  (PF.IDPESSOA        IN (' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ')) AND');
      end
      else
      begin
        Add('  (F.IDPESSOA          = ' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ') AND');
        Add('  (PF.IDPESSOA         = ' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ') AND');
      end;
    end
    else
    begin
      if (CmpRptCM.ParamByName('SitFunc').asString <> '') then
        if (Pos(',',CmpRptCM.ParamByName('SitFunc').asString) > 0) then
          Add('  (ST.TIPOSIT       IN (' +CmpRptCM.ParamByName('SitFunc').asString+ ')) AND')
        else
          Add('  (ST.TIPOSIT        = ' +CmpRptCM.ParamByName('SitFunc').asString+ ') AND');

      if (Pos(',',CmpRptCM.ParamByName('TipoContrato').asString) > 0) then
        Add('  (F.TIPOCONTRATO   IN (' +CmpRptCM.ParamByName('TipoContrato').asString+ ')) AND')
      else
        Add('  (F.TIPOCONTRATO    = ' +CmpRptCM.ParamByName('TipoContrato').asString+ ') AND');
    end;

    Add('  (((TO_CHAR(FE.INIGOZOFERIAS,''YYYY/MM/DD'') >= '+
      QuotedStr(FormatDateTime('YYYY/MM/DD',StrToDate(sDataInicial)))+') AND');
    Add('    (TO_CHAR(FE.INIGOZOFERIAS,''YYYY/MM/DD'') <= '+
      QuotedStr(FormatDateTime('YYYY/MM/DD',StrToDate(sDataFinal)))+')) OR');

    Add('  ((TO_CHAR(FE.FIMGOZOFERIAS,''YYYY/MM/DD'') >= '+
      QuotedStr(FormatDateTime('YYYY/MM/DD',StrToDate(sDataInicial)))+') AND');
    Add('   (TO_CHAR(FE.FIMGOZOFERIAS,''YYYY/MM/DD'') <= '+
      QuotedStr(FormatDateTime('YYYY/MM/DD',StrToDate(sDataFinal)))+'))) AND');

    Add('  (ST.IDSITFUNC      = F.IDSITFUNC) AND');
    Add('  (F.IDESTAB         = PJ.IDPESSOA) AND');
    Add('  (F.CODCENTROCUSTO  = CC.CODCENTROCUSTO) AND');
    Add('  (F.IDPESSOA        = PF.IDPESSOA) AND');
    Add('  (F.IDPESSOA        = FE.IDPESSOA) AND');
    Add('  (PJ.IDPESSOA       = END.IDPESSOA(+)) AND');
    Add('  (PJ.IDENDCOMERCIAL = END.IDENDERECO(+)) AND');
    Add('  (END.IDCIDADES     = CIDADES.IDCIDADES(+)) AND');
    Add('  (CIDADES.IDESTADO  = ES.IDESTADO(+)) AND');
    Add('  (PJ.IDPESSOA       = ESTADUAL.IDPESSOA(+)) AND');
    Add('  (PJ.IDPESSOA       = MUNICIPAL.IDPESSOA(+))');
    Add('ORDER BY');
    case (CmpRptCM.ParamByName('Ordenacao').asInteger) of
      0 : Add('  UPPER(NOMECENTROCUSTO), UPPER(EMPREGADO), FE.INIGOZOFERIAS');
      1 : Add('  UPPER(NOMECENTROCUSTO), MATRICULA, FE.INIGOZOFERIAS');
      2 : Add('  CODCENTROCUSTO, UPPER(EMPREGADO), FE.INIGOZOFERIAS');
      3 : Add('  CODCENTROCUSTO, MATRICULA, FE.INIGOZOFERIAS');
    end;
    //SaveToFile('c:\qry.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;

  // Monta Query Principal
  GerarDadosRelat;

  frmAguarde.Max := CdsAcompEscalaFerias.RecordCount;
  frmAguarde.Min := 0;
end;

procedure TRptAcompEscalaFerias.CdsAcompEscalaFeriasAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TRptAcompEscalaFerias.rpAcompEscalaFeriasBeforePrint(Sender: TObject);
begin
  AcompEscalaFeriasShapeJaProcess.Brush.Color :=
    TColor(CmpRptCM.ParamByName('CorFeriasJaProcessadas').asInteger);
  AcompEscalaFeriasShapeNaoProcess.Brush.Color :=
    TColor(CmpRptCM.ParamByName('CorFeriasNaoProcessadas').asInteger);
end;

procedure TRptAcompEscalaFerias.ppDetailBand9BeforePrint(Sender: TObject);
const
  MES: array[1..12] of string = ('01','02','03','04','05','06','07','08','09','10','11','12');
var
  rDif: real;
  iPosicao, c: integer;
  bPrimPerFinal, bUltPerInicial: boolean;
begin
  // Cada linha será inicialmente invisível
  for c:=1 to 5 do
    TppLine(Self.FindComponent('rpAcompEscalaFeriasLinePer'+IntToStr(c))).Visible := false;

  // Posição inicial de cada linha
  for c:=1 to 5 do
    TppLine(Self.FindComponent('rpAcompEscalaFeriasLinePer'+IntToStr(c))).Width := 6.615;

  iPosicao := 1;

  with (CdsAcompEscalaFerias) do
  begin
    for c:=1 to 12 do
      if (Trim(FieldByName('PERIODO_'+MES[c]).asString) <> '') then
      begin
        if (FieldByName('TIPO_PERIODO_' +MES[c]).asString <> 'FINAL') then
        begin
          if (FieldByName('OCORRIDA_'+MES[c]).asInteger = 1) then
          begin
            TppLine(Self.FindComponent('rpAcompEscalaFeriasLinePer'+
              IntToStr(iPosicao))).Pen.Color :=
                TColor(CmpRptCM.ParamByName('CorFeriasJaProcessadas').asInteger);
          end
          else
          begin
            TppLine(Self.FindComponent('rpAcompEscalaFeriasLinePer'+
              IntToStr(iPosicao))).Pen.Color :=
                TColor(CmpRptCM.ParamByName('CorFeriasNaoProcessadas').asInteger);
          end;

          TppLine(Self.FindComponent('rpAcompEscalaFeriasLinePer'+
            IntToStr(iPosicao))).Visible := true;
        end;

        // Calcula a diferença para o tamanho da linha do período Início-Fim que deve ficar
        // no mesmo campo
        if (FieldByName('TIPO_PERIODO_' +MES[c]).asString = 'INI_FIN') then
        begin
          rDif := 5;
          TppLine(Self.FindComponent('rpAcompEscalaFeriasLinePer'+
            IntToStr(iPosicao))).Width := 6.615 - 2.4;
        end
        else
          rDif := 0;

        // Se o primeiro período está como FINAL eu modifico a Primeira Linha
        bPrimPerFinal := false;
        bUltPerInicial := false;
        if (MES[c] = '01') and (FieldByName('TIPO_PERIODO_' +MES[c]).asString = 'FINAL') then
        begin
          bPrimPerFinal := true;
          rpAcompEscalaFeriasLinePer1.Visible := true;
          rpAcompEscalaFeriasLinePer1.Left := 117.74;
          rpAcompEscalaFeriasLinePer1.Width := 4;
        end
        else
        if (MES[c] = '12') and (FieldByName('TIPO_PERIODO_' +MES[c]).asString = 'INICIAL') then
        begin
          bUltPerInicial := true;
          TppLine(Self.FindComponent('rpAcompEscalaFeriasLinePer'+
            IntToStr(iPosicao))).Visible := true;
          TppLine(Self.FindComponent('rpAcompEscalaFeriasLinePer'+
            IntToStr(iPosicao))).Left := 262.467;
          TppLine(Self.FindComponent('rpAcompEscalaFeriasLinePer'+
            IntToStr(iPosicao))).Width := 4.2;
        end;

        // Calcula a posição inicial de cada Linha correspondente ao contador "iPosicao"
        if not(bUltPerInicial) and not(bPrimPerFinal) then
          TppLine(Self.FindComponent('rpAcompEscalaFeriasLinePer'+
            IntToStr(iPosicao))).Left := 126.736+((c-1)*12.435)-rDif;
            
        Inc(iPosicao);
      end;
  end;
end;

procedure TRptAcompEscalaFerias.rpAcompEscalaFeriasSmryBndAfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

procedure TRptAcompEscalaFerias.GerarDadosRelat;
const
  MES: array[1..12] of string =
    ('01' ,'02' ,'03' ,'04' ,'05' ,'06' ,'07' ,'08' ,'09' ,'10' ,'11' ,'12');
var
  dtDataIni, dtDataFin: TDateTime;
  c, iMes, iOcorrida, iNumRegistro: integer;
  sDataRef, sDia, sMatricula, sDataGozoIni, sDataGozoFin: string;
begin
  dmCds.sql.Open;
  sqlAcompEscalaFerias.Open;
  if not(dmCds.Cds.IsEmpty) then
  begin
    iNumRegistro := 0;
    dtDataIni := StrToDate(sDataInicial);
    dtDataFin := StrToDate(sDataFinal);

    // Arrumo os Ponteiros dos meses
    sDataRef := sDataInicial;
    for c:=1 to 12 do
    begin
      MES[c] := Copy(sDataRef,4,2);
      sDataRef := FU.IncData(sDataRef,0,1,0);
    end;

    // LOOP para todos os funcionários
    while not(dmCds.Cds.EOF) do
    begin
      Inc(iNumRegistro);
      CdsAcompEscalaFerias.Insert;
      // Dados do Estabelecimento
      CdsAcompEscalaFerias.FieldByName('EMPRESA').asString := dmCds.Cds.FieldByName('EMPRESA').asString;
      CdsAcompEscalaFerias.FieldByName('CGC').asString := dmCds.Cds.FieldByName('CGC').asString;
      CdsAcompEscalaFerias.FieldByName('ESTADUALMUNICIPAL').asString := dmCds.Cds.FieldByName('ESTADUALMUNICIPAL').asString;
      CdsAcompEscalaFerias.FieldByName('ENDERECO').asString := dmCds.Cds.FieldByName('ENDERECO').asString;
      CdsAcompEscalaFerias.FieldByName('UF').asString := dmCds.Cds.FieldByName('UF').asString;
      // Dados do Funcionário
      CdsAcompEscalaFerias.FieldByName('MATRICULA').asString := dmCds.Cds.FieldByName('MATRICULA').asString;
      CdsAcompEscalaFerias.FieldByName('EMPREGADO').asString := dmCds.Cds.FieldByName('EMPREGADO').asString;
      CdsAcompEscalaFerias.FieldByName('CODCENTROCUSTO').asString := dmCds.Cds.FieldByName('CODCENTROCUSTO').asString;
      CdsAcompEscalaFerias.FieldByName('NOMECENTROCUSTO').asString := dmCds.Cds.FieldByName('NOMECENTROCUSTO').asString;
      CdsAcompEscalaFerias.FieldByName('DATA_REF_INI').asString := sDataInicial;
      CdsAcompEscalaFerias.FieldByName('DATA_REF_FIN').asString := sDataFinal;
      CdsAcompEscalaFerias.FieldByName('NUM_REGISTRO').asInteger := iNumRegistro;

      // Labels dos Meses escolhidos pelo usuário
      for c:=1 to 12 do
        CdsAcompEscalaFerias.FieldByName('NOME_MES_'+FU.PoeZero(c)).asString :=
          MesCurto[StrToInt(MES[c])];

      // Gravo os períodos do funcionário atual
      sMatricula := dmCds.Cds.FieldByName('MATRICULA').asString;
      repeat
        iOcorrida := dmCds.Cds.FieldByName('FLGOCORRIDA').asInteger;
        sDataGozoIni := dmCds.Cds.FieldByName('INI_PER').asString;
        sDataGozoFin := dmCds.Cds.FieldByName('FIN_PER').asString;

        if (StrToDate(sDataGozoIni) >= dtDataIni) then
        begin
          // Assumo que este é o período inicial
          iMes := StrToInt(Copy(sDataGozoIni,4,2));
          sDia := Copy(sDataGozoIni,1,2);

          for c:=1 to 12 do
            if (MES[c] = FU.PoeZero(iMes)) then
              break;

          CdsAcompEscalaFerias.FieldByName('TIPO_PERIODO_' +FU.PoeZero(c)).asString := 'INICIAL';
          CdsAcompEscalaFerias.FieldByName('PERIODO_' +FU.PoeZero(c)).asString := sDia;
          CdsAcompEscalaFerias.FieldByName('OCORRIDA_'+FU.PoeZero(c)).asInteger := iOcorrida;
        end;

        if (StrToDate(sDataGozoFin) <= dtDataFin) then
        begin
          // Vejo se é período final ou (Inicial x Final)
          iMes := StrToInt(Copy(sDataGozoFin,4,2));
          sDia := Copy(sDataGozoFin,1,2);

          for c:=1 to 12 do
            if (MES[c] = FU.PoeZero(iMes)) then
              break;

          if (Trim(CdsAcompEscalaFerias.FieldByName('PERIODO_'+FU.PoeZero(c)).asString) <> '') then
          begin
            CdsAcompEscalaFerias.FieldByName('TIPO_PERIODO_' +FU.PoeZero(c)).asString := 'INI_FIN';
            CdsAcompEscalaFerias.FieldByName('PERIODO_' +FU.PoeZero(c)).asString :=
              CdsAcompEscalaFerias.FieldByName('PERIODO_' +FU.PoeZero(c)).asString +
              '      '+ sDia;
          end
          else
          begin
            CdsAcompEscalaFerias.FieldByName('TIPO_PERIODO_' +FU.PoeZero(c)).asString := 'FINAL';
            CdsAcompEscalaFerias.FieldByName('PERIODO_' +FU.PoeZero(c)).asString := sDia;
          end;
        end;

        dmCds.Cds.Next;
      until (dmCds.Cds.EOF) or
            (dmCds.Cds.FieldByName('MATRICULA').asString <> sMatricula);
      CdsAcompEscalaFerias.Post;
    end;
  end
  else
  begin
    CdsAcompEscalaFerias.Insert;
    CdsAcompEscalaFerias.Post;
  end;

  CdsAcompEscalaFerias.First;
end;

end.
