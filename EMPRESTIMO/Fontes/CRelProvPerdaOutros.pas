unit CRelProvPerdaOutros;

// Alterações:
{
 --------------------------------------------------------------------------------------------------
Pendência   : SOL 253185 PPM 771995
Responsável : William Moreira da Silva
Data        : 17/06/2015
Descrição   : Reestruturação da HistMovEmptmo(*Retirada dos Hint's)
--------------------------------------------------------------------------------------------------
Pendência   : SOL 114575 KINTANA 535771
Responsável : Jéssica Lana
Data        : 24/04/2009
Descrição   : Gravar arquivos com a query de entrada na pasta C:\PLANUS\TEMP.
----------------------------------------------------------------------------------------------------
Rotina    :
Data      :
Autor     :
Pendencia :
Descrição :
---------------------------------------------------------------------------------------------------}

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   CRel, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr,
   TB97, ExtCtrls, mContratoEmptmo, Mask, wwdbedit, Wwdbspin, CheckLst,
   wwdblook, db, fcCombo, fcColorCombo, mInscricaoEmptmo, wwdbdatetimepicker,
   mListaPlano, mListaPatro, mListaPlanoContab, DBTables, Wwquery, ppBands,
   ppClass, ppCtrls, ppVar, ppPrnabl, ppCache, ppProd, ppReport, Wwdatsrc,
   ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, ppRichTx, ppStrtch, ppMemo,
   uCmSqlParams, DBClient, uCMClientDataSet, fPreview;

type
   TcfgRelProvPerdaOutros = class(TcfgRel)
      Label1: TLabel;
      Label2: TLabel;
      DBcboTipoEmptmo: TwwDBLookupCombo;
      DBcboTipoContr: TwwDBLookupCombo;
      Panel1: TPanel;
      molContratoEmptmo: TmolContratoEmptmo;
      edtDataRef: TwwDBDateTimePicker;
      Label3: TLabel;
      rdgOrdenar: TRadioGroup;
      GroupBox1: TGroupBox;
      chkCorLinha: TCheckBox;
      cboCorLinha: TfcColorCombo;
      chkLinhas: TCheckBox;
      molListaPatro: TmolListaPatro;
      molListaPlano: TmolListaPlanoContab;
      qryContrato: TwwQuery;
      qryVlrDevido: TwwQuery;
      qryVlrPago: TwwQuery;
      qryLookTipoContr: TwwQuery;
      qryVlrDevidoVLR_DEV: TFloatField;
      qryContratoNOMEPLANO: TStringField;
      qryContratoNOMEPATRO: TStringField;
      qryContratoTCEDESCRICAO: TStringField;
      qryContratoIDCONTRATOEMPTMO: TFloatField;
      qryContratoMATRICULA: TStringField;
      qryContratoNOME: TStringField;
      qryContratoSIT_PART: TStringField;
      qryVlrPagoVLR_PAG: TFloatField;
      qryLookTipoContrIDTIPOCONTREMPTMO: TFloatField;
      qryLookTipoContrTCEDESCRICAO: TStringField;
      qryLookTipoContrIDTIPOEMPTMO: TFloatField;
      qryLookTipoContrDESCTIPOEMPTMO: TStringField;
      qryContratoTXJUROS: TFloatField;
      qryContratoVLRCONTRATO: TFloatField;
      qryContratoDATACREDITO: TDateTimeField;
      qryContratoNUMPARCELAS: TFloatField;
      qryQuantParcelas: TwwQuery;
      qryPrimeiraInadimplencia: TwwQuery;
      qryPrimeiraInadimplenciaHMEDATAPREVISTA: TDateTimeField;
      qryQuantParcelasQUANT_PARCELAS: TFloatField;
      qryContratoNOMEPLANOPATRO: TStringField;
      pplProvPerdaAnal: TppBDEPipeline;
      rptProvPerdaAnal: TppReport;
      ppHeaderBand1: TppHeaderBand;
      ppLabel1: TppLabel;
      rptProvPerdaAnal_lblEmpresa: TppLabel;
      ppLabel122: TppLabel;
      rptProvPerdaAnal_lblDataRef: TppLabel;
      ppDetailBand1: TppDetailBand;
      ppShape3: TppShape;
      ppLine3: TppLine;
      ppDBText1: TppDBText;
      ppDBText2: TppDBText;
      ppDBText3: TppDBText;
      ppDBText4: TppDBText;
      ppDBText5: TppDBText;
      ppDBText6: TppDBText;
      ppDBText8: TppDBText;
      ppDBText12: TppDBText;
      ppDBText13: TppDBText;
      ppDBText15: TppDBText;
      ppFooterBand1: TppFooterBand;
      ppLine2: TppLine;
      ppLabel3: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppSystemVariable2: TppSystemVariable;
      ppSummaryBand1: TppSummaryBand;
      ppGroup1: TppGroup;
      ppGroupHeaderBand1: TppGroupHeaderBand;
      ppDBText9: TppDBText;
      ppGroupFooterBand1: TppGroupFooterBand;
      ppShape5: TppShape;
      ppShape6: TppShape;
      ppLine4: TppLine;
      ppDBCalc5: TppDBCalc;
      ppDBCalc6: TppDBCalc;
      ppDBCalc7: TppDBCalc;
      ppLabel17: TppLabel;
      ppDBCalc8: TppDBCalc;
      ppGroup2: TppGroup;
      ppGroupHeaderBand2: TppGroupHeaderBand;
      ppDBText10: TppDBText;
      ppGroupFooterBand2: TppGroupFooterBand;
      ppGroup3: TppGroup;
      ppGroupHeaderBand3: TppGroupHeaderBand;
      ppShape1: TppShape;
      ppDBText11: TppDBText;
      ppLabel4: TppLabel;
      ppLabel13: TppLabel;
      ppLabel5: TppLabel;
      ppLabel7: TppLabel;
      ppLabel11: TppLabel;
      ppLabel8: TppLabel;
      ppLabel12: TppLabel;
      ppLabel14: TppLabel;
      ppLabel6: TppLabel;
      ppLabel20: TppLabel;
      ppLabel21: TppLabel;
      ppLabel22: TppLabel;
      ppLabel23: TppLabel;
      ppLabel28: TppLabel;
      ppGroupFooterBand3: TppGroupFooterBand;
      ppShape10: TppShape;
      ppShape9: TppShape;
      ppLabel26: TppLabel;
      ppDBCalc13: TppDBCalc;
      ppLine1: TppLine;
      ppDBCalc14: TppDBCalc;
      ppDBCalc15: TppDBCalc;
      ppDBCalc16: TppDBCalc;
      ppLabel29: TppLabel;
      ppLabel32: TppLabel;
      ppMemo2: TppMemo;
      rptProvPerdaAnal_memPatro: TppRichText;
      rptProvPerdaAnal_memPlano: TppRichText;
      ppMemo1: TppMemo;
      rptProvPerdaSint: TppReport;
      ppHeaderBand2: TppHeaderBand;
      ppLabel33: TppLabel;
      rptProvPerdaSint_lblEmpresa: TppLabel;
      ppLabel35: TppLabel;
      rptProvPerdaSint_lblDataRef: TppLabel;
      ppLabel37: TppLabel;
      ppLabel38: TppLabel;
      ppMemo3: TppMemo;
      rptProvPerdaSint_memPatro: TppRichText;
      rptProvPerdaSint_memPlano: TppRichText;
      ppMemo4: TppMemo;
      ppDetailBand2: TppDetailBand;
      ppDBText22: TppDBText;
      ppDBText23: TppDBText;
      ppFooterBand2: TppFooterBand;
      ppLine8: TppLine;
      ppLabel39: TppLabel;
      ppSystemVariable3: TppSystemVariable;
      ppSystemVariable4: TppSystemVariable;
      ppGroup4: TppGroup;
      ppGroupHeaderBand4: TppGroupHeaderBand;
      ppDBText31: TppDBText;
      ppGroupFooterBand4: TppGroupFooterBand;
      ppGroup5: TppGroup;
      ppGroupHeaderBand5: TppGroupHeaderBand;
      ppGroupFooterBand5: TppGroupFooterBand;
      ppShape18: TppShape;
      ppDBText34: TppDBText;
      ppLabel50: TppLabel;
      ppLabel51: TppLabel;
      ppLabel52: TppLabel;
      ppLabel53: TppLabel;
      ppLabel54: TppLabel;
      pplProvPerdaSint: TppBDEPipeline;
      cdsProvPerdaSint: TCMClientDataSet;
      cdsProvPerdaAnal: TCMClientDataSet;
      sqlProvPerdaSint: TCMSqlParams;
      sqlProvPerdaAnal: TCMSqlParams;
      dsSint: TwwDataSource;
      dsAnal: TwwDataSource;
      ppGroup7: TppGroup;
      ppGroupHeaderBand7: TppGroupHeaderBand;
      ppGroupFooterBand7: TppGroupFooterBand;
      ppGroup8: TppGroup;
      ppGroupHeaderBand8: TppGroupHeaderBand;
      ppGroupFooterBand8: TppGroupFooterBand;
      ppDBText18: TppDBText;
      ppDBText19: TppDBText;
      ppDBText20: TppDBText;
      ppDBText21: TppDBText;
      ppLabel40: TppLabel;
      ppLabel41: TppLabel;
      ppLabel44: TppLabel;
      ppLabel45: TppLabel;
      ppLabel42: TppLabel;
      ppLabel46: TppLabel;
      ppLabel47: TppLabel;
      ppDBCalc21: TppDBCalc;
      ppDBCalc22: TppDBCalc;
      ppDBCalc23: TppDBCalc;
      ppDBCalc24: TppDBCalc;
      ppDBCalc25: TppDBCalc;
      ppDBCalc26: TppDBCalc;
      ppLine7: TppLine;
      ppShape12: TppShape;
      ppLine9: TppLine;
      ppShape11: TppShape;
      qryProvisaoLancada: TwwQuery;
      qryProvisaoLancadaPROVISAO: TFloatField;
      qryProvisaoLancadaESTORNO: TFloatField;
      rptProvPerdaAnal_DBtxtPROV_ANT: TppDBText;
      ppDBText24: TppDBText;
      ppDBText25: TppDBText;
      ppLabel16: TppLabel;
      rptProvPerdaAnal_lblProvisaoAnt2: TppLabel;
      ppLabel25: TppLabel;
      ppLabel30: TppLabel;
      rptProvPerdaAnal_lblProvisaoAnt1: TppLabel;
      ppLabel48: TppLabel;
      rptProvPerdaAnal_DBcalcPROV_ANT1: TppDBCalc;
      ppDBCalc20: TppDBCalc;
      ppDBCalc27: TppDBCalc;
      ppDBCalc29: TppDBCalc;
      ppDBCalc30: TppDBCalc;
      ppDBCalc32: TppDBCalc;
      ppGroup6: TppGroup;
      ppGroupHeaderBand6: TppGroupHeaderBand;
      ppGroupFooterBand6: TppGroupFooterBand;
      ppDBText14: TppDBText;
      ppDBText16: TppDBText;
      ppShape2: TppShape;
      ppShape4: TppShape;
      ppDBCalc1: TppDBCalc;
      ppDBCalc2: TppDBCalc;
      ppDBCalc3: TppDBCalc;
      ppLabel9: TppLabel;
      ppDBCalc4: TppDBCalc;
      rptProvPerdaAnal_DBcalcPROV_ANT2: TppDBCalc;
      ppDBCalc10: TppDBCalc;
      ppDBCalc11: TppDBCalc;
      ppLine5: TppLine;
      ppDBText17: TppDBText;
      ppDBText26: TppDBText;
      ppDBText27: TppDBText;
      ppShape7: TppShape;
      ppShape8: TppShape;
      ppDBCalc12: TppDBCalc;
      ppDBCalc18: TppDBCalc;
      ppDBCalc19: TppDBCalc;
      ppLabel10: TppLabel;
      ppDBCalc28: TppDBCalc;
      ppDBCalc31: TppDBCalc;
      ppDBCalc33: TppDBCalc;
      ppDBCalc34: TppDBCalc;
      ppLine6: TppLine;
      ppLabel15: TppLabel;
      ppSummaryBand2: TppSummaryBand;
      ppLine10: TppLine;
      ppShape13: TppShape;
      ppDBCalc35: TppDBCalc;
      ppDBCalc36: TppDBCalc;
      ppDBCalc37: TppDBCalc;
      ppDBCalc38: TppDBCalc;
      ppDBCalc39: TppDBCalc;
      ppDBCalc40: TppDBCalc;
      ppLine11: TppLine;
      ppLabel18: TppLabel;
      qryLookTipoContrIDPLANOPREV: TFloatField;
      ppLabel19: TppLabel;
      ppLabel27: TppLabel;
      rptProvPerdaSint_lblTipoEmptmo: TppLabel;
      rptProvPerdaSint_lblTipoContr: TppLabel;
      ppLabel56: TppLabel;
      ppLabel57: TppLabel;
      rptProvPerdaAnal_lblTipoEmptmo: TppLabel;
      rptProvPerdaAnal_lblTipoContr: TppLabel;
      chkMesAnterior: TCheckBox;
      rdgBaseCalculo: TRadioGroup;
      cdsProvPerdaAnalFAIXA: TStringField;
      cdsProvPerdaAnalPERCENT_FAIXA: TFloatField;
      cdsProvPerdaAnalFAIXA_EXTENSO: TStringField;
      cdsProvPerdaAnalIDCONTRATOEMPTMO: TFloatField;
      cdsProvPerdaAnalNOMEPLANO: TStringField;
      cdsProvPerdaAnalNOMEPATRO: TStringField;
      cdsProvPerdaAnalPLANOPATRO: TStringField;
      cdsProvPerdaAnalNOME_TITULAR: TStringField;
      cdsProvPerdaAnalNOME_BENEF: TStringField;
      cdsProvPerdaAnalSIT_PART: TStringField;
      cdsProvPerdaAnalMATRICULA: TStringField;
      cdsProvPerdaAnalMATRICULA_TIT: TStringField;
      cdsProvPerdaAnalTXJUROS: TFloatField;
      cdsProvPerdaAnalVLRCONTRATO: TFloatField;
      cdsProvPerdaAnalDATACREDITO: TDateTimeField;
      cdsProvPerdaAnalNUMPARCELAS: TFloatField;
      cdsProvPerdaAnalQUANT_PARCELAS: TFloatField;
      cdsProvPerdaAnalPRIMEIRA_DATA: TDateTimeField;
      cdsProvPerdaAnalHMEDATAATUALIZA: TDateTimeField;
      cdsProvPerdaAnalHMESALDODEV: TFloatField;
      cdsProvPerdaAnalHMEPARCELA: TFloatField;
      cdsProvPerdaAnalHMENUMPARCELAS: TFloatField;
      cdsProvPerdaAnalTCEDESCRICAO: TStringField;
      cdsProvPerdaAnalDEVE: TFloatField;
      cdsProvPerdaAnalTOTAL_DEV: TFloatField;
      cdsProvPerdaAnalPROV_ANT: TFloatField;
      cdsProvPerdaAnalPROV_ATU: TFloatField;
      cdsProvPerdaAnalPROV_DIF: TFloatField;
      cdsProvPerdaSintFAIXA: TStringField;
      cdsProvPerdaSintPERCENT_FAIXA: TFloatField;
      cdsProvPerdaSintFAIXA_EXTENSO: TStringField;
      cdsProvPerdaSintNOMEPLANO: TStringField;
      cdsProvPerdaSintNOMEPATRO: TStringField;
      cdsProvPerdaSintPLANOPATRO: TStringField;
      cdsProvPerdaSintTCEDESCRICAO: TStringField;
      cdsProvPerdaSintHMESALDODEV: TFloatField;
      cdsProvPerdaSintDEVE: TFloatField;
      cdsProvPerdaSintTOTAL_DEV: TFloatField;
      cdsProvPerdaSintPROV_ANT: TFloatField;
      cdsProvPerdaSintPROV_ATU: TFloatField;
      cdsProvPerdaSintPROV_DIF: TFloatField;
      rptProvPerdaSint_lblBaseProvisao: TppLabel;
      rptProvPerdaAnal_lblBaseProvisao: TppLabel;
      ppLabel2: TppLabel;
      ppDBText7: TppDBText;
      cdsProvPerdaAnalDIAS: TFloatField;

      procedure FormShow(Sender: TObject);
      procedure DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure DBcboTipoEmptmoExit(Sender: TObject);
      procedure molListaPatrobtnInvertePatroClick(Sender: TObject);
      procedure molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
      procedure molListaPlanobtnInvertePlanoClick(Sender: TObject);
      procedure molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
      procedure bbtnConfirmarClick(Sender: TObject);
      procedure ppLine9Print(Sender: TObject);
      procedure ppLine3Print(Sender: TObject);
      procedure ppShape11Print(Sender: TObject);
      procedure ppShape3Print(Sender: TObject);
      procedure bbtnSairClick(Sender: TObject);
      procedure rptProvPerdaAnal_lblProvisaoAnt1Print(Sender: TObject);
      procedure rptProvPerdaAnal_lblProvisaoAnt2Print(Sender: TObject);
      procedure rptProvPerdaAnal_DBtxtPROV_ANTPrint(Sender: TObject);
      procedure rptProvPerdaAnal_DBcalcPROV_ANT1Print(Sender: TObject);
      procedure rptProvPerdaAnal_DBcalcPROV_ANT2Print(Sender: TObject);
      procedure ppDBCalc20Print(Sender: TObject);
      procedure ppDBCalc31Print(Sender: TObject);
      procedure ppDBCalc34Print(Sender: TObject);
      procedure ppDBCalc32Print(Sender: TObject);
      procedure ppDBCalc11Print(Sender: TObject);
      procedure ppDBCalc30Print(Sender: TObject);
      procedure ppDBText25Print(Sender: TObject);
      procedure ppLabel30Print(Sender: TObject);
      procedure ppLabel45Print(Sender: TObject);
      procedure ppLabel41Print(Sender: TObject);
      procedure ppDBText20Print(Sender: TObject);
      procedure ppDBCalc24Print(Sender: TObject);
      procedure ppDBCalc38Print(Sender: TObject);
      procedure ppLabel44Print(Sender: TObject);
      procedure ppDBText23Print(Sender: TObject);
      procedure ppDBCalc26Print(Sender: TObject);
      procedure ppDBCalc40Print(Sender: TObject);


   private  // Private declarations

      CorAtual : TColor;

      procedure AbreQueries;

      procedure MontaQuery; override;
      procedure FiltraRelatorioAtuDia;


   public   // Public declarations

      sAnalSint : String;

   end;



var
  cfgRelProvPerdaOutros: TcfgRelProvPerdaOutros;



implementation
{$R *.DFM}
uses
   dLookEmptmo, UDiasUteis, USistema, uFuncoesEmptmo, dEmptmo, dRelDividasPP, uMensErro,
   uCalcEmptmo, fProgresso, fProgressoDuplo, uTypesEmptmo;



procedure TcfgRelProvPerdaOutros.AbreQueries;
begin
   with dtmLookEmptmo.qryLookTipoEmptmo do
   begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoEmptmo);
      ParamByName('PIDEMPRESAPROP').AsInteger := Sistema.IDEmpresa;
      Open;
   end;

   LimpaParametros(dtmLookEmptmo.qryLookPlanPrev);
   dtmLookEmptmo.qryLookPlanPrev.Open;

   LimpaParametros(dtmLookEmptmo.qryLookSitPart);
   dtmLookEmptmo.qryLookSitPart.Open;
end;




procedure TcfgRelProvPerdaOutros.MontaQuery;
var
   sTextoProvisao : String;
begin
   inherited;

   rptProvPerdaAnal_lblEmpresa.Caption := Sistema.NomeEmpresa;
   rptProvPerdaSint_lblEmpresa.Caption := Sistema.NomeEmpresa;

   rptProvPerdaAnal_lblDataRef.Caption := FormatDateTime('DD/MM/YYYY', edtDataRef.Date);
   rptProvPerdaSint_lblDataRef.Caption := FormatDateTime('DD/MM/YYYY', edtDataRef.Date);

   //-----------------------------------------------------------------------------------------------

   case rdgBaseCalculo.ItemIndex of
      0: sTextoProvisao := 'Provisão calculada sobre valor vencido + vincendo';
      1: sTextoProvisao := 'Provisão calculada apenas sobre valor vencido';
   end;

   rptProvPerdaSint_lblBaseProvisao.Caption := sTextoProvisao;
   rptProvPerdaAnal_lblBaseProvisao.Caption := sTextoProvisao;

   //-----------------------------------------------------------------------------------------------

   rptProvPerdaAnal_lblTipoEmptmo.Caption := ' < todos > ';
   rptProvPerdaSint_lblTipoEmptmo.Caption := ' < todos > ';

   if DBcboTipoEmptmo.LookupValue <> '' then
   begin
      rptProvPerdaAnal_lblTipoEmptmo.Caption := DBcboTipoEmptmo.Text;
      rptProvPerdaSint_lblTipoEmptmo.Caption := DBcboTipoEmptmo.Text;
   end;

   //-----------------------------------------------------------------------------------------------

   rptProvPerdaAnal_lblTipoContr.Caption  := ' < todos > ';
   rptProvPerdaSint_lblTipoContr.Caption  := ' < todos > ';

   if DBcboTipoContr.LookupValue <> '' then
   begin
      rptProvPerdaAnal_lblTipoContr.Caption := DBcboTipoContr.Text;
      rptProvPerdaSint_lblTipoContr.Caption := DBcboTipoContr.Text;
   end;

   //-----------------------------------------------------------------------------------------------

   rptProvPerdaAnal_memPatro.RichText  := molListaPatro.ListaPatro;
   rptProvPerdaAnal_memPlano.RichText  := molListaPlano.ListaPlano;

   rptProvPerdaSint_memPatro.RichText  := molListaPatro.ListaPatro;
   rptProvPerdaSint_memPlano.RichText  := molListaPlano.ListaPlano;

   //-----------------------------------------------------------------------------------------------

   FiltraRelatorioAtuDia;
end;



procedure TcfgRelProvPerdaOutros.FormShow(Sender: TObject);
begin
   inherited;

   //-----------------------------------------------------------------------------------------------

   case sAnalSint[1] of
      'A' : cfgRelProvPerdaOutros.Caption := 'Provisão para Perdas (analítico) - por Plano e Patrocinadora';
      'S' : cfgRelProvPerdaOutros.Caption := 'Provisão para Perdas (sintético) - por Plano e Patrocinadora';
   end;

   rdgOrdenar.Visible         := sAnalSint = 'A';
   molContratoEmptmo.Visible  := sAnalSint = 'A';

   //-----------------------------------------------------------------------------------------------

   // limpa a seleção de Contrato
   molContratoEmptmo.btnLimpaContrato.Click;

   // preenche a data de referência
   edtDataRef.Date := DiasUteis.UltDiaMes(DiasUteis.ExtraiAno(Sysdate), DiasUteis.ExtraiMes(Sysdate));

   ParametrosSistema;
   AbreQueries;

   // Preenche a listbox de patrocinadoras...
   molListaPatro.PreenchePatro;
   // ...e marca todas por default
   molListaPatrobtnMarcaTodosPatroClick(self);

   // Preenche a listbox de Planos...
   molListaPlano.PreenchePlano;
   // ...e marca todos por default
   molListaPlanobtnMarcaTodosPlanoClick(self);
end;



procedure TcfgRelProvPerdaOutros.DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;

   // seleciona apenas os Tipos de Contrato do Tipo de Empréstimo selecionado
   with dtmLookEmptmo.qryLookTipoContr do
   begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoContr);

      if DBcboTipoEmptmo.LookupValue <> '' then
      begin
         ParamByName('PIDTIPOEMPTMO').AsInteger    := StrToInt(DBcboTipoEmptmo.LookupValue);
         ParamByName('PIDEMPRESAPROP').AsInteger   := Sistema.IDEmpresa;
      end;

      Open;

      DBcboTipoContr.Enabled := True;
   end;
end;



procedure TcfgRelProvPerdaOutros.DBcboTipoEmptmoExit(Sender: TObject);
begin
   inherited;

   // seleciona apenas os Tipos de Contrato do Tipo de Empréstimo selecionado
   with dtmLookEmptmo.qryLookTipoContr do
   begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoContr);

      if DBcboTipoEmptmo.LookupValue <> '' then
      begin
         ParamByName('PIDTIPOEMPTMO').AsInteger    := StrToInt(DBcboTipoEmptmo.LookupValue);
         ParamByName('PIDEMPRESAPROP').AsInteger   := Sistema.IDEmpresa;
      end;

      Open;

      DBcboTipoContr.Enabled := True;
   end;
end;



procedure TcfgRelProvPerdaOutros.FiltraRelatorioAtuDia;
var
   iPatro            : Integer;
   iPlano            : Integer;
   iTipoContr        : Integer;

   iContadorCima     : Integer;
   iContadorBaixo    : Integer;

   iContadorPlano    : Integer;
   iContadorPatro    : Integer;

   iQuantTipoContr   : Integer;
   iTotalPxPxTC      : Integer;

   iQuantDias        : Integer;
   iQuantDiasAnt     : Integer;

   bGrava            : Boolean;

   rSaldoDev         : TSaldoDevAnt;
   rSaldoDevAnt      : TSaldoDevAnt;

   sNomeFaixa        : String;
   sNomeExtenso      : String;

   sNomePatro        : String;
   sNomePlano        : String;
   sPlanoPatro       : String;

   dDataAnt          : TDateTime;

   dDataAntSaldo     : TDateTime;
   dDataRefSaldo     : TDateTime;

   fPercentFaixa     : Currency;
   fPercentFaixaAnt  : Currency;
   fSaldoDev         : Currency;
   fVlrAberto        : Currency;

   fSaldoDevAnt      : Currency;
   fVlrAbertoAnt     : Currency;

   fVlrProvAnt       : Currency;
   fVlrProvAtu       : Currency;
   fVlrProvDif       : Currency;

   fPercentAnt       : Currency;
begin
   with qryLookTipoContr do
   begin
      LimpaParametros(qryLookTipoContr);
      ParamByName('PIDEMPRESAPROP').AsInteger := Sistema.IDEmpresa;
      Open;
   end;

   iQuantTipoContr   := qryLookTipoContr.RecordCount;
   iTotalPxPxTC      := molListaPlano.lstPlano.Items.Count *
                        molListaPatro.lstPatro.Items.Count *
                        iQuantTipoContr;

   dDataAnt          := DiasUteis.SomaMeses(edtDataRef.Date, -1);
   dDataAnt          := DiasUteis.UltDiaMes(DiasUteis.ExtraiAno(dDataAnt), DiasUteis.ExtraiMes(dDataAnt)); 

   // ----------------------------------------------------------------------------------------------

   sqlProvPerdaSint.Open;
   sqlProvPerdaAnal.Open;

   // ----------------------------------------------------------------------------------------------

   try
      // ----------------------------------------------------------------------------------------------
      // Faz TRÊS loops aninhados: por Plano, por Patro e por Tipo de Contrato
      // ----------------------------------------------------------------------------------------------
      frmProgressoDuplo.MostraFormProgressoDuplo('Processando Plano, Patrocinadora, Tipo de Contrato...',   // Legenda de cima
                                                 'Processando Contratos...',                                // Legenda de Baixo
                                                 0,                        // Mínimo de cima
                                                 0,                        // Mínimo de baixo
                                                 iTotalPxPxTC,             // Máximo de cima
                                                 0,                        // Máximo de baixo
                                                 True,                     // Botão visível
                                                 True                      // Botão habilitado
                                                );
      Repaint;

      iContadorCima  := 0;

      // -------------------------------------------------------------------------------------------
      // Loops por Plano, Patro e Tipo de Contrato
      // -------------------------------------------------------------------------------------------
      for iContadorPlano := 0 to (molListaPlano.lstPlano.Items.Count - 1) do
      begin
         if molListaPlano.lstPlano.Checked[iContadorPlano] then
         begin
            // -------------------------------------------------------------------------------------
            for iContadorPatro := 0 to (molListaPatro.lstPatro.Items.Count - 1) do
            begin
               // ----------------------------------------------------------------------------------
               if molListaPatro.lstPatro.Checked[iContadorPatro] then
               begin
                  qryLookTipoContr.First;
                  while not(qryLookTipoContr.EOF) do
                  begin
                     // ----------------------------------------------------------------------------
                     if frmProgressoDuplo.Cancelou then
                     begin
                        Repaint;
                        Application.ProcessMessages;

                        // Verifica se abortou processo
                        if MsgDlg('Deseja realmente interromper o relatório?', 'Empréstimo', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
                        begin
                           Repaint;

                           Exit;
                        end;
                        Repaint;
                     end;
                     Repaint;

                     // ----------------------------------------------------------------------------

                     if molContratoEmptmo.IDContrato > 0 then
                     begin
                        if molContratoEmptmo.IDTipoContr <> qryLookTipoContrIDTIPOCONTREMPTMO.AsInteger then
                        begin
                           qryLookTipoContr.Next;
                           inc(iContadorCima);
                           frmProgressoDuplo.AndaFormProgressoDuplo(iContadorCima, 0);
                           Continue;
                        end;
                     end;

                     // ----------------------------------------------------------------------------

                     if (DBcboTipoContr.LookupValue <> '') and
                        (qryLookTipoContrIDTIPOCONTREMPTMO.AsInteger <> StrToInt(DBcboTipoContr.LookupValue)) then
                     begin
                        qryLookTipoContr.Next;
                        inc(iContadorCima);
                        frmProgressoDuplo.AndaFormProgressoDuplo(iContadorCima, 0);
                        Continue;
                     end;

                     // ----------------------------------------------------------------------------

                     if not(qryLookTipoContrIDPLANOPREV.IsNULL) and
                        (qryLookTipoContrIDPLANOPREV.AsInteger <> molListaPlano.vIDPlano[iContadorPlano]) then
                     begin
                        qryLookTipoContr.Next;
                        inc(iContadorCima);
                        frmProgressoDuplo.AndaFormProgressoDuplo(iContadorCima, 0);
                        Continue;
                     end;

                     // ----------------------------------------------------------------------------

                     with qryContrato do
                     begin
                        LimpaParametros(qryContrato);
                        ParamByName('PIDEMPRESAPROP').AsInteger         := Sistema.IDEmpresa;
                        ParamByName('PIDPATRO').AsInteger               := molListaPatro.vIDPatro[iContadorPatro];
                        ParamByName('IDPLANOPREV').AsInteger            := molListaPlano.vIDPlano[iContadorPlano];
                        ParamByName('PIDTIPOCONTREMPTMO').AsInteger     := qryLookTipoContrIDTIPOCONTREMPTMO.AsInteger;

                        ParamByName('PHMEDATA').AsDateTime              := edtDataRef.Date;
                        ParamByName('PHMEDATAANT').AsDateTime           := dDataAnt;

                        if chkMesAnterior.Checked then
                           ParamByName('PANTERIOR').AsInteger           := 1;

                        if DBcboTipoContr.LookupValue <> '' then
                           ParamByName('PIDTIPOCONTRFILTRO').AsInteger  := StrToInt(DBcboTipoContr.LookupValue);

                        if molContratoEmptmo.IDContrato > 0 then
                           ParamByName('PIDCONTRATOEMPTMO').AsFloat     := molContratoEmptmo.IDContrato;

                        qryContrato.Open;
                     end;
                     // -------------------------------------------------------------------------------

                     frmProgressoDuplo.MostraFormProgressoDuplo('Processando ' +
                                                                molListaPlano.lstPlano.Items[iContadorPlano] + ', ' +
                                                                molListaPatro.lstPatro.Items[iContadorPatro] + ', ' +
                                                                qryLookTipoContrTCEDESCRICAO.AsString + '...',       // Legenda de cima
                                                                'Processando Contratos...',  // Legenda de Baixo
                                                                0,                           // Mínimo de cima
                                                                0,                           // Mínimo de baixo
                                                                iTotalPxPxTC,                // Máximo de cima
                                                                qryContrato.RecordCount,     // Máximo de baixo
                                                                True,                        // Botão visível
                                                                True                         // Botão habilitado
                                                               );
                     Repaint;

                     iContadorBaixo := 0;

                     // ----------------------------------------------------------------------------
                     while not(qryContrato.EOF) do
                     begin
                        // -------------------------------------------------------------------------
                        if frmProgressoDuplo.Cancelou then
                        begin
                           Repaint;
                           Application.ProcessMessages;

                           // Verifica se abortou processo
                           if MsgDlg('Deseja realmente interromper o relatório?', 'Empréstimo', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
                           begin
                              Repaint;

                              Exit;
                           end;
                           Repaint;
                        end;
                        Repaint;
                        // -------------------------------------------------------------------------

                        // Valor em Aberto (atual) -------------------------------------------------
                        with qryVlrDevido do
                        begin
                           LimpaParametros(qryVlrDevido);
                           ParamByName('PIDCONTRATOEMPTMO').AsFloat     := qryContratoIDCONTRATOEMPTMO.AsFloat;
                           ParamByName('PHMEDATAPREVISTA').AsDateTime   := edtDataRef.Date;
                           Open;
                        end;

                        if qryVlrDevido.IsEmpty then
                        begin
                           fVlrAberto := 0;
                        end
                        else
                        begin
                           with qryVlrPago do
                           begin
                              LimpaParametros(qryVlrPago);
                              ParamByName('PIDCONTRATOEMPTMO').AsFloat     := qryContratoIDCONTRATOEMPTMO.AsFloat;
                              ParamByName('PHMEDATAPREVISTA').AsDateTime   := edtDataRef.Date;
                              Open;
                           end;

                           if qryVlrPago.IsEmpty then
                           begin
                              fVlrAberto := qryVlrDevidoVLR_DEV.AsFloat;
                           end
                           else
                           begin
                              fVlrAberto := qryVlrDevidoVLR_DEV.AsFloat - qryVlrPagoVLR_PAG.AsFloat;
                           end;
                        end;


                        if (fVlrAberto = 0) and not(chkMesAnterior.Checked) then
                        begin
                           qryContrato.Next;
                           inc(iContadorBaixo);
                           frmProgressoDuplo.AndaFormProgressoDuplo(iContadorCima, iContadorBaixo);
                           Application.ProcessMessages;
                           Continue;
                        end;
                        // -------------------------------------------------------------------------

                        // Valor em Aberto (anterior) ----------------------------------------------
                        if chkMesAnterior.Checked then
                        begin
                           with qryVlrDevido do
                           begin
                              LimpaParametros(qryVlrDevido);
                              ParamByName('PIDCONTRATOEMPTMO').AsFloat     := qryContratoIDCONTRATOEMPTMO.AsFloat;
                              ParamByName('PHMEDATAPREVISTA').AsDateTime   := dDataAnt;
                              Open;
                           end;

                           if qryVlrDevido.IsEmpty then
                           begin
                              fVlrAbertoAnt := 0;
                           end
                           else
                           begin
                              with qryVlrPago do
                              begin
                                 LimpaParametros(qryVlrPago);
                                 ParamByName('PIDCONTRATOEMPTMO').AsFloat     := qryContratoIDCONTRATOEMPTMO.AsFloat;
                                 ParamByName('PHMEDATAPREVISTA').AsDateTime   := dDataAnt;
                                 Open;
                              end;

                              if qryVlrPago.IsEmpty then
                              begin
                                 fVlrAbertoAnt := qryVlrDevidoVLR_DEV.AsFloat;
                              end
                              else
                              begin
                                 fVlrAbertoAnt := qryVlrDevidoVLR_DEV.AsFloat - qryVlrPagoVLR_PAG.AsFloat;
                              end;

                              fVlrAbertoAnt  := qryVlrDevidoVLR_DEV.AsFloat - qryVlrPagoVLR_PAG.AsFloat;
                           end;

                           if (fVlrAberto = 0) and (fVlrAbertoAnt = 0) then
                           begin
                              qryContrato.Next;
                              inc(iContadorBaixo);
                              frmProgressoDuplo.AndaFormProgressoDuplo(iContadorCima, iContadorBaixo);
                              Application.ProcessMessages;
                              Continue;
                           end;
                        end;
                        // -------------------------------------------------------------------------


                        // -------------------------------------------------------------------------
                        // André Pontes - 27/04/2006
                        // Para compensar o parâmetro do sistema que indica que o saldo devedor
                        // de uma data deve ser o do dia anterior, somar 1 dia na data de referencia

                        dDataRefSaldo     := edtDataRef.Date;
                        dDataAntSaldo     := dDataAnt;

                        if dtmEmptmo.qryParamEmptmoFLGSALDODEVANT.AsInteger = 1 then
                        begin
                           dDataRefSaldo  := dDataRefSaldo + 1;
                           dDataAntSaldo  := dDataAntSaldo + 1;
                        end;
                        // FIM André Pontes - 27/04/2006
                        // -------------------------------------------------------------------------


                        // Saldo Devedor (atual) ---------------------------------------------------
                        rSaldoDev   := CalcEmptmo.SaldoDevAnt(qryContratoIDCONTRATOEMPTMO.AsFloat,
                                                              dDataRefSaldo,
                                                              -1,
                                                              -1,
                                                              False
                                                             );
                        // -------------------------------------------------------------------------

                        // Saldo Devedor (anterior) ------------------------------------------------
                        if chkMesAnterior.Checked then
                        begin
                           rSaldoDevAnt   := CalcEmptmo.SaldoDevAnt(qryContratoIDCONTRATOEMPTMO.AsFloat,
                                                                    dDataAntSaldo,
                                                                    -1,
                                                                    -1,
                                                                    False
                                                                   );
                        end;
                        // -------------------------------------------------------------------------

                        // Primeira Data -----------------------------------------------------------
                        with qryPrimeiraInadimplencia do
                        begin
                           LimpaParametros(qryPrimeiraInadimplencia);
                           ParamByName('PIDCONTRATOEMPTMO').AsFloat     := qryContratoIDCONTRATOEMPTMO.AsFloat;
                           ParamByName('PHMEDATAPREVISTA').AsDateTime   := edtDataRef.Date;
                           Open;
                        end;

                        iQuantDias     := trunc(edtDataRef.Date) - trunc(qryPrimeiraInadimplenciaHMEDATAPREVISTA.AsDateTime);

                        // -------------------------------------------------------------------------

                        // Cálculo da Provisão -----------------------------------------------------
                        if iQuantDias <= 60 then
                        begin
                           fPercentFaixa  := 0;
                           sNomeFaixa     := 'Até 60 dias';
                           sNomeExtenso   := 'Até 60 dias - 0%';
                        end
                        else
                        if iQuantDias <= 120 then
                        begin
                           fPercentFaixa  := 25;
                           sNomeFaixa     := 'De 61 a 120 dias';
                           sNomeExtenso   := 'De 61 a 120 dias - 25%';
                        end
                        else
                        if iQuantDias <= 240 then
                        begin
                           fPercentFaixa  := 50;
                           sNomeFaixa     := 'De 121 a 240 dias';
                           sNomeExtenso   := 'De 121 a 240 dias - 50%';
                        end
                        else
                        if iQuantDias <= 360 then
                        begin
                           fPercentFaixa  := 75;
                           sNomeFaixa     := 'De 241 a 360 dias';
                           sNomeExtenso   := 'De 241 a 360 dias - 75%';
                        end
                        else
                        if iQuantDias > 360 then
                        begin
                           fPercentFaixa  := 100;
                           sNomeFaixa     := 'Mais que 360 dias';
                           sNomeExtenso   := 'Mais que 360 dias - 100%';
                        end;

                        case rdgBaseCalculo.ItemIndex of
                           0: fVlrProvAtu := (rSaldoDev.fSaldoDevAnt + fVlrAberto) * fPercentFaixa / 100;
                           1: fVlrProvAtu := fVlrAberto * fPercentFaixa / 100;
                        end;
                        // -------------------------------------------------------------------------

                        // Cálculo da Provisão (ant) -----------------------------------------------
                        if chkMesAnterior.Checked then
                        begin
                           iQuantDiasAnt  := trunc(dDataAnt) - trunc(qryPrimeiraInadimplenciaHMEDATAPREVISTA.AsDateTime);

                           if iQuantDiasAnt <= 60 then
                              fPercentFaixaAnt  := 0
                           else if iQuantDiasAnt <= 120 then
                              fPercentFaixaAnt  := 25
                           else if iQuantDiasAnt <= 240 then
                              fPercentFaixaAnt  := 50
                           else if iQuantDiasAnt <= 360 then
                              fPercentFaixaAnt  := 75
                           else if iQuantDiasAnt > 360 then
                              fPercentFaixaAnt  := 100;

                           case rdgBaseCalculo.ItemIndex of
                              0: fVlrProvAnt := (rSaldoDevAnt.fSaldoDevAnt + fVlrAbertoAnt) * fPercentFaixaAnt / 100;
                              1: fVlrProvAnt := fVlrAbertoAnt * fPercentFaixaAnt / 100;
                           end;
                        end;
                        // -------------------------------------------------------------------------

                        cdsProvPerdaAnal.Insert;

                        cdsProvPerdaAnalIDCONTRATOEMPTMO.AsFloat  := qryContratoIDCONTRATOEMPTMO.AsFloat;
                        cdsProvPerdaAnalNOME_BENEF.AsString       := qryContratoNOME.AsString;
                        cdsProvPerdaAnalSIT_PART.AsString         := qryContratoSIT_PART.AsString;
                        cdsProvPerdaAnalMATRICULA.AsString        := qryContratoMATRICULA.AsString;
                        cdsProvPerdaAnalHMESALDODEV.AsCurrency    := rSaldoDev.fSaldoDevAnt;
                        cdsProvPerdaAnalTCEDESCRICAO.AsString     := qryContratoTCEDESCRICAO.AsString;
                        cdsProvPerdaAnalDEVE.AsCurrency           := fVlrAberto;

                        case rdgBaseCalculo.ItemIndex of
                           0: cdsProvPerdaAnalTOTAL_DEV.AsCurrency   := rSaldoDev.fSaldoDevAnt + fVlrAberto;
                           1: cdsProvPerdaAnalTOTAL_DEV.AsCurrency   := fVlrAberto;
                        end;

                        cdsProvPerdaAnalNOMEPLANO.AsString        := qryContratoNOMEPLANO.AsString;
                        cdsProvPerdaAnalNOMEPATRO.AsString        := qryContratoNOMEPATRO.AsString;

                        cdsProvPerdaAnalPLANOPATRO.AsString       := qryContratoNOMEPLANOPATRO.AsString;

                        cdsProvPerdaAnalQUANT_PARCELAS.AsInteger  := qryQuantParcelasQUANT_PARCELAS.AsInteger;
                        cdsProvPerdaAnalPRIMEIRA_DATA.AsDateTime  := qryPrimeiraInadimplenciaHMEDATAPREVISTA.AsDateTime;

                        cdsProvPerdaAnalTXJUROS.AsCurrency        := qryContratoTXJUROS.AsCurrency;
                        cdsProvPerdaAnalVLRCONTRATO.AsCurrency    := qryContratoVLRCONTRATO.AsCurrency;
                        cdsProvPerdaAnalDATACREDITO.AsDateTime    := qryContratoDATACREDITO.AsDateTime;
                        cdsProvPerdaAnalNUMPARCELAS.AsInteger     := qryContratoNUMPARCELAS.AsInteger;

                        cdsProvPerdaAnalFAIXA.AsString            := sNomeFaixa;
                        cdsProvPerdaAnalFAIXA_EXTENSO.AsString    := sNomeExtenso;
                        cdsProvPerdaAnalPERCENT_FAIXA.AsCurrency  := fPercentFaixa;

                        cdsProvPerdaAnalDIAS.AsInteger            := iQuantDias; // André Pontes - 02/05/2006

                        cdsProvPerdaAnalPROV_ANT.AsCurrency       := fVlrProvAnt;
                        cdsProvPerdaAnalPROV_ATU.AsCurrency       := fVlrProvAtu;
                        cdsProvPerdaAnalPROV_DIF.AsCurrency       := fVlrProvAtu - fVlrProvAnt;

                        cdsProvPerdaAnal.Post;

                        // -------------------------------------------------------------------------

                        qryContrato.Next;

                        inc(iContadorBaixo);

                        frmProgressoDuplo.AndaFormProgressoDuplo(iContadorCima, iContadorBaixo);
                        Application.ProcessMessages;
                     end;
                     // ----------------------------------------------------------------------------

                     inc(iContadorCima);
                     frmProgressoDuplo.AndaFormProgressoDuplo(iContadorCima, 0);
                     Application.ProcessMessages;

                     qryLookTipoContr.Next;
                  end;  // while not(qryLookTipoContr.EOF)
               end
               else    // if molListaPatro.lstPatro.Checked
               begin
                  iContadorCima := iContadorCima + iQuantTipoContr;
                  frmProgressoDuplo.AndaFormProgressoDuplo(iContadorCima, 0);
                  Application.ProcessMessages;
               end;  // if molListaPatro.lstPatro.Checked
            end;  // for(Patro)
         end
         else  // if molListaPlano.lstPlano.Checked
         begin
            iContadorCima := iContadorCima + (molListaPatro.lstPatro.Items.Count * iQuantTipoContr);
            frmProgressoDuplo.AndaFormProgressoDuplo(iContadorCima, 0);
            Application.ProcessMessages;
         end;  // if molListaPlano.lstPlano.Checked
      end;  // for(Plano)
      // -------------------------------------------------------------------------------------------
      // FIM dos loops
      // -------------------------------------------------------------------------------------------

      //Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
      //cdsProvPerdaAnal.SaveToFile(Sistema.TempDir + 'EP-cdsProvPerdaAnal-AntesOrdenar.cds');
        cdsProvPerdaAnal.SaveToFile(ftempregra + '\' + 'EP-cdsProvPerdaAnal-AntesOrdenar.cds');

      case rdgOrdenar.ItemIndex of
         0: cdsProvPerdaAnal.IndexFieldNames := 'NOMEPLANO;NOMEPATRO;PERCENT_FAIXA;IDCONTRATOEMPTMO';
         1: cdsProvPerdaAnal.IndexFieldNames := 'NOMEPLANO;NOMEPATRO;PERCENT_FAIXA;NOME_BENEF;IDCONTRATOEMPTMO';
         2: cdsProvPerdaAnal.IndexFieldNames := 'NOMEPLANO;NOMEPATRO;PERCENT_FAIXA;MATRICULA;IDCONTRATOEMPTMO';
      end;
      
    //Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
    //cdsProvPerdaAnal.SaveToFile(Sistema.TempDir + 'EP-cdsProvPerdaAnal-AposOrdenar.cds');
      cdsProvPerdaAnal.SaveToFile(ftempregra + '\' + 'EP-cdsProvPerdaAnal-AposOrdenar.cds');

      // -------------------------------------------------------------------------------------------
      // Se for sintético, itera pelos contratos, consolidando valores por faixa
      // -------------------------------------------------------------------------------------------
      if sAnalSint = 'S' then
      begin
         frmProgressoDuplo.EscondeFormProgressoDuplo;

         frmProgresso.MostraFormProgresso('Consolidando valores por faixa ...',  // Legenda de cima
                                          True,                                  // Botão visível
                                          True,                                  // Botão habilitado
                                          True,                                  // Mostra barra de progresso
                                          0,                                     // Mínimo
                                          cdsProvPerdaAnal.RecordCount           // Máximo
                                         );
         Repaint;

         iContadorCima  := 0;

         // ----------------------------------------------------------------------------------------


         // ----------------------------------------------------------------------------------------

         cdsProvPerdaAnal.First;

         fPercentAnt    := cdsProvPerdaAnalPERCENT_FAIXA.AsCurrency;
         sNomeFaixa     := cdsProvPerdaAnalFAIXA.AsString;
         sNomeExtenso   := cdsProvPerdaAnalFAIXA_EXTENSO.AsString;

         sNomePatro     := cdsProvPerdaAnalNOMEPATRO.AsString;
         sNomePlano     := cdsProvPerdaAnalNOMEPLANO.AsString;
         sPlanoPatro    := cdsProvPerdaAnalPLANOPATRO.AsString;

         fSaldoDev      := 0;
         fVlrAberto     := 0;
         fVlrProvAtu    := 0;
         fVlrProvAnt    := 0;
         fVlrProvDif    := 0;

         while not(cdsProvPerdaAnal.EOF) do
         begin
            // -------------------------------------------------------------------------------------

            if frmProgresso.Cancelou then
            begin
               Repaint;
               Application.ProcessMessages;

               // Verifica se abortou processo
               if MsgDlg('Deseja realmente interromper o relatório?', 'Empréstimo', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
               begin
                  Repaint;

                  Exit;
               end;
               Repaint;
            end;
            Repaint;

            // -------------------------------------------------------------------------------------

            fPercentFaixa := cdsProvPerdaAnalPERCENT_FAIXA.AsCurrency;

            if fPercentFaixa = fPercentAnt then
            begin
               // Acumula os valores
               fSaldoDev      := fSaldoDev      + cdsProvPerdaAnalHMESALDODEV.AsCurrency;
               fVlrAberto     := fVlrAberto     + cdsProvPerdaAnalDEVE.AsCurrency;
               fVlrProvAtu    := fVlrProvAtu    + cdsProvPerdaAnalPROV_ATU.AsCurrency;
               fVlrProvAnt    := fVlrProvAnt    + cdsProvPerdaAnalPROV_ANT.AsCurrency;
               fVlrProvDif    := fVlrProvDif    + cdsProvPerdaAnalPROV_DIF.AsCurrency;
            end
            else
            begin
               // Primeiro faz o INSERT
               cdsProvPerdaSint.Insert;

               cdsProvPerdaSintPERCENT_FAIXA.AsCurrency  := fPercentAnt;

               cdsProvPerdaSintFAIXA.AsString            := sNomeFaixa;
               cdsProvPerdaSintFAIXA_EXTENSO.AsString    := sNomeExtenso;

               cdsProvPerdaSintNOMEPLANO.AsString        := sNomePlano;
               cdsProvPerdaSintNOMEPATRO.AsString        := sNomePatro;
               cdsProvPerdaSintPLANOPATRO.AsString       := sPlanoPatro;

               cdsProvPerdaSintHMESALDODEV.AsCurrency    := fSaldoDev;
               cdsProvPerdaSintDEVE.AsCurrency           := fVlrAberto;
               cdsProvPerdaSintTOTAL_DEV.AsCurrency      := fSaldoDev + fVlrAberto;
               cdsProvPerdaSintPROV_ANT.AsCurrency       := fVlrProvAnt;
               cdsProvPerdaSintPROV_ATU.AsCurrency       := fVlrProvAtu;
               cdsProvPerdaSintPROV_DIF.AsCurrency       := fVlrProvDif;

               cdsProvPerdaSint.Post;

               // ----------------------------------------------------------------------------------

               // Reinicializa os valores
               fPercentAnt    := cdsProvPerdaAnalPERCENT_FAIXA.AsCurrency;

               sNomeFaixa     := cdsProvPerdaAnalFAIXA.AsString;
               sNomeExtenso   := cdsProvPerdaAnalFAIXA_EXTENSO.AsString;

               sNomePatro     := cdsProvPerdaAnalNOMEPATRO.AsString;
               sNomePlano     := cdsProvPerdaAnalNOMEPLANO.AsString;
               sPlanoPatro    := cdsProvPerdaAnalPLANOPATRO.AsString;

               fSaldoDev      := cdsProvPerdaAnalHMESALDODEV.AsCurrency;
               fVlrAberto     := cdsProvPerdaAnalDEVE.AsCurrency;
               fVlrProvAtu    := cdsProvPerdaAnalPROV_ATU.AsCurrency;
               fVlrProvAnt    := cdsProvPerdaAnalPROV_ANT.AsCurrency;
               fVlrProvDif    := cdsProvPerdaAnalPROV_DIF.AsCurrency;
            end;

            inc(iContadorCima);
            if iContadorCima > cdsProvPerdaAnal.RecordCount then iContadorCima := cdsProvPerdaAnal.RecordCount;
            frmProgresso.AndaFormProgresso(iContadorCima);

            cdsProvPerdaAnal.Next;

            // -------------------------------------------------------------------------------------
            if cdsProvPerdaAnal.EOF then
            begin
               cdsProvPerdaSint.Insert;

               cdsProvPerdaSintPERCENT_FAIXA.AsCurrency  := fPercentAnt;

               cdsProvPerdaSintFAIXA.AsString            := sNomeFaixa;
               cdsProvPerdaSintFAIXA_EXTENSO.AsString    := sNomeExtenso;

               cdsProvPerdaSintNOMEPLANO.AsString        := sNomePlano;
               cdsProvPerdaSintNOMEPATRO.AsString        := sNomePatro;
               cdsProvPerdaSintPLANOPATRO.AsString       := sPlanoPatro;

               cdsProvPerdaSintHMESALDODEV.AsCurrency    := fSaldoDev;
               cdsProvPerdaSintDEVE.AsCurrency           := fVlrAberto;
               cdsProvPerdaSintTOTAL_DEV.AsCurrency      := fSaldoDev + fVlrAberto;
               cdsProvPerdaSintPROV_ANT.AsCurrency       := fVlrProvAnt;
               cdsProvPerdaSintPROV_ATU.AsCurrency       := fVlrProvAtu;
               cdsProvPerdaSintPROV_DIF.AsCurrency       := fVlrProvDif;

               cdsProvPerdaSint.Post;
            end;
            // -------------------------------------------------------------------------------------
         end;  // while not(cdsProvPerdaAnal.EOF)
      end;  // if sAnalSint = 'S'

      cdsProvPerdaSint.IndexFieldNames := 'NOMEPLANO;NOMEPATRO;PERCENT_FAIXA';
    //Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
    //cdsProvPerdaSint.SaveToFile(Sistema.TempDir + 'EP-cdsProvPerdaSint.cds');
      cdsProvPerdaSint.SaveToFile(ftempregra + '\' + 'EP-cdsProvPerdaSint.cds');

      // -------------------------------------------------------------------------------------------
      // FIM do processo de consolidação
      // -------------------------------------------------------------------------------------------

      frmProgresso.EscondeFormProgresso;

      // -------------------------------------------------------------------------------------------

      case sAnalSint[1] of
         'A': TfrmPreview.CreateModalPreview(Application, rptProvPerdaAnal, rptProvPerdaAnal.PrinterSetup.DocumentName);
         'S': TfrmPreview.CreateModalPreview(Application, rptProvPerdaSint, rptProvPerdaSint.PrinterSetup.DocumentName);
      end;

      // -------------------------------------------------------------------------------------------

   finally
      frmProgressoDuplo.EscondeFormProgressoDuplo;
      frmProgresso.EscondeFormProgresso;
   end;
end;



procedure TcfgRelProvPerdaOutros.molListaPatrobtnInvertePatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnInvertePatroClick(Sender);
end;



procedure TcfgRelProvPerdaOutros.molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnMarcaTodosPatroClick(Sender);
end;



procedure TcfgRelProvPerdaOutros.molListaPlanobtnInvertePlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnInvertePlanoClick(Sender);
end;



procedure TcfgRelProvPerdaOutros.molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnMarcaTodosPlanoClick(Sender);
end;



procedure TcfgRelProvPerdaOutros.bbtnConfirmarClick(Sender: TObject);
begin
   DesabilitaBotoes;
   try
      try
         MontaQuery;
      except
         Screen.Cursor := crDefault;
         Raise;
         Repaint;
         HabilitaBotoes;
      end;
   finally
      HabilitaBotoes;
   end;
end;



procedure TcfgRelProvPerdaOutros.ppLine9Print(Sender: TObject);
begin
   inherited;
   (Sender as TppLine).Visible := chkLinhas.Checked;
end;



procedure TcfgRelProvPerdaOutros.ppLine3Print(Sender: TObject);
begin
   inherited;
   (Sender as TppLine).Visible := chkLinhas.Checked;
end;



procedure TcfgRelProvPerdaOutros.ppShape11Print(Sender: TObject);
begin
   if chkCorLinha.Checked then
   begin
      if CorAtual = clWhite then
      begin
         CorAtual := cboCorLinha.SelectedColor;
      end
      else
      begin
         CorAtual := clWhite;
      end;
   end
   else
   begin
      CorAtual := clWhite;
   end;

   (Sender as TppShape).Brush.Color := CorAtual;
end;



procedure TcfgRelProvPerdaOutros.ppShape3Print(Sender: TObject);
begin
   if chkCorLinha.Checked then
   begin
      if CorAtual = clWhite then
      begin
         CorAtual := cboCorLinha.SelectedColor;
      end
      else
      begin
         CorAtual := clWhite;
      end;
   end
   else
   begin
      CorAtual := clWhite;
   end;

   (Sender as TppShape).Brush.Color := CorAtual;
end;



procedure TcfgRelProvPerdaOutros.bbtnSairClick(Sender: TObject);
begin
   Release;
end;



//--------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------

procedure TcfgRelProvPerdaOutros.rptProvPerdaAnal_lblProvisaoAnt1Print(Sender: TObject);
begin
   inherited;
   (Sender as TppLabel).Visible := chkMesAnterior.Checked;
end;

procedure TcfgRelProvPerdaOutros.rptProvPerdaAnal_lblProvisaoAnt2Print(Sender: TObject);
begin
   inherited;
   (Sender as TppLabel).Visible := chkMesAnterior.Checked;
end;

procedure TcfgRelProvPerdaOutros.rptProvPerdaAnal_DBtxtPROV_ANTPrint(Sender: TObject);
begin
   inherited;
   (Sender as TppDBtext).Visible := chkMesAnterior.Checked;
end;

procedure TcfgRelProvPerdaOutros.rptProvPerdaAnal_DBcalcPROV_ANT1Print(Sender: TObject);
begin
   inherited;
   (Sender as TppDBcalc).Visible := chkMesAnterior.Checked;
end;

procedure TcfgRelProvPerdaOutros.rptProvPerdaAnal_DBcalcPROV_ANT2Print(Sender: TObject);
begin
   inherited;
   (Sender as TppDBcalc).Visible := chkMesAnterior.Checked;
end;

procedure TcfgRelProvPerdaOutros.ppDBCalc20Print(Sender: TObject);
begin
   inherited;
   (Sender as TppDBcalc).Visible := chkMesAnterior.Checked;
end;

procedure TcfgRelProvPerdaOutros.ppDBCalc31Print(Sender: TObject);
begin
   inherited;
   (Sender as TppDBcalc).Visible := chkMesAnterior.Checked;
end;

procedure TcfgRelProvPerdaOutros.ppDBCalc34Print(Sender: TObject);
begin
   inherited;
   (Sender as TppDBcalc).Visible := chkMesAnterior.Checked;
end;

procedure TcfgRelProvPerdaOutros.ppDBCalc32Print(Sender: TObject);
begin
   inherited;
   (Sender as TppDBcalc).Visible := chkMesAnterior.Checked;
end;

procedure TcfgRelProvPerdaOutros.ppDBCalc11Print(Sender: TObject);
begin
   inherited;
   (Sender as TppDBcalc).Visible := chkMesAnterior.Checked;
end;

procedure TcfgRelProvPerdaOutros.ppDBCalc30Print(Sender: TObject);
begin
   inherited;
   (Sender as TppDBcalc).Visible := chkMesAnterior.Checked;
end;

procedure TcfgRelProvPerdaOutros.ppDBText25Print(Sender: TObject);
begin
   inherited;
   (Sender as TppDBtext).Visible := chkMesAnterior.Checked;
end;

procedure TcfgRelProvPerdaOutros.ppLabel30Print(Sender: TObject);
begin
   inherited;
   (Sender as TppLabel).Visible := chkMesAnterior.Checked;
end;

procedure TcfgRelProvPerdaOutros.ppLabel45Print(Sender: TObject);
begin
   inherited;
   (Sender as TppLabel).Visible := chkMesAnterior.Checked;
end;

procedure TcfgRelProvPerdaOutros.ppLabel41Print(Sender: TObject);
begin
   inherited;
   (Sender as TppLabel).Visible := chkMesAnterior.Checked;
end;

procedure TcfgRelProvPerdaOutros.ppDBText20Print(Sender: TObject);
begin
   inherited;
   (Sender as TppDBtext).Visible := chkMesAnterior.Checked;
end;

procedure TcfgRelProvPerdaOutros.ppDBCalc24Print(Sender: TObject);
begin
   inherited;
   (Sender as TppDBcalc).Visible := chkMesAnterior.Checked;
end;

procedure TcfgRelProvPerdaOutros.ppDBCalc38Print(Sender: TObject);
begin
   inherited;
   (Sender as TppDBcalc).Visible := chkMesAnterior.Checked;
end;

procedure TcfgRelProvPerdaOutros.ppLabel44Print(Sender: TObject);
begin
   inherited;
   (Sender as TppLabel).Visible := chkMesAnterior.Checked;
end;

procedure TcfgRelProvPerdaOutros.ppDBText23Print(Sender: TObject);
begin
   inherited;
   (Sender as TppDBtext).Visible := chkMesAnterior.Checked;
end;

procedure TcfgRelProvPerdaOutros.ppDBCalc26Print(Sender: TObject);
begin
   inherited;
   (Sender as TppDBcalc).Visible := chkMesAnterior.Checked;
end;

procedure TcfgRelProvPerdaOutros.ppDBCalc40Print(Sender: TObject);
begin
   inherited;
   (Sender as TppDBcalc).Visible := chkMesAnterior.Checked;
end;

//--------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------


end.
