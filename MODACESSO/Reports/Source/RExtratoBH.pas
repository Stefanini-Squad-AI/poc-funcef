unit RExtratoBH;

interface

uses
  Windows, Messages, SysUtils,  Classes, Graphics, Controls, Forms, Dialogs, DBClient,
  DB, FCmReport, uCMClientDataSet, uCmSqlParams, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppStrtch,
  ppRegion, ppCtrls, ppBands, ppClass, ppVar, ppPrnabl, ppCache, ppComm, ppRelatv, ppProd,
  ppReport, uCmRptManager, TXComp, CmParamReport, IvDictio, IvMulti, 
  uCtrlBancoHoras, TXRB;

type
  TRptExtratoBH = class(TFrmCmReport)
    rpExtratoBH: TppReport;
    rpExtratoBHHdrBnd: TppHeaderBand;
    ppLabel1: TppLabel;
    rpExtratoBHLbl2: TppLabel;
    rpExtratoBHLbl3: TppLabel;
    rpExtratoBHDBTxt1: TppDBText;
    rpExtratoBHSysVar1: TppSystemVariable;
    rpExtratoBHSysVar2: TppSystemVariable;
    rpExtratoBHLbl4: TppLabel;
    rpExtratoBHLblDATAINI: TppLabel;
    rpExtratoBHLbl5: TppLabel;
    rpExtratoBHLblDATAFINAL: TppLabel;
    rpExtratoBHDtlBnd: TppDetailBand;
    rpExtratoBHDBTxt6: TppDBText;
    ppDBText2: TppDBText;
    rpExtratoBHSmryBnd: TppSummaryBand;
    rpExtratoBHGrp1: TppGroup;
    rpExtratoBHGrpHdrBnd1: TppGroupHeaderBand;
    rpExtratoBHLbl6: TppLabel;
    rpExtratoBHLbl7: TppLabel;
    rpExtratoBHLbl8: TppLabel;
    rpExtratoBHGrpFootBnd1: TppGroupFooterBand;
    rpExtratoBHLbl14: TppLabel;
    rpExtratoBHLbl15: TppLabel;
    rpCalc1Tot: TppDBCalc;
    rpCalc2Tot: TppDBCalc;
    rpExtratoBHGrp2: TppGroup;
    rpExtratoBHGrpHdrBnd2: TppGroupHeaderBand;
    ppShape1: TppShape;
    rpExtratoBHDBTxt3: TppDBText;
    rpExtratoBHDBTxt4: TppDBText;
    rpExtratoBHDBTxt5: TppDBText;
    ppRegCab: TppRegion;
    rpExtratoBHLbl9: TppLabel;
    ppLabel2: TppLabel;
    ppLabel4: TppLabel;
    rpExtratoBHLbl10: TppLabel;
    rpExtratoBHGrpFootBnd2: TppGroupFooterBand;
    ppLabel3: TppLabel;
    rpCalc2: TppDBCalc;
    rpCalc3: TppDBCalc;
    ppExtratoBH: TppBDEPipeline;
    dsExtratoBH: TwwDataSource;
    sqlExtratoBH: TCMSqlParams;
    CdsExtratoBH: TCMClientDataSet;
    ppDBText3: TppDBText;
    ppDBCalc1: TppDBCalc;
    ppDBText1: TppDBText;
    ppLabel9: TppLabel;
    ppDBText4: TppDBText;
    lblValorSimulado: TppLabel;
    dbValorSimulado: TppDBText;
    TotValorSimulado: TppDBCalc;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CdsExtratoBHAfterScroll(DataSet: TDataSet);
    procedure rpExtratoBHSmryBndAfterPrint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    CtrlBancoHoras: TCtrlBancoHoras;
    
    procedure GerarDadosRelatorio;
  end;

var
  RptExtratoBH: TRptExtratoBH;

implementation

uses uCtrlFuncoesRH, fAguarde, dCds, uCtrlPadroes;

{$R *.dfm}

procedure TRptExtratoBH.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlBancoHoras := TCtrlBancoHoras.Create;
  CtrlBancoHoras.InitializeAs(Padroes);
end;

procedure TRptExtratoBH.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlBancoHoras);
  inherited;
end;

procedure TRptExtratoBH.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  // Apagar o índice se este existir
  dmCds.Cds.IndexName := '';
  if (dmCds.Cds.IndexDefs.IndexOf('Index1') > 0) then
    dmCds.Cds.DeleteIndex('Index1');

  lblValorSimulado.Visible := (CmpRptCM.ParamByName('Simula').asBoolean);
  dbValorSimulado.Visible := (CmpRptCM.ParamByName('Simula').asBoolean);
  TotValorSimulado.Visible := (CmpRptCM.ParamByName('Simula').asBoolean);


  with (dmCds.sql.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  F.IDPESSOA,');
    Add('  F.MATRICULA,');
    Add('  RTRIM(PF.NOME) AS NOME,');
    Add('  C.TITULO AS CARGO,');
    Add('  BH.DATABANCOHORAS AS DATABH,');
    Add('  (CASE');
    Add('     WHEN BH.VALBANCOHORAS >= 0 THEN BH.VALBANCOHORAS');
    Add('     ELSE 0');
    Add('   END) AS CREDITO,');
    Add('  (CASE');
    Add('     WHEN BH.VALBANCOHORAS < 0 THEN -BH.VALBANCOHORAS');
    Add('     ELSE 0');
    Add('   END) AS DEBITO');
    Add('FROM');
    Add('  PESSOA PF, FUNCIONARIO F, BANCOHORAS BH, CARGO C');
    // -------------------------------------------------------------------- //
    Add('WHERE');

    // Funcionários selecionados
    if (CmpRptCM.ParamByName('ListaIdPessoa').asString <> '') then
      Add(FU.MontaLinhaSelSQL('  (PF.IDPESSOA',CmpRptCM.ParamByName('ListaIdPessoa').asString,7))
    else
      Add('  (PF.IDPESSOA        = -1) AND');

    //if not(CmpRptCM.ParamByName('ListaProcessados').asBoolean) then
    //  Add('  (NVL(BH.SITBANCOHORAS, 0) = 0) AND');

    Add('  (BH.DATABANCOHORAS >= TO_DATE(' +
      QuotedStr(CmpRptCM.ParamByName('DataInicial').asString)+ ',''DD/MM/YYYY'')) AND');
    Add('  (BH.DATABANCOHORAS <= TO_DATE(' +
      QuotedStr(CmpRptCM.ParamByName('DataFinal').asString)+ ',''DD/MM/YYYY'')) AND');
    Add('  (PF.IDPESSOA        = F.IDPESSOA) AND');
    Add('  (PF.IDPESSOA        = BH.IDPESSOA) AND');
    Add('  (F.IDCARGO          = C.IDCARGO(+))');
    Add('ORDER BY');
    Add('  UPPER(NOME), DATABH');
    SaveToFile(FU.DirTempLog + '\qry.txt');
  end;
  GerarDadosRelatorio;
  frmAguarde.Min := 0;
  frmAguarde.Max := CdsExtratoBH.RecordCount;

  rpExtratoBHLblDATAINI.Caption := CmpRptCM.ParamByName('DataInicial').asString;
  rpExtratoBHLblDATAFINAL.Caption := CmpRptCM.ParamByName('DataFinal').asString;
end;

procedure TRptExtratoBH.CdsExtratoBHAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TRptExtratoBH.rpExtratoBHSmryBndAfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

procedure TRptExtratoBH.GerarDadosRelatorio;
var
  c: byte;
  iSaldo: integer;
  sMatricula: string;
  bIncEmpregado: boolean;
begin
  dmCds.sql.Open;
  sqlExtratoBH.Open;
  if not(dmCds.Cds.IsEmpty) then
  begin
    sMatricula := dmCds.Cds.FieldByName('MATRICULA').asString;
    bIncEmpregado := true;
    iSaldo := 0;
    while not(dmCds.Cds.EOF) do
    begin
      CdsExtratoBH.Append;
      // -2 pois o primeiro campo não será passado para o Cds Principal
      for c:=0 to dmCds.Cds.FieldCount-2 do
        CdsExtratoBH.Fields[c].Value := dmCds.Cds.Fields[c+1].Value;

      if (bIncEmpregado) then
      begin
        CdsExtratoBH.FieldByName('NUMEMPREGADO').asInteger := 1;
        bIncEmpregado := false;
        iSaldo := CtrlBancoHoras.VerificaSaldoBancoHorasPeriodo(
          dmCds.Cds.FieldByName('IDPESSOA').asFloat,
          DateToStr(CmpRptCM.ParamByName('DataInicial').asDateTime - 1000),
          DateToStr(CmpRptCM.ParamByName('DataInicial').asDateTime - 1));

        CdsExtratoBH.FieldByName('SALDOANTERIOR').asInteger := iSaldo;
      end;

      CdsExtratoBH.FieldByName('EMPRESA').asString := CmpRptCM.ParamByName('NomeEmpresa').asString;
      iSaldo := iSaldo +
        dmCds.Cds.FieldByName('CREDITO').asInteger -
        dmCds.Cds.FieldByName('DEBITO').asInteger;
      CdsExtratoBH.FieldByName('SALDO').asInteger := iSaldo;

      dmCds.Cds.Next;

      if (CmpRptCM.ParamByName('Simula').asBoolean) and  (iSaldo <> 0) and
         ((sMatricula <> dmCds.Cds.FieldByName('MATRICULA').asString) or
          (dmCds.Cds.Eof)) then
          CdsExtratoBH.FieldByName('VALOR').asFloat :=
            CtrlBancoHoras.SimulaValorBancoHoras(sMatricula, iSaldo,
            FU.IFF(iSaldo > 0, CmpRptCM.ParamByName('PercPos').asFloat,
            CmpRptCM.ParamByName('PercNeg').asFloat));

      if (sMatricula <> dmCds.Cds.FieldByName('MATRICULA').asString) then
      begin
        bIncEmpregado := true;
        sMatricula := dmCds.Cds.FieldByName('MATRICULA').asString;
      end;

      CdsExtratoBH.Post;
    end;
    CdsExtratoBH.First;
  end;
end;

end.
