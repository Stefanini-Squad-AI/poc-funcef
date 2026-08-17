unit RBenefPorTipo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport, Db,
  DBClient, uCMClientDataSet, uCmSqlParams, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppCtrls,
  ppBands, ppClass, ppVar, ppPrnabl, ppCache, ppComm, ppRelatv, ppProd, ppReport, TXComp,
  uCmRptManager, CmParamReport, uCtrlBeneficiosRH, uCtrlCalcRub;

type
  TRptBenefPorTipo = class(TFrmCmReport)
    rpBenefPorTipo: TppReport;
    rpBenefPorTipoHdrBnd: TppHeaderBand;
    rpBenefPorTipoLbl1: TppLabel;
    rpBenefPorTipoLbl2: TppLabel;
    rpBenefPorTipoLbl3: TppLabel;
    rpBenefPorTipoDBTxt1: TppDBText;
    rpBenefPorTipoCalc1: TppSystemVariable;
    rpBenefPorTipoCalc2: TppSystemVariable;
    ppDetailBand1: TppDetailBand;
    rpBenefPorTipoDBTxt6: TppDBText;
    rpBenefPorTipoDBTxt7: TppDBText;
    rpBenefPorTipoDBTxt2: TppDBText;
    rpBenefPorTipoDBTxt3: TppDBText;
    rpBenefPorTipoFootBnd: TppFooterBand;
    rpBenefPorTipoSmryBndSmryBnd: TppSummaryBand;
    rpBenefPorTipoGrp1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLine1: TppLine;
    rpBenefPorTipoLbl12: TppLabel;
    rpBenefPorTipoDBCalc3: TppDBCalc;
    rpBenefPorTipoLbl11: TppLabel;
    rpBenefPorTipoDBCalc2: TppDBCalc;
    rpBenefPorTipoLbl6: TppLabel;
    ppDBCalc2: TppDBCalc;
    rpBenefPorTipoGrp2: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppShape1: TppShape;
    rpBenefPorTipoDBTxt4: TppDBText;
    rpBenefPorTipoLbl8: TppLabel;
    rpBenefPorTipoLbl9: TppLabel;
    rpBenefPorTipoDBTxt5: TppDBText;
    rpBenefPorTipoLbl4: TppLabel;
    rpBenefPorTipoLbl5: TppLabel;
    ppGroupFooterBand3: TppGroupFooterBand;
    rpBenefPorTipoLbl10: TppLabel;
    ppLine2: TppLine;
    rpBenefPorTipoDBCalc1: TppDBCalc;
    ppLabel1: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppBenefPorTipo: TppBDEPipeline;
    dsBenefPorTipo: TwwDataSource;
    sqlBenefPorTipo: TCMSqlParams;
    CdsBenefPorTipo: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CdsBenefPorTipoAfterOpen(DataSet: TDataSet);
    procedure CdsBenefPorTipoAfterScroll(DataSet: TDataSet);
    procedure rpBenefPorTipoSmryBndSmryBndAfterPrint(Sender: TObject);
  private
    CtrlBeneficiosRH: TCtrlBeneficiosRH;
    CtrlCalcRub: TCtrlCalcRub;

    procedure GerarDadosRelat;
  end;

var
  RptBenefPorTipo: TRptBenefPorTipo;

implementation

uses uSistema, uCtrlPadroes, fAguarde, dCds;

{$R *.DFM}

procedure TRptBenefPorTipo.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlBeneficiosRH := TCtrlBeneficiosRH.Create;
  CtrlBeneficiosRH.InitializeAs(Padroes);

  CtrlCalcRub := TCtrlCalcRub.Create;
  CtrlCalcRub.InitializeAs(Padroes);
end;

procedure TRptBenefPorTipo.FormDestroy(Sender: TObject);
begin
  FreeAndNil(CtrlBeneficiosRH);
  FreeAndNil(CtrlCalcRub);
  inherited;
end;

procedure TRptBenefPorTipo.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  dmCds.Cds.Data := CtrlBeneficiosRH.ListBeneficios(
    '',
    CmpRptCM.ParamByName('ListaIdRubrica').asString,
    CmpRptCM.ParamByName('MesRef').asString,
    CmpRptCM.ParamByName('MesRef').asString);
  CtrlBeneficiosRH.SQL.SaveToFile('c:\qry.txt');

  GerarDadosRelat;
  CdsBenefPorTipo.First;
end;

procedure TRptBenefPorTipo.CdsBenefPorTipoAfterOpen(DataSet: TDataSet);
begin
  frmAguarde.Min := 0;
  frmAguarde.Max := DataSet.RecordCount;
end;

procedure TRptBenefPorTipo.CdsBenefPorTipoAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TRptBenefPorTipo.rpBenefPorTipoSmryBndSmryBndAfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

procedure TRptBenefPorTipo.GerarDadosRelat;
var
  dValCalc: double;
  sNomeTipo, sAnoMesIni, sIdRegra, sIdPessoa: string;
begin
  sqlBenefPorTipo.Open;
  if not(dmCds.Cds.IsEmpty) then
  begin
    sNomeTipo := '';
    repeat
      CdsBenefPorTipo.Insert;
      CdsBenefPorTipo.FieldByName('EMPRESA').asString  := Sistema.NomeEmpresa;
      CdsBenefPorTipo.FieldByName('MATRICULA').asString := dmCds.Cds.FieldByName('MATRICULA').asString;
      CdsBenefPorTipo.FieldByName('EMPREGADO').asString := dmCds.Cds.FieldByName('NOME').asString;
      CdsBenefPorTipo.FieldByName('BENEFICIO').asString := dmCds.Cds.FieldByName('DESCRICAO').asString;

      if (sNomeTipo = dmCds.Cds.FieldByName('DESCRICAO').asString) then
        CdsBenefPorTipo.FieldByName('QTDE_TIPOS').asInteger := 0
      else
        CdsBenefPorTipo.FieldByName('QTDE_TIPOS').asInteger := 1;

      sAnoMesIni := Copy(dmCds.Cds.FieldByName('ANOMESINICIO').asString,6,2) +'/'+
        Copy(dmCds.Cds.FieldByName('ANOMESINICIO').asString,1,4);

      CdsBenefPorTipo.FieldByName('ANOMESINICIO').asString := sAnoMesIni;

      if (dmCds.Cds.FieldByName('VALORRUBRICA').IsNull) then
        dValCalc := 0
      else
        dValCalc := dmCds.Cds.FieldByName('VALORRUBRICA').asFloat;

      if not(dmCds.Cds.FieldByName('IDREGRACALCULO').IsNull) and
            (dmCds.Cds.FieldByName('IDREGRACALCULO').asInteger <> -99) then
      begin
        sIdRegra := dmCds.Cds.FieldByName('IDREGRACALCULO').asString;
        sIdPessoa := dmCds.Cds.FieldByName('IDPESSOA').asString;
        CtrlCalcRub.CalcBeneficioRegra(sIdRegra, sIdPessoa, dValCalc);
      end;

      if (dValCalc > 0) then
        CdsBenefPorTipo.FieldByName('VALOR').asFloat := dValCalc
      else
        CdsBenefPorTipo.FieldByName('VALOR').asFloat := 0;

      CdsBenefPorTipo.Post;

      sNomeTipo := dmCds.Cds.FieldByName('DESCRICAO').asString;
      dmCds.Cds.Next;
    until (dmCds.Cds.EOF);
  end
  else
  begin
    CdsBenefPorTipo.Insert;
    CdsBenefPorTipo.Post;
  end;
end;

end.
