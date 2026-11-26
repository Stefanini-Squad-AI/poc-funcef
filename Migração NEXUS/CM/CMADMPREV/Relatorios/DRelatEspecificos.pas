// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor       : Paulo Ramos
// Data        : 30/05/2006
// Pendencia   : 22491
// Rotina      : dfm
// Alteração   : Ajuste nos sqls dos objetos updatesql.
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 26.08.2004
// Alteração   : Colocar Active = False nas qrys qryFundacao e qryProvApos
// Pendência   : 17481
//------------------------------------------------------------------------------
unit DRelatEspecificos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppDB, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache,
  ppProd, ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv,
  ppDBPipe, ppDBBDE, ppStrtch, ppSubRpt, ppModule, raCodMod, ppEndUsr;

type
  TdtmRelatEspecificos = class(TdtmReports)
    qryFundacao: TwwQuery;
    dsFundacao: TwwDataSource;
    ppFundacao: TppBDEPipeline;
    ppEnquadramento: TppBDEPipeline;
    dsEnquadramento: TwwDataSource;
    qryEnquadramento: TwwQuery;
    rpEnquadramento: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLine1: TppLine;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppLabel3: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppDBImage2: TppDBImage;
    ppDBText29: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppLabel40: TppLabel;
    ppDBText44: TppDBText;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLine3: TppLine;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine5: TppLine;
    ppLine9: TppLine;
    ppLine4: TppLine;
    ppLine8: TppLine;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppLabel2: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppEnqSecao2: TppBDEPipeline;
    dsEnqSecao2: TwwDataSource;
    qryEnqSecao2: TwwQuery;
    ppLabel6: TppLabel;
    ppSubEnqSecao2: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppDetailBand2: TppDetailBand;
    ppSummaryBand1: TppSummaryBand;
    ppLabel7: TppLabel;
    ppDBText1: TppDBText;
    ppDBText7: TppDBText;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLine13: TppLine;
    ppLine16: TppLine;
    ppLine17: TppLine;
    ppLine18: TppLine;
    ppLine23: TppLine;
    ppLine25: TppLine;
    ppEnqSecao3: TppBDEPipeline;
    dsEnqSecao3: TwwDataSource;
    qryEnqSecao3: TwwQuery;
    ppSubEnqSecao3: TppSubReport;
    ppChildReport2: TppChildReport;
    ppTitleBand2: TppTitleBand;
    ppDetailBand3: TppDetailBand;
    ppSummaryBand2: TppSummaryBand;
    ppLabel10: TppLabel;
    ppLine26: TppLine;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLine30: TppLine;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppLine32: TppLine;
    ppLine33: TppLine;
    ppLine34: TppLine;
    ppLine35: TppLine;
    ppLabel15: TppLabel;
    ppLine47: TppLine;
    ppDBCalc3: TppDBCalc;
    ppLabel16: TppLabel;
    ppLine52: TppLine;
    ppDBCalc4: TppDBCalc;
    ppLine55: TppLine;
    ppLine56: TppLine;
    ppLine57: TppLine;
    ppLine58: TppLine;
    ppLine59: TppLine;
    ppLine60: TppLine;
    updSecao4: TUpdateSQL;
    ppEnqSecao4: TppBDEPipeline;
    dsEnqSecao4: TwwDataSource;
    qryEnqSecao4: TwwQuery;
    ppShape1: TppShape;
    ppShape4: TppShape;
    ppShape5: TppShape;
    ppShape6: TppShape;
    ppSubEnqSecao4: TppSubReport;
    ppChildReport3: TppChildReport;
    ppTitleBand3: TppTitleBand;
    ppDetailBand4: TppDetailBand;
    ppSummaryBand3: TppSummaryBand;
    ppGroup5: TppGroup;
    ppGroupHeaderBand5: TppGroupHeaderBand;
    ppGroupFooterBand5: TppGroupFooterBand;
    ppLabel17: TppLabel;
    ppGroup6: TppGroup;
    ppGroupHeaderBand6: TppGroupHeaderBand;
    ppGroupFooterBand6: TppGroupFooterBand;
    ppShape2: TppShape;
    ppDBCalc1: TppDBCalc;
    ppLabel13: TppLabel;
    ppLine40: TppLine;
    ppLabel18: TppLabel;
    ppLblSubEnq4TituloColuna1: TppLabel;
    ppLblSubEnq4TituloColuna2: TppLabel;
    ppLblSubEnq4TituloColuna3: TppLabel;
    ppLblSubEnq4TituloColuna4: TppLabel;
    ppLblSubEnq4TituloColuna5: TppLabel;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppLblSubEnq4ValorColuna5: TppDBText;
    ppLine14: TppLine;
    ppShape7: TppShape;
    ppShape8: TppShape;
    ppLine15: TppLine;
    ppLine19: TppLine;
    ppLine22: TppLine;
    ppLine27: TppLine;
    ppLine29: TppLine;
    ppLine31: TppLine;
    ppLine39: TppLine;
    ppLine41: TppLine;
    ppShapeEnqTituloTotais: TppShape;
    ppShapeEnqValorTotais: TppShape;
    updEnqSecao1: TUpdateSQL;
    ppEnqSecao1: TppBDEPipeline;
    dsEnqSecao1: TwwDataSource;
    qryEnqSecao1: TwwQuery;
    ppSubEnqSecao1: TppSubReport;
    ppChildReport4: TppChildReport;
    ppTitleBand4: TppTitleBand;
    ppDetailBand5: TppDetailBand;
    ppSummaryBand4: TppSummaryBand;
    ppSummaryBand11: TppSummaryBand;
    ppLabel54: TppLabel;
    ppLabel55: TppLabel;
    ppLabel56: TppLabel;
    ppLabel57: TppLabel;
    ppLabel58: TppLabel;
    ppLabel59: TppLabel;
    ppDBText47: TppDBText;
    ppDBText48: TppDBText;
    ppDBText49: TppDBText;
    ppDBText50: TppDBText;
    ppDBText51: TppDBText;
    ppDBText52: TppDBText;
    ppShape29: TppShape;
    ppLine115: TppLine;
    ppLine116: TppLine;
    ppLine117: TppLine;
    ppLine118: TppLine;
    ppLine119: TppLine;
    ppLine120: TppLine;
    ppLine121: TppLine;
    ppLine122: TppLine;
    ppLine123: TppLine;
    ppLine124: TppLine;
    ppShape30: TppShape;
    ppLabel19: TppLabel;
    ppDBText17: TppDBText;
    ppLabel20: TppLabel;
    ppDBText20: TppDBText;
    ppLabel21: TppLabel;
    ppDBText21: TppDBText;
    ppLabel22: TppLabel;
    ppDBText22: TppDBText;
    ppLabel23: TppLabel;
    ppDBText23: TppDBText;
    ppLine42: TppLine;
    ppExtReserva: TppBDEPipeline;
    dsExtReserva: TwwDataSource;
    qryExtReserva: TwwQuery;
    rpExtReserva: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLabel24: TppLabel;
    ppDBText42: TppDBText;
    ppDBText43: TppDBText;
    ppDBText45: TppDBText;
    ppLabel63: TppLabel;
    ppDBText54: TppDBText;
    ppDBImage1: TppDBImage;
    ppDetailBand6: TppDetailBand;
    ppDBText8: TppDBText;
    ppDBText11: TppDBText;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    ppDBText28: TppDBText;
    ppDBText30: TppDBText;
    ppDBText56: TppDBText;
    ppDBText57: TppDBText;
    ppDBText58: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppSystemVariable3: TppSystemVariable;
    ppLine20: TppLine;
    ppLabel26: TppLabel;
    ppSystemVariable4: TppSystemVariable;
    ppExtReservaSumario: TppSummaryBand;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppLine21: TppLine;
    ppLabel64: TppLabel;
    ppLabel67: TppLabel;
    ppLabel69: TppLabel;
    ppLabel70: TppLabel;
    ppDBCalc7: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    ppExtReservaCotaGeral: TppLabel;
    ppLabel76: TppLabel;
    ppLabel84: TppLabel;
    ppLabel87: TppLabel;
    ppLabel88: TppLabel;
    ppLabel89: TppLabel;
    ppLabel90: TppLabel;
    ppLabel91: TppLabel;
    ppDBCalc11: TppDBCalc;
    ppDBCalc12: TppDBCalc;
    ppExtReservaCotaGeralCOTACBS: TppLabel;
    ppLabel93: TppLabel;
    ppLabel27: TppLabel;
    ppDBText32: TppDBText;
    ppLabel28: TppLabel;
    ppDBText33: TppDBText;
    ppLabel29: TppLabel;
    ppDBText35: TppDBText;
    ppLabel33: TppLabel;
    ppDBText36: TppDBText;
    ppLabel34: TppLabel;
    ppDBText37: TppDBText;
    ppLine24: TppLine;
    ppLabel36: TppLabel;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppLabel41: TppLabel;
    ppLabel42: TppLabel;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    ppLabel48: TppLabel;
    ppLine28: TppLine;
    ppLine36: TppLine;
    ppLabel68: TppLabel;
    ppLabel71: TppLabel;
    ppLabel72: TppLabel;
    ppLabel73: TppLabel;
    ppLabel74: TppLabel;
    ppLabel96: TppLabel;
    ppLabel97: TppLabel;
    ppLabel98: TppLabel;
    ppLabel99: TppLabel;
    ppLabel100: TppLabel;
    ppLabel101: TppLabel;
    ppLabel102: TppLabel;
    ppLabel49: TppLabel;
    ppDBText39: TppDBText;
    ppLine37: TppLine;
    ppShape9: TppShape;
    ppLine38: TppLine;
    ppLabel50: TppLabel;
    ppLabel51: TppLabel;
    ppLabel52: TppLabel;
    ppLabel53: TppLabel;
    ppLabel60: TppLabel;
    ppLine44: TppLine;
    ppLabel61: TppLabel;
    ppLabel62: TppLabel;
    ppLine45: TppLine;
    ppLabel66: TppLabel;
    ppLabel25: TppLabel;
    ppLabel65: TppLabel;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppExtReservaCotaGrupoICBS: TppLabel;
    ppLabel75: TppLabel;
    ppLabel78: TppLabel;
    ppLabel79: TppLabel;
    ppLabel80: TppLabel;
    ppLabel81: TppLabel;
    ppLabel82: TppLabel;
    ppLabel83: TppLabel;
    ppDBCalc9: TppDBCalc;
    ppDBCalc10: TppDBCalc;
    ppExtReservaCotaGrupoCotaCBS: TppLabel;
    ppLabel85: TppLabel;
    ppLabel92: TppLabel;
    ppLabel103: TppLabel;
    ppLabel104: TppLabel;
    ppLine48: TppLine;
    ppLine49: TppLine;
    ppLine50: TppLine;
    ppLabel105: TppLabel;
    ppDBText46: TppDBText;
    ppLine51: TppLine;
    ppLine53: TppLine;
    ppGroup8: TppGroup;
    ppGroupHeaderBand8: TppGroupHeaderBand;
    ppGroupFooterBand8: TppGroupFooterBand;
    updSecao2: TUpdateSQL;
    ppShape10: TppShape;
    ppLabel106: TppLabel;
    ppLabel107: TppLabel;
    ppLine43: TppLine;
    ppDBText27: TppDBText;
    ppDBText31: TppDBText;
    ppLine54: TppLine;
    ppLine61: TppLine;
    ppLine62: TppLine;
    ppLine63: TppLine;
    ppLine64: TppLine;
    ppLine65: TppLine;
    ppLine66: TppLine;
    ppLine67: TppLine;
    ppShape11: TppShape;
    ppLine68: TppLine;
    updSecao3: TUpdateSQL;
    ppShape3: TppShape;
    ppLabel14: TppLabel;
    ppLine77: TppLine;
    ppDBCalc2: TppDBCalc;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppGroupFooterBand4: TppGroupFooterBand;
    ppLabel35: TppLabel;
    ppDBText34: TppDBText;
    rptExtReserva_lblDataSolicitacao: TppLabel;
    updProvApos: TUpdateSQL;
    ppProvApos: TppBDEPipeline;
    dsProvApos: TwwDataSource;
    qryProvApos: TwwQuery;
    rpProvApos: TppReport;
    ppHeaderBand4: TppHeaderBand;
    ppLabel95: TppLabel;
    ppLine70: TppLine;
    ppDBImage3: TppDBImage;
    ppDBText38: TppDBText;
    ppDBText40: TppDBText;
    ppDBText41: TppDBText;
    ppLabel108: TppLabel;
    ppDBText53: TppDBText;
    ppDetailBand8: TppDetailBand;
    ppFooterBand4: TppFooterBand;
    ppSystemVariable7: TppSystemVariable;
    ppLine78: TppLine;
    ppLabel109: TppLabel;
    ppSystemVariable8: TppSystemVariable;
    ppSummaryBand5: TppSummaryBand;
    ppDBText55: TppDBText;
    ppGroup7: TppGroup;
    ppGroupHeaderBand7: TppGroupHeaderBand;
    ppGroupFooterBand7: TppGroupFooterBand;
    ppLabel77: TppLabel;
    ppDBText59: TppDBText;
    ppLabel86: TppLabel;
    ppLabel94: TppLabel;
    ppDBText60: TppDBText;
    ppLabel110: TppLabel;
    ppDBText62: TppDBText;
    ppLine46: TppLine;
    ppLabel111: TppLabel;
    qryModCarta: TwwQuery;
    dsModCarta: TwwDataSource;
    ppbModCarta: TppBDEPipeline;
    pprModCarta: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppDetailBand7: TppDetailBand;
    ppLabel112: TppLabel;
    ppLabel113: TppLabel;
    ppLabel114: TppLabel;
    ppLabel115: TppLabel;
    ppLabel116: TppLabel;
    ppLabel117: TppLabel;
    ppLine69: TppLine;
    ppLabel118: TppLabel;
    ppFooterBand3: TppFooterBand;
    ppLine71: TppLine;
    ppLabel119: TppLabel;
    ppSystemVariable5: TppSystemVariable;
    ppSystemVariable6: TppSystemVariable;
    ppGroup9: TppGroup;
    ppGroupHeaderBand9: TppGroupHeaderBand;
    ppLabel120: TppLabel;
    ppLine72: TppLine;
    ppDBImage4: TppDBImage;
    ppLabel121: TppLabel;
    ppDBText61: TppDBText;
    ppDBText63: TppDBText;
    ppDBText64: TppDBText;
    ppDBText65: TppDBText;
    ppDBText66: TppDBText;
    ppDBText67: TppDBText;
    ppDBText68: TppDBText;
    ppGroupFooterBand9: TppGroupFooterBand;
    DsgnCM: TppDesigner;

    procedure rpEnquadramentoPreviewFormClose(Sender: TObject);
    procedure ppGroupHeaderBand5BeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    function MostraParam(Form: string): boolean; override;
  end;

var
  dtmRelatEspecificos: TdtmRelatEspecificos;

implementation

uses FPRelEnquadramento, FParamRelProvApos;

{$R *.DFM}

function TdtmRelatEspecificos.MostraParam(Form: string): boolean;
var frm : TForm;
begin
   if (UPPERCASE(Form) = 'FRMPRELENQUADRAMENTO')
   then frm := TfrmPRelEnquadramento.Create(Application)
   else if (UPPERCASE(Form) = 'FRMPARAMRELPROVAPOS')
   then frm := TFrmParamRelProvApos.Create(Application)
   else frm := nil;

   if frm = nil
   then Result := false
   else begin
      with frm do
      begin
         Result := (ShowModal = mrOk);
         Free;
      end;
   end;
end; // MostraParam

procedure TdtmRelatEspecificos.rpEnquadramentoPreviewFormClose(
  Sender: TObject);
begin
  inherited;
  if qryEnqSecao4.UpdatesPending
  then qryEnqSecao4.CancelUpdates;
end;

procedure TdtmRelatEspecificos.ppGroupHeaderBand5BeforePrint(
  Sender: TObject);
begin
  inherited;
  if qryEnqSecao4.FieldByName('GRUPO').AsInteger = 1
  then begin
     ppLblSubEnq4TituloColuna1.Caption := 'SAL. PADRÃO';
     ppLblSubEnq4TituloColuna2.Caption := 'FUNÇÃO';
     ppLblSubEnq4TituloColuna3.Caption := 'ATS';
     ppLblSubEnq4TituloColuna4.Caption := 'VP´S';
     ppLblSubEnq4TituloColuna5.Visible := False;
     ppLblSubEnq4ValorColuna5.Visible  := False;
     ppShapeEnqTituloTotais.Visible    := False;
     ppShapeEnqValorTotais.Visible     := False;
  end
  else if qryEnqSecao4.FieldByName('GRUPO').AsInteger = 2
  then begin
     ppLblSubEnq4TituloColuna1.Caption := 'ADICIONAL NOTURNO';
     ppLblSubEnq4TituloColuna2.Caption := 'ADICIONAL INSALUBRID.';
     ppLblSubEnq4TituloColuna3.Caption := 'ADICIONAL PERICULOS.';
     ppLblSubEnq4TituloColuna4.Caption := 'ADICIONAL COMPENSAT.';
     ppLblSubEnq4TituloColuna5.Visible := False;
     ppLblSubEnq4ValorColuna5.Visible  := False;
     ppShapeEnqTituloTotais.Visible    := False;
     ppShapeEnqValorTotais.Visible     := False;
  end
  else if qryEnqSecao4.FieldByName('GRUPO').AsInteger = 3
  then begin
     ppLblSubEnq4TituloColuna1.Caption := 'DIF. COMPENS.';
     ppLblSubEnq4TituloColuna2.Caption := 'VANTAGEM PESSOAL';
     ppLblSubEnq4TituloColuna3.Caption := 'COMP. PESSOAL';
     ppLblSubEnq4TituloColuna4.Caption := 'HORAS SUPL.';
     ppLblSubEnq4TituloColuna5.Caption := 'TOTAIS';
     ppLblSubEnq4TituloColuna5.Visible := True;
     ppLblSubEnq4ValorColuna5.Visible  := True;
     ppShapeEnqTituloTotais.Visible    := True;
     ppShapeEnqValorTotais.Visible     := True;
  end;
end;

end.



