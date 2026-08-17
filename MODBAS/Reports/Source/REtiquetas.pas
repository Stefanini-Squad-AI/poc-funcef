unit REtiquetas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport, Db,
  DBClient, uCMClientDataSet, uCmSqlParams, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppBands,
  ppCtrls, ppPrnabl, ppClass, ppCache, ppComm, ppRelatv, ppProd, ppReport, uCmRptManager,
  TXComp, CmParamReport;

type
  TRptEtiquetas = class(TFrmCmReport)
    rpEtiquetas: TppReport;
    rpEtiquetasColHdrBnd: TppColumnHeaderBand;
    rpEtiquetasDtlBnd: TppDetailBand;
    rpEtiquetasDBText1: TppDBText;
    rpEtiquetasDBText2: TppDBText;
    rpEtiquetasDBText3: TppDBText;
    rpEtiquetasDBCampo3: TppDBText;
    rpEtiquetasDBText5: TppDBText;
    rpEtiquetasDBText6: TppDBText;
    ppDBText42: TppDBText;
    rpEtiquetaslblFuncao: TppLabel;
    rpEtiquetasColFootBnd: TppColumnFooterBand;
    rpEtiquetasSmryBnd: TppSummaryBand;
    ppEtiquetas: TppBDEPipeline;
    ppEtiquetasppField1: TppField;
    ppEtiquetasppField2: TppField;
    ppEtiquetasppField3: TppField;
    ppEtiquetasppField4: TppField;
    ppEtiquetasppField5: TppField;
    ppEtiquetasppField6: TppField;
    ppEtiquetasppField7: TppField;
    dsEtiquetas: TwwDataSource;
    sqlEtiquetas: TCMSqlParams;
    CdsEtiquetas: TCMClientDataSet;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CdsEtiquetasAfterOpen(DataSet: TDataSet);
    procedure CdsEtiquetasAfterScroll(DataSet: TDataSet);
    procedure rpEtiquetasDtlBndBeforePrint(Sender: TObject);
    procedure rpEtiquetasSmryBndAfterPrint(Sender: TObject);
  end;

var
  RptEtiquetas: TRptEtiquetas;

implementation

uses dCds, fAguarde;

{$R *.DFM}

procedure TRptEtiquetas.CrmRptCMBeforePrint(Sender: TObject);
const
  PIXEL_MILIM = 0.265;
var
  rPaperWidth, rMargemEsq: real;
begin
  inherited;
  with (sqlEtiquetas.SQL) do
  begin
    Clear;
    Add('SELECT');

    if (CmpRptCM.ParamByName('TipoEtiqueta').asInteger < 3) then
      Add('  PF.NOME,');

    case (CmpRptCM.ParamByName('TipoEtiqueta').asInteger) of
      0 :
      begin
        Add('  '' '' AS CAMPO4,');
        Add('  DECODE(RTRIM(E.LOGRADOURO),NULL,NULL,RTRIM(E.LOGRADOURO) ||');
        Add('    '', ''|| E.NUMERO || DECODE(RTRIM(E.COMPLEMENTO),');
        Add('    NULL,NULL,'' - '' || RTRIM(E.COMPLEMENTO))) AS CAMPO1,');
        Add('  E.BAIRRO AS CAMPO2,');
        Add('  ES.CODESTADO AS UF,');
        Add('  CI.NOME AS CIDADE,');
        Add('  DECODE(RTRIM(E.CEP),NULL,NULL,RTRIM(SUBSTR(E.CEP,1,5)) ||''-''||');
        Add('    RTRIM(SUBSTR(E.CEP,6,3))) AS CAMPO3');
        Add('FROM');
        Add('  PESSOA PF, PESSOAFISICA PEFIS, ENDPESS E, FUNCIONARIO F,');
        Add('  CIDADES CI, ESTADO ES');
      end;
      1 :
      begin
        Add('  ('' '') AS CAMPO4,');
        Add('  C.TITULO AS CAMPO1,');
        Add('  PJ.NOME AS CAMPO2,');
        Add('  CC.NOME AS CAMPO3');
        Add('FROM');
        Add('  PESSOA PJ, PESSOA PF, PESSOAFISICA PEFIS, FUNCIONARIO F,');
        Add('  CENTCUST CC, CARGO C');
      end;
      2 :
      begin
        if (CmpRptCM.ParamByName('OpcaoPonto').asInteger) = 0 then
          Add('  ''Matr: '' || F.MATRICULA || '+QuotedStr('  '+CmpRptCM.ParamByName('MesRef').asString)+' AS CAMPO4,')
        else
          Add('  ''Matr: '' || F.MATRICULA || ''  CTPS: '' || CTPS.NUM || '' - '' || CTPS.UF AS CAMPO4,');
        Add('  C.TITULO AS CAMPO1,');
        Add('  PJ.NOME AS CAMPO2,');
        Add('  HT.NOMEHORARIO AS CAMPO3');
        Add('FROM');
        Add('  PESSOA PJ, PESSOA PF, PESSOAFISICA PEFIS, FUNCIONARIO F,');
        Add('  HORATRAB HT, CARGO C ');
        // -------------------------------------------------------------------------------- //
        // CTPS do Funcionário
        if (CmpRptCM.ParamByName('OpcaoPonto').asInteger) = 1 then
        begin
          Add('  ,(SELECT F.IDPESSOA, TDP.MASCARA, DP.NUMDOCUMENTO AS NUM, ES.CODESTADO AS UF');
          Add('   FROM   DOCPESSOA DP, FUNCIONARIO F, TIPODOCOFICIAL TDO, TIPODOCPESSOA TDP,');
          Add('          ESTADO ES, PAIS PA');
          Add('   WHERE (TDO.SIGLADOCUMENTO = ''CTPS:'') AND');
          Add('         (TDO.IDDOCUMENTO    = DP.IDDOCUMENTO) AND');
          Add('         (TDP.IDDOCUMENTO    = DP.IDDOCUMENTO) AND');
          Add('         (F.IDPESSOA         = DP.IDPESSOA) AND');
          Add('         (DP.IDPAIS          = PA.IDPAIS) AND');
          Add('         (ES.IDPAIS          = PA.IDPAIS) AND');
          Add('         (DP.IDESTADO        = ES.IDESTADO)) CTPS ');
        end;
      end;
      3 :
      begin
        Add('  ''Aumentado em: '' ||');
        Add('    TO_CHAR(PF.DATAALTERFUNC,''DD/MM/YYYY'') ||');
        Add('    '' para R$ '' || TRIM(TO_CHAR(PF.SALARIO,''999G999D99'')) AS CAMPO4,');
        Add('  ''Na função de '' || C.TITULO AS NOME,');
        Add('    ''CBO: '' || C.CBO || '' Por motivo de '' || RPAD(MO.DESCRICAO,25,'' '') AS CAMPO1,');
        Add('  ''___________________________________________'' AS CAMPO2,');
        Add('  F.MATRICULA || ''   Assinatura do Empregador '' AS CAMPO3,');
        Add('  PF.IDPESSOA, PF.IDCARGO, PF.DATAALTERFUNC');
        Add('FROM');
        Add('  EVOLFUNC PF, FUNCIONARIO F, MOTIVO MO, CARGO C');
      end;
      4 :
      begin
        Add('  ''Gozou férias relativas ao período: '' AS CAMPO4,');
        Add('  ''       '' || TO_CHAR(INIPERIODOFERIAS,''DD/MM/YYYY'') ||');
        Add('    '' a '' || TO_CHAR(ADD_MONTHS(INIPERIODOFERIAS, 12) -1,''DD/MM/YYYY'') AS NOME,');
        Add('  ''  de '' || TO_CHAR(INIGOZOFERIAS,''DD/MM/YYYY'') ||');
        Add('    '' a '' || TO_CHAR(FIMGOZOFERIAS,''DD/MM/YYYY'') AS CAMPO1,');
        Add('  ''___________________________________________'' AS CAMPO2,');
        Add('  F.MATRICULA || ''   Assinatura do Empregador '' AS CAMPO3');
        Add('  FROM FERIAS PF, FUNCIONARIO F');
      end;
    end;

    Add('WHERE');

    // Funcionários selecionado(s)
    if (CmpRptCM.ParamByName('ListaIdFunc').asString <> '') then
    begin
      if (Pos(',', CmpRptCM.ParamByName('ListaIdFunc').asString) > 0) then
        Add('  (PF.IDPESSOA        IN (' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ')) AND')
      else
        Add('  (PF.IDPESSOA         = ' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ') AND');
    end
    else
      Add('  (PF.IDPESSOA      = -1) AND');

    if (CmpRptCM.ParamByName('TipoEtiqueta').asInteger < 3) then
    begin
      Add('  (PF.IDPESSOA         = PEFIS.IDPESSOA) AND');
      Add('  (PF.IDPESSOA         = F.IDPESSOA) AND');
    end;

    case (CmpRptCM.ParamByName('TipoEtiqueta').asInteger) of
      0 :
      begin
        Add('  (PF.IDENDRESIDENCIAL = E.IDENDERECO(+)) AND');
        Add('  (E.IDCIDADES         = CI.IDCIDADES(+)) AND');
        Add('  (CI.IDESTADO         = ES.IDESTADO(+))');
      end;
      1 :
      begin
        Add('  (F.CODCENTROCUSTO    = CC.CODCENTROCUSTO) AND');
        Add('  (F.IDEMPRESA         = CC.IDEMPRESA) AND');

        if (CmpRptCM.ParamByName('BuscarCargoAlternativo').asBoolean) then
          Add(' (DECODE(F.IDFUNCAO,NULL,F.IDCARGO,F.IDFUNCAO) = C.IDCARGO) AND')
        else
          Add('  (F.IDCARGO           = C.IDCARGO) AND');

        Add('  (F.IDESTAB           = PJ.IDPESSOA(+))');
      end;
      2 :
      begin
        Add('  (F.IDHORARIO         = HT.IDHORARIO) AND');
        Add('  (F.IDCARGO           = C.IDCARGO) AND');
        if (CmpRptCM.ParamByName('OpcaoPonto').asInteger) = 1 then
          Add('  (F.IDPESSOA          = CTPS.IDPESSOA(+)) AND');
        Add('  (F.IDESTAB           = PJ.IDPESSOA(+))');
      end;
      3 :
      begin
        Add('  (MO.GRUPOMOTIVO IN (''A'',''D'')) AND');
        Add('  (PF.DATAALTERFUNC BETWEEN TO_DATE(' + QuotedStr(
          CmpRptCM.ParamByName('PeriodoInicial').asString) +',''DD/MM/YYYY'') AND ' +
          'TO_DATE('+QuotedStr(CmpRptCM.ParamByName('PeriodoFinal').asString)+
          ',''DD/MM/YYYY'')) AND');
        Add('  (PF.IDPESSOA      = F.IDPESSOA) AND');
        Add('  (PF.IDMOTIVO      = MO.IDMOTIVO(+)) AND');
        Add('  (PF.IDCARGO       = C.IDCARGO(+))');
      end;
      4 :
      begin
        Add('  (FLGOCORRIDA = 1) AND');
        Add('  (INIGOZOFERIAS BETWEEN TO_DATE(' + QuotedStr(
          CmpRptCM.ParamByName('PeriodoInicial').asString) +',''DD/MM/YYYY'') AND ' +
          'TO_DATE('+QuotedStr(CmpRptCM.ParamByName('PeriodoFinal').asString)+
          ',''DD/MM/YYYY'')) AND');
        Add('  (PF.IDPESSOA      = F.IDPESSOA)');
      end;
    end;

    Add('ORDER BY');
    case (CmpRptCM.ParamByName('TipoEtiqueta').asInteger) of
      0..2 : Add('  NOME');
      3    : Add('  CAMPO3, PF.DATAALTERFUNC');
      else   Add('  CAMPO3, CAMPO4');
    end;
    SaveToFile('c:\qry.txt');
  end;

  sqlEtiquetas.Open;

  if not(CdsEtiquetas.IsEmpty) then
  begin
    rMargemEsq := CmpRptCM.ParamByName('MargemEsquerda').asFloat;

    rpEtiquetasDtlBnd.Height := CmpRptCM.ParamByName('Altura').asInteger * 19 * PIXEL_MILIM;
    rpEtiquetas.Columns := CmpRptCM.ParamByName('QuantCarreiras').asInteger;
    rpEtiquetas.PrinterSetup.MarginTop := CmpRptCM.ParamByName('MargemSuperior').asFloat;
    rpEtiquetas.PrinterSetup.MarginLeft := rMargemEsq;
    rpEtiquetasDBCampo3.AutoSize := (CmpRptCM.ParamByName('TipoEtiqueta').asInteger in [2..4]);

    rPaperWidth := rpEtiquetas.PrinterSetup.PaperWidth;
    with (rpEtiquetas.ColumnPositions) do
    begin
      Clear;
      // Primeira coluna
      Add(IntToStr(Round(rMargemEsq) + 1));
      // Segunda coluna
      Add(IntToStr(Round(rMargemEsq) + Trunc(rPaperWidth /
        CmpRptCM.ParamByName('QuantCarreiras').asInteger)));
      // Terceira coluna
      if (CmpRptCM.ParamByName('QuantCarreiras').asInteger = 3) then
        Add(IntToStr((Round(rMargemEsq) + Trunc(rPaperWidth /
          CmpRptCM.ParamByName('QuantCarreiras').asInteger)) * 2));
    end;
  end;
end;

procedure TRptEtiquetas.CdsEtiquetasAfterOpen(DataSet: TDataSet);
begin
  frmAguarde.Max := DataSet.RecordCount;
  frmAguarde.Min := 0;
end;

procedure TRptEtiquetas.CdsEtiquetasAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TRptEtiquetas.rpEtiquetasDtlBndBeforePrint(Sender: TObject);
begin
  if (CmpRptCM.ParamByName('TipoEtiqueta').asInteger = 3) then
  begin
    with (dmCds.SQL.SQL) do
    begin
      Clear;
      Add('SELECT');
      Add('  IDCARGO');
      Add('FROM');
      Add('  EVOLFUNC');
      Add('WHERE');
      Add('  (IDPESSOA      = ' + CdsEtiquetas.FieldByName('IDPESSOA').asString + ') AND');
      Add('  (DATAALTERFUNC = (SELECT MAX(DATAALTERFUNC)');
      Add('                    FROM   EVOLFUNC');
      Add('                    WHERE  (IDPESSOA = '+
        CdsEtiquetas.FieldByName('IDPESSOA').asString + ') AND');
      Add('                           (DATAALTERFUNC < TO_DATE('+
        QuotedStr(CdsEtiquetas.FieldByName('DATAALTERFUNC').asString)+',''DD/MM/YYYY''))))');
    end;

    dmCds.SQL.Open;
    if (dmCds.Cds.FieldByName('IDCARGO').asFloat =
        CdsEtiquetas.FieldByName('IDCARGO').asFloat) then
    begin
      rpEtiquetaslblFuncao.Left := 0;
      rpEtiquetaslblFuncao.Visible := true;
      rpEtiquetasDBText1.Visible := false;
    end
    else
    begin
      rpEtiquetaslblFuncao.Visible := false;
      rpEtiquetasDBText1.Visible := true;
    end;
    dmCds.Cds.Close;
  end
  else
  begin
    rpEtiquetaslblFuncao.Visible := false;
    rpEtiquetasDBText1.Visible := true;
  end;
end;

procedure TRptEtiquetas.rpEtiquetasSmryBndAfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

end.
