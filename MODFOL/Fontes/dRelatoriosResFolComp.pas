unit dRelatoriosResFolComp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, dReports,
  ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd, ppReport, Db, DBTables,
  Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE;

type
  TdtmRelatoriosResFolComp = class(TdtmReports)
    rpResFolComp: TppReport;
    rpResFolCompHdrBnd1: TppHeaderBand;
    rpResFolCompLbl5: TppLabel;
    rpResFolCompLbl2: TppLabel;
    rpResFolCompLbl3: TppLabel;
    rpResFolCompLbl7: TppLabel;
    rpResFolCompLbl8: TppLabel;
    rpResFolCompLbl11: TppLabel;
    rpResFolCompLine1: TppLine;
    rpResFolCompLblTipoPag: TppLabel;
    rpResFolCompDBTxt2: TppDBText;
    rpResFolCompDBTxt1: TppDBText;
    rpResFolCompDBTxt4: TppDBText;
    rpResFolCompDBTxt3: TppDBText;
    rpResFolCompLbl1: TppLabel;
    rpResFolCompDBTxt5: TppDBText;
    rpResFolCompLbl6: TppLabel;
    rpResFolCompDBTxt6: TppDBText;
    rpResFolCompDBTxt7: TppDBText;
    rpResFolCompDBTxt8: TppDBText;
    rpResFolCompLbl9: TppLabel;
    rpResFolCompLbl10: TppLabel;
    rpResFolCompLbl12: TppLabel;
    rpResFolCompLbl14: TppLabel;
    rpResFolCompLbl13: TppLabel;
    rpResFolCompSysVar1: TppSystemVariable;
    rpResFolCompSysVar2: TppSystemVariable;
    rpResFolCompDtlBnd1: TppDetailBand;
    rpResFolCompDBTxt14: TppDBText;
    rpResFolCompDBTxt18: TppDBText;
    rpResFolCompDBTxt13: TppDBText;
    rpResFolCompDBTxt15: TppDBText;
    rpResFolCompDBTxt16: TppDBText;
    rpResFolCompDBTxt17: TppDBText;
    rpResFolCompFootBnd1: TppFooterBand;
    rpResFolCompSmryBnd1: TppSummaryBand;
    rpResFolCompLine6: TppLine;
    rpResFolCompLbl29: TppLabel;
    rpResFolCompLbl30: TppLabel;
    rpResFolCompLbl28: TppLabel;
    rpResFolCompLine7: TppLine;
    rpResFolCompLblTOT_GERAL_VALOR_VAR_PROV: TppLabel;
    rpResFolCompLblTOT_GERAL_VALOR_VAR_DESC: TppLabel;
    rpResFolCompLblTOT_GERAL_VALOR_VAR_LIQ: TppLabel;
    rpResFolCompLblTOT_GERAL_PERC_VAR_PROV: TppLabel;
    rpResFolCompLblTOT_GERAL_PERC_VAR_DESC: TppLabel;
    rpResFolCompLblTOT_GERAL_PERC_VAR_LIQ: TppLabel;
    rpResFolCompLblTOT_GERAL_PROV1: TppLabel;
    rpResFolCompLblTOT_GERAL_PROV2: TppLabel;
    rpResFolCompLblTOT_GERAL_DESC1: TppLabel;
    rpResFolCompLblTOT_GERAL_DESC2: TppLabel;
    rpResFolCompLblTOT_GERAL_LIQ1: TppLabel;
    rpResFolCompLblTOT_GERAL_LIQ2: TppLabel;
    rpResFolCompGroup1: TppGroup;
    rpResFolCompGrpHdrBnd0: TppGroupHeaderBand;
    rpResFolCompLbl15: TppLabel;
    rpResFolCompDBTxt9: TppDBText;
    rpResFolCompLbl16: TppLabel;
    rpResFolCompLbl17: TppLabel;
    rpResFolCompLine2: TppLine;
    rpResFolCompLbl20: TppLabel;
    rpResFolCompDBTxt10: TppDBText;
    rpResFolCompDBTxt11: TppDBText;
    rpResFolCompLbl18: TppLabel;
    rpResFolCompLbl19: TppLabel;
    rpResFolCompLbl21: TppLabel;
    rpResFolCompLbl23: TppLabel;
    rpResFolCompLbl22: TppLabel;
    rpResFolCompGrpFootBnd0: TppGroupFooterBand;
    rpResFolCompLbl25: TppLabel;
    rpResFolCompLbl26: TppLabel;
    rpResFolCompLine5: TppLine;
    rpResFolCompLbl27: TppLabel;
    rpResFolCompLblTOT_VALOR_VAR_PROV: TppLabel;
    rpResFolCompLblTOT_VALOR_VAR_DESC: TppLabel;
    rpResFolCompLblTOT_VALOR_VAR_LIQ: TppLabel;
    rpResFolCompLblTOT_PERC_VAR_PROV: TppLabel;
    rpResFolCompLblTOT_PERC_VAR_DESC: TppLabel;
    rpResFolCompLblTOT_PERC_VAR_LIQ: TppLabel;
    rpResFolCompLblTOT_PROV1: TppLabel;
    rpResFolCompLblTOT_PROV2: TppLabel;
    rpResFolCompLblTOT_DESC1: TppLabel;
    rpResFolCompLblTOT_DESC2: TppLabel;
    rpResFolCompLblTOT_LIQ1: TppLabel;
    rpResFolCompLblTOT_LIQ2: TppLabel;
    rpResFolCompGroup2: TppGroup;
    rpResFolCompGrpHdrBand1: TppGroupHeaderBand;
    rpResFolCompDBTxt12: TppDBText;
    rpResFolCompGrpFootBnd1: TppGroupFooterBand;
    rpResFolCompLine3: TppLine;
    rpResFolCompTotProvDesc: TppLabel;
    rpResFolCompLine4: TppLine;
    rpResFolCompDBCalcVALOR1: TppDBCalc;
    rpResFolCompDBCalcVALOR2: TppDBCalc;
    rpResFolCompLblPERC_VAR: TppLabel;
    rpResFolCompLblVALOR_VAR: TppLabel;
    ppResFolComp: TppBDEPipeline;
    ppResFolCompppField1: TppField;
    ppResFolCompppField2: TppField;
    ppResFolCompppField3: TppField;
    ppResFolCompppField4: TppField;
    ppResFolCompppField5: TppField;
    ppResFolCompppField6: TppField;
    ppResFolCompppField7: TppField;
    ppResFolCompppField8: TppField;
    ppResFolCompppField9: TppField;
    ppResFolCompppField10: TppField;
    ppResFolCompppField11: TppField;
    ppResFolCompppField12: TppField;
    ppResFolCompppField13: TppField;
    ppResFolCompppField14: TppField;
    ppResFolCompppField15: TppField;
    ppResFolCompppField16: TppField;
    ppResFolCompppField17: TppField;
    ppResFolCompppField18: TppField;
    ppResFolCompppField19: TppField;
    dsResFolComp: TDataSource;
    qryResFolComp: TQuery;
    updResFolComp: TUpdateSQL;
    procedure qryResFolCompBeforeOpen(DataSet: TDataSet);
    procedure qryResFolCompAfterOpen(DataSet: TDataSet);
    procedure qryResFolCompAfterScroll(DataSet: TDataSet);
    procedure rpResFolCompGrpHdrBand1BeforePrint(Sender: TObject);
    procedure rpResFolCompGrpFootBnd1BeforePrint(Sender: TObject);
    procedure rpResFolCompGrpFootBnd1AfterPrint(Sender: TObject);
    procedure rpResFolCompGrpFootBnd0BeforePrint(Sender: TObject);
    procedure rpResFolCompGrpFootBnd0AfterPrint(Sender: TObject);
    procedure rpResFolCompSmryBnd1BeforePrint(Sender: TObject);
    procedure rpResFolCompSmryBnd1AfterPrint(Sender: TObject);
    procedure rpResFolCompDtlBnd1AfterPrint(Sender: TObject);
  private
    // Total por Grupo das Rubricas
    rTotProvGrupo1, rTotDescGrupo1, rTotProvGrupo2, rTotDescGrupo2,
    rTotOutrGrupo1, rTotOutrGrupo2,
    // Total Geral das Rubricas
    rTotProv1, rTotDesc1, rTotProv2, rTotDesc2, rTotOutr1, rTotOutr2: real;
    bPrimeiraVez: boolean;
  public
    iTipoRel: integer;
    bTotalUnico: boolean;

    function MostraParam(Form: string): boolean; override;
  end;

var
  dtmRelatoriosResFolComp: TdtmRelatoriosResFolComp;

implementation

uses fAguarde, uFuncoesUteis, fParamResFolComp;

{$R *.DFM}

{ TdtmRelatoriosResFolComp }

function TdtmRelatoriosResFolComp.MostraParam(Form: string): boolean;
var
  frm: TForm;
begin
  if (AnsiUpperCase(Form) = 'FRMPARAMRESFOLCOMP') then
    frm := TfrmParamResFolComp.Create(Application)
  else
  if (AnsiUpperCase(Form) = '') then
  begin
    Result := true;
    exit;
  end
  else
    frm := nil;

  if (frm = nil) then
    Result := false
  else
  begin
    with (frm) do
    begin
      Result := (ShowModal = mrOk);
      free;
    end;
  end;
end;

procedure TdtmRelatoriosResFolComp.qryResFolCompBeforeOpen(DataSet: TDataSet);
begin
  frmAguarde.Pos := 0;
  rTotProv1 := 0;
  rTotProv2 := 0;  
  rTotDesc1 := 0;
  rTotDesc2 := 0;  
  rTotOutr1 := 0;
  rTotOutr2 := 0;
  rTotProvGrupo1 := 0;
  rTotProvGrupo2 := 0;
  rTotDescGrupo1 := 0;
  rTotDescGrupo2 := 0;
  rTotOutrGrupo1 := 0;
  rTotOutrGrupo2 := 0;
  bPrimeiraVez := true;
end;

procedure TdtmRelatoriosResFolComp.qryResFolCompAfterOpen(DataSet: TDataSet);
begin
  frmAguarde.Max := DataSet.RecordCount;
  frmAguarde.Min := 0;
end;

procedure TdtmRelatoriosResFolComp.qryResFolCompAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TdtmRelatoriosResFolComp.rpResFolCompGrpHdrBand1BeforePrint(Sender: TObject);
begin
  // Imprime o tipo de rubrica usada em cada grupo no SEU RODAPÉ
  if (qryResFolComp.FieldByName('PROVENTODESCONTO').asString = 'PROVENTOS') then
  begin
    rpResFolCompTotProvDesc.Caption := 'TOTAL PROVENTOS:';
    rpResFolCompLine4.Visible       := true;
  end
  else
  if (qryResFolComp.FieldByName('PROVENTODESCONTO').asString = 'DESCONTOS') then
  begin
    rpResFolCompTotProvDesc.Caption := 'TOTAL DESCONTOS:';
    rpResFolCompLine4.Visible       := true;
  end
  else
  begin
    rpResFolCompTotProvDesc.Caption := '';
    rpResFolCompLine4.Visible       := false;
  end;
end;

procedure TdtmRelatoriosResFolComp.rpResFolCompDtlBnd1AfterPrint(Sender: TObject);
begin
  if (qryResFolComp.FieldByName('PROVENTODESCONTO').asString = 'OUTROS') and
     (bTotalUnico) then
  begin
    rTotOutrGrupo1 := rTotOutrGrupo1 + qryResFolComp.FieldByName('VALOR1').asFloat;
    rTotOutrGrupo2 := rTotOutrGrupo2 + qryResFolComp.FieldByName('VALOR2').asFloat;
  end;
end;

procedure TdtmRelatoriosResFolComp.rpResFolCompGrpFootBnd1BeforePrint(Sender: TObject);
var
  rRub1, rRub2: real;
  sVarVal, sVarPerc: string;
begin
  if (qryResFolComp.FieldByName('PROVENTODESCONTO').asString <> 'OUTROS') then
  begin
    rRub1 := rpResFolCompDBCalcVALOR1.Value;
    rRub2 := rpResFolCompDBCalcVALOR2.Value;

    frmParamResFolComp.CalcVariacao (rRub1, rRub2, sVarVal, sVarPerc);

    rpResFolCompLblPERC_VAR.Caption  := sVarPerc;
    rpResFolCompLblVALOR_VAR.Caption := sVarVal;
  end;

  rpResFolCompDBCalcVALOR1.Visible :=
    (qryResFolComp.FieldByName('PROVENTODESCONTO').asString <> 'OUTROS') and not(bTotalUnico);
  rpResFolCompDBCalcVALOR2.Visible := rpResFolCompDBCalcVALOR1.Visible;
  rpResFolCompLblPERC_VAR.Visible  := rpResFolCompDBCalcVALOR1.Visible;
  rpResFolCompLblVALOR_VAR.Visible := rpResFolCompDBCalcVALOR1.Visible;
end;

procedure TdtmRelatoriosResFolComp.rpResFolCompGrpFootBnd1AfterPrint(Sender: TObject);
begin
  // Acumula para o Totalizador
  if (iTipoRel = 0) then
  begin
    if (qryResFolComp.FieldByName('PROVENTODESCONTO').asString = 'PROVENTOS') then
    begin
      rTotProv1 := rpResFolCompDBCalcVALOR1.Value;
      rTotProv2 := rpResFolCompDBCalcVALOR2.Value;
    end
    else
    if (qryResFolComp.FieldByName('PROVENTODESCONTO').asString = 'DESCONTOS') then
    begin
      rTotDesc1 := rpResFolCompDBCalcVALOR1.Value;
      rTotDesc2 := rpResFolCompDBCalcVALOR2.Value;
    end;
  end
  else
  begin
    if (qryResFolComp.FieldByName('PROVENTODESCONTO').asString = 'PROVENTOS') then
    begin
      rTotProvGrupo1 := rpResFolCompDBCalcVALOR1.Value;
      rTotProvGrupo2 := rpResFolCompDBCalcVALOR2.Value;
    end
    else
    if (qryResFolComp.FieldByName('PROVENTODESCONTO').asString = 'DESCONTOS') then
    begin
      rTotDescGrupo1 := rpResFolCompDBCalcVALOR1.Value;
      rTotDescGrupo2 := rpResFolCompDBCalcVALOR2.Value;
    end;

    if (bPrimeiraVez) then
    begin
      if (qryResFolComp.FieldByName('PROVENTODESCONTO').asString = 'PROVENTOS') then
      begin
        rTotProv1 := rTotProv1 + rpResFolCompDBCalcVALOR1.Value;
        rTotProv2 := rTotProv2 + rpResFolCompDBCalcVALOR2.Value;
      end
      else
      if (qryResFolComp.FieldByName('PROVENTODESCONTO').asString = 'DESCONTOS') then
      begin
        rTotDesc1 := rTotDesc1 + rpResFolCompDBCalcVALOR1.Value;
        rTotDesc2 := rTotDesc2 + rpResFolCompDBCalcVALOR2.Value;
      end;
    end;
  end;
end;

procedure TdtmRelatoriosResFolComp.rpResFolCompGrpFootBnd0BeforePrint(Sender: TObject);
var
  sVarVal, sVarPerc: string;
begin
  if (bTotalUnico) then
  begin
    if (bPrimeiraVez) then
    begin
      rTotOutr1 := rTotOutr1 + rTotOutrGrupo1;
      rTotOutr2 := rTotOutr2 + rTotOutrGrupo2;
    end;
    rpResFolCompLblTOT_LIQ1.Caption := ValStr(rTotProvGrupo1+rTotOutrGrupo1-rTotDescGrupo1,12,2,true,',');
    rpResFolCompLblTOT_LIQ2.Caption := ValStr(rTotProvGrupo2+rTotOutrGrupo2-rTotDescGrupo2,12,2,true,',');

    frmParamResFolComp.CalcVariacao (rTotProvGrupo1+rTotOutrGrupo1,
      rTotProvGrupo1+rTotOutrGrupo2, sVarVal, sVarPerc);
    rpResFolCompLblTOT_PERC_VAR_PROV.Caption  := sVarPerc;
    rpResFolCompLblTOT_VALOR_VAR_PROV.Caption := sVarVal;

    frmParamResFolComp.CalcVariacao (rTotProvGrupo1+rTotOutrGrupo1-rTotDescGrupo1,
      rTotProvGrupo2+rTotOutrGrupo2-rTotDescGrupo2, sVarVal, sVarPerc);
    rpResFolCompLblTOT_PERC_VAR_LIQ.Caption  := sVarPerc;
    rpResFolCompLblTOT_VALOR_VAR_LIQ.Caption := sVarVal;
  end
  else
  begin
    rpResFolCompLblTOT_PROV1.Caption := ValStr(rTotProvGrupo1,12,2,true,',');
    rpResFolCompLblTOT_DESC1.Caption := ValStr(rTotDescGrupo1,12,2,true,',');
    rpResFolCompLblTOT_LIQ1.Caption  := ValStr(rTotProvGrupo1-rTotDescGrupo1,12,2,true,',');

    rpResFolCompLblTOT_PROV2.Caption := ValStr(rTotProvGrupo2,12,2,true,',');
    rpResFolCompLblTOT_DESC2.Caption := ValStr(rTotDescGrupo2,12,2,true,',');
    rpResFolCompLblTOT_LIQ2.Caption  := ValStr(rTotProvGrupo2-rTotDescGrupo2,12,2,true,',');

    frmParamResFolComp.CalcVariacao (rTotProvGrupo1, rTotProvGrupo2, sVarVal, sVarPerc);
    rpResFolCompLblTOT_PERC_VAR_PROV.Caption  := sVarPerc;
    rpResFolCompLblTOT_VALOR_VAR_PROV.Caption := sVarVal;

    frmParamResFolComp.CalcVariacao (rTotProvGrupo1-rTotDescGrupo1, rTotProvGrupo2-rTotDescGrupo2, sVarVal, sVarPerc);
    rpResFolCompLblTOT_PERC_VAR_LIQ.Caption  := sVarPerc;
    rpResFolCompLblTOT_VALOR_VAR_LIQ.Caption := sVarVal;
  end;

  frmParamResFolComp.CalcVariacao (rTotDescGrupo1, rTotDescGrupo2, sVarVal, sVarPerc);
  rpResFolCompLblTOT_PERC_VAR_DESC.Caption  := sVarPerc;
  rpResFolCompLblTOT_VALOR_VAR_DESC.Caption := sVarVal;
end;

procedure TdtmRelatoriosResFolComp.rpResFolCompGrpFootBnd0AfterPrint(Sender: TObject);
begin
  rTotProvGrupo1 := 0;
  rTotProvGrupo2 := 0;
  rTotDescGrupo1 := 0;
  rTotDescGrupo2 := 0;
  rTotOutrGrupo1 := 0;
  rTotOutrGrupo2 := 0;
end;

procedure TdtmRelatoriosResFolComp.rpResFolCompSmryBnd1BeforePrint(Sender: TObject);
var
  sVarVal, sVarPerc: string;
begin
  rpResFolCompLblTOT_GERAL_PROV1.Caption := ValStr(rTotProv1+rTotOutr1,12,2,true,',');
  rpResFolCompLblTOT_GERAL_DESC1.Caption := ValStr(rTotDesc1,12,2,true,',');
  rpResFolCompLblTOT_GERAL_LIQ1.Caption  := ValStr(rTotProv1+rTotOutr1-rTotDesc1,12,2,true,',');

  rpResFolCompLblTOT_GERAL_PROV2.Caption := ValStr(rTotProv2+rTotOutr2,12,2,true,',');
  rpResFolCompLblTOT_GERAL_DESC2.Caption := ValStr(rTotDesc2,12,2,true,',');
  rpResFolCompLblTOT_GERAL_LIQ2.Caption  := ValStr(rTotProv2+rTotOutr2-rTotDesc2,12,2,true,',');

  frmParamResFolComp.CalcVariacao (rTotProv1+rTotOutr1, rTotProv2+rTotOutr2, sVarVal, sVarPerc);
  rpResFolCompLblTOT_GERAL_PERC_VAR_PROV.Caption  := sVarPerc;
  rpResFolCompLblTOT_GERAL_VALOR_VAR_PROV.Caption := sVarVal;

  frmParamResFolComp.CalcVariacao (rTotDesc1, rTotDesc2, sVarVal, sVarPerc);
  rpResFolCompLblTOT_GERAL_PERC_VAR_DESC.Caption  := sVarPerc;
  rpResFolCompLblTOT_GERAL_VALOR_VAR_DESC.Caption := sVarVal;

  frmParamResFolComp.CalcVariacao (rTotProv1+rTotOutr1-rTotDesc1,
    rTotProv2+rTotOutr2-rTotDesc2, sVarVal, sVarPerc);
  rpResFolCompLblTOT_GERAL_PERC_VAR_LIQ.Caption  := sVarPerc;
  rpResFolCompLblTOT_GERAL_VALOR_VAR_LIQ.Caption := sVarVal;
end;

procedure TdtmRelatoriosResFolComp.rpResFolCompSmryBnd1AfterPrint(Sender: TObject);
begin
  bPrimeiraVez := false;
  rpResFolCompGrpFootBnd0AfterPrint(Sender);
  frmAguarde.Apaga;
end;

end.
