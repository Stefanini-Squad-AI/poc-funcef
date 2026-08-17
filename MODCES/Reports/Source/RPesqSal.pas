unit RPesqSal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport, Db,
  DBClient, uCMClientDataSet, uCmSqlParams, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppCtrls,
  ppBands, ppClass, ppVar, ppPrnabl, ppCache, ppComm, ppRelatv, ppProd, ppReport,
  uCmRptManager, TXComp, CmParamReport, uCtrlTabPesqui;

type
  TRptPesqSal = class(TFrmCmReport)
    rpPesqSal: TppReport;
    rpPesqSalHdrBnd: TppHeaderBand;
    rpPesqSalLblTITULO: TppLabel;
    rpPesqSalLbl1: TppLabel;
    rpPesqSalLbl2: TppLabel;
    rpPesqSalLine1: TppLine;
    rpPesqSalDBTxt1: TppDBText;
    rpPesqSalDBTxt2: TppDBText;
    rpPesqSalDBTxt3: TppDBText;
    rpPesqSalCalc1: TppSystemVariable;
    rpPesqSalCalc2: TppSystemVariable;
    rpPesqSalDtlBnd: TppDetailBand;
    rpPesqSalDBTxt6: TppDBText;
    rpPesqSalDBTxt5: TppDBText;
    rpPesqSalLbl11: TppLabel;
    rpPesqSalLbl12: TppLabel;
    rpPesqSalLblMENOR1: TppLabel;
    rpPesqSalLblPRIQUA1: TppLabel;
    rpPesqSalLblMODA1: TppLabel;
    rpPesqSalLblMEDIA1: TppLabel;
    rpPesqSalLblMEDIANA1: TppLabel;
    rpPesqSalLblTERQUA1: TppLabel;
    rpPesqSalLblMAIOR1: TppLabel;
    rpPesqSalLblMENOR2: TppLabel;
    rpPesqSalLblPRIQUA2: TppLabel;
    rpPesqSalLblMODA2: TppLabel;
    rpPesqSalLblMEDIA2: TppLabel;
    rpPesqSalLblMEDIANA2: TppLabel;
    rpPesqSalLblTERQUA2: TppLabel;
    rpPesqSalLblMAIOR2: TppLabel;
    rpPesqSalFootBnd: TppFooterBand;
    rpPesqSalSmryBnd: TppSummaryBand;
    rpPesqSalGroup1: TppGroup;
    rpPesqSalGrpHdrBnd: TppGroupHeaderBand;
    rpPesqSalDBTxt4: TppDBText;
    rpPesqSalLbl3: TppLabel;
    rpPesqSalLbl10: TppLabel;
    rpPesqSalLbl4: TppLabel;
    rpPesqSalLbl5: TppLabel;
    rpPesqSalLbl6: TppLabel;
    rpPesqSalLbl7: TppLabel;
    rpPesqSalLbl8: TppLabel;
    rpPesqSalLbl9: TppLabel;
    rpPesqSalLine2: TppLine;
    rpPesqSalGrpFootBnd: TppGroupFooterBand;
    rpPesqSalLbl13: TppLabel;
    rpPesqSalLine3: TppLine;
    rpPesqSalLbl14: TppLabel;
    rpPesqSalLbl15: TppLabel;
    rpPesqSalLine4: TppLine;
    rpPesqSalLblMENOR1_TOT: TppLabel;
    rpPesqSalLblMENOR2_TOT: TppLabel;
    rpPesqSalLblMEDIA1_TOT: TppLabel;
    rpPesqSalLblMEDIA2_TOT: TppLabel;
    rpPesqSalLblMAIOR1_TOT: TppLabel;
    rpPesqSalLblMAIOR2_TOT: TppLabel;
    rpPesqSalDBCalc1: TppDBCalc;
    ppPesqSal: TppBDEPipeline;
    dsPesqSal: TwwDataSource;
    sqlPesqSal: TCMSqlParams;
    CdsPesqSal: TCMClientDataSet;
    CdsTendencia: TCMClientDataSet;
    rpPesqSalLblCorte: TppLabel;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    rpPesqSalLblFREQ_TOT: TppLabel;
    rpPesqSalLblPRIMQ1_TOT: TppLabel;
    rpPesqSalLblPRIMQ2_TOT: TppLabel;
    rpPesqSalLblMODA1_TOT: TppLabel;
    rpPesqSalLblMODA2_TOT: TppLabel;
    rpPesqSalLblMEDIANA1_TOT: TppLabel;
    rpPesqSalLblMEDIANA2_TOT: TppLabel;
    rpPesqSalLblTERCQ1_TOT: TppLabel;
    rpPesqSalLblTERCQ2_TOT: TppLabel;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure rpPesqSalDtlBndBeforePrint(Sender: TObject);
    procedure rpPesqSalGrpFootBndBeforePrint(Sender: TObject);
    procedure rpPesqSalGrpFootBndAfterPrint(Sender: TObject);
    procedure rpPesqSalSmryBndAfterPrint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    CtrlTabPesqui: TCtrlTabPesqui;

    iTotFreq: integer;
    rTotMenor, rTotMedia, rTotMaior, rTotMenorR, rTotMaiorR, rTotMediaR: real;
    sTitulo: string;
  end;

var
  RptPesqSal: TRptPesqSal;

implementation

uses uSistema, fAguarde, uCtrlPadroes;

{$R *.DFM}

procedure TRptPesqSal.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  if (CmpRptCM.ParamByName('TipoRelatorio').asInteger = 0) then
    sTitulo := 'Tabulação de Pesquisa por Cargo'
  else
    sTitulo := 'Tabulação de Pesquisa por Empresa';

  if (CmpRptCM.ParamByName('PercCorte').asInteger = 0) then
    rpPesqSalLblCorte.Visible := False
  else
    rpPesqSalLblCorte.Caption := 'Corte de ' +
      IntToStr(CmpRptCM.ParamByName('PercCorte').asInteger) + '%';

  with (sqlPesqSal.SQL) do
  begin
    Clear;
    Add('SELECT');
    if (CmpRptCM.ParamByName('IndNomeCodigo').asInteger = 0) then
      Add('  ' +QuotedStr(Sistema.NomeEmpresa)+ ' AS EMPRESA,')
    else
      Add('  '+QuotedStr('Empresa '+IntToStr(Sistema.IdEmpresa))+ ' AS EMPRESA,');
    Add('  TEN.IDEMPRESAPARTIC,');

    if (CmpRptCM.ParamByName('TipoRelatorio').asInteger = 1) then
    begin
      if (CmpRptCM.ParamByName('IndNomeCodigo').asInteger = 0) then
        Add('  PJ.NOME, C.TITULO AS DESCRICAO,')
      else
        Add('  ''Empresa '' || TO_CHAR(PJ.IDPESSOA) AS NOME, C.TITULO AS DESCRICAO,');
    end
    else
    begin
      Add('  C.TITULO AS NOME,');
      Add('  DECODE(' +IntToStr(CmpRptCM.ParamByName('TIPOEXCLUSAOEMPRESA').asInteger)+ ',');
      Add('    0,TO_CHAR(DECODE(TEN.IDEMPRESAPARTIC,');
      Add('        ' +IntToStr(Sistema.IdEmpresa)+ ',''* - '',');
      Add('        ''''');
      Add('      )),');
      Add('    1,TO_CHAR(DECODE(TEN.IDEMPRESAPARTIC,');
      Add('        ' +CmpRptCM.ParamByName('IDEMPRESA').asString+ ',''* - '',');
      Add('        ''''');
      Add('      )),');
      if (CmpRptCM.ParamByName('IndNomeCodigo').asInteger = 0) then
        Add('    '''') || PJ.NOME AS DESCRICAO,')
      else
        Add('    '''') || ''Empresa '' || TO_CHAR(PJ.IDPESSOA) AS DESCRICAO,');
    end;

    Add('  AJU.FATOR, PJ.IDPESSOA,');
    Add('  (' +QuotedStr(Trim(CmpRptCM.ParamByName('NomePesquisa').asString))+ ') AS NOMEPESQSALAR,');
    Add('  (' +QuotedStr(Trim(CmpRptCM.ParamByName('DataPesquisa').asString))+ ') AS DATAREFPESQ,');
    Add('  TEN.MENOR, TEN.MENOR_R, TEN.MAIOR, TEN.MAIOR_R, TEN.MEDIA, TEN.MEDIA_R,');
    Add('  TEN.MODA, TEN.MODA_R, TEN.MEDIANA, TEN.MEDIANA_R, TEN.PRIMQUA, TEN.PRIMQUA_R,');
    Add('  TEN.TERCQUA, TEN.TERCQUA_R, TEN.FREQ, TEN.IDCARGO');
    Add('FROM');
    Add('  PESSOA PJ, AJUSTPESQ AJU, CARGO C, TENDPESQSAL TEN');
    Add('WHERE');
    Add('  (TEN.IDPESQSALAR     = ' +CmpRptCM.ParamByName('IdPesquisa').asString+ ') AND');
    Add('  (TEN.IDCARGO         = C.IDCARGO) AND');
    Add('  (TEN.IDEMPRESAPARTIC = PJ.IDPESSOA) AND');
    Add('  (TEN.IDPESQSALAR     = AJU.IDPESQSALAR(+)) AND');
    Add('  (TEN.IDEMPRESAPARTIC = AJU.IDEMPRESAPARTIC(+))');
    Add('ORDER BY');
    Add('  NOME, DESCRICAO');
    SaveToFile('c:\qry.txt');
  end;
  sqlPesqSal.Open;

  frmAguarde.Mostra(sTitulo);
  frmAguarde.Pos := 0;
  frmAguarde.Update;

  rpPesqSalLblTITULO.Caption := sTitulo;
  frmAguarde.Min := 0;
  frmAguarde.Max := CdsPesqSal.RecordCount;

  rpPesqSalGrpFootBndAfterPrint(nil);
end;

procedure TRptPesqSal.rpPesqSalDtlBndBeforePrint(Sender: TObject);
var
  rFatAjus: real;
begin
  if (CdsPesqSal.FieldByName('IDEMPRESAPARTIC').asInteger <> Sistema.IdEmpresa) and
     (CdsPesqSal.FieldByName('FATOR').asFloat <> 0) then
    rFatAjus := CdsPesqSal.FieldByName('FATOR').asFloat
  else
    rFatAjus := 1;

  rpPesqSalLblMENOR1.Caption := IntToStr(Round(rFatAjus * CdsPesqSal.FieldByName('MENOR').asFloat));
  rpPesqSalLblMENOR2.Caption := IntToStr(Round(rFatAjus * CdsPesqSal.FieldByName('MENOR_R').asFloat));
  rpPesqSalLblMAIOR1.Caption := IntToStr(Round(rFatAjus * CdsPesqSal.FieldByName('MAIOR').asFloat));
  rpPesqSalLblMAIOR2.Caption := IntToStr(Round(rFatAjus * CdsPesqSal.FieldByName('MAIOR_R').asFloat));
  rpPesqSalLblMEDIA1.Caption := IntToStr(Round(rFatAjus * CdsPesqSal.FieldByName('MEDIA').asFloat));
  rpPesqSalLblMEDIA2.Caption := IntToStr(Round(rFatAjus * CdsPesqSal.FieldByName('MEDIA_R').asFloat));
  rpPesqSalLblMODA1.Caption := IntToStr(Round(rFatAjus * CdsPesqSal.FieldByName('MODA').asFloat));
  rpPesqSalLblMODA2.Caption := IntToStr(Round(rFatAjus * CdsPesqSal.FieldByName('MODA_R').asFloat));
  rpPesqSalLblMEDIANA1.Caption := IntToStr(Round(rFatAjus * CdsPesqSal.FieldByName('MEDIANA').asFloat));
  rpPesqSalLblMEDIANA2.Caption := IntToStr(Round(rFatAjus * CdsPesqSal.FieldByName('MEDIANA_R').asFloat));
  rpPesqSalLblPRIQUA1.Caption := IntToStr(Round(rFatAjus * CdsPesqSal.FieldByName('PRIMQUA').asFloat));
  rpPesqSalLblPRIQUA2.Caption := IntToStr(Round(rFatAjus * CdsPesqSal.FieldByName('PRIMQUA_R').asFloat));
  rpPesqSalLblTERQUA1.Caption := IntToStr(Round(rFatAjus * CdsPesqSal.FieldByName('TERCQUA').asFloat));
  rpPesqSalLblTERQUA2.Caption := IntToStr(Round(rFatAjus * CdsPesqSal.FieldByName('TERCQUA_R').asFloat));

  // Se Por Empresa e não entra na Média, ou acima do corte, aborta a execução
  if (CmpRptCM.ParamByName('TipoRelatorio').asInteger = 1) and
     (Copy(CdsPesqSal.FieldByName('DESCRICAO').asString, 1, 4) <> '* - ') and
     ((CmpRptCM.ParamByName('PercCorte').asInteger = 0) or
      ((abs(CdsPesqSal.FieldByName('MENOR').asFloat - CdsPesqSal.FieldByName('MEDIA').asFloat)
        * 100 / CdsPesqSal.FieldByName('MEDIA').asFloat <= CmpRptCM.ParamByName('PercCorte').asInteger) and
       (abs(CdsPesqSal.FieldByName('MAIOR').asFloat - CdsPesqSal.FieldByName('MEDIA').asFloat)
        * 100 / CdsPesqSal.FieldByName('MEDIA').asFloat <= CmpRptCM.ParamByName('PercCorte').asInteger) and
       (abs(CdsPesqSal.FieldByName('MENOR_R').asFloat - CdsPesqSal.FieldByName('MEDIA_R').asFloat)
        * 100 / CdsPesqSal.FieldByName('MEDIA_R').asFloat <= CmpRptCM.ParamByName('PercCorte').asInteger) and
       (abs(CdsPesqSal.FieldByName('MAIOR_R').asFloat - CdsPesqSal.FieldByName('MEDIA_R').asFloat)
        * 100 / CdsPesqSal.FieldByName('MEDIA_R').asFloat <= CmpRptCM.ParamByName('PercCorte').asInteger))) then
  begin
    iTotFreq := iTotFreq + CdsPesqSal.FieldByName('FREQ').asInteger;
    if (StrToInt(rpPesqSalLblMENOR1.Caption) < rTotMenor) then
      rTotMenor := StrToInt(rpPesqSalLblMENOR1.Caption);

    rTotMedia := rTotMedia + CdsPesqSal.FieldByName('FREQ').asInteger *
      StrToInt(rpPesqSalLblMEDIA1.Caption);
    if (StrToInt(rpPesqSalLblMAIOR1.Caption) > rTotMaior) then
      rTotMaior := StrToInt(rpPesqSalLblMAIOR1.Caption);

    if (StrToInt(rpPesqSalLblMENOR2.Caption) < rTotMenorR) then
      rTotMenorR := StrToInt(rpPesqSalLblMENOR2.Caption);

    rTotMediaR := rTotMediaR + CdsPesqSal.FieldByName('FREQ').asInteger *
      StrToInt(rpPesqSalLblMEDIA2.Caption);
    if (StrToInt(rpPesqSalLblMAIOR2.Caption) > rTotMaiorR) then
      rTotMaiorR := StrToInt(rpPesqSalLblMAIOR2.Caption);
  end;
end;

procedure TRptPesqSal.rpPesqSalGrpFootBndBeforePrint(Sender: TObject);
var
  IdEmpresa: integer;
  bOk: boolean;
begin
  if (iTotFreq = 0) then
  begin
    rTotMenor := 0;
    rTotMenorR := 0;
  end;

  if (CmpRptCM.ParamByName('TipoRelatorio').asInteger = 1) then
  begin
    rpPesqSalLblMENOR1_TOT.Caption := FloatToStrF(rTotMenor, ffFixed, 12, 0);
    rpPesqSalLblMAIOR1_TOT.Caption := FloatToStrF(rTotMaior, ffFixed, 12, 0);

    if (iTotFreq > 0) then
      rpPesqSalLblMEDIA1_TOT.Caption := FloatToStrF(rTotMedia / iTotFreq, ffFixed, 12, 0)
    else
      rpPesqSalLblMEDIA1_TOT.Caption := '0';

    rpPesqSalLblMENOR2_TOT.Caption := FloatToStrF(rTotMenorR, ffFixed, 12, 0);
    rpPesqSalLblMAIOR2_TOT.Caption := FloatToStrF(rTotMaiorR, ffFixed, 12, 0);

    if (iTotFreq > 0) then
      rpPesqSalLblMEDIA2_TOT.Caption := FloatToStrF(rTotMediaR / iTotFreq, ffFixed, 12, 0)
    else
      rpPesqSalLblMEDIA2_TOT.Caption := '0';

    exit;
  end;

  // Relatório por Cargo
  if (CmpRptCM.ParamByName('IdEmpresa').asInteger > 0) then
    IdEmpresa := CmpRptCM.ParamByName('IdEmpresa').asInteger
  else
    IdEmpresa := -1;


  if (CmpRptCM.ParamByName('PercCorte').asInteger > 0) then
  begin
    bOk := CtrlTabPesqui.GerarTabulacao(
      CmpRptCM.ParamByName('TipoExclusaoEmpresa').asInteger,
      Sistema.IdEmpresa,
      IdEmpresa,
      CmpRptCM.ParamByName('IdPesquisa').asFloat,
      CdsPesqSal.FieldByName('IDCARGO').asFloat,
      0);

    if (not bOk) or (CtrlTabPesqui.Frequencia = 0) then
    begin
      // Não há dados a serem exibidos com os parãmetros selecionados
      exit;
    end;
  end;


  bOk := CtrlTabPesqui.GerarTabulacao(
      CmpRptCM.ParamByName('TipoExclusaoEmpresa').asInteger,
      Sistema.IdEmpresa,
      IdEmpresa,
      CmpRptCM.ParamByName('IdPesquisa').asFloat,
      CdsPesqSal.FieldByName('IDCARGO').asFloat,
      CmpRptCM.ParamByName('PercCorte').asInteger);

  if (bOk) and (CtrlTabPesqui.Frequencia > 0) then
  begin
    rpPesqSalDBCalc1.Visible := false;
    rpPesqSalLblFREQ_TOT.Caption := IntToStr(CtrlTabPesqui.Frequencia);
    rpPesqSalLblMENOR1_TOT.Caption := IntToStr(CtrlTabPesqui.ValMenor);
    rpPesqSalLblMENOR2_TOT.Caption := IntToStr(CtrlTabPesqui.ValMenorReal);
    rpPesqSalLblPRIMQ1_TOT.Caption := IntToStr(CtrlTabPesqui.Quartil1);
    rpPesqSalLblPRIMQ2_TOT.Caption := IntToStr(CtrlTabPesqui.Quartil1Real);
    rpPesqSalLblMODA1_TOT.Caption := FloatToStrF(CtrlTabPesqui.Moda, ffFixed,10,0);
    rpPesqSalLblMODA2_TOT.Caption := FloatToStrF(CtrlTabPesqui.ModaReal, ffFixed,10,0);
    rpPesqSalLblMEDIA1_TOT.Caption := FloatToStrF(CtrlTabPesqui.Media, ffFixed, 12, 0);
    rpPesqSalLblMEDIA2_TOT.Caption := FloatToStrF(CtrlTabPesqui.MediaReal, ffFixed, 12, 0);
    rpPesqSalLblMEDIANA1_TOT.Caption := IntToStr(CtrlTabPesqui.Mediana);
    rpPesqSalLblMEDIANA2_TOT.Caption := IntToStr(CtrlTabPesqui.MedianaReal);
    rpPesqSalLblTERCQ1_TOT.Caption := IntToStr(CtrlTabPesqui.Quartil3);
    rpPesqSalLblTERCQ2_TOT.Caption := IntToStr(CtrlTabPesqui.Quartil3Real);
    rpPesqSalLblMAIOR1_TOT.Caption := IntToStr(CtrlTabPesqui.ValMaior);
    rpPesqSalLblMAIOR2_TOT.Caption := IntToStr(CtrlTabPesqui.ValMaiorReal);

  end
  else
  begin
      // Não há dados a serem exibidos com os parãmetros selecionados
  end;

end;

procedure TRptPesqSal.rpPesqSalGrpFootBndAfterPrint(Sender: TObject);
begin
  iTotFreq := 0;
  rTotMenor := (9999 * 9999);
  rTotMedia := 0;
  rTotMaior := 0;
  rTotMenorR := (9999 * 9999);
  rTotMediaR := 0;
  rTotMaiorR := 0;
end;

procedure TRptPesqSal.rpPesqSalSmryBndAfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

procedure TRptPesqSal.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlTabPesqui := TCtrlTabPesqui.Create;
  CtrlTabPesqui.InitializeAs(Padroes);
  CtrlTabPesqui.CdsTendencia := CdsTendencia;
end;

procedure TRptPesqSal.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(CtrlTabPesqui);
end;

end.
