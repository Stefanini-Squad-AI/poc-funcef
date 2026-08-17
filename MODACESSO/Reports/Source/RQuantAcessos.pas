unit RQuantAcessos;

interface

uses
  Windows, Messages, SysUtils,  Classes, Graphics, Controls, Forms, Dialogs, DBClient,
  DB, FCmReport, uCMClientDataSet, uCmSqlParams, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppStrtch,
  ppRegion, ppCtrls, ppBands, ppClass, ppVar, ppPrnabl, ppCache, ppComm, ppRelatv, ppProd,
  ppReport, uCmRptManager, TXComp, CmParamReport, IvDictio, IvMulti,
  TXRB;

type
  TRptQuantAcessos = class(TFrmCmReport)
    rpQuantAcessos: TppReport;
    rpOcorrPessHdrBnd: TppHeaderBand;
    ppLabel1: TppLabel;
    rpOcorrPessLbl2: TppLabel;
    rpOcorrPessLbl3: TppLabel;
    rpOcorrPessDBTxt1: TppDBText;
    rpOcorrPessSysVar1: TppSystemVariable;
    rpOcorrPessSysVar2: TppSystemVariable;
    rpOcorrPessLbl4: TppLabel;
    rpOcorrPessLblDATAINI: TppLabel;
    rpOcorrPessLbl5: TppLabel;
    rpOcorrPessLblDATAFINAL: TppLabel;
    rpOcorrPessDtlBnd: TppDetailBand;
    rpOcorrPessDBTxt6: TppDBText;
    rpOcorrPessDBTxt7: TppDBText;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    rpOcorrPessSmryBnd: TppSummaryBand;
    rpOcorrPessGrp1: TppGroup;
    rpOcorrPessGrpHdrBnd1: TppGroupHeaderBand;
    rpOcorrPessLbl6: TppLabel;
    rpOcorrPessLbl7: TppLabel;
    rpOcorrPessLbl8: TppLabel;
    rpOcorrPessGrpFootBnd1: TppGroupFooterBand;
    rpOcorrPessLbl14: TppLabel;
    rpOcorrPessLbl15: TppLabel;
    rpCalc1Tot: TppDBCalc;
    rpCalc2Tot: TppDBCalc;
    rpOcorrPessGrp2: TppGroup;
    rpOcorrPessGrpHdrBnd2: TppGroupHeaderBand;
    ppShape1: TppShape;
    rpOcorrPessDBTxt3: TppDBText;
    rpOcorrPessDBTxt4: TppDBText;
    rpOcorrPessDBTxt5: TppDBText;
    ppRegCab: TppRegion;
    rpOcorrPessLbl9: TppLabel;
    ppLabel2: TppLabel;
    ppLabel4: TppLabel;
    rpOcorrPessLbl10: TppLabel;
    rpOcorrPessGrpFootBnd2: TppGroupFooterBand;
    ppLabel3: TppLabel;
    rpCalc2: TppDBCalc;
    rpCalc3: TppDBCalc;
    ppQuantAcessos: TppBDEPipeline;
    dsQuantAcessos: TwwDataSource;
    sqlQuantAcessos: TCMSqlParams;
    CdsQuantAcessos: TCMClientDataSet;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppDBText3: TppDBText;
    sqlReal: TCMSqlParams;
    CdsReal: TCMClientDataSet;
    ppDBText4: TppDBText;
    rpOcorrPessDBCalc1: TppDBCalc;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CdsQuantAcessosAfterScroll(DataSet: TDataSet);
    procedure rpOcorrPessSmryBndAfterPrint(Sender: TObject);
  private
    procedure GerarDadosRelatorio;
    function  GetAcessosRealizados: integer;
  end;

var
  RptQuantAcessos: TRptQuantAcessos;

implementation

uses uCtrlFuncoesRH, fAguarde, dCds;

{$R *.dfm}

procedure TRptQuantAcessos.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  // Apagar o índice se este existir
  dmCds.Cds.IndexName := '';
  if (dmCds.Cds.IndexDefs.IndexOf('Index1') > 0) then
    dmCds.Cds.DeleteIndex('Index1');

  with (dmCds.sql.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  F.IDPESSOA,');
    Add('  AF.IDESTACAOACESSO,');
    Add('  F.MATRICULA,');
    Add('  RTRIM(PF.NOME) AS NOME,');
    Add('  C.TITULO AS CARGO,');
    Add('  AF.ENTRADA,');
    Add('  AF.SAIDA,');
    Add('  EA.ESTACAO || '' - '' || EA.DESCRICAO AS DESCRICAO,');
    Add('  AF.QTDEVEZES AS PERMITIDOS');
    Add('FROM');
    Add('  PESSOA PF, FUNCIONARIO F, ACESSOFUNC AF, ESTACAOACESSO EA, CARGO C');
    // -------------------------------------------------------------------- //
    Add('WHERE');

    // Funcionários/Candidatos selecionados
    if (CmpRptCM.ParamByName('ListaIdPessoa').asString <> '') then
      Add(FU.MontaLinhaSelSQL('  (PF.IDPESSOA',CmpRptCM.ParamByName('ListaIdPessoa').asString,7))
    else
      Add('  (PF.IDPESSOA        = -1) AND');

    Add('  ((AF.ENTRADA  BETWEEN TO_DATE(' +
      QuotedStr(CmpRptCM.ParamByName('DataInicial').asString)+ ',''DD/MM/YYYY'') AND '+
      'TO_DATE(' +QuotedStr(CmpRptCM.ParamByName('DataFinal').asString)+ ',''DD/MM/YYYY'')) OR');

    Add('   (AF.SAIDA    BETWEEN TO_DATE(' +
      QuotedStr(CmpRptCM.ParamByName('DataInicial').asString)+ ',''DD/MM/YYYY'') AND '+
      'TO_DATE(' +QuotedStr(CmpRptCM.ParamByName('DataFinal').asString)+ ',''DD/MM/YYYY''))) AND');

    Add('  (PF.IDPESSOA        = F.IDPESSOA) AND');
    Add('  (PF.IDPESSOA        = AF.IDPESSOA) AND');
    Add('  (AF.IDESTACAOACESSO = EA.IDESTACAOACESSO) AND');
    Add('  (AF.INDFUNCAO       = ''Q'') AND');
    Add('  (F.IDCARGO          = C.IDCARGO(+))');
    Add('ORDER BY');
    Add('  UPPER(NOME), AF.ENTRADA');
    SaveToFile(FU.DirTempLog + '\qry.txt');
  end;
  GerarDadosRelatorio;
  frmAguarde.Min := 0;
  frmAguarde.Max := CdsQuantAcessos.RecordCount;

  rpOcorrPessLblDATAINI.Caption := CmpRptCM.ParamByName('DataInicial').asString;
  rpOcorrPessLblDATAFINAL.Caption := CmpRptCM.ParamByName('DataFinal').asString;
end;

procedure TRptQuantAcessos.CdsQuantAcessosAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TRptQuantAcessos.rpOcorrPessSmryBndAfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

procedure TRptQuantAcessos.GerarDadosRelatorio;
var
  c: byte;
  sMatricula: string;
  bIncEmpregado: boolean;
begin
  dmCds.sql.Open;
  sqlQuantAcessos.Open;
  if not(dmCds.Cds.IsEmpty) then
  begin
    sMatricula := dmCds.Cds.FieldByName('MATRICULA').asString;
    bIncEmpregado := true;
    while not(dmCds.Cds.EOF) do
    begin
      CdsQuantAcessos.Append;
      // -3 pois os dois primeiros campos não serão passados para o Cds Principal
      for c:=0 to dmCds.Cds.FieldCount-3 do
        CdsQuantAcessos.Fields[c].Value := dmCds.Cds.Fields[c+2].Value;

      if (bIncEmpregado) then
      begin
        CdsQuantAcessos.FieldByName('NUMEMPREGADO').asInteger := 1;
        bIncEmpregado := false;
      end;

      CdsQuantAcessos.FieldByName('EMPRESA').asString := CmpRptCM.ParamByName('NomeEmpresa').asString;
      CdsQuantAcessos.FieldByName('REALIZADOS').asInteger := GetAcessosRealizados;
      CdsQuantAcessos.FieldByName('SALDO').asInteger :=
        dmCds.Cds.FieldByName('PERMITIDOS').asInteger -
        CdsQuantAcessos.FieldByName('REALIZADOS').asInteger;
      CdsQuantAcessos.Post;

      dmCds.Cds.Next;
      if (sMatricula <> dmCds.Cds.FieldByName('MATRICULA').asString) then
      begin
        bIncEmpregado := true;
        sMatricula := dmCds.Cds.FieldByName('MATRICULA').asString;
      end;
    end;
    CdsQuantAcessos.First;
  end;
end;

function TRptQuantAcessos.GetAcessosRealizados: integer;
begin
  with (sqlReal.SQL) do
  begin
    Clear;
    if (dmCds.Cds.FieldByName('IDPESSOA').asString = '') then
      Add('SELECT 0 AS REALIZADOS FROM DUAL')
    else
    begin
      Add('SELECT');
      Add('  COUNT(*) AS REALIZADOS');
      Add('FROM');
      Add('  ACESSOFUNC');
      Add('WHERE');
      Add('  (ENTRADA        >= TO_DATE(' +
        QuotedStr(dmCds.Cds.FieldByName('ENTRADA').asString)+ ',''DD/MM/YYYY'')) AND');
      Add('  (ENTRADA        <= TO_DATE(' +
        QuotedStr(dmCds.Cds.FieldByName('SAIDA').asString)+ ',''DD/MM/YYYY'')+1) AND');
      Add('  (IDPESSOA        = ' +dmCds.Cds.FieldByName('IDPESSOA').asString+ ') AND');
      Add('  (IDESTACAOACESSO = ' +dmCds.Cds.FieldByName('IDESTACAOACESSO').asString+ ') AND');
      Add('  (INDFUNCAO      <> ''Q'')');
    end;
  end;
  sqlReal.Open;
  Result := CdsReal.FieldByName('REALIZADOS').asInteger;
end;

end.
