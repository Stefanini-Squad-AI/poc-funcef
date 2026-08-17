unit RBenefPorPessoa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport, Db,
  Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppCtrls, ppBands, ppClass, ppVar, ppPrnabl, ppCache,
  ppComm, ppRelatv, ppProd, ppReport, uCmRptManager, TXComp, CmParamReport, DBClient,
  uCMClientDataSet, uCmSqlParams, uCtrlPadroes, uCtrlBeneficiosRH, uCtrlCalcRub;

type
  TRptBenefPorPessoa = class(TFrmCmReport)
    rpBenefPorPessoa: TppReport;
    rpBenefPorPessoaHdrBnd: TppHeaderBand;
    rpBenefPorPessoaLblTITULO: TppLabel;
    rpBenefPorPessoaLbl1: TppLabel;
    rpBenefPorPessoaLbl2: TppLabel;
    rpBenefPorPessoaDBTxt1: TppDBText;
    rpBenefPorPessoaCalc1: TppSystemVariable;
    rpBenefPorPessoaCalc2: TppSystemVariable;
    rpBenefPorPessoaLbl3: TppLabel;
    rpBenefPorPessoaLbl4: TppLabel;
    rpBenefPorPessoaLbl5: TppLabel;
    rpBenefPorPessoaDtlBnd: TppDetailBand;
    rpBenefPorPessoaDBTxt5: TppDBText;
    rpBenefPorPessoaDBTxt6: TppDBText;
    rpBenefPorPessoaDBTxt7: TppDBText;
    rpBenefPorPessoaFootBnd: TppFooterBand;
    rpBenefPorPessoaSmryBnd: TppSummaryBand;
    rpBenefPorPessoaGrp2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    rpBenefPorPessoaLine2: TppLine;
    rpBenefPorPessoaLbl11: TppLabel;
    rpBenefPorPessoaDBCalc3: TppDBCalc;
    rpBenefPorPessoaLbl10: TppLabel;
    rpBenefPorPessoaDBCalc2: TppDBCalc;
    rpBenefPorPessoaGrp1: TppGroup;
    rpBenefPorPessoaGrpHdrBnd: TppGroupHeaderBand;
    rpBenefPorPessoaShape1: TppShape;
    rpBenefPorPessoaDBTxt3: TppDBText;
    rpBenefPorPessoaDBTxt4: TppDBText;
    rpBenefPorPessoaDBTxt2: TppDBText;
    rpBenefPorPessoaLbl6: TppLabel;
    rpBenefPorPessoaLbl7: TppLabel;
    rpBenefPorPessoaLbl8: TppLabel;
    rpBenefPorPessoaGrpFootBnd: TppGroupFooterBand;
    rpBenefPorPessoaLbl9: TppLabel;
    rpBenefPorPessoaLine1: TppLine;
    rpBenefPorPessoaDBCalc1: TppDBCalc;
    ppBenefPorPessoa: TppBDEPipeline;
    dsBenefPorPessoa: TwwDataSource;
    sqlBenefPorPessoa: TCMSqlParams;
    CdsBenefPorPessoa: TCMClientDataSet;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CdsBenefPorPessoaAfterOpen(DataSet: TDataSet);
    procedure CdsBenefPorPessoaAfterScroll(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure rpBenefPorPessoaSmryBndAfterPrint(Sender: TObject);
  private
    CtrlBeneficiosRH: TCtrlBeneficiosRH;
    CtrlCalcRub: TCtrlCalcRub;

    procedure GerarDadosRelat;
  end;

var
  RptBenefPorPessoa: TRptBenefPorPessoa;

implementation

uses uSistema, fAguarde, dCds;

{$R *.DFM}

procedure TRptBenefPorPessoa.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlBeneficiosRH := TCtrlBeneficiosRH.Create;
  CtrlBeneficiosRH.InitializeAs(Padroes);

  CtrlCalcRub := TCtrlCalcRub.Create;
  CtrlCalcRub.InitializeAs(Padroes);
end;

procedure TRptBenefPorPessoa.FormDestroy(Sender: TObject);
begin
  FreeAndNil(CtrlBeneficiosRH);
  FreeAndNil(CtrlCalcRub);
  inherited;
end;

procedure TRptBenefPorPessoa.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  dmCds.Cds.Data := CtrlBeneficiosRH.ListBeneficios(
    CmpRptCM.ParamByName('ListaIdFunc').asString,
    '',
    CmpRptCM.ParamByName('MesRef').asString,
    CmpRptCM.ParamByName('MesRef').asString, true);
  CtrlBeneficiosRH.SQL.SaveToFile('c:\qry.txt');

  GerarDadosRelat;
  CdsBenefPorPessoa.First;
end;

procedure TRptBenefPorPessoa.CdsBenefPorPessoaAfterOpen(DataSet: TDataSet);
begin
  frmAguarde.Min := 0;
  frmAguarde.Max := DataSet.RecordCount;
end;

procedure TRptBenefPorPessoa.CdsBenefPorPessoaAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TRptBenefPorPessoa.rpBenefPorPessoaSmryBndAfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

procedure TRptBenefPorPessoa.GerarDadosRelat;
var
  dValCalc: double;
  sNomeFunc, sAnoMesIni, sIdRegra, sIdPessoa: string;
begin
  sqlBenefPorPessoa.Open;
  if not(dmCds.Cds.IsEmpty) then
  begin
    sNomeFunc := '';
    repeat
      CdsBenefPorPessoa.Insert;
      CdsBenefPorPessoa.FieldByName('EMPRESA').asString  := Sistema.NomeEmpresa;
      CdsBenefPorPessoa.FieldByName('MATRICULA').asString := dmCds.Cds.FieldByName('MATRICULA').asString;
      CdsBenefPorPessoa.FieldByName('EMPREGADO').asString := dmCds.Cds.FieldByName('NOME').asString;
      CdsBenefPorPessoa.FieldByName('CARGO').asString := dmCds.Cds.FieldByName('TITULO').asString;
      CdsBenefPorPessoa.FieldByName('BENEFICIO').asString := dmCds.Cds.FieldByName('DESCRICAO').asString;

      if (sNomeFunc = dmCds.Cds.FieldByName('NOME').asString) then
        CdsBenefPorPessoa.FieldByName('QTDE_FUNC').asInteger := 0
      else
        CdsBenefPorPessoa.FieldByName('QTDE_FUNC').asInteger := 1;

      sAnoMesIni := Copy(dmCds.Cds.FieldByName('ANOMESINICIO').asString,6,2) +'/'+
        Copy(dmCds.Cds.FieldByName('ANOMESINICIO').asString,1,4);

      CdsBenefPorPessoa.FieldByName('ANOMESINICIO').asString := sAnoMesIni;

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
        CdsBenefPorPessoa.FieldByName('VALOR').asFloat := dValCalc
      else
        CdsBenefPorPessoa.FieldByName('VALOR').asFloat := 0;

      CdsBenefPorPessoa.Post;

      sNomeFunc := dmCds.Cds.FieldByName('NOME').asString;
      dmCds.Cds.Next;
    until (dmCds.Cds.EOF);
  end
  else
  begin
    CdsBenefPorPessoa.Insert;
    CdsBenefPorPessoa.Post;
  end;
end;

end.
