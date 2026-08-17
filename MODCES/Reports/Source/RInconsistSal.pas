//******************************************************************************
//N. Sol..........: 171426
//N. Kintana......: 1537613
//Data............: 10/03/2012
//Responsável.....: Edilaine Ferraresi
//Descrição.......: Inclusão de novas faixas salariais (de 9 para 20)
// *****************************************************************************

unit RInconsistSal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport, Db,
  DBClient, uCMClientDataSet, uCmSqlParams, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppCtrls,
  ppBands, ppClass, ppVar, ppPrnabl, ppCache, ppComm, ppRelatv, ppProd, ppReport,
  uCmRptManager, TXComp, CmParamReport, uCtrlTabelaHay, TXRB;

type
  TRptInconsistSal = class(TFrmCmReport)
    rpInconsistSal: TppReport;
    InconsistSalHdrBnd1: TppHeaderBand;
    InconsistSalLbl1: TppLabel;
    InconsistSalLbl2: TppLabel;
    InconsistSalLbl3: TppLabel;
    InconsistSalLbl4: TppLabel;
    InconsistSalLbl5: TppLabel;
    InconsistSalLine1: TppLine;
    InconsistSalDBTxt1: TppDBText;
    InconsistSalLbl6: TppLabel;
    InconsistSalLbl7: TppLabel;
    InconsistSalCalc1: TppSystemVariable;
    InconsistSalCalc2: TppSystemVariable;
    InconsistSalDtlBnd1: TppDetailBand;
    InconsistSalDBTxt2: TppDBText;
    InconsistSalDBTxt3: TppDBText;
    InconsistSalDBTxt4: TppDBText;
    InconsistSalDBTxt5: TppDBText;
    InconsistSalDBTxt6: TppDBText;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    InconsistSalFootBnd1: TppFooterBand;
    rpInconsistSalSmryBnd: TppSummaryBand;
    rpInconsistSalGroup1: TppGroup;
    InconsistSalGrpHdrBnd1: TppGroupHeaderBand;
    InconsistSalGrpFootBnd1: TppGroupFooterBand;
    rpInconsistSalLabel1: TppLabel;
    rpInconsistSalDBCalc1: TppDBCalc;
    rpInconsistSalLabel2: TppLabel;
    rpInconsistSalLabel3: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppInconsistSal: TppBDEPipeline;
    dsInconsistSal: TwwDataSource;
    sqlInconsistSal: TCMSqlParams;
    CdsInconsistSal: TCMClientDataSet;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CdsInconsistSalAfterScroll(DataSet: TDataSet);
    procedure rpInconsistSalSmryBndAfterPrint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    CtrlTabelaHay: TCtrlTabelaHay;

    procedure GerarDadosRelatorio;
  end;

var
  RptInconsistSal: TRptInconsistSal;

implementation

uses uSistema, fAguarde, uCtrlPadroes, uCtrlFuncoesRH, dCds;

{$R *.DFM}

procedure TRptInconsistSal.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlTabelaHay := TCtrlTabelaHay.Create;
  CtrlTabelaHay.InitializeAs(Padroes);
end;

procedure TRptInconsistSal.FormDestroy(Sender: TObject);
begin
  FreeAndNil(CtrlTabelaHay);
  inherited;
end;

procedure TRptInconsistSal.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  with (dmCds.sql.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  F.MATRICULA, PF.NOME AS EMPREGADO,');
    Add('  C.TITULO AS CARGO, F.IDCARGO,');
    Add('  F.SALARIOATUAL, PRH.FLGNIVELINDIV, F.TIPOPAGAMENTO');

    // Faixas Salariais do cargo
    if (CmpRptCM.ParamByName('IndPolitica').asInteger = 0) then
      Add('  ,FS.STEP1, FS.STEP2, FS.STEP3, FS.STEP4, FS.STEP5, FS.STEP6, FS.STEP7, FS.STEP8, FS.STEP9'+
          '  ,FS.STEP10, FS.STEP11, FS.STEP12, FS.STEP13, FS.STEP14, FS.STEP15 '+ // Edilaine Ferraresi - SOL 171426 / KTN 1537613 - de 9 para 20
          '  ,FS.STEP16, FS.STEP17, FS.STEP18, FS.STEP19, FS.STEP20'); // Edilaine Ferraresi - SOL 171426 / KTN 1537613 - de 9 para 20

    Add('FROM');
    Add('  PESSOA PF, FUNCIONARIO F, CARGO C, PARAMRH PRH');

    if (CmpRptCM.ParamByName('IndPolitica').asInteger = 0) then
      Add('  , FAIXASAL FS');

    Add('WHERE');

    if (CmpRptCM.ParamByName('IndPolitica').asInteger = 0) then  
      Add('  (DECODE(PRH.FLGNIVELINDIV,1,F.IDFAIXACARGO,C.IDFAIXASALARIAL) IS NOT NULL) AND');

    // Funcionários selecionado(s)
    if (CmpRptCM.ParamByName('ListaIdFunc').asString <> '') then
    begin
      if (Pos(',',CmpRptCM.ParamByName('ListaIdFunc').asString) > 0) then
        Add('  (PF.IDPESSOA      IN (' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ')) AND')
      else
        Add('  (PF.IDPESSOA       = ' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ') AND');
    end;

    Add('  (PF.IDPESSOA       = F.IDPESSOA) AND');
    Add('  (F.IDCARGO         = C.IDCARGO) ');

    if (CmpRptCM.ParamByName('IndPolitica').asInteger = 0) then  
      Add(' AND (DECODE(PRH.FLGNIVELINDIV,1,F.IDFAIXACARGO,C.IDFAIXASALARIAL) = FS.IDFAIXASALARIAL)');

    Add('ORDER BY NOME DESC');
    SaveToFile('c:\qry.txt');
  end;
  frmAguarde.Mostra('Listagem de Inconsistências Salariais');
  frmAguarde.Pos := 0;
  frmAguarde.Update;

  GerarDadosRelatorio;
  CdsInconsistSal.First;

  frmAguarde.Min := 0;
  frmAguarde.Max := CdsInconsistSal.RecordCount;
end;

procedure TRptInconsistSal.CdsInconsistSalAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TRptInconsistSal.rpInconsistSalSmryBndAfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

procedure TRptInconsistSal.GerarDadosRelatorio;
var
  c: byte;
  dValor, dValMin, dValMax: double;
begin
  dmCds.sql.Open;
  sqlInconsistSal.Open;
  if not(dmCds.Cds.IsEmpty) then
  begin
    repeat
      if (CmpRptCM.ParamByName('IndPolitica').asInteger = 0) then
      begin
        dValMin := dmCds.Cds.FieldByName('STEP1').asFloat;
        dValMax := dmCds.Cds.FieldByName('STEP1').asFloat;

        for c:=2 to 20 {9} do  // Edilaine Ferraresi - SOL 171426 / KTN 1537613 - de 9 para 20
          if (dmCds.Cds.FieldByName('STEP' +IntToStr(c)).asFloat > dValMax) then
            dValMax := dmCds.Cds.FieldByName('STEP' +IntToStr(c)).asFloat;
      end
      else
      begin // Tabela Hay
        dValMin := CtrlTabelaHay.GetValorHay(dmCds.Cds.FieldByName('IdCargo').asInteger);
        dValMax := dValMin * CmpRptCM.ParamByName('HayMax').asFloat;
        dValMin := dValMin * CmpRptCM.ParamByName('HayMin').asFloat;
      end;

      dValor := dmCds.Cds.FieldByName('SALARIOATUAL').asFloat;

      if (dmCds.Cds.FieldByName('TIPOPAGAMENTO').asString = 'D') then
        dValor := dValor * 30
      else
      if (dmCds.Cds.FieldByName('TIPOPAGAMENTO').asString = 'H') then
        dValor := dValor * dmCds.Cds.FieldByName('JORNADAMENSAL').asInteger;

      if ((dValor >= dValMin) and (dValor <= dValMax)) or (dValMax <= 0) then
      begin
        dmCds.Cds.Next;
        continue;
      end;

      CdsInconsistSal.Insert;
      CdsInconsistSal.FieldByName('EMPREGADO').asString := dmCds.Cds.FieldByName('EMPREGADO').asString;
      CdsInconsistSal.FieldByName('MATRICULA').asString := dmCds.Cds.FieldByName('MATRICULA').asString;
      CdsInconsistSal.FieldByName('CARGO').asString := dmCds.Cds.FieldByName('CARGO').asString;
      CdsInconsistSal.FieldByName('EMPRESA').asString := Sistema.NomeEmpresa;
      CdsInconsistSal.FieldByName('SALARIOATUAL').asString := dmCds.Cds.FieldByName('SALARIOATUAL').asString;

      if dmCds.Cds.FieldByName('TIPOPAGAMENTO').asString <> '' then
      begin
      case (dmCds.Cds.FieldByName('TIPOPAGAMENTO').asString[1]) of
        'H' : CdsInconsistSal.FieldByName('TIPOPAGAMENTO').asString := 'Horista';
        'D' : CdsInconsistSal.FieldByName('TIPOPAGAMENTO').asString := 'Diarista';
        'M' : CdsInconsistSal.FieldByName('TIPOPAGAMENTO').asString := 'Mensalista';
        'T' : CdsInconsistSal.FieldByName('TIPOPAGAMENTO').asString := 'Tarefa';
      end;
      end
      else
        CdsInconsistSal.FieldByName('TIPOPAGAMENTO').asString := 'Mensalista';
        
      CdsInconsistSal.FieldByName('TIPOPAGAMENTO').asString :=
        '(' +CdsInconsistSal.FieldByName('TIPOPAGAMENTO').asString+ ')';

      if (dValor < dValMin) then
      begin
        CdsInconsistSal.FieldByName('ABAIXO_MINIMO').asInteger := 1;
        CdsInconsistSal.FieldByName('ACIMA_MINIMO').asInteger := 0;
        CdsInconsistSal.FieldByName('VALOR_REF').asFloat := dValMin;
        dValMax := (dValMin - dValor) * 100 / dValMin;
        CdsInconsistSal.FieldByName('OBSERV').asString :=
          Trim(FloatToStrF(dValMax,ffNumber,10,2)) + '% Abaixo do Min.';
      end
      else
      begin
        CdsInconsistSal.FieldByName('ABAIXO_MINIMO').asInteger := 0;
        CdsInconsistSal.FieldByName('ACIMA_MINIMO').asInteger := 1;
        CdsInconsistSal.FieldByName('VALOR_REF').asFloat := dValMax;
        dValMin := (dValor - dValMax) * 100 / dValMax;
        CdsInconsistSal.FieldByName('OBSERV').asString :=
          Trim(FloatToStrF(dValMin,ffNumber,10,2)) + '% Acima do Max.';
      end;
      CdsInconsistSal.Post;

      dmCds.Cds.Next;
    until (dmCds.Cds.EOF);
  end
  else
  begin
    CdsInconsistSal.Insert;
    CdsInconsistSal.Post;
  end;
end;

end.
