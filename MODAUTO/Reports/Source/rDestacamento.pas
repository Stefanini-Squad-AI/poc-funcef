{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Andre Mesquita                  }
{                                                       }
{*******************************************************}

unit rDestacamento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, TXRB, CmParamReport, Db, DBClient,
  uCMClientDataSet, Wwdatsrc, uCmSqlParams, ppDB, ppDBPipe, ppDBBDE,
  ppParameter, ppBands, ppClass, ppVar, ppModule, raCodMod, ppCtrls,
  ppReport, ppSubRpt, ppStrtch, ppMemo, ppPrnabl, ppCache, ppComm,
  ppRelatv, ppProd, MontaSelect, uCtrlDestacamento, daDataModule, ppRegion;

type
  TRptDestacamento = class(TFrmCmReport)
    rbDestacamento: TppReport;
    ppParameterList1: TppParameterList;
    ppDestacamento: TppBDEPipeline;
    ppCalendario: TppBDEPipeline;
    ppTrecho: TppBDEPipeline;
    qryDestacamento: TCMSqlParams;
    qryCalendario: TCMSqlParams;
    qryTrecho: TCMSqlParams;
    dsDestacamento: TwwDataSource;
    msDestacamento: TMontaSelect;
    cdsCalen: TCMClientDataSet;
    cdsCalenCALC_HOSPEDAGEM: TStringField;
    cdsCalenIDDESTACAMENTO: TFloatField;
    cdsCalenDATADESTACAMENTO: TDateTimeField;
    cdsCalenFLGDIARIA: TFloatField;
    cdsCalenTRGDTINCLUSAO: TDateTimeField;
    cdsCalenTRGUSERINCLUSAO: TStringField;
    cdsCalenVLRDIARIA: TFloatField;
    cdsCalenVLRHOTEL: TFloatField;
    cdsCalenVLRDESLOCAMENTO: TFloatField;
    cdsCalenPCDIARIA: TFloatField;
    cdsCalenPCHOTEL: TFloatField;
    cdsCalenPCDESLOCAMENTO: TFloatField;
    cdsCalenDIARIA_COM_PERCENTUAL: TFloatField;
    cdsCalenHOTEL_COM_PERCENTUAL: TFloatField;
    cdsCalenDESLOCAMENTO_COM_PERCENTUAL: TFloatField;
    dsCalen: TwwDataSource;
    cdsTrecho: TCMClientDataSet;
    dsTrecho: TwwDataSource;
    cdsDestacamento: TCMClientDataSet;
    cdsRAD: TCMClientDataSet;
    qryRAD: TCMSqlParams;
    dsRAD: TwwDataSource;
    ppRAD: TppBDEPipeline;
    ppTitleBand3: TppTitleBand;
    lblEmpresa: TppLabel;
    lblTituloRelatorio: TppLabel;
    ppLine1: TppLine;
    ppDetailBand1: TppDetailBand;
    ppShape43: TppShape;
    ppShape42: TppShape;
    ppShape38: TppShape;
    ppShape37: TppShape;
    ppDBText3: TppDBText;
    ppCentroCusto: TppDBText;
    ppCargoFuncao: TppDBText;
    ppValorDestacamento: TppDBText;
    ppLabel4: TppLabel;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppLabel6: TppLabel;
    ppShape1: TppShape;
    ppShape2: TppShape;
    ppShape3: TppShape;
    ppShape4: TppShape;
    ppShape5: TppShape;
    ppShape6: TppShape;
    ppShape7: TppShape;
    ppShape8: TppShape;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppShape9: TppShape;
    ppShape10: TppShape;
    ppShape11: TppShape;
    ppShape12: TppShape;
    ppShape13: TppShape;
    ppShape14: TppShape;
    ppShape15: TppShape;
    ppShape16: TppShape;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText11: TppDBText;
    ppDBText6: TppDBText;
    ppDBText9: TppDBText;
    ppDBText7: TppDBText;
    ppDBText10: TppDBText;
    ppDBText8: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    ppShape17: TppShape;
    ppShape18: TppShape;
    ppShape20: TppShape;
    ppShape22: TppShape;
    ppLabel7: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    raCodeModule1: TraCodeModule;
    ppMemo1: TppMemo;
    ppMemo3: TppMemo;
    ppLine4: TppLine;
    ppShape39: TppShape;
    ppShape40: TppShape;
    ppMemo2: TppMemo;
    ppDBText2: TppDBText;
    ppShape41: TppShape;
    ppDBMemo1: TppDBMemo;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel5: TppLabel;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    ppFooterBand1: TppFooterBand;
    lblNomeSistema: TppLabel;
    Calc2: TppSystemVariable;
    ppSystemVariable1: TppSystemVariable;
    ppLine3: TppLine;
    ppSummaryBand3: TppSummaryBand;
    ppShape35: TppShape;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppLine2: TppLine;
    ppDBText19: TppDBText;
    ppShape36: TppShape;
    ppDBMemo2: TppDBMemo;
    ppLabel28: TppLabel;
    ppsRAD: TppSubReport;
    ppChildReport3: TppChildReport;
    ppTitleBand4: TppTitleBand;
    ppLabel27: TppLabel;
    ppShape48: TppShape;
    ppShape50: TppShape;
    ppShape51: TppShape;
    ppShape52: TppShape;
    ppShape53: TppShape;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppDetailBand4: TppDetailBand;
    ppShape44: TppShape;
    ppShape45: TppShape;
    ppShape46: TppShape;
    ppShape47: TppShape;
    ppShape49: TppShape;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppSummaryBand4: TppSummaryBand;
    ppDBText25: TppDBText;
    ppLine5: TppLine;
    lblSaldo: TppLabel;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    lblTipoAcerto: TppLabel;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppSubReport2: TppSubReport;
    ppChildReport2: TppChildReport;
    ppTitleBand2: TppTitleBand;
    ppLabel16: TppLabel;
    ppShape26: TppShape;
    ppLabel17: TppLabel;
    ppShape27: TppShape;
    ppLabel18: TppLabel;
    ppShape28: TppShape;
    ppLabel19: TppLabel;
    ppShape29: TppShape;
    ppLabel20: TppLabel;
    ppShape30: TppShape;
    ppLabel21: TppLabel;
    ppDetailBand3: TppDetailBand;
    ppShape19: TppShape;
    ppShape21: TppShape;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppShape23: TppShape;
    ppDBText14: TppDBText;
    ppShape24: TppShape;
    ppDBText15: TppDBText;
    ppShape25: TppShape;
    ppDBText16: TppDBText;
    ppSummaryBand2: TppSummaryBand;
    ppShape31: TppShape;
    ppLabel22: TppLabel;
    ppShape32: TppShape;
    ppDBCalc4: TppDBCalc;
    ppShape33: TppShape;
    ppDBCalc5: TppDBCalc;
    ppShape34: TppShape;
    ppDBCalc6: TppDBCalc;
    raCodeModule2: TraCodeModule;
    ppDBText26: TppDBText;
    ppLabel36: TppLabel;
    ppDBText28: TppDBText;
    ppLabel37: TppLabel;
    ppDBText27: TppDBText;
    ppSubReport3: TppSubReport;
    ppChildReport4: TppChildReport;
    ppTitleBand5: TppTitleBand;
    ppDetailBand5: TppDetailBand;
    ppSummaryBand5: TppSummaryBand;
    ppDespesas: TppBDEPipeline;
    qryDespesas: TCMSqlParams;
    cdsDespesas: TCMClientDataSet;
    dsDespesas: TwwDataSource;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppDBText29: TppDBText;
    ppDBText30: TppDBText;
    ppDBText31: TppDBText;
    ppDBText32: TppDBText;
    ppLabel42: TppLabel;
    ppDBCalc7: TppDBCalc;
    ppLabel43: TppLabel;
    ppShape54: TppShape;
    ppShape55: TppShape;
    ppDBText33: TppDBText;
    ppMemo4: TppMemo;
    ppShape56: TppShape;
    ppShape57: TppShape;
    ppMemo5: TppMemo;
    ppDBText34: TppDBText;
    ppShape58: TppShape;
    ppShape59: TppShape;
    ppShape60: TppShape;
    ppShape61: TppShape;
    ppShape62: TppShape;
    ppShape63: TppShape;
    ppShape64: TppShape;
    ppShape65: TppShape;
    ppShape66: TppShape;
    ppShape67: TppShape;
    ppRegion1: TppRegion;
    ppDBMemo3: TppDBMemo;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    ctrlDestacamento : TCtrlDestacamento;
    FCodigoDestacamento: Integer;
  public
    property CodigoDestacamento : Integer read  FCodigoDestacamento
                                          write FCodigoDestacamento;
  end;

var
  RptDestacamento: TRptDestacamento;

implementation

uses uSistema, uCtrlPadroes, IvDictio;

{$R *.DFM}

procedure TRptDestacamento.CrmRptCMBeforePrint(Sender: TObject);
var
  destacamento,
  acerto,
  saldo : Double;
begin
  // As duas linhas a seguir operam sob um erro de perda de referência.
{  CrmRptCM.LabelEmpresa := lblEmpresa;
  CrmRptCM.LabelSistema := lblNomeSistema;

  if CmpRptCM.ParamByName('IDDESTACAMENTO').AsInteger > 0 then
    FCodigoDestacamento := CmpRptCM.ParamByName('IDDESTACAMENTO').AsInteger;

//  cdsDestacamento.Data := ctrlDestacamento.listarDestacamento(CodigoDestacamento);
//  cdsTrecho.Data       := ctrlDestacamento.listarTrechos(CodigoDestacamento);

  destacamento := cdsDestacamento.FieldByName('VLRDESTACAMENTO').AsFloat;
  acerto       := cdsDestacamento.FieldByName('VLRACERTO').AsFloat;
  saldo        := destacamento - acerto;
  saldo        := abs(saldo);

  if Assigned(lblTipoAcerto) then
    begin
      if (acerto > destacamento) then
        lblTipoAcerto.Caption := Translate('A PAGAR')
      else
        if (destacamento > acerto) then
          lblTipoAcerto.Caption := Translate('A RECEBER')
        else
          lblTipoAcerto.Caption := Translate('LIQUIDADO');
    end;
  // end if

  if Assigned(lblSaldo) then
    lblSaldo.Caption := FormatFloat('##,##0.00',saldo);}
  inherited;
end;

procedure TRptDestacamento.FormCreate(Sender: TObject);
begin
  inherited;
//  CtrlDestacamento := TCtrlDestacamento.Create(Sistema);
//  CtrlDestacamento.InitializeAs(Padroes);
end;

procedure TRptDestacamento.FormDestroy(Sender: TObject);
begin
  inherited;
//  FreeAndNil(ctrlDestacamento);
end;

end.
