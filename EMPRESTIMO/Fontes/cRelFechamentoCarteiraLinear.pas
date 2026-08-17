unit cRelFechamentoCarteiraLinear;

// Alterações:
{ --------------------------------------------------------------------------------------------------
Pendência   : SOL 253185 PPM 771995
Responsável : Wylliam Leite da Silva
Data        : 18/05/2015
Descrição   : Reestruturação da HistMovEmptmo(*Retirada dos Hint's)
----------------------------------------------------------------------------------------------------
Pendência   : SOL 114575 Kintana 535771
Responsável : Jéssica Lana
Data        : 24/04/2009
Descrição   : Gravar arquivos com a query de entrada na pasta C:\PLANUS\TEMP.
----------------------------------------------------------------------------------------------------
Rotina    : FiltraRelatorio, parte da sub-query de ITENS ATRASADOS
Data      : 27/11/2003
Autor     : André Pontes
Pendencia :
Descrição : Na concatenação de Ano e Mês de cobrança foi incluído o TO_CHAR:
            RTRIM(LTRIM(TO_CHAR(HMEANOCOBRANCA,'0000'))) || RTRIM(LTRIM(TO_CHAR(HMEMESCOBRANCA,'00')))
---------------------------------------------------------------------------------------------------}

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   CRel, fcCombo, fcColorCombo, StdCtrls, Mask, wwdbedit, Wwdbspin,
   wwdblook, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97,
   ExtCtrls, Db, mContratoEmptmo, DBTables, Wwquery, mListaPlano,
   mListaPatro, fProgressoDuplo, mListaPlanoContab;

type
   TcfgRelFechamentoCarteiraLinear = class(TcfgRel)
      Panel1: TPanel;
      Label15: TLabel;
      DBspnAno: TwwDBSpinEdit;
      cboMes: TComboBox;
      GroupBox1: TGroupBox;
      chkCorLinha: TCheckBox;
      cboCorLinha: TfcColorCombo;
      chkLinhas: TCheckBox;
      Label1: TLabel;
      Label2: TLabel;
      DBcboTipoEmptmo: TwwDBLookupCombo;
    DBcboTipoContr: TwwDBLookupCombo;
      molContratoEmptmo: TmolContratoEmptmo;
      qryCalculo: TwwQuery;
      molListaPatro: TmolListaPatro;
      chkApropriado: TCheckBox;
      chkAbonoContab: TCheckBox;
      chkRenovacao: TCheckBox;
    qryCalculoDESCTIPOEMPTMO: TStringField;
    qryCalculoTCEDESCRICAO: TStringField;
    qryCalculoSALDO_ANT: TFloatField;
    qryCalculoTOTALSALDO_ANT: TFloatField;
    qryCalculoPARCELAS_CR: TFloatField;
    qryCalculoTOTALPARC_CR: TFloatField;
    qryCalculoPARCELAS_FP: TFloatField;
    qryCalculoTOTALPARC_FP: TFloatField;
    qryCalculoPARCELAS_FB: TFloatField;
    qryCalculoTOTALPARC_FB: TFloatField;
    qryCalculoENCARGOS_CR: TFloatField;
    qryCalculoTOTALENC_CR: TFloatField;
    qryCalculoENCARGOS_FP: TFloatField;
    qryCalculoTOTALENC_FP: TFloatField;
    qryCalculoENCARGOS_FB: TFloatField;
    qryCalculoTOTALENC_FB: TFloatField;
    qryCalculoAMORTIZACAO_CR: TFloatField;
    qryCalculoTOTALAMO_CR: TFloatField;
    qryCalculoAMORTIZACAO_FP: TFloatField;
    qryCalculoTOTALAMO_FP: TFloatField;
    qryCalculoAMORTIZACAO_FB: TFloatField;
    qryCalculoTOTALAMO_FB: TFloatField;
    qryCalculoQUITACAO_CR: TFloatField;
    qryCalculoTOTALQUI_CR: TFloatField;
    qryCalculoQUITACAO_FP: TFloatField;
    qryCalculoTOTALQUI_FP: TFloatField;
    qryCalculoQUITACAO_FB: TFloatField;
    qryCalculoTOTALQUI_FB: TFloatField;
    qryCalculoREC_PARC_CR: TFloatField;
    qryCalculoTOT_REC_PARC_CR: TFloatField;
    qryCalculoREC_PARC_FP: TFloatField;
    qryCalculoTOT_REC_PARC_FP: TFloatField;
    qryCalculoREC_PARC_FB: TFloatField;
    qryCalculoTOT_REC_PARC_FB: TFloatField;
    qryCalculoREC_ENC_CR: TFloatField;
    qryCalculoTOT_REC_ENC_CR: TFloatField;
    qryCalculoREC_ENC_FP: TFloatField;
    qryCalculoTOT_REC_ENC_FP: TFloatField;
    qryCalculoREC_ENC_FB: TFloatField;
    qryCalculoTOT_REC_ENC_FB: TFloatField;
    qryCalculoREC_AMORT_CR: TFloatField;
    qryCalculoTOT_REC_AMORT_CR: TFloatField;
    qryCalculoREC_AMORT_FP: TFloatField;
    qryCalculoTOT_REC_AMORT_FP: TFloatField;
    qryCalculoREC_AMORT_FB: TFloatField;
    qryCalculoTOT_REC_AMORT_FB: TFloatField;
    qryCalculoREC_QUIT_CR: TFloatField;
    qryCalculoTOT_REC_QUIT_CR: TFloatField;
    qryCalculoREC_QUIT_FP: TFloatField;
    qryCalculoTOT_REC_QUIT_FP: TFloatField;
    qryCalculoREC_QUIT_FB: TFloatField;
    qryCalculoTOT_REC_QUIT_FB: TFloatField;
    qryCalculoABONADO: TFloatField;
    qryCalculoTOT_ABONADO: TFloatField;
    qryCalculoQUITADO: TFloatField;
    qryCalculoTOT_QUITADO: TFloatField;
    qryCalculoSALDO_DEV: TFloatField;
    qryCalculoTOTALSALDO_DEV: TFloatField;
    qryContrato: TwwQuery;
    qryContratoNOMEPLANO: TStringField;
    qryContratoNOMEPATRO: TStringField;
    qryContratoTCEDESCRICAO: TStringField;
    qryContratoIDCONTRATOEMPTMO: TFloatField;
    qryContratoMATRICULA: TStringField;
    qryContratoNOME: TStringField;
    qryContratoSIT_PART: TStringField;
    qryContratoTXJUROS: TFloatField;
    qryContratoVLRCONTRATO: TFloatField;
    qryContratoDATACREDITO: TDateTimeField;
    qryContratoNUMPARCELAS: TFloatField;
    qryContratoNOMEPLANOPATRO: TStringField;
    qryContratoINSCRICAONUMERO: TFloatField;
    qryContratoDESCTIPOEMPTMO: TStringField;
    qryLookTipoContr: TwwQuery;
    qryLookTipoContrIDTIPOCONTREMPTMO: TFloatField;
    qryLookTipoContrTCEDESCRICAO: TStringField;
    qryLookTipoContrIDTIPOEMPTMO: TFloatField;
    qryLookTipoContrDESCTIPOEMPTMO: TStringField;
    qryLookTipoContrIDPLANOPREV: TFloatField;
    qrySaldoAtu: TwwQuery;
    qrySaldoAtuIDCONTRATOEMPTMO: TFloatField;
    qrySaldoAtuSALDO_DEV: TFloatField;
    qrySaldoAtuTOTALSALDO_DEV: TFloatField;
    qrySaldoAnt: TwwQuery;
    qrySaldoAntIDCONTRATOEMPTMO: TFloatField;
    qrySaldoAntSALDO_ANT: TFloatField;
    qrySaldoAntTOTALSALDO_ANT: TFloatField;
    qryParcelas_CR: TwwQuery;
    qryParcelas_CRIDTIPOCONTREMPTMO: TFloatField;
    qryParcelas_CRPARCELAS: TFloatField;
    qryParcelas_CRTOTALPARC: TFloatField;
    qryParcelas_FP: TwwQuery;
    qryParcelas_FPIDTIPOCONTREMPTMO: TFloatField;
    qryParcelas_FPPARCELAS: TFloatField;
    qryParcelas_FPTOTALPARC: TFloatField;
    qryParcelas_FB: TwwQuery;
    qryParcelas_FBIDTIPOCONTREMPTMO: TFloatField;
    qryParcelas_FBPARCELAS: TFloatField;
    qryParcelas_FBTOTALPARC: TFloatField;
    qryEncargos_CR: TwwQuery;
    qryEncargos_FP: TwwQuery;
    qryEncargos_FB: TwwQuery;
    qryAmort_CR: TwwQuery;
    qryAmort_CRAMORTIZACAO_CR: TFloatField;
    qryAmort_CRTOTALAMO_CR: TFloatField;
    qryEncargos_CRIDTIPOCONTREMPTMO: TFloatField;
    qryEncargos_CRENCARGOS_CR: TFloatField;
    qryEncargos_CRTOTALENC_CR: TFloatField;
    qryEncargos_FPIDTIPOCONTREMPTMO: TFloatField;
    qryEncargos_FPENCARGOS_FP: TFloatField;
    qryEncargos_FPTOTALENC_FP: TFloatField;
    qryEncargos_FBIDTIPOCONTREMPTMO: TFloatField;
    qryEncargos_FBENCARGOS_FB: TFloatField;
    qryEncargos_FBTOTALENC_FB: TFloatField;
    qryAmort_FP: TwwQuery;
    qryAmort_FPAMORTIZACAO_FP: TFloatField;
    qryAmort_FPTOTALAMO_FP: TFloatField;
    qryAmort_FB: TwwQuery;
    qryAmort_FBAMORTIZACAO_FB: TFloatField;
    qryAmort_FBTOTALAMO_FB: TFloatField;
    qryQuitacao_CR: TwwQuery;
    qryQuitacao_CRIDTIPOCONTREMPTMO: TFloatField;
    qryQuitacao_CRQUITACAO_CR: TFloatField;
    qryQuitacao_CRTOTALQUI_CR: TFloatField;
    qryAmort_CRIDTIPOCONTREMPTMO: TFloatField;
    qryAmort_FPIDTIPOCONTREMPTMO: TFloatField;
    qryAmort_FBIDTIPOCONTREMPTMO: TFloatField;
    qryQuitacao_FP: TwwQuery;
    qryQuitacao_FPIDTIPOCONTREMPTMO: TFloatField;
    qryQuitacao_FPQUITACAO_FP: TFloatField;
    qryQuitacao_FPTOTALQUI_FP: TFloatField;
    qryQuitacao_FB: TwwQuery;
    qryQuitacao_FBIDTIPOCONTREMPTMO: TFloatField;
    qryQuitacao_FBQUITACAO_FB: TFloatField;
    qryQuitacao_FBTOTALQUI_FB: TFloatField;
    qryRecParc_CR: TwwQuery;
    qryRecParc_CRIDTIPOCONTREMPTMO: TFloatField;
    qryRecParc_CRREC_PARC: TFloatField;
    qryRecParc_CRTOT_REC_PARC: TFloatField;
    qryRecParc_FP: TwwQuery;
    qryRecParc_FPIDTIPOCONTREMPTMO: TFloatField;
    qryRecParc_FPREC_PARC: TFloatField;
    qryRecParc_FPTOT_REC_PARC: TFloatField;
    qryRecParc_FB: TwwQuery;
    qryRecParc_FBIDTIPOCONTREMPTMO: TFloatField;
    qryRecParc_FBREC_PARC: TFloatField;
    qryRecParc_FBTOT_REC_PARC: TFloatField;
    qryRecEnc_CR: TwwQuery;
    qryRecEnc_CRIDTIPOCONTREMPTMO: TFloatField;
    qryRecEnc_CRREC_ENC: TFloatField;
    qryRecEnc_CRTOT_REC_ENC: TFloatField;
    qryRecEnc_FP: TwwQuery;
    qryRecEnc_FPIDTIPOCONTREMPTMO: TFloatField;
    qryRecEnc_FPREC_ENC: TFloatField;
    qryRecEnc_FPTOT_REC_ENC: TFloatField;
    qryRecEnc_FB: TwwQuery;
    qryRecEnc_FBIDTIPOCONTREMPTMO: TFloatField;
    qryRecEnc_FBREC_ENC: TFloatField;
    qryRecEnc_FBTOT_REC_ENC: TFloatField;
    qryRecAmort_CR: TwwQuery;
    qryRecAmort_CRIDTIPOCONTREMPTMO: TFloatField;
    qryRecAmort_CRREC_AMORT: TFloatField;
    qryRecAmort_CRTOT_REC_AMORT: TFloatField;
    qryRecAmort_FP: TwwQuery;
    qryRecAmort_FPIDTIPOCONTREMPTMO: TFloatField;
    qryRecAmort_FPREC_AMORT: TFloatField;
    qryRecAmort_FPTOT_REC_AMORT: TFloatField;
    qryRecAmort_FB: TwwQuery;
    qryRecAmort_FBIDTIPOCONTREMPTMO: TFloatField;
    qryRecAmort_FBREC_AMORT: TFloatField;
    qryRecAmort_FBTOT_REC_AMORT: TFloatField;
    qryRecQuit_CR: TwwQuery;
    qryRecQuit_CRIDTIPOCONTREMPTMO: TFloatField;
    qryRecQuit_CRREC_QUIT: TFloatField;
    qryRecQuit_CRTOT_REC_QUIT: TFloatField;
    qryRecQuit_FP: TwwQuery;
    qryRecQuit_FPIDTIPOCONTREMPTMO: TFloatField;
    qryRecQuit_FPREC_QUIT: TFloatField;
    qryRecQuit_FPTOT_REC_QUIT: TFloatField;
    qryRecQuit_FB: TwwQuery;
    qryRecQuit_FBIDTIPOCONTREMPTMO: TFloatField;
    qryRecQuit_FBREC_QUIT: TFloatField;
    qryRecQuit_FBTOT_REC_QUIT: TFloatField;
    qryItensAbonados: TwwQuery;
    qryItensAbonadosIDTIPOCONTREMPTMO: TFloatField;
    qryItensAbonadosABONADO: TFloatField;
    qryItensAbonadosTOT_ABONADO: TFloatField;
    qryItensQuitados: TwwQuery;
    qryItensQuitadosIDTIPOCONTREMPTMO: TFloatField;
    qryItensQuitadosQUITADO: TFloatField;
    qryItensQuitadosTOT_QUITADO: TFloatField;
    molListaPlano: TmolListaPlanoContab;

      procedure FormShow(Sender: TObject);
      procedure DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure DBcboTipoEmptmoExit(Sender: TObject);
      procedure molContratoEmptmobtnBuscaContratoClick(Sender: TObject);
      procedure molContratoEmptmobtnLimpaContratoClick(Sender: TObject);
      procedure molListaPatrobtnInvertePatroClick(Sender: TObject);
      procedure molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
      procedure molListaPlanobtnInvertePlanoClick(Sender: TObject);
      procedure molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);


   private  // Private declarations

      procedure AbreQueries;

      procedure MontaQuery; override;
      procedure FiltraRelatorio;
      procedure FiltraRelatorioAtuDia;


   public   // Public declarations


   end;



var
  cfgRelFechamentoCarteiraLinear: TcfgRelFechamentoCarteiraLinear;



implementation
{$R *.DFM}
uses
   DLookEmptmo,
   UDiasUteis,
   UMensErro,
   USistema,
   UfuncoesEmptmo,
   uTypesEmptmo,
   dEmptmo,
   dRelFechamentoCarteiraLinear;




procedure TcfgRelFechamentoCarteiraLinear.AbreQueries;
begin
   // Tipo de Empréstimo
   with dtmLookEmptmo.qryLookTipoEmptmo do
   begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoEmptmo);
      ParamByName('PIDEMPRESAPROP').AsInteger := Sistema.IDEmpresa;
      Open;
   end;

   // Tipo de Contrato
   LimpaParametros(dtmLookEmptmo.qryLookPlanPrev);
   dtmLookEmptmo.qryLookPlanPrev.Open;
end;



procedure TcfgRelFechamentoCarteiraLinear.MontaQuery;
begin
   inherited;

   with dtmRelFechamentoCarteiraLinear do
   begin
      sMesCompetencia   := cboMes.Text + ' / ' + DBspnAno.Text;

      bSeparador        := chkLinhas.Checked;

      // -------------------------------------------------------------------------------------------

      lblApropriado.Visible   := chkApropriado.Checked;
      lblAbonoContab.Visible  := chkAbonoContab.Checked;
      lblRenovacao.Visible    := chkRenovacao.Checked;

      lblTipoEmptmo.Caption := ' < todos > ';
      if DBcboTipoEmptmo.LookupValue <> ''   then lblTipoEmptmo.Caption := DBcboTipoEmptmo.Text;

      lblTipoContr.Caption  := ' < todos > ';
      if DBcboTipoContr.LookupValue <> ''    then lblTipoContr.Caption  := DBcboTipoContr.Text;

      memPatro.RichText := molListaPatro.ListaPatro;
      memPlano.RichText := molListaPlano.ListaPlano;

      // -------------------------------------------------------------------------------------------

      // determina se as linhas do relatório serão impressas em cores alternadas, e qual cor usar
      bCorlinha         := chkCorLinha.Checked;
      CorLinha          := cboCorLinha.SelectedColor;
   end;

   ParametrosSistema;
   case dtmEmptmo.qryParamEmptmoFLGCALCDIA.AsInteger of
      0: FiltraRelatorio;
      1: FiltraRelatorioAtuDia;
   end;
end;



procedure TcfgRelFechamentoCarteiraLinear.FiltraRelatorio;
var
   dDataAnt : TDateTime;
   dDataAtu : TDateTime;
   dDataIni : TDateTime;
   sSQL     : String;
   sAno     : String;
   sMes     : String;
   sDataAnt : String;
   sDataAtu : String;
   sDataIni : String;
begin
   sAno     := FormatFloat('0000', DBspnAno.Value);
   sMes     := FormatFloat('00', cboMes.ItemIndex + 1);

   dDataAtu := DiasUteis.UltDiaMes(Trunc(DBspnAno.Value), (cboMes.ItemIndex + 1));
   dDataAnt := DiasUteis.SomaMeses(dDataAtu, -1);
   dDataAnt := DiasUteis.UltDiaMes(DiasUteis.ExtraiAno(dDataAnt), DiasUteis.ExtraiMes(dDataAnt));

   dDataIni := EncodeDate(word(Trunc(DBspnAno.Value)), word(cboMes.ItemIndex + 1), 01);

   sDataAnt := QuotedStr(FormatDateTime('dd/mm/yyyy', dDataAnt));
   sDataAtu := QuotedStr(FormatDateTime('dd/mm/yyyy', dDataAtu));
   sDataIni := QuotedStr(FormatDateTime('dd/mm/yyyy', dDataIni));

   sSQL :=
   'SELECT '                                                                                             + #13 +

   '   TEP.DESCTIPOEMPTMO, '                                                                             + #13 +
   '   TCE.TCEDESCRICAO, '                                                                               + #13 +

   '   NVL(SALDO_ANT.SALDO_ANT, 0)                 AS SALDO_ANT, '                                       + #13 +
   '   NVL(SALDO_ANT.TOTALSALDO_ANT, 0)            AS TOTALSALDO_ANT, '                                  + #13 +

   '   NVL(PARCELAS_CR.PARCELAS, 0)                AS PARCELAS_CR, '                                     + #13 +
   '   NVL(PARCELAS_CR.TOTALPARC, 0)               AS TOTALPARC_CR, '                                    + #13 +
   '   NVL(PARCELAS_FP.PARCELAS, 0)                AS PARCELAS_FP, '                                     + #13 +
   '   NVL(PARCELAS_FP.TOTALPARC, 0)               AS TOTALPARC_FP, '                                    + #13 +
   '   NVL(PARCELAS_FB.PARCELAS, 0)                AS PARCELAS_FB, '                                     + #13 +
   '   NVL(PARCELAS_FB.TOTALPARC, 0)               AS TOTALPARC_FB, '                                    + #13 +

   '   NVL(ENCARGOS_CR.ENCARGOS_CR, 0)             AS ENCARGOS_CR, '                                     + #13 +
   '   NVL(ENCARGOS_CR.TOTALENC_CR, 0)             AS TOTALENC_CR, '                                     + #13 +
   '   NVL(ENCARGOS_FP.ENCARGOS_FP, 0)             AS ENCARGOS_FP, '                                     + #13 +
   '   NVL(ENCARGOS_FP.TOTALENC_FP, 0)             AS TOTALENC_FP, '                                     + #13 +
   '   NVL(ENCARGOS_FB.ENCARGOS_FB, 0)             AS ENCARGOS_FB, '                                     + #13 +
   '   NVL(ENCARGOS_FB.TOTALENC_FB, 0)             AS TOTALENC_FB, '                                     + #13 +

   '   NVL(AMORT_CR.AMORTIZACAO_CR, 0)             AS AMORTIZACAO_CR, '                                  + #13 +
   '   NVL(AMORT_CR.TOTALAMO_CR, 0)                AS TOTALAMO_CR, '                                     + #13 +
   '   NVL(AMORT_FP.AMORTIZACAO_FP, 0)             AS AMORTIZACAO_FP, '                                  + #13 +
   '   NVL(AMORT_FP.TOTALAMO_FP, 0)                AS TOTALAMO_FP, '                                     + #13 +
   '   NVL(AMORT_FB.AMORTIZACAO_FB, 0)             AS AMORTIZACAO_FB, '                                  + #13 +
   '   NVL(AMORT_FB.TOTALAMO_FB, 0)                AS TOTALAMO_FB, '                                     + #13 +

   '   NVL(QUITACAO_CR.QUITACAO_CR, 0)             AS QUITACAO_CR, '                                        + #13 +
   '   NVL(QUITACAO_CR.TOTALQUI_CR, 0)             AS TOTALQUI_CR, '                                        + #13 +
   '   NVL(QUITACAO_FP.QUITACAO_FP, 0)             AS QUITACAO_FP, '                                        + #13 +
   '   NVL(QUITACAO_FP.TOTALQUI_FP, 0)             AS TOTALQUI_FP, '                                        + #13 +
   '   NVL(QUITACAO_FB.QUITACAO_FB, 0)             AS QUITACAO_FB, '                                        + #13 +
   '   NVL(QUITACAO_FB.TOTALQUI_FB, 0)             AS TOTALQUI_FB, '                                        + #13 +

   '   NVL(REC_PARC_CR.REC_PARC, 0)                AS REC_PARC_CR, '                                     + #13 +
   '   NVL(REC_PARC_CR.TOT_REC_PARC, 0)            AS TOT_REC_PARC_CR, '                                 + #13 +

   '   NVL(REC_PARC_FP.REC_PARC, 0)                AS REC_PARC_FP, '                                     + #13 +
   '   NVL(REC_PARC_FP.TOT_REC_PARC, 0)            AS TOT_REC_PARC_FP, '                                 + #13 +

   '   NVL(REC_PARC_FB.REC_PARC, 0)                AS REC_PARC_FB, '                                     + #13 +
   '   NVL(REC_PARC_FB.TOT_REC_PARC, 0)            AS TOT_REC_PARC_FB, '                                 + #13 +

   '   NVL(REC_ENC_CR.REC_ENC, 0)                  AS REC_ENC_CR, '                                         + #13 +
   '   NVL(REC_ENC_CR.TOT_REC_ENC, 0)              AS TOT_REC_ENC_CR, '                                     + #13 +
   '   NVL(REC_ENC_FP.REC_ENC, 0)                  AS REC_ENC_FP, '                                         + #13 +
   '   NVL(REC_ENC_FP.TOT_REC_ENC, 0)              AS TOT_REC_ENC_FP, '                                     + #13 +
   '   NVL(REC_ENC_FB.REC_ENC, 0)                  AS REC_ENC_FB, '                                         + #13 +
   '   NVL(REC_ENC_FB.TOT_REC_ENC, 0)              AS TOT_REC_ENC_FB, '                                     + #13 +
   '   NVL(REC_AMORT_CR.REC_AMORT, 0)              AS REC_AMORT_CR, '                                       + #13 +
   '   NVL(REC_AMORT_CR.TOT_REC_AMORT, 0)          AS TOT_REC_AMORT_CR, '                                   + #13 +
   '   NVL(REC_AMORT_FP.REC_AMORT, 0)              AS REC_AMORT_FP, '                                       + #13 +
   '   NVL(REC_AMORT_FP.TOT_REC_AMORT, 0)          AS TOT_REC_AMORT_FP, '                                   + #13 +
   '   NVL(REC_AMORT_FB.REC_AMORT, 0)              AS REC_AMORT_FB, '                                       + #13 +
   '   NVL(REC_AMORT_FB.TOT_REC_AMORT, 0)          AS TOT_REC_AMORT_FB, '                                   + #13 +

   '   NVL(REC_QUIT_CR.REC_QUIT, 0)                AS REC_QUIT_CR, '                                        + #13 +
   '   NVL(REC_QUIT_CR.TOT_REC_QUIT, 0)            AS TOT_REC_QUIT_CR, '                                    + #13 +
   '   NVL(REC_QUIT_FP.REC_QUIT, 0)                AS REC_QUIT_FP, '                                        + #13 +
   '   NVL(REC_QUIT_FP.TOT_REC_QUIT, 0)            AS TOT_REC_QUIT_FP, '                                    + #13 +
   '   NVL(REC_QUIT_FB.REC_QUIT, 0)                AS REC_QUIT_FB, '                                        + #13 +
   '   NVL(REC_QUIT_FB.TOT_REC_QUIT, 0)            AS TOT_REC_QUIT_FB, '                                    + #13 +

   '   NVL(ABONADO.ABONADO, 0)                     AS ABONADO, '                                         + #13 +
   '   NVL(ABONADO.TOT_ABONADO, 0)                 AS TOT_ABONADO, '                                     + #13 +

   '   NVL(QUITADO.QUITADO, 0)                     AS QUITADO, '                                         + #13 +
   '   NVL(QUITADO.TOT_QUITADO, 0)                 AS TOT_QUITADO, '                                     + #13 +

   '   NVL(SALDO_DEV.SALDO_DEV, 0)                 AS SALDO_DEV, '                                       + #13 +
   '   NVL(SALDO_DEV.TOTALSALDO_DEV, 0)            AS TOTALSALDO_DEV '                                   + #13 +

   'FROM '                                                                                               + #13 +
   '   TIPOCONTREMPTMO TCE, TIPOEMPTMO TEP, '                                                            + #13 +


   '-- SALDO ANTERIOR ---------------------------------------------------------------------------- '     + #13 +
   '   ( '                                                                                               + #13 +
   '   SELECT '                                                                                          + #13 +
   '      A.IDTIPOCONTREMPTMO, '                                                                         + #13 +
   '      SUM(CON.DEVE) AS SALDO_ANT, '                                                                  + #13 +
   '      SUM(CON.QUANT) AS TOTALSALDO_ANT '                                                             + #13 +
   '   FROM '                                                                                            + #13 +
   '      TIPOCONTREMPTMO A, '                                                                           + #13 +
   '      ( '                                                                                            + #13 +
   '      SELECT '                                                                                       + #13 +
   '         C.IDCONTRATOEMPTMO, C.IDTIPOCONTREMPTMO, '                                                  + #13 +
   '         (NVL(PAR_DEV.VLR_DEV, 0) - NVL(PAR_PAG.VLR_PAG, 0)) AS DEVE, '                                       + #13 +
   '         DECODE((ROUND(NVL(PAR_DEV.VLR_DEV, 0), 2) - ROUND(NVL(PAR_PAG.VLR_PAG, 0), 2)), 0, 0, 1) AS QUANT '  + #13 +
   '      FROM '                                                                                         + #13 +
   '         CONTRATOEMPTMO C, '                                                                         + #13 +
   '         ( '                                                                                         + #13 +
   '         SELECT '                                                                                    + #13 +
   '            CON.IDCONTRATOEMPTMO, SUM(NVL(HME.HMEVLRPREVISTO, 0)) AS VLR_DEV '                       + #13 +
   '         FROM '                                                                                      + #13 +
   '            HISTMOVEMPTMO HME, CONTRATOEMPTMO CON '                                                  + #13 +
   '         WHERE '                                                                                     + #13 +
   '                CON.FLGSITUACAO        <> ''C'' '                                                    + #13 +
   '            AND HME.HMETIPOMOV         IN (1, 2, 3, 4, 6, 7) '                                       + #13 +
   '            AND HME.HMESEQCOBRANCA     = 1 '                                                         + #13 +
   '            AND HME.HMEDATAPREVISTA    <= TO_DATE(' + sDataAnt + ', ''DD/MM/YYYY'') '                + #13 +
   '            AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) ) '                            + #13 +
   '            AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO IS NULL) ) '                        + #13 +
   '            AND CON.IDPATRO             IN (' + molListaPatro.PegaPatro + ') '                       + #13 +
   '            AND CON.IDPLANOPREV         IN (' + molListaPlano.PegaPlano + ') '                       + #13;

   // Tipo de Contrato
   if DBcboTipoContr.LookupValue <> '' then sSQL := sSQL +
   '            AND CON.IDTIPOCONTREMPTMO  = ' + DBcboTipoContr.LookupValue                           + #13;

   // Contrato
   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '            AND CON.IDCONTRATOEMPTMO   = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)         + #13;

   sSQL := sSQL +
   '            AND ( CON.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO ) '                                    + #13 +
   '         GROUP BY '                                                                                  + #13 +
   '            CON.IDCONTRATOEMPTMO '                                                                   + #13 +
   '         ) PAR_DEV, '                                                                                + #13 +
   '         ( '                                                                                         + #13 +
   '         SELECT '                                                                                    + #13 +
   '            CON.IDCONTRATOEMPTMO, '                                                                  + #13 +
   '            SUM(DECODE(FLGQUITADO, 1, NVL(HME.HMEVLRPREVISTO, 0), '                                        + #13 +
   '                                      DECODE(FLGABONADO, 1, NVL(HME.HMEVLRPREVISTO, 0), '                  + #13 +
   '                                                            NVL(HME.HMEVLREFETIVO, 0)))) AS VLR_PAG '      + #13 +
   '         FROM '                                                                                      + #13 +
   '            HISTMOVEMPTMO HME, CONTRATOEMPTMO CON '                                                  + #13 +
   '         WHERE '                                                                                     + #13 +
   '                CON.FLGSITUACAO        <> ''C'' '                                                    + #13 +
   '            AND HME.HMETIPOMOV         IN (1, 2, 3, 4, 6, 7) '                                       + #13 +
   '            AND HME.HMEDATAPREVISTA    <= TO_DATE(' + sDataAnt + ', ''DD/MM/YYYY'') '                + #13 +
   '            AND ( '                                                                                  + #13 +
   '                (HME.HMEDATAEFETIVA    <= TO_DATE(' + sDataAnt + ', ''DD/MM/YYYY'')) '               + #13 +
   '                OR ( (HME.FLGQUITADO = 1) AND (HME.HMEDATAQUITABONO <= TO_DATE(' + sDataAnt + ',''DD/MM/YYYY'')) ) '   + #13 +
   '                OR ( (HME.FLGABONADO = 1) AND (HME.HMEDATAQUITABONO <= TO_DATE(' + sDataAnt + ',''DD/MM/YYYY'')) ) '   + #13 +
   '                ) '                                                                                  + #13 +
   '            AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) ) '                            + #13 +
   '            AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO IS NULL) ) '                        + #13 +
   '            AND CON.IDPATRO             IN (' + molListaPatro.PegaPatro + ') '                       + #13 +
   '            AND CON.IDPLANOPREV         IN (' + molListaPlano.PegaPlano + ') '                       + #13;

   // Tipo de Contrato
   if DBcboTipoContr.LookupValue <> '' then sSQL := sSQL +
   '            AND CON.IDTIPOCONTREMPTMO  = ' + DBcboTipoContr.LookupValue                           + #13;

   // Contrato
   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '            AND CON.IDCONTRATOEMPTMO   = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)         + #13;

   sSQL := sSQL +
   '            AND ( CON.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO ) '                                    + #13 +
   '         GROUP BY '                                                                                  + #13 +
   '            CON.IDCONTRATOEMPTMO '                                                                   + #13 +
   '         ) PAR_PAG '                                                                                 + #13 +
   '      WHERE '                                                                                        + #13 +
   '             C.IDCONTRATOEMPTMO   = PAR_DEV.IDCONTRATOEMPTMO(+) '                                    + #13 +
   '         AND C.IDPATRO            IN (' + molListaPatro.PegaPatro + ') '                             + #13 +
   '         AND C.IDPLANOPREV        IN (' + molListaPlano.PegaPlano + ') '                             + #13;

   // Tipo de Contrato
   if DBcboTipoContr.LookupValue <> '' then sSQL := sSQL +
   '         AND C.IDTIPOCONTREMPTMO  = ' + DBcboTipoContr.LookupValue                                + #13;

   // Contrato
   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '         AND C.IDCONTRATOEMPTMO   = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)                       + #13;

   sSQL := sSQL +
   '         AND C.IDCONTRATOEMPTMO   = PAR_PAG.IDCONTRATOEMPTMO(+) '                                    + #13 +
   '      ) CON '                                                                                        + #13 +
   '   WHERE '                                                                                           + #13 +
   '      A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO(+) '                                               + #13 +
   '   GROUP BY '                                                                                        + #13 +
   '      A.IDTIPOCONTREMPTMO '                                                                          + #13 +
   '   ) SALDO_ANT, '                                                                                    + #13 +
   '-- FIM SALDO ANTERIOR ------------------------------------------------------------------------ '     + #13 +

//******************************************************************************************************
// Cobranças Geradas
//******************************************************************************************************

   '-- PARCELAS FINANCEIRO ---------------------------------------------------------------------------------- '     + #13 +
   '   ( '                                                                                               + #13 +
   '   SELECT '                                                                                          + #13 +
   '      A.IDTIPOCONTREMPTMO, NVL(SUM(CON.HMEVLRPREVISTO), 0) AS PARCELAS, '                            + #13 +
   '      NVL(COUNT(CON.IDCONTRATOEMPTMO),0) AS TOTALPARC '                                              + #13 +
   '   FROM '                                                                                            + #13 +
   '      TIPOCONTREMPTMO A, '                                                                           + #13 +
   '      ( '                                                                                            + #13 +
   '      SELECT '                                                                                       + #13 +
   '         C.IDTIPOCONTREMPTMO, C.IDCONTRATOEMPTMO, HME.HMEVLRPREVISTO '                               + #13 +
   '      FROM '                                                                                         + #13 +
   '         HISTMOVEMPTMO HME, CONTRATOEMPTMO C '                                                       + #13 +
   '      WHERE '                                                                                        + #13 +
   '             C.FLGSITUACAO          <> ''C'' '                                                       + #13 +
   '         AND C.IDPATRO              IN (' + molListaPatro.PegaPatro + ') '                           + #13 +
   '         AND C.IDPLANOPREV          IN (' + molListaPlano.PegaPlano + ') '                           + #13;

   // Tipo de Contrato
   if DBcboTipoContr.LookupValue <> '' then sSQL := sSQL +
   '         AND C.IDTIPOCONTREMPTMO    = ' + DBcboTipoContr.LookupValue                              + #13;

   // Contrato
   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '         AND C.IDCONTRATOEMPTMO     = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)            + #13;

   sSQL := sSQL +
   '         AND HME.HMETIPOMOV         = 1 '                                                            + #13 +
   '         AND HME.HMEPARCELA         > 0 '                                                            + #13 +
   '         AND HME.HMESEQCOBRANCA     = 1 '                                                            + #13 +
   '         AND HME.HMEFORMACOBRANCA   = ''C'' '                                                        + #13 +
   '         AND ( HME.HMECENTRALIZA    = 1 OR HME.HMEDESTACADO = 1 ) '                                  + #13 +
   '         AND ( (HME.FLGESTORNADO    IS NULL) OR (HME.FLGESTORNADO = 0) ) '                           + #13 +

   '         AND HME.HMEDATAPREVISTA    BETWEEN TO_DATE(' + sDataIni + ', ''DD/MM/YYYY'') AND TO_DATE(' + sDataAtu + ', ''DD/MM/YYYY'') ' +

   '         AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO '                                           + #13 +
   '      ) CON '                                                                                        + #13 +
   '   WHERE '                                                                                           + #13 +
   '      A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO(+) '                                               + #13 +
   '   GROUP BY '                                                                                        + #13 +
   '      A.IDTIPOCONTREMPTMO '                                                                          + #13 +
   '   ) PARCELAS_CR, '                                                                                  + #13 +
   '-- FIM PARCELAS FINANCEIRO ------------------------------------------------------------------- '     + #13 +


   '-- PARCELAS FOLHA PATROCINADORA -------------------------------------------------------------- '     + #13 +
   '   ( '                                                                                               + #13 +
   '   SELECT '                                                                                          + #13 +
   '      A.IDTIPOCONTREMPTMO, NVL(SUM(CON.HMEVLRPREVISTO), 0) AS PARCELAS, '                            + #13 +
   '      NVL(COUNT(CON.IDCONTRATOEMPTMO),0) AS TOTALPARC '                                              + #13 +
   '   FROM '                                                                                            + #13 +
   '      TIPOCONTREMPTMO A, '                                                                           + #13 +
   '      ( '                                                                                            + #13 +
   '      SELECT '                                                                                       + #13 +
   '         C.IDTIPOCONTREMPTMO, C.IDCONTRATOEMPTMO, HME.HMEVLRPREVISTO '                               + #13 +
   '      FROM '                                                                                         + #13 +
   '         HISTMOVEMPTMO HME, CONTRATOEMPTMO C '                                                       + #13 +
   '      WHERE '                                                                                        + #13 +
   '             C.FLGSITUACAO          <> ''C'' '                                                       + #13 +
   '         AND C.IDPATRO              IN (' + molListaPatro.PegaPatro + ') '                           + #13 +
   '         AND C.IDPLANOPREV          IN (' + molListaPlano.PegaPlano + ') '                           + #13;

   // Tipo de Contrato
   if DBcboTipoContr.LookupValue <> '' then sSQL := sSQL +
   '         AND C.IDTIPOCONTREMPTMO    = ' + DBcboTipoContr.LookupValue                              + #13;

   // Contrato
   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '         AND C.IDCONTRATOEMPTMO     = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)            + #13;

   sSQL := sSQL +
   '         AND HME.HMETIPOMOV         = 1 '                                                            + #13 +
   '         AND HME.HMEPARCELA         > 0 '                                                            + #13 +
   '         AND HME.HMESEQCOBRANCA     = 1 '                                                            + #13 +
   '         AND HME.HMEFORMACOBRANCA   = ''F'' '                                                        + #13 +
   '         AND HME.HMETIPOFOLHA       = ''P'' '                                                        + #13 +
   '         AND ( HME.HMECENTRALIZA    = 1 OR HME.HMEDESTACADO = 1 ) '                                  + #13 +
   '         AND ( (HME.FLGESTORNADO    IS NULL) OR (HME.FLGESTORNADO = 0) ) '                           + #13 +

   '         AND HME.HMEDATAPREVISTA    BETWEEN TO_DATE(' + sDataIni + ', ''DD/MM/YYYY'') AND TO_DATE(' + sDataAtu + ', ''DD/MM/YYYY'') ' +

   '         AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO '                                           + #13 +
   '      ) CON '                                                                                        + #13 +
   '   WHERE '                                                                                           + #13 +
   '      A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO(+) '                                               + #13 +
   '   GROUP BY '                                                                                        + #13 +
   '      A.IDTIPOCONTREMPTMO '                                                                          + #13 +
   '   ) PARCELAS_FP, '                                                                                  + #13 +
   '-- FIM PARCELAS FOLHA PATROCINADORA ---------------------------------------------------------- '     + #13 +

   '-- PARCELAS FOLHA BENEFÏCIOS    -------------------------------------------------------------- '     + #13 +
   '   ( '                                                                                               + #13 +
   '   SELECT '                                                                                          + #13 +
   '      A.IDTIPOCONTREMPTMO, NVL(SUM(CON.HMEVLRPREVISTO), 0) AS PARCELAS, '                            + #13 +
   '      NVL(COUNT(CON.IDCONTRATOEMPTMO),0) AS TOTALPARC '                                              + #13 +
   '   FROM '                                                                                            + #13 +
   '      TIPOCONTREMPTMO A, '                                                                           + #13 +
   '      ( '                                                                                            + #13 +
   '      SELECT '                                                                                       + #13 +
   '         C.IDTIPOCONTREMPTMO, C.IDCONTRATOEMPTMO, HME.HMEVLRPREVISTO '                               + #13 +
   '      FROM '                                                                                         + #13 +
   '         HISTMOVEMPTMO HME, CONTRATOEMPTMO C '                                                       + #13 +
   '      WHERE '                                                                                        + #13 +
   '             C.FLGSITUACAO          <> ''C'' '                                                       + #13 +
   '         AND C.IDPATRO              IN (' + molListaPatro.PegaPatro + ') '                           + #13 +
   '         AND C.IDPLANOPREV          IN (' + molListaPlano.PegaPlano + ') '                           + #13;

   // Tipo de Contrato
   if DBcboTipoContr.LookupValue <> '' then sSQL := sSQL +
   '         AND C.IDTIPOCONTREMPTMO    = ' + DBcboTipoContr.LookupValue                              + #13;

   // Contrato
   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '         AND C.IDCONTRATOEMPTMO     = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)            + #13;

   sSQL := sSQL +
   '         AND HME.HMETIPOMOV         = 1 '                                                            + #13 +
   '         AND HME.HMEPARCELA         > 0 '                                                            + #13 +
   '         AND HME.HMESEQCOBRANCA     = 1 '                                                            + #13 +
   '         AND HME.HMEFORMACOBRANCA   = ''F'' '                                                        + #13 +
   '         AND HME.HMETIPOFOLHA       = ''B'' '                                                        + #13 +
   '         AND ( HME.HMECENTRALIZA    = 1 OR HME.HMEDESTACADO = 1 ) '                                  + #13 +
   '         AND ( (HME.FLGESTORNADO    IS NULL) OR (HME.FLGESTORNADO = 0) ) '                           + #13 +

   '         AND HME.HMEDATAPREVISTA    BETWEEN TO_DATE(' + sDataIni + ', ''DD/MM/YYYY'') AND TO_DATE(' + sDataAtu + ', ''DD/MM/YYYY'') ' +

   '         AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO '                                           + #13 +
   '      ) CON '                                                                                        + #13 +
   '   WHERE '                                                                                           + #13 +
   '      A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO(+) '                                               + #13 +
   '   GROUP BY '                                                                                        + #13 +
   '      A.IDTIPOCONTREMPTMO '                                                                          + #13 +
   '   ) PARCELAS_FB, '                                                                                  + #13 +
   '-- FIM PARCELAS FOLHA BENEFICIOS    ---------------------------------------------------------- '     + #13 +


   '-- ENCARGOS FINANCEIRO ---------------------------------------------------------------------------------- '     + #13 +
   '   ( '                                                                                               + #13 +
   '   SELECT '                                                                                          + #13 +
   '      A.IDTIPOCONTREMPTMO, NVL(SUM(CON.HMEVLRPREVISTO), 0) AS ENCARGOS_CR, '                            + #13 +
   '      NVL(COUNT(CON.IDCONTRATOEMPTMO), 0) AS TOTALENC_CR '                                              + #13 +
   '   FROM '                                                                                            + #13 +
   '      TIPOCONTREMPTMO A, '                                                                           + #13 +
   '      ( '                                                                                            + #13 +
   //Wylliam Leite da Silva SOL 253185 PPM 771995 - Início
   '      SELECT '                                                                     + #13 +
   //Wylliam Leite da Silva SOL 253185 PPM 771995 - Fim
   '         TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO, '                               + #13 +
   '         TC.IDTIPOCONTREMPTMO, HMEVLRPREVISTO '                                                      + #13 +
   '      FROM '                                                                                         + #13 +
   '         HISTMOVEMPTMO HME, CONTRATOEMPTMO C, '                                                      + #13 +
   '         ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC '                                                    + #13 +
   '      WHERE '                                                                                        + #13 +
   '             C.FLGSITUACAO          <> ''C'' '                                                       + #13 +
   '         AND C.IDPATRO              IN (' + molListaPatro.PegaPatro + ') '                           + #13 +
   '         AND C.IDPLANOPREV          IN (' + molListaPlano.PegaPlano + ') '                           + #13;

   // Tipo de Empréstimo
   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   '         AND TC.IDTIPOEMPTMO        = ' + DBcboTipoEmptmo.LookupValue                                + #13;

   // Tipo de Contrato
   if DBcboTipoContr.LookupValue <> '' then sSQL := sSQL +
   '         AND TC.IDTIPOCONTREMPTMO   = ' + DBcboTipoContr.LookupValue                              + #13;

   // Contrato
   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '         AND C.IDCONTRATOEMPTMO     = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)                     + #13;

   if chkApropriado.Checked then sSQL := sSQL +
   '         AND ( '                                                                                     + #13 +
   '             (NVL(HME.FLGABONADO, 0) = 0) OR '                                                       + #13 +
   '             (NVL(HME.FLGABONADO, 0) = 1 AND HME.PLNCODIGO IS NOT NULL) '                            + #13 +
   '             ) '                                                                                     + #13;

   sSQL := sSQL +
   '         AND HME.HMETIPOMOV         = 4 '                                                            + #13 +
   '         AND HME.HMESEQCOBRANCA     = 1 '                                                            + #13 +
   '         AND HME.HMEFORMACOBRANCA   = ''C'' '                                                        + #13 +
   '         AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) ) '                               + #13 +
   '         AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO IS NULL) ) '                           + #13 +

   '         AND HME.HMEDATAPREVISTA    BETWEEN TO_DATE(' + sDataIni + ', ''DD/MM/YYYY'') AND TO_DATE(' + sDataAtu + ', ''DD/MM/YYYY'') ' +

   '         AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO '                                           + #13 +
   '         AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO '                                         + #13 +
   '         AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO '                                        + #13 +
   '         AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO '                                             + #13 +
   '      ) CON '                                                                                        + #13 +
   '   WHERE '                                                                                           + #13 +
   '      A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO(+) '                                               + #13 +
   '   GROUP BY '                                                                                        + #13 +
   '      A.IDTIPOCONTREMPTMO '                                                                          + #13 +
   '   ) ENCARGOS_CR, '                                                                                     + #13 +
   ' '                                                                                                   + #13 +
   '-- FIM ENCARGOS FINANCEIRO ------------------------------------------------------------------- '     + #13 +


   '-- ENCARGOS FOLHA PATRO ---------------------------------------------------------------------------------- '     + #13 +
   '   ( '                                                                                               + #13 +
   '   SELECT '                                                                                          + #13 +
   '      A.IDTIPOCONTREMPTMO, NVL(SUM(CON.HMEVLRPREVISTO), 0) AS ENCARGOS_FP, '                            + #13 +
   '      NVL(COUNT(CON.IDCONTRATOEMPTMO), 0) AS TOTALENC_FP '                                              + #13 +
   '   FROM '                                                                                            + #13 +
   '      TIPOCONTREMPTMO A, '                                                                           + #13 +
   '      ( '                                                                                            + #13 +
   //Wylliam Leite da Silva SOL 253185 PPM 771995 - Início
   '      SELECT '                                                                     + #13 +
   //Wylliam Leite da Silva SOL 253185 PPM 771995 - Fim
   '         TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO, '                               + #13 +
   '         TC.IDTIPOCONTREMPTMO, HMEVLRPREVISTO '                                                      + #13 +
   '      FROM '                                                                                         + #13 +
   '         HISTMOVEMPTMO HME, CONTRATOEMPTMO C, '                                                      + #13 +
   '         ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC '                                                    + #13 +
   '      WHERE '                                                                                        + #13 +
   '             C.FLGSITUACAO          <> ''C'' '                                                       + #13 +
   '         AND C.IDPATRO              IN (' + molListaPatro.PegaPatro + ') '                           + #13 +
   '         AND C.IDPLANOPREV          IN (' + molListaPlano.PegaPlano + ') '                           + #13;

   // Tipo de Empréstimo
   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   '         AND TC.IDTIPOEMPTMO        = ' + DBcboTipoEmptmo.LookupValue                                + #13;

   // Tipo de Contrato
   if DBcboTipoContr.LookupValue <> '' then sSQL := sSQL +
   '         AND TC.IDTIPOCONTREMPTMO   = ' + DBcboTipoContr.LookupValue                              + #13;

   // Contrato
   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '         AND C.IDCONTRATOEMPTMO     = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)                     + #13;

   if chkApropriado.Checked then sSQL := sSQL +
   '         AND ( '                                                                                     + #13 +
   '             (NVL(HME.FLGABONADO, 0) = 0) OR '                                                       + #13 +
   '             (NVL(HME.FLGABONADO, 0) = 1 AND HME.PLNCODIGO IS NOT NULL) '                            + #13 +
   '             ) '                                                                                     + #13;

   sSQL := sSQL +
   '         AND HME.HMETIPOMOV         = 4 '                                                            + #13 +
   '         AND HME.HMESEQCOBRANCA     = 1 '                                                            + #13 +
   '         AND HME.HMEFORMACOBRANCA   = ''F'' '                                                        + #13 +
   '         AND HME.HMETIPOFOLHA       = ''P'' '                                                        + #13 +
   '         AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) ) '                               + #13 +
   '         AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO IS NULL) ) '                           + #13 +

   '         AND HME.HMEDATAPREVISTA    BETWEEN TO_DATE(' + sDataIni + ', ''DD/MM/YYYY'') AND TO_DATE(' + sDataAtu + ', ''DD/MM/YYYY'') ' +

   '         AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO '                                           + #13 +
   '         AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO '                                         + #13 +
   '         AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO '                                        + #13 +
   '         AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO '                                             + #13 +
   '      ) CON '                                                                                        + #13 +
   '   WHERE '                                                                                           + #13 +
   '      A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO(+) '                                               + #13 +
   '   GROUP BY '                                                                                        + #13 +
   '      A.IDTIPOCONTREMPTMO '                                                                          + #13 +
   '   ) ENCARGOS_FP, '                                                                                  + #13 +
   '-- FIM ENCARGOS FOLHA PATRO ------------------------------------------------------------------- '    + #13 +

   '-- ENCARGOS FOLHA BENEF ---------------------------------------------------------------------------------- '     + #13 +
   '   ( '                                                                                               + #13 +
   '   SELECT '                                                                                          + #13 +
   '      A.IDTIPOCONTREMPTMO, NVL(SUM(CON.HMEVLRPREVISTO), 0) AS ENCARGOS_FB, '                            + #13 +
   '      NVL(COUNT(CON.IDCONTRATOEMPTMO), 0) AS TOTALENC_FB '                                              + #13 +
   '   FROM '                                                                                            + #13 +
   '      TIPOCONTREMPTMO A, '                                                                           + #13 +
   '      ( '                                                                                            + #13 +
   //Wylliam Leite da Silva SOL 253185 PPM 771995 - Início
   '      SELECT '                                                                     + #13 +
   //Wylliam Leite da Silva SOL 253185 PPM 771995 - Fim
   '         TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO, '                               + #13 +
   '         TC.IDTIPOCONTREMPTMO, HMEVLRPREVISTO '                                                      + #13 +
   '      FROM '                                                                                         + #13 +
   '         HISTMOVEMPTMO HME, CONTRATOEMPTMO C, '                                                      + #13 +
   '         ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC '                                                    + #13 +
   '      WHERE '                                                                                        + #13 +
   '             C.FLGSITUACAO          <> ''C'' '                                                       + #13 +
   '         AND C.IDPATRO              IN (' + molListaPatro.PegaPatro + ') '                           + #13 +
   '         AND C.IDPLANOPREV          IN (' + molListaPlano.PegaPlano + ') '                           + #13;

   // Tipo de Empréstimo
   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   '         AND TC.IDTIPOEMPTMO        = ' + DBcboTipoEmptmo.LookupValue                                + #13;

   // Tipo de Contrato
   if DBcboTipoContr.LookupValue <> '' then sSQL := sSQL +
   '         AND TC.IDTIPOCONTREMPTMO   = ' + DBcboTipoContr.LookupValue                              + #13;

   // Contrato
   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '         AND C.IDCONTRATOEMPTMO     = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)                     + #13;

   if chkApropriado.Checked then sSQL := sSQL +
   '         AND ( '                                                                                     + #13 +
   '             (NVL(HME.FLGABONADO, 0) = 0) OR '                                                       + #13 +
   '             (NVL(HME.FLGABONADO, 0) = 1 AND HME.PLNCODIGO IS NOT NULL) '                            + #13 +
   '             ) '                                                                                     + #13;

   sSQL := sSQL +
   '         AND HME.HMETIPOMOV         = 4 '                                                            + #13 +
   '         AND HME.HMESEQCOBRANCA     = 1 '                                                            + #13 +
   '         AND HME.HMEFORMACOBRANCA   = ''F'' '                                                        + #13 +
   '         AND HME.HMETIPOFOLHA       = ''B'' '                                                        + #13 +
   '         AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) ) '                               + #13 +
   '         AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO IS NULL) ) '                           + #13 +

   '         AND HME.HMEDATAPREVISTA    BETWEEN TO_DATE(' + sDataIni + ', ''DD/MM/YYYY'') AND TO_DATE(' + sDataAtu + ', ''DD/MM/YYYY'') ' +

   '         AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO '                                           + #13 +
   '         AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO '                                         + #13 +
   '         AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO '                                        + #13 +
   '         AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO '                                             + #13 +
   '      ) CON '                                                                                        + #13 +
   '   WHERE '                                                                                           + #13 +
   '      A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO(+) '                                               + #13 +
   '   GROUP BY '                                                                                        + #13 +
   '      A.IDTIPOCONTREMPTMO '                                                                          + #13 +
   '   ) ENCARGOS_FB, '                                                                                     + #13 +
   '-- FIM ENCARGOS FOLHA BENEF ------------------------------------------------------------------- '     + #13 +


   '-- AMORTIZAÇÃO FINANCEIRO ------------------------------------------------------------------------------- '     + #13 +
   '   ( '                                                                                               + #13 +
   '   SELECT '                                                                                          + #13 +
   '      A.IDTIPOCONTREMPTMO, '                                                                         + #13 +
   '      NVL(SUM(CON.HMEVLRPREVISTO), 0) AS AMORTIZACAO_CR, '                                              + #13 +
   '      NVL(COUNT(CON.IDCONTRATOEMPTMO), 0) AS TOTALAMO_CR '                                              + #13 +
   '   FROM '                                                                                            + #13 +
   '      TIPOCONTREMPTMO A, '                                                                           + #13 +
   '      ( '                                                                                            + #13 +
   //Wylliam Leite da Silva SOL 253185 PPM 771995 - Início
   '      SELECT '                                                                     + #13 +
   //Wylliam Leite da Silva SOL 253185 PPM 771995 - Fim
   '         TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO, '                               + #13 +
   '         TC.IDTIPOCONTREMPTMO, HMEVLRPREVISTO '                                                      + #13 +
   '      FROM '                                                                                         + #13 +
   '         HISTMOVEMPTMO HME, CONTRATOEMPTMO C, '                                                      + #13 +
   '         ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC '                                                    + #13 +
   '      WHERE '                                                                                        + #13 +
   '             C.FLGSITUACAO          <> ''C'' '                                                       + #13 +
   '         AND C.IDPATRO              IN (' + molListaPatro.PegaPatro + ') '                           + #13 +
   '         AND C.IDPLANOPREV          IN (' + molListaPlano.PegaPlano + ') '                           + #13;

   // Tipo de Empréstimo
   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   '         AND TC.IDTIPOEMPTMO        = ' + DBcboTipoEmptmo.LookupValue                                + #13;

   // Tipo de Contrato
   if DBcboTipoContr.LookupValue <> '' then sSQL := sSQL +
   '         AND TC.IDTIPOCONTREMPTMO   = ' + DBcboTipoContr.LookupValue                              + #13;

   // Contrato
   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '         AND C.IDCONTRATOEMPTMO     = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)                     + #13;

   sSQL := sSQL +
   '         AND HME.HMETIPOMOV         = 2 '                                                            + #13 +
   '         AND HME.HMESEQCOBRANCA     = 1 '                                                            + #13 +
   '         AND HME.HMEFORMACOBRANCA   = ''C'' '                                                            + #13 +
   '         AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) ) '                               + #13 +
   '         AND ( (HME.FLGESTORNADO    IS NULL) OR (HME.FLGESTORNADO = 0) ) '                           + #13 +

   '         AND HME.HMEDATAPREVISTA    BETWEEN TO_DATE(' + sDataIni + ', ''DD/MM/YYYY'') AND TO_DATE(' + sDataAtu + ', ''DD/MM/YYYY'') ' +

   '         AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO '                                           + #13 +
   '         AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO '                                         + #13 +
   '         AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO '                                        + #13 +
   '         AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO '                                             + #13 +
   '      ) CON '                                                                                        + #13 +
   '   WHERE '                                                                                           + #13 +
   '      A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO(+) '                                               + #13 +
   '   GROUP BY '                                                                                        + #13 +
   '      A.IDTIPOCONTREMPTMO '                                                                          + #13 +
   '   ) AMORT_CR, '                                                                                        + #13 +
   '-- FIM AMORTIZAÇÃO FINANCEIRO --------------------------------------------------------------------------- '     + #13 +


   '-- AMORTIZAÇÃO FOLHA PATRO ------------------------------------------------------------------------------- '     + #13 +
   '   ( '                                                                                               + #13 +
   '   SELECT '                                                                                          + #13 +
   '      A.IDTIPOCONTREMPTMO, '                                                                         + #13 +
   '      NVL(SUM(CON.HMEVLRPREVISTO), 0) AS AMORTIZACAO_FP, '                                              + #13 +
   '      NVL(COUNT(CON.IDCONTRATOEMPTMO), 0) AS TOTALAMO_FP '                                              + #13 +
   '   FROM '                                                                                            + #13 +
   '      TIPOCONTREMPTMO A, '                                                                           + #13 +
   '      ( '                                                                                            + #13 +
   //Wylliam Leite da Silva SOL 253185 PPM 771995 - Início
   '      SELECT '                                                                     + #13 +
   //Wylliam Leite da Silva SOL 253185 PPM 771995 - Fim
   '         TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO, '                               + #13 +
   '         TC.IDTIPOCONTREMPTMO, HMEVLRPREVISTO '                                                      + #13 +
   '      FROM '                                                                                         + #13 +
   '         HISTMOVEMPTMO HME, CONTRATOEMPTMO C, '                                                      + #13 +
   '         ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC '                                                    + #13 +
   '      WHERE '                                                                                        + #13 +
   '             C.FLGSITUACAO          <> ''C'' '                                                       + #13 +
   '         AND C.IDPATRO              IN (' + molListaPatro.PegaPatro + ') '                           + #13 +
   '         AND C.IDPLANOPREV          IN (' + molListaPlano.PegaPlano + ') '                           + #13;

   // Tipo de Empréstimo
   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   '         AND TC.IDTIPOEMPTMO        = ' + DBcboTipoEmptmo.LookupValue                                + #13;

   // Tipo de Contrato
   if DBcboTipoContr.LookupValue <> '' then sSQL := sSQL +
   '         AND TC.IDTIPOCONTREMPTMO   = ' + DBcboTipoContr.LookupValue                              + #13;

   // Contrato
   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '         AND C.IDCONTRATOEMPTMO     = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)                     + #13;

   sSQL := sSQL +
   '         AND HME.HMETIPOMOV         = 2 '                                                            + #13 +
   '         AND HME.HMESEQCOBRANCA     = 1 '                                                            + #13 +
   '         AND HME.HMEFORMACOBRANCA   = ''F'' '                                                            + #13 +
   '         AND HME.HMETIPOFOLHA       = ''P'' '                                                            + #13 +
   '         AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) ) '                               + #13 +
   '         AND ( (HME.FLGESTORNADO    IS NULL) OR (HME.FLGESTORNADO = 0) ) '                           + #13 +

   '         AND HME.HMEDATAPREVISTA    BETWEEN TO_DATE(' + sDataIni + ', ''DD/MM/YYYY'') AND TO_DATE(' + sDataAtu + ', ''DD/MM/YYYY'') ' +

   '         AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO '                                           + #13 +
   '         AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO '                                         + #13 +
   '         AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO '                                        + #13 +
   '         AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO '                                             + #13 +
   '      ) CON '                                                                                        + #13 +
   '   WHERE '                                                                                           + #13 +
   '      A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO(+) '                                               + #13 +
   '   GROUP BY '                                                                                        + #13 +
   '      A.IDTIPOCONTREMPTMO '                                                                          + #13 +
   '   ) AMORT_FP, '                                                                                        + #13 +
   '-- FIM AMORTIZAÇÃO FOLHA PATRO --------------------------------------------------------------------------- '     + #13 +

   '-- AMORTIZAÇÃO FOLHA BENEF ------------------------------------------------------------------------------- '     + #13 +
   '   ( '                                                                                               + #13 +
   '   SELECT '                                                                                          + #13 +
   '      A.IDTIPOCONTREMPTMO, '                                                                         + #13 +
   '      NVL(SUM(CON.HMEVLRPREVISTO), 0) AS AMORTIZACAO_FB, '                                              + #13 +
   '      NVL(COUNT(CON.IDCONTRATOEMPTMO), 0) AS TOTALAMO_FB '                                              + #13 +
   '   FROM '                                                                                            + #13 +
   '      TIPOCONTREMPTMO A, '                                                                           + #13 +
   '      ( '                                                                                            + #13 +
   //Wylliam Leite da Silva SOL 253185 PPM 771995 - Início
   '      SELECT '                                                                     + #13 +
   //Wylliam Leite da Silva SOL 253185 PPM 771995 - Fim
   '         TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO, '                               + #13 +
   '         TC.IDTIPOCONTREMPTMO, HMEVLRPREVISTO '                                                      + #13 +
   '      FROM '                                                                                         + #13 +
   '         HISTMOVEMPTMO HME, CONTRATOEMPTMO C, '                                                      + #13 +
   '         ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC '                                                    + #13 +
   '      WHERE '                                                                                        + #13 +
   '             C.FLGSITUACAO          <> ''C'' '                                                       + #13 +
   '         AND C.IDPATRO              IN (' + molListaPatro.PegaPatro + ') '                           + #13 +
   '         AND C.IDPLANOPREV          IN (' + molListaPlano.PegaPlano + ') '                           + #13;

   // Tipo de Empréstimo
   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   '         AND TC.IDTIPOEMPTMO        = ' + DBcboTipoEmptmo.LookupValue                                + #13;

   // Tipo de Contrato
   if DBcboTipoContr.LookupValue <> '' then sSQL := sSQL +
   '         AND TC.IDTIPOCONTREMPTMO   = ' + DBcboTipoContr.LookupValue                              + #13;

   // Contrato
   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '         AND C.IDCONTRATOEMPTMO     = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)                     + #13;

   sSQL := sSQL +
   '         AND HME.HMETIPOMOV         = 2 '                                                            + #13 +
   '         AND HME.HMESEQCOBRANCA     = 1 '                                                            + #13 +
   '         AND HME.HMEFORMACOBRANCA   = ''F'' '                                                            + #13 +
   '         AND HME.HMETIPOFOLHA       = ''B'' '                                                            + #13 +
   '         AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) ) '                               + #13 +

   '         AND NVL(HME.FLGESTORNADO, 0) = 0 '                                                          + #13 +

   '         AND HME.HMEDATAPREVISTA    BETWEEN TO_DATE(' + sDataIni + ', ''DD/MM/YYYY'') AND TO_DATE(' + sDataAtu + ', ''DD/MM/YYYY'') ' +

   '         AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO '                                           + #13 +
   '         AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO '                                         + #13 +
   '         AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO '                                        + #13 +
   '         AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO '                                             + #13 +
   '      ) CON '                                                                                        + #13 +
   '   WHERE '                                                                                           + #13 +
   '      A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO(+) '                                               + #13 +
   '   GROUP BY '                                                                                        + #13 +
   '      A.IDTIPOCONTREMPTMO '                                                                          + #13 +
   '   ) AMORT_FB, '                                                                                        + #13 +
   '-- FIM AMORTIZAÇÃO FOLHA BENEF --------------------------------------------------------------------------- '     + #13 +


   '-- QUITAÇÃO FINANCEIRO ---------------------------------------------------------------------------------- '     + #13 +
   '   ( '                                                                                               + #13 +
   '   SELECT '                                                                                          + #13 +
   '      A.IDTIPOCONTREMPTMO, NVL(SUM(CON.HMEVLRPREVISTO), 0) AS QUITACAO_CR, '                            + #13 +
   '      NVL(COUNT(CON.IDCONTRATOEMPTMO), 0) AS TOTALQUI_CR '                                              + #13 +
   '   FROM '                                                                                            + #13 +
   '      TIPOCONTREMPTMO A, '                                                                           + #13 +
   '      ( '                                                                                            + #13 +
   //Wylliam Leite da Silva SOL 253185 PPM 771995 - Início
   '      SELECT '                                                                     + #13 +
   //Wylliam Leite da Silva SOL 253185 PPM 771995 - Fim
   '         TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO, '                               + #13 +
   '         TC.IDTIPOCONTREMPTMO, HME.HMEVLRPREVISTO '                                                  + #13 +
   '      FROM '                                                                                         + #13 +
   '         HISTMOVEMPTMO HME, CONTRATOEMPTMO C, '                                                      + #13 +
   '         ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC '                                                    + #13 +
   '      WHERE '                                                                                        + #13 +
   '             C.FLGSITUACAO          <> ''C'' '                                                       + #13 +
   '         AND C.IDPATRO              IN (' + molListaPatro.PegaPatro + ') '                           + #13 +
   '         AND C.IDPLANOPREV          IN (' + molListaPlano.PegaPlano + ') '                           + #13;

   // Tipo de Empréstimo
   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   '         AND TC.IDTIPOEMPTMO        = ' + DBcboTipoEmptmo.LookupValue                                + #13;

   // Tipo de Contrato
   if DBcboTipoContr.LookupValue <> '' then sSQL := sSQL +
   '         AND TC.IDTIPOCONTREMPTMO   = ' + DBcboTipoContr.LookupValue                              + #13;

   // Contrato
   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '         AND C.IDCONTRATOEMPTMO     = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)                     + #13;

   if chkRenovacao.Checked then sSQL := sSQL +
   '         AND HME.HMEORIGEM         <> 0 '                                                            + #13;

   sSQL := sSQL +
   '         AND HME.HMETIPOMOV         = 3 '                                                            + #13 +
   '         AND HME.HMESEQCOBRANCA     = 1 '                                                            + #13 +
   '         AND HME.HMEFORMACOBRANCA   = ''C'' '                                                            + #13 +
   '         AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) ) '                               + #13 +
   '         AND NVL(HME.FLGESTORNADO, 0) = 0 '                                                          + #13 +

   '         AND HME.HMEDATAPREVISTA    BETWEEN TO_DATE(' + sDataIni + ', ''DD/MM/YYYY'') AND TO_DATE(' + sDataAtu + ', ''DD/MM/YYYY'') ' +

   '         AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO '                                           + #13 +
   '         AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO '                                         + #13 +
   '         AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO '                                        + #13 +
   '         AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO '                                             + #13 +
   '      ) CON '                                                                                        + #13 +
   '   WHERE '                                                                                           + #13 +
   '      A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO(+) '                                               + #13 +
   '   GROUP BY '                                                                                        + #13 +
   '      A.IDTIPOCONTREMPTMO '                                                                          + #13 +
   '   ) QUITACAO_CR, '                                                                                     + #13 +
   '-- FIM QUITAÇÃO FINANCEIRO ------------------------------------------------------------------------------ '     + #13 +


   '-- QUITAÇÂO FOLHA PATRO ---------------------------------------------------------------------------------- '     + #13 +
   '   ( '                                                                                               + #13 +
   '   SELECT '                                                                                          + #13 +
   '      A.IDTIPOCONTREMPTMO, NVL(SUM(CON.HMEVLRPREVISTO), 0) AS QUITACAO_FP, '                            + #13 +
   '      NVL(COUNT(CON.IDCONTRATOEMPTMO), 0) AS TOTALQUI_FP '                                              + #13 +
   '   FROM '                                                                                            + #13 +
   '      TIPOCONTREMPTMO A, '                                                                           + #13 +
   '      ( '                                                                                            + #13 +
   //Wylliam Leite da Silva SOL 253185 PPM 771995 - Início
   '      SELECT '                                                                     + #13 +
   //Wylliam Leite da Silva SOL 253185 PPM 771995 - Fim
   '         TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO, '                               + #13 +
   '         TC.IDTIPOCONTREMPTMO, HME.HMEVLRPREVISTO '                                                  + #13 +
   '      FROM '                                                                                         + #13 +
   '         HISTMOVEMPTMO HME, CONTRATOEMPTMO C, '                                                      + #13 +
   '         ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC '                                                    + #13 +
   '      WHERE '                                                                                        + #13 +
   '             C.FLGSITUACAO          <> ''C'' '                                                       + #13 +
   '         AND C.IDPATRO              IN (' + molListaPatro.PegaPatro + ') '                           + #13 +
   '         AND C.IDPLANOPREV          IN (' + molListaPlano.PegaPlano + ') '                           + #13;

   // Tipo de Empréstimo
   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   '         AND TC.IDTIPOEMPTMO        = ' + DBcboTipoEmptmo.LookupValue                                + #13;

   // Tipo de Contrato
   if DBcboTipoContr.LookupValue <> '' then sSQL := sSQL +
   '         AND TC.IDTIPOCONTREMPTMO   = ' + DBcboTipoContr.LookupValue                              + #13;

   // Contrato
   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '         AND C.IDCONTRATOEMPTMO     = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)                     + #13;

   if chkRenovacao.Checked then sSQL := sSQL +
   '         AND HME.HMEORIGEM         <> 0 '                                                            + #13;

   sSQL := sSQL +
   '         AND HME.HMETIPOMOV         = 3 '                                                            + #13 +
   '         AND HME.HMESEQCOBRANCA     = 1 '                                                            + #13 +
   '         AND HME.HMEFORMACOBRANCA   = ''F'' '                                                            + #13 +
   '         AND HME.HMETIPOFOLHA       = ''P'' '                                                            + #13 +
   '         AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) ) '                               + #13 +
   '         AND NVL(HME.FLGESTORNADO, 0) = 0 '                                                          + #13 +

   '         AND HME.HMEDATAPREVISTA    BETWEEN TO_DATE(' + sDataIni + ', ''DD/MM/YYYY'') AND TO_DATE(' + sDataAtu + ', ''DD/MM/YYYY'') ' +

   '         AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO '                                           + #13 +
   '         AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO '                                         + #13 +
   '         AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO '                                        + #13 +
   '         AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO '                                             + #13 +
   '      ) CON '                                                                                        + #13 +
   '   WHERE '                                                                                           + #13 +
   '      A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO(+) '                                               + #13 +
   '   GROUP BY '                                                                                        + #13 +
   '      A.IDTIPOCONTREMPTMO '                                                                          + #13 +
   '   ) QUITACAO_FP, '                                                                                     + #13 +
   '-- FIM QUITAÇÃO FOLHA PATRO ------------------------------------------------------------------------------ '     + #13 +

   '-- QUITAÇÂO FOLHA BENEF ---------------------------------------------------------------------------------- '     + #13 +
   '   ( '                                                                                               + #13 +
   '   SELECT '                                                                                          + #13 +
   '      A.IDTIPOCONTREMPTMO, NVL(SUM(CON.HMEVLRPREVISTO), 0) AS QUITACAO_FB, '                            + #13 +
   '      NVL(COUNT(CON.IDCONTRATOEMPTMO), 0) AS TOTALQUI_FB '                                              + #13 +
   '   FROM '                                                                                            + #13 +
   '      TIPOCONTREMPTMO A, '                                                                           + #13 +
   '      ( '                                                                                            + #13 +
   //Wylliam Leite da Silva SOL 253185 PPM 771995 - Início
   '      SELECT '                                                                     + #13 +
   //Wylliam Leite da Silva SOL 253185 PPM 771995 - Fim
   '         TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO, '                               + #13 +
   '         TC.IDTIPOCONTREMPTMO, HME.HMEVLRPREVISTO '                                                  + #13 +
   '      FROM '                                                                                         + #13 +
   '         HISTMOVEMPTMO HME, CONTRATOEMPTMO C, '                                                      + #13 +
   '         ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC '                                                    + #13 +
   '      WHERE '                                                                                        + #13 +
   '             C.FLGSITUACAO          <> ''C'' '                                                       + #13 +
   '         AND C.IDPATRO              IN (' + molListaPatro.PegaPatro + ') '                           + #13 +
   '         AND C.IDPLANOPREV          IN (' + molListaPlano.PegaPlano + ') '                           + #13;

   // Tipo de Empréstimo
   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   '         AND TC.IDTIPOEMPTMO        = ' + DBcboTipoEmptmo.LookupValue                                + #13;

   // Tipo de Contrato
   if DBcboTipoContr.LookupValue <> '' then sSQL := sSQL +
   '         AND TC.IDTIPOCONTREMPTMO   = ' + DBcboTipoContr.LookupValue                              + #13;

   // Contrato
   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '         AND C.IDCONTRATOEMPTMO     = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)                     + #13;

   if chkRenovacao.Checked then sSQL := sSQL +
   '         AND HME.HMEORIGEM         <> 0 '                                                            + #13;

   sSQL := sSQL +
   '         AND HME.HMETIPOMOV         = 3 '                                                            + #13 +
   '         AND HME.HMESEQCOBRANCA     = 1 '                                                            + #13 +
   '         AND HME.HMEFORMACOBRANCA   = ''F'' '                                                            + #13 +
   '         AND HME.HMETIPOFOLHA       = ''B'' '                                                            + #13 +
   '         AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) ) '                               + #13 +
   '         AND NVL(HME.FLGESTORNADO, 0) = 0 '                                                          + #13 +

   '         AND HME.HMEDATAPREVISTA    BETWEEN TO_DATE(' + sDataIni + ', ''DD/MM/YYYY'') AND TO_DATE(' + sDataAtu + ', ''DD/MM/YYYY'') ' +

   '         AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO '                                           + #13 +
   '         AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO '                                         + #13 +
   '         AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO '                                        + #13 +
   '         AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO '                                             + #13 +
   '      ) CON '                                                                                        + #13 +
   '   WHERE '                                                                                           + #13 +
   '      A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO(+) '                                               + #13 +
   '   GROUP BY '                                                                                        + #13 +
   '      A.IDTIPOCONTREMPTMO '                                                                          + #13 +
   '   ) QUITACAO_FB, '                                                                                     + #13 +
   '-- FIM QUITAÇÃO FOLHA BENEF ------------------------------------------------------------------------------ '     + #13 +

//******************************************************************************************************
// Fim de cobranças Geradas
//******************************************************************************************************

   '-- PARCELAS RECEBIDAS FINANCEIRO ------------------------------------------------------------- '     + #13 +
   '   ( '                                                                                               + #13 +
   '   SELECT '                                                                                          + #13 +
   '      A.IDTIPOCONTREMPTMO, NVL(SUM(CON.HMEVLREFETIVO), 0) AS REC_PARC, '                             + #13 +
   '      NVL(COUNT(CON.IDCONTRATOEMPTMO),0) AS TOT_REC_PARC '                                           + #13 +
   '   FROM '                                                                                            + #13 +
   '      TIPOCONTREMPTMO A, '                                                                           + #13 +
   '      ( '                                                                                            + #13 +
   '      SELECT '                                                                                       + #13 +
   '         TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO, '                               + #13 +
   '         TC.IDTIPOCONTREMPTMO, '                                                                     + #13 +

   '         NVL(HME.HMEVLREFETIVO,0) AS HMEVLREFETIVO'                                                 + #13 +

   '      FROM '                                                                                         + #13 +
   '         HISTMOVEMPTMO HME, CONTRATOEMPTMO C, '                                                      + #13 +
   '         ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC '                                                    + #13 +
   '      WHERE '                                                                                        + #13 +
   '             C.FLGSITUACAO          <> ''C'' '                                                       + #13 +
   '         AND C.IDPATRO              IN (' + molListaPatro.PegaPatro + ') '                           + #13 +
   '         AND C.IDPLANOPREV          IN (' + molListaPlano.PegaPlano + ') '                           + #13;

   // Tipo de Empréstimo
   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   '         AND TC.IDTIPOEMPTMO        = ' + DBcboTipoEmptmo.LookupValue                                + #13;

   // Tipo de Contrato
   if DBcboTipoContr.LookupValue <> '' then sSQL := sSQL +
   '         AND TC.IDTIPOCONTREMPTMO   = ' + DBcboTipoContr.LookupValue                              + #13;

   // Contrato
   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '         AND C.IDCONTRATOEMPTMO     = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)                     + #13;

   sSQL := sSQL +
   '         AND HME.HMETIPOMOV         = 1 '                                                            + #13 +
   '         AND HME.FLGBAIXADO         IS NULL '                                                            + #13 +
   '         AND HME.HMEFORMACOBRANCA   = ''C'' '                                                        + #13 +
   '         AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) ) '                               + #13 +
   '         AND NVL(HME.FLGESTORNADO, 0) = 0 '                                                          + #13 +

   '         AND HME.HMEDATAEFETIVA BETWEEN TO_DATE(' + sDataIni + ', ''DD/MM/YYYY'') AND TO_DATE(' + sDataAtu + ', ''DD/MM/YYYY'') '                                     + #13 +

   '         AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO '                                           + #13 +
   '         AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO '                                         + #13 +
   '         AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO '                                        + #13 +
   '         AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO '                                             + #13 +
   '      ) CON '                                                                                        + #13 +
   '   WHERE '                                                                                           + #13 +
   '      A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO(+) '                                               + #13 +
   '   GROUP BY '                                                                                        + #13 +
   '      A.IDTIPOCONTREMPTMO '                                                                          + #13 +
   '   ) REC_PARC_CR, '                                                                                  + #13 +
   '-- FIM PARCELAS RECEBIDAS FINANCEIRO --------------------------------------------------------- '     + #13 +


   '-- PARCELAS RECEBIDAS FOLHA PATRO ------------------------------------------------------------ '     + #13 +
   '   ( '                                                                                               + #13 +
   '   SELECT '                                                                                          + #13 +
   '      A.IDTIPOCONTREMPTMO, NVL(SUM(CON.HMEVLREFETIVO), 0) AS REC_PARC, '                             + #13 +
   '      NVL(COUNT(CON.IDCONTRATOEMPTMO),0) AS TOT_REC_PARC '                                           + #13 +
   '   FROM '                                                                                            + #13 +
   '      TIPOCONTREMPTMO A, '                                                                           + #13 +
   '      ( '                                                                                            + #13 +
   '      SELECT '                                                                                       + #13 +
   '         TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO, '                               + #13 +
   '         TC.IDTIPOCONTREMPTMO, '                                                                     + #13 +

   '         NVL(HME.HMEVLREFETIVO, 0) AS HMEVLREFETIVO'                                                 + #13 +

   '      FROM '                                                                                         + #13 +
   '         HISTMOVEMPTMO HME, CONTRATOEMPTMO C, '                                                      + #13 +
   '         ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC '                                                    + #13 +
   '      WHERE '                                                                                        + #13 +
   '             C.FLGSITUACAO          <> ''C'' '                                                       + #13 +
   '         AND C.IDPATRO              IN (' + molListaPatro.PegaPatro + ') '                           + #13 +
   '         AND C.IDPLANOPREV          IN (' + molListaPlano.PegaPlano + ') '                           + #13;

   // Tipo de Empréstimo
   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   '         AND TC.IDTIPOEMPTMO        = ' + DBcboTipoEmptmo.LookupValue                                + #13;

   // Tipo de Contrato
   if DBcboTipoContr.LookupValue <> '' then sSQL := sSQL +
   '         AND TC.IDTIPOCONTREMPTMO   = ' + DBcboTipoContr.LookupValue                              + #13;

   // Contrato
   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '         AND C.IDCONTRATOEMPTMO     = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)                     + #13;

   sSQL := sSQL +
   '         AND HME.HMETIPOMOV         = 1 '                                                            + #13 +
   '         AND HME.FLGBAIXADO         IS NULL '                                                            + #13 +
   '         AND HME.HMEFORMACOBRANCA   = ''F'' '                                                        + #13 +
   '         AND HME.HMETIPOFOLHA       = ''P'' '                                                        + #13 +
   '         AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) ) '                               + #13 +
   '         AND NVL(HME.FLGESTORNADO, 0) = 0 '                                                          + #13 +

   '         AND HME.HMEDATAEFETIVA BETWEEN TO_DATE(' + sDataIni + ', ''DD/MM/YYYY'') AND TO_DATE(' + sDataAtu + ', ''DD/MM/YYYY'') '                                     + #13 +

   '         AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO '                                           + #13 +
   '         AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO '                                         + #13 +
   '         AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO '                                        + #13 +
   '         AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO '                                             + #13 +
   '      ) CON '                                                                                        + #13 +
   '   WHERE '                                                                                           + #13 +
   '      A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO(+) '                                               + #13 +
   '   GROUP BY '                                                                                        + #13 +
   '      A.IDTIPOCONTREMPTMO '                                                                          + #13 +
   '   ) REC_PARC_FP, '                                                                                  + #13 +
   '-- FIM PARCELAS RECEBIDAS FOLHA PATRO -------------------------------------------------------- '     + #13 +

   '-- PARCELAS RECEBIDAS FOLHA BENEF ------------------------------------------------------------ '     + #13 +
   '   ( '                                                                                               + #13 +
   '   SELECT '                                                                                          + #13 +
   '      A.IDTIPOCONTREMPTMO, NVL(SUM(CON.HMEVLREFETIVO), 0) AS REC_PARC, '                             + #13 +
   '      NVL(COUNT(CON.IDCONTRATOEMPTMO),0) AS TOT_REC_PARC '                                           + #13 +
   '   FROM '                                                                                            + #13 +
   '      TIPOCONTREMPTMO A, '                                                                           + #13 +
   '      ( '                                                                                            + #13 +
   '      SELECT '                                                                                       + #13 +
   '         TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO, '                               + #13 +
   '         TC.IDTIPOCONTREMPTMO, '                                                                     + #13 +

   '         NVL(HME.HMEVLREFETIVO, 0) AS HMEVLREFETIVO'                                                 + #13 +

   '      FROM '                                                                                         + #13 +
   '         HISTMOVEMPTMO HME, CONTRATOEMPTMO C, '                                                      + #13 +
   '         ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC '                                                    + #13 +
   '      WHERE '                                                                                        + #13 +
   '             C.FLGSITUACAO          <> ''C'' '                                                       + #13 +
   '         AND C.IDPATRO              IN (' + molListaPatro.PegaPatro + ') '                           + #13 +
   '         AND C.IDPLANOPREV          IN (' + molListaPlano.PegaPlano + ') '                           + #13;

   // Tipo de Empréstimo
   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   '         AND TC.IDTIPOEMPTMO        = ' + DBcboTipoEmptmo.LookupValue                                + #13;

   // Tipo de Contrato
   if DBcboTipoContr.LookupValue <> '' then sSQL := sSQL +
   '         AND TC.IDTIPOCONTREMPTMO   = ' + DBcboTipoContr.LookupValue                              + #13;

   // Contrato
   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '         AND C.IDCONTRATOEMPTMO     = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)                     + #13;

   sSQL := sSQL +
   '         AND HME.HMETIPOMOV         = 1 '                                                            + #13 +
   '         AND HME.FLGBAIXADO         IS NULL '                                                            + #13 +
   '         AND HME.HMEFORMACOBRANCA   = ''F'' '                                                        + #13 +
   '         AND HME.HMETIPOFOLHA       = ''B'' '                                                        + #13 +
   '         AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) ) '                               + #13 +
   '         AND ( (HME.FLGESTORNADO    IS NULL) OR (HME.FLGESTORNADO = 0) ) '                           + #13 +

   '         AND HME.HMEDATAEFETIVA BETWEEN TO_DATE(' + sDataIni + ', ''DD/MM/YYYY'') AND TO_DATE(' + sDataAtu + ', ''DD/MM/YYYY'') '                                     + #13 +

   '         AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO '                                           + #13 +
   '         AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO '                                         + #13 +
   '         AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO '                                        + #13 +
   '         AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO '                                             + #13 +
   '      ) CON '                                                                                        + #13 +
   '   WHERE '                                                                                           + #13 +
   '      A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO(+) '                                               + #13 +
   '   GROUP BY '                                                                                        + #13 +
   '      A.IDTIPOCONTREMPTMO '                                                                          + #13 +
   '   ) REC_PARC_FB, '                                                                                  + #13 +
   '-- FIM PARCELAS RECEBIDAS FOLHA BENEF -------------------------------------------------------- '     + #13 +



   '-- ENCARGOS DO MÊS RECEBIDOS CR ----------------------------------------------------------------- '     + #13 +
   '   ( '                                                                                               + #13 +
   '   SELECT '                                                                                          + #13 +
   '      A.IDTIPOCONTREMPTMO, NVL(SUM(CON.HMEVLREFETIVO), 0) AS REC_ENC, '                              + #13 +
   '      NVL(COUNT(CON.IDCONTRATOEMPTMO),0) AS TOT_REC_ENC '                                            + #13 +
   '   FROM '                                                                                            + #13 +
   '      TIPOCONTREMPTMO A, '                                                                           + #13 +
   '      ( '                                                                                            + #13 +
   '      SELECT '                                                                                       + #13 +
   '         TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO, '                               + #13 +
   '         TC.IDTIPOCONTREMPTMO, '                                                                     + #13 +

   '         NVL(HME.HMEVLREFETIVO, 0) AS HMEVLREFETIVO'                                                 + #13 +

   '      FROM '                                                                                         + #13 +
   '         HISTMOVEMPTMO HME, CONTRATOEMPTMO C, '                                                      + #13 +
   '         ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC '                                                    + #13 +
   '      WHERE '                                                                                        + #13 +
   '             C.FLGSITUACAO          <> ''C'' '                                                       + #13 +
   '         AND C.IDPATRO              IN (' + molListaPatro.PegaPatro + ') '                           + #13 +
   '         AND C.IDPLANOPREV          IN (' + molListaPlano.PegaPlano + ') '                           + #13;

   // Tipo de Empréstimo
   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   '         AND TC.IDTIPOEMPTMO        = ' + DBcboTipoEmptmo.LookupValue                                + #13;

   // Tipo de Contrato
   if DBcboTipoContr.LookupValue <> '' then sSQL := sSQL +
   '         AND TC.IDTIPOCONTREMPTMO   = ' + DBcboTipoContr.LookupValue                              + #13;

   // Contrato
   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '         AND C.IDCONTRATOEMPTMO     = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)                     + #13;

   sSQL := sSQL +
   '         AND HME.HMETIPOMOV         = 4 '                                                            + #13 +
   '         AND HME.FLGBAIXADO         IS NULL '                                                            + #13 +
   '         AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) ) '                               + #13 +
   '         AND NVL(HME.FLGESTORNADO, 0) = 0 '                                                          + #13 +
   '         AND HME.HMEFORMACOBRANCA   = ''C'' '                                                            + #13 +

   '         AND HME.HMEDATAEFETIVA BETWEEN TO_DATE(' + sDataIni + ', ''DD/MM/YYYY'') AND TO_DATE(' + sDataAtu + ', ''DD/MM/YYYY'') '                                     + #13 +

   '         AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO '                                           + #13 +
   '         AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO '                                         + #13 +
   '         AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO '                                        + #13 +
   '         AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO '                                             + #13 +
   '      ) CON '                                                                                        + #13 +
   '   WHERE '                                                                                           + #13 +
   '      A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO(+) '                                               + #13 +
   '   GROUP BY '                                                                                        + #13 +
   '      A.IDTIPOCONTREMPTMO '                                                                          + #13 +
   '   ) REC_ENC_CR, '                                                                                      + #13 +
   '-- FIM ENCARGOS DO MÊS RECEBIDOS CR ------------------------------------------------------------- '     + #13 +


   '-- ENCARGOS DO MÊS RECEBIDOS FP ----------------------------------------------------------------- '     + #13 +
   '   ( '                                                                                               + #13 +
   '   SELECT '                                                                                          + #13 +
   '      A.IDTIPOCONTREMPTMO, NVL(SUM(CON.HMEVLREFETIVO), 0) AS REC_ENC, '                              + #13 +
   '      NVL(COUNT(CON.IDCONTRATOEMPTMO),0) AS TOT_REC_ENC '                                            + #13 +
   '   FROM '                                                                                            + #13 +
   '      TIPOCONTREMPTMO A, '                                                                           + #13 +
   '      ( '                                                                                            + #13 +
   '      SELECT '                                                                                       + #13 +
   '         TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO, '                               + #13 +
   '         TC.IDTIPOCONTREMPTMO, '                                                                     + #13 +

   '         NVL(HME.HMEVLREFETIVO, 0) AS HMEVLREFETIVO'                                                 + #13 +

   '      FROM '                                                                                         + #13 +
   '         HISTMOVEMPTMO HME, CONTRATOEMPTMO C, '                                                      + #13 +
   '         ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC '                                                    + #13 +
   '      WHERE '                                                                                        + #13 +
   '             C.FLGSITUACAO          <> ''C'' '                                                       + #13 +
   '         AND C.IDPATRO              IN (' + molListaPatro.PegaPatro + ') '                           + #13 +
   '         AND C.IDPLANOPREV          IN (' + molListaPlano.PegaPlano + ') '                           + #13;

   // Tipo de Empréstimo
   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   '         AND TC.IDTIPOEMPTMO        = ' + DBcboTipoEmptmo.LookupValue                                + #13;

   // Tipo de Contrato
   if DBcboTipoContr.LookupValue <> '' then sSQL := sSQL +
   '         AND TC.IDTIPOCONTREMPTMO   = ' + DBcboTipoContr.LookupValue                              + #13;

   // Contrato
   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '         AND C.IDCONTRATOEMPTMO     = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)                     + #13;

   sSQL := sSQL +
   '         AND HME.HMETIPOMOV         = 4 '                                                            + #13 +
   '         AND HME.FLGBAIXADO         IS NULL '                                                            + #13 +
   '         AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) ) '                               + #13 +
   '         AND NVL(HME.FLGESTORNADO, 0) = 0 '                                                          + #13 +
   '         AND HME.HMEFORMACOBRANCA   = ''F'' '                                                            + #13 +
   '         AND HME.HMETIPOFOLHA       = ''P'' '                                                            + #13 +

   '         AND HME.HMEDATAEFETIVA BETWEEN TO_DATE(' + sDataIni + ', ''DD/MM/YYYY'') AND TO_DATE(' + sDataAtu + ', ''DD/MM/YYYY'') '                                     + #13 +

   '         AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO '                                           + #13 +
   '         AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO '                                         + #13 +
   '         AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO '                                        + #13 +
   '         AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO '                                             + #13 +
   '      ) CON '                                                                                        + #13 +
   '   WHERE '                                                                                           + #13 +
   '      A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO(+) '                                               + #13 +
   '   GROUP BY '                                                                                        + #13 +
   '      A.IDTIPOCONTREMPTMO '                                                                          + #13 +
   '   ) REC_ENC_FP, '                                                                                      + #13 +
   '-- FIM ENCARGOS DO MÊS RECEBIDOS FP ------------------------------------------------------------- '     + #13 +


   '-- ENCARGOS DO MÊS RECEBIDOS FB ----------------------------------------------------------------- '     + #13 +
   '   ( '                                                                                               + #13 +
   '   SELECT '                                                                                          + #13 +
   '      A.IDTIPOCONTREMPTMO, NVL(SUM(CON.HMEVLREFETIVO), 0) AS REC_ENC, '                              + #13 +
   '      NVL(COUNT(CON.IDCONTRATOEMPTMO),0) AS TOT_REC_ENC '                                            + #13 +
   '   FROM '                                                                                            + #13 +
   '      TIPOCONTREMPTMO A, '                                                                           + #13 +
   '      ( '                                                                                            + #13 +
   '      SELECT '                                                                                       + #13 +
   '         TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO, '                               + #13 +
   '         TC.IDTIPOCONTREMPTMO, '                                                                     + #13 +

   '         NVL(HME.HMEVLREFETIVO, 0) AS HMEVLREFETIVO'                                                 + #13 +

   '      FROM '                                                                                         + #13 +
   '         HISTMOVEMPTMO HME, CONTRATOEMPTMO C, '                                                      + #13 +
   '         ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC '                                                    + #13 +
   '      WHERE '                                                                                        + #13 +
   '             C.FLGSITUACAO          <> ''C'' '                                                       + #13 +
   '         AND C.IDPATRO              IN (' + molListaPatro.PegaPatro + ') '                           + #13 +
   '         AND C.IDPLANOPREV          IN (' + molListaPlano.PegaPlano + ') '                           + #13;

   // Tipo de Empréstimo
   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   '         AND TC.IDTIPOEMPTMO        = ' + DBcboTipoEmptmo.LookupValue                                + #13;

   // Tipo de Contrato
   if DBcboTipoContr.LookupValue <> '' then sSQL := sSQL +
   '         AND TC.IDTIPOCONTREMPTMO   = ' + DBcboTipoContr.LookupValue                              + #13;

   // Contrato
   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '         AND C.IDCONTRATOEMPTMO     = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)                     + #13;

   sSQL := sSQL +
   '         AND HME.HMETIPOMOV         = 4 '                                                            + #13 +
   '         AND HME.FLGBAIXADO         IS NULL '                                                            + #13 +
   '         AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) ) '                               + #13 +
   '         AND NVL(HME.FLGESTORNADO, 0) = 0 '                                                          + #13 +
   '         AND HME.HMEFORMACOBRANCA   = ''F'' '                                                            + #13 +
   '         AND HME.HMETIPOFOLHA       = ''B'' '                                                            + #13 +

   '         AND HME.HMEDATAEFETIVA BETWEEN TO_DATE(' + sDataIni + ', ''DD/MM/YYYY'') AND TO_DATE(' + sDataAtu + ', ''DD/MM/YYYY'') '                                     + #13 +

   '         AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO '                                           + #13 +
   '         AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO '                                         + #13 +
   '         AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO '                                        + #13 +
   '         AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO '                                             + #13 +
   '      ) CON '                                                                                        + #13 +
   '   WHERE '                                                                                           + #13 +
   '      A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO(+) '                                               + #13 +
   '   GROUP BY '                                                                                        + #13 +
   '      A.IDTIPOCONTREMPTMO '                                                                          + #13 +
   '   ) REC_ENC_FB, '                                                                                      + #13 +
   '-- FIM ENCARGOS DO MÊS RECEBIDOS FP ------------------------------------------------------------- '     + #13 +

   '-- AMORTIZAÇÕES RECEBIDAS CR -------------------------------------------------------------------- '     + #13 +
   '   ( '                                                                                               + #13 +
   '   SELECT '                                                                                          + #13 +
   '      A.IDTIPOCONTREMPTMO, NVL(SUM(CON.HMEVLREFETIVO), 0) AS REC_AMORT, '                            + #13 +
   '      NVL(COUNT(CON.IDCONTRATOEMPTMO),0) AS TOT_REC_AMORT '                                          + #13 +
   '   FROM '                                                                                            + #13 +
   '      TIPOCONTREMPTMO A, '                                                                           + #13 +
   '      ( '                                                                                            + #13 +
   '      SELECT '                                                                                       + #13 +
   '         TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO, '                               + #13 +
   '         TC.IDTIPOCONTREMPTMO, '                                                                     + #13 +

   '         NVL(HME.HMEVLREFETIVO, 0) AS HMEVLREFETIVO'                                                 + #13 +

   '      FROM '                                                                                         + #13 +
   '         HISTMOVEMPTMO HME, CONTRATOEMPTMO C, '                                                      + #13 +
   '         ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC '                                                    + #13 +
   '      WHERE '                                                                                        + #13 +
   '             C.FLGSITUACAO          <> ''C'' '                                                       + #13 +
   '         AND C.IDPATRO              IN (' + molListaPatro.PegaPatro + ') '                           + #13 +
   '         AND C.IDPLANOPREV          IN (' + molListaPlano.PegaPlano + ') '                           + #13;

   // Tipo de Empréstimo
   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   '         AND TC.IDTIPOEMPTMO        = ' + DBcboTipoEmptmo.LookupValue                                + #13;

   // Tipo de Contrato
   if DBcboTipoContr.LookupValue <> '' then sSQL := sSQL +
   '         AND TC.IDTIPOCONTREMPTMO   = ' + DBcboTipoContr.LookupValue                              + #13;

   // Contrato
   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '         AND C.IDCONTRATOEMPTMO     = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)                     + #13;

   sSQL := sSQL +
   '         AND HME.HMETIPOMOV         = 2 '                                                            + #13 +
   '         AND HME.FLGBAIXADO         IS NULL '                                                            + #13 +
   '         AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) ) '                               + #13 +
   '         AND HME.HMEFORMACOBRANCA   = ''C'' '                                                            + #13 +

   '         AND NVL(HME.FLGESTORNADO, 0) = 0 '                                                          + #13 +
   '         AND HME.HMEDATAEFETIVA BETWEEN TO_DATE(' + sDataIni + ', ''DD/MM/YYYY'') AND TO_DATE(' + sDataAtu + ', ''DD/MM/YYYY'') '                                     + #13 +

   '         AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO '                                           + #13 +
   '         AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO '                                         + #13 +
   '         AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO '                                        + #13 +
   '         AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO '                                             + #13 +
   '      ) CON '                                                                                        + #13 +
   '   WHERE '                                                                                           + #13 +
   '      A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO(+) '                                               + #13 +
   '   GROUP BY '                                                                                        + #13 +
   '      A.IDTIPOCONTREMPTMO '                                                                          + #13 +
   '   ) REC_AMORT_CR, '                                                                                    + #13 +
   '-- FIM AMORTIZAÇÕES RECEBIDAS CR ---------------------------------------------------------------- '     + #13 +

   '-- AMORTIZAÇÕES RECEBIDAS FP -------------------------------------------------------------------- '     + #13 +
   '   ( '                                                                                               + #13 +
   '   SELECT '                                                                                          + #13 +
   '      A.IDTIPOCONTREMPTMO, NVL(SUM(CON.HMEVLREFETIVO), 0) AS REC_AMORT, '                            + #13 +
   '      NVL(COUNT(CON.IDCONTRATOEMPTMO),0) AS TOT_REC_AMORT '                                          + #13 +
   '   FROM '                                                                                            + #13 +
   '      TIPOCONTREMPTMO A, '                                                                           + #13 +
   '      ( '                                                                                            + #13 +
   '      SELECT '                                                                                       + #13 +
   '         TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO, '                               + #13 +
   '         TC.IDTIPOCONTREMPTMO, '                                                                     + #13 +

   '         NVL(HME.HMEVLREFETIVO, 0) AS HMEVLREFETIVO'   + #13 +

   '      FROM '                                                                                         + #13 +
   '         HISTMOVEMPTMO HME, CONTRATOEMPTMO C, '                                                      + #13 +
   '         ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC '                                                    + #13 +
   '      WHERE '                                                                                        + #13 +
   '             C.FLGSITUACAO          <> ''C'' '                                                       + #13 +
   '         AND C.IDPATRO              IN (' + molListaPatro.PegaPatro + ') '                           + #13 +
   '         AND C.IDPLANOPREV          IN (' + molListaPlano.PegaPlano + ') '                           + #13;

   // Tipo de Empréstimo
   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   '         AND TC.IDTIPOEMPTMO        = ' + DBcboTipoEmptmo.LookupValue                                + #13;

   // Tipo de Contrato
   if DBcboTipoContr.LookupValue <> '' then sSQL := sSQL +
   '         AND TC.IDTIPOCONTREMPTMO   = ' + DBcboTipoContr.LookupValue                              + #13;

   // Contrato
   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '         AND C.IDCONTRATOEMPTMO     = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)                     + #13;

   sSQL := sSQL +
   '         AND HME.HMETIPOMOV         = 2 '                                                            + #13 +
   '         AND HME.FLGBAIXADO         IS NULL '                                                            + #13 +
   '         AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) ) '                               + #13 +
   '         AND HME.HMEFORMACOBRANCA   = ''F'' '                                                            + #13 +

   //Pendência 23755 - 17/11/2006 - Alberto
   '         AND HME.HMETIPOFOLHA       = ''P'' '                                                            + #13 +

   '         AND NVL(HME.FLGESTORNADO, 0) = 0 '                                                          + #13 +
   '         AND HME.HMEDATAEFETIVA BETWEEN TO_DATE(' + sDataIni + ', ''DD/MM/YYYY'') AND TO_DATE(' + sDataAtu + ', ''DD/MM/YYYY'') '                                     + #13 +

   '         AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO '                                           + #13 +
   '         AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO '                                         + #13 +
   '         AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO '                                        + #13 +
   '         AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO '                                             + #13 +
   '      ) CON '                                                                                        + #13 +
   '   WHERE '                                                                                           + #13 +
   '      A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO(+) '                                               + #13 +
   '   GROUP BY '                                                                                        + #13 +
   '      A.IDTIPOCONTREMPTMO '                                                                          + #13 +
   '   ) REC_AMORT_FP, '                                                                                    + #13 +
   '-- FIM AMORTIZAÇÕES RECEBIDAS FP ---------------------------------------------------------------- '     + #13 +

   '-- AMORTIZAÇÕES RECEBIDAS FB -------------------------------------------------------------------- '     + #13 +
   '   ( '                                                                                               + #13 +
   '   SELECT '                                                                                          + #13 +
   '      A.IDTIPOCONTREMPTMO, NVL(SUM(CON.HMEVLREFETIVO), 0) AS REC_AMORT, '                            + #13 +
   '      NVL(COUNT(CON.IDCONTRATOEMPTMO),0) AS TOT_REC_AMORT '                                          + #13 +
   '   FROM '                                                                                            + #13 +
   '      TIPOCONTREMPTMO A, '                                                                           + #13 +
   '      ( '                                                                                            + #13 +
   '      SELECT '                                                                                       + #13 +
   '         TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO, '                               + #13 +
   '         TC.IDTIPOCONTREMPTMO, '                                                                     + #13 +

   '         NVL(HME.HMEVLREFETIVO, 0) AS HMEVLREFETIVO'   + #13 +

   '      FROM '                                                                                         + #13 +
   '         HISTMOVEMPTMO HME, CONTRATOEMPTMO C, '                                                      + #13 +
   '         ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC '                                                    + #13 +
   '      WHERE '                                                                                        + #13 +
   '             C.FLGSITUACAO          <> ''C'' '                                                       + #13 +
   '         AND C.IDPATRO              IN (' + molListaPatro.PegaPatro + ') '                           + #13 +
   '         AND C.IDPLANOPREV          IN (' + molListaPlano.PegaPlano + ') '                           + #13;

   // Tipo de Empréstimo
   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   '         AND TC.IDTIPOEMPTMO        = ' + DBcboTipoEmptmo.LookupValue                                + #13;

   // Tipo de Contrato
   if DBcboTipoContr.LookupValue <> '' then sSQL := sSQL +
   '         AND TC.IDTIPOCONTREMPTMO   = ' + DBcboTipoContr.LookupValue                              + #13;

   // Contrato
   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '         AND C.IDCONTRATOEMPTMO     = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)                     + #13;

   sSQL := sSQL +
   '         AND HME.HMETIPOMOV         = 2 '                                                            + #13 +
   '         AND HME.FLGBAIXADO         IS NULL '                                                            + #13 +
   '         AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) ) '                               + #13 +
   '         AND HME.HMEFORMACOBRANCA   = ''F'' '                                                            + #13 +

   //Pendência 23755 - 17/11/2006 - Alberto
   '         AND HME.HMETIPOFOLHA       = ''B'' '                                                            + #13 +

   '         AND NVL(HME.FLGESTORNADO, 0) = 0 '                                                          + #13 +
   '         AND HME.HMEDATAEFETIVA BETWEEN TO_DATE(' + sDataIni + ', ''DD/MM/YYYY'') AND TO_DATE(' + sDataAtu + ', ''DD/MM/YYYY'') '                                     + #13 +

   '         AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO '                                           + #13 +
   '         AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO '                                         + #13 +
   '         AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO '                                        + #13 +
   '         AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO '                                             + #13 +
   '      ) CON '                                                                                        + #13 +
   '   WHERE '                                                                                           + #13 +
   '      A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO(+) '                                               + #13 +
   '   GROUP BY '                                                                                        + #13 +
   '      A.IDTIPOCONTREMPTMO '                                                                          + #13 +
   '   ) REC_AMORT_FB, '                                                                                    + #13 +
   '-- FIM AMORTIZAÇÕES RECEBIDAS FB ---------------------------------------------------------------- '     + #13 +


   '-- QUITAÇÕES RECEBIDAS CR ----------------------------------------------------------------------- '     + #13 +
   '   ( '                                                                                               + #13 +
   '   SELECT '                                                                                          + #13 +
   '      A.IDTIPOCONTREMPTMO, NVL(SUM(CON.HMEVLREFETIVO), 0) AS REC_QUIT, '                             + #13 +
   '      NVL(COUNT(CON.IDCONTRATOEMPTMO),0) AS TOT_REC_QUIT '                                           + #13 +
   '   FROM '                                                                                            + #13 +
   '      TIPOCONTREMPTMO A, '                                                                           + #13 +
   '      ( '                                                                                            + #13 +
   '      SELECT '                                                                                       + #13 +
   '         TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO, '                               + #13 +
   '         TC.IDTIPOCONTREMPTMO, '                                                                     + #13 +

   '         NVL(HME.HMEVLREFETIVO, 0) AS HMEVLREFETIVO'   + #13 +

   '      FROM '                                                                                         + #13 +
   '         HISTMOVEMPTMO HME, CONTRATOEMPTMO C, '                                                      + #13 +
   '         ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC '                                                    + #13 +
   '      WHERE '                                                                                        + #13 +
   '             C.FLGSITUACAO          <> ''C'' '                                                       + #13 +
   '         AND C.IDPATRO              IN (' + molListaPatro.PegaPatro + ') '                           + #13 +
   '         AND C.IDPLANOPREV          IN (' + molListaPlano.PegaPlano + ') '                           + #13;

   // Tipo de Empréstimo
   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   '         AND TC.IDTIPOEMPTMO        = ' + DBcboTipoEmptmo.LookupValue                                + #13;

   // Tipo de Contrato
   if DBcboTipoContr.LookupValue <> '' then sSQL := sSQL +
   '         AND TC.IDTIPOCONTREMPTMO   = ' + DBcboTipoContr.LookupValue                              + #13;

   // Contrato
   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '         AND C.IDCONTRATOEMPTMO     = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)                     + #13;

   if chkRenovacao.Checked then sSQL := sSQL +
   '         AND HME.HMEORIGEM         <> 0 '                                                            + #13;

   sSQL := sSQL +
   '         AND HMETIPOMOV             = 3 '                                                            + #13 +
   '         AND HME.FLGBAIXADO         IS NULL '                                                            + #13 +
   '         AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) ) '                               + #13 +
   '         AND HME.HMEFORMACOBRANCA   = ''C'' '                                                            + #13 +

   '         AND NVL(HME.FLGESTORNADO, 0) = 0 '                                                          + #13 +
   '         AND HME.HMEDATAEFETIVA BETWEEN TO_DATE(' + sDataIni + ', ''DD/MM/YYYY'') AND TO_DATE(' + sDataAtu + ', ''DD/MM/YYYY'') '                                     + #13 +

   '         AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO '                                           + #13 +
   '         AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO '                                         + #13 +
   '         AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO '                                        + #13 +
   '         AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO '                                             + #13 +
   '      ) CON '                                                                                        + #13 +
   '   WHERE '                                                                                           + #13 +
   '      A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO(+) '                                               + #13 +
   '   GROUP BY '                                                                                        + #13 +
   '      A.IDTIPOCONTREMPTMO '                                                                          + #13 +
   '   ) REC_QUIT_CR, '                                                                                     + #13 +
   '-- FIM QUITAÇÕES RECEBIDAS CR ------------------------------------------------------------------- '     + #13 +

   '-- QUITAÇÕES RECEBIDAS FP ----------------------------------------------------------------------- '     + #13 +
   '   ( '                                                                                               + #13 +
   '   SELECT '                                                                                          + #13 +
   '      A.IDTIPOCONTREMPTMO, NVL(SUM(CON.HMEVLREFETIVO), 0) AS REC_QUIT, '                             + #13 +
   '      NVL(COUNT(CON.IDCONTRATOEMPTMO),0) AS TOT_REC_QUIT '                                           + #13 +
   '   FROM '                                                                                            + #13 +
   '      TIPOCONTREMPTMO A, '                                                                           + #13 +
   '      ( '                                                                                            + #13 +
   '      SELECT '                                                                                       + #13 +
   '         TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO, '                               + #13 +
   '         TC.IDTIPOCONTREMPTMO, '                                                                     + #13 +

   '         NVL(HME.HMEVLREFETIVO, 0) AS HMEVLREFETIVO'   + #13 +

   '      FROM '                                                                                         + #13 +
   '         HISTMOVEMPTMO HME, CONTRATOEMPTMO C, '                                                      + #13 +
   '         ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC '                                                    + #13 +
   '      WHERE '                                                                                        + #13 +
   '             C.FLGSITUACAO          <> ''C'' '                                                       + #13 +
   '         AND C.IDPATRO              IN (' + molListaPatro.PegaPatro + ') '                           + #13 +
   '         AND C.IDPLANOPREV          IN (' + molListaPlano.PegaPlano + ') '                           + #13;

   // Tipo de Empréstimo
   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   '         AND TC.IDTIPOEMPTMO        = ' + DBcboTipoEmptmo.LookupValue                                + #13;

   // Tipo de Contrato
   if DBcboTipoContr.LookupValue <> '' then sSQL := sSQL +
   '         AND TC.IDTIPOCONTREMPTMO   = ' + DBcboTipoContr.LookupValue                              + #13;

   // Contrato
   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '         AND C.IDCONTRATOEMPTMO     = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)                     + #13;

   if chkRenovacao.Checked then sSQL := sSQL +
   '         AND HME.HMEORIGEM         <> 0 '                                                            + #13;

   sSQL := sSQL +
   '         AND HMETIPOMOV             = 3 '                                                            + #13 +
   '         AND HME.FLGBAIXADO         IS NULL '                                                            + #13 +
   '         AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) ) '                               + #13 +
   '         AND HME.HMEFORMACOBRANCA   = ''F'' '                                                            + #13 +
   '         AND HME.HMETIPOFOLHA       = ''P'' '                                                            + #13 +

   '         AND NVL(HME.FLGESTORNADO, 0) = 0 '                                                          + #13 +
   '         AND HME.HMEDATAEFETIVA BETWEEN TO_DATE(' + sDataIni + ', ''DD/MM/YYYY'') AND TO_DATE(' + sDataAtu + ', ''DD/MM/YYYY'') '                                     + #13 +

   '         AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO '                                           + #13 +
   '         AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO '                                         + #13 +
   '         AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO '                                        + #13 +
   '         AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO '                                             + #13 +
   '      ) CON '                                                                                        + #13 +
   '   WHERE '                                                                                           + #13 +
   '      A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO(+) '                                               + #13 +
   '   GROUP BY '                                                                                        + #13 +
   '      A.IDTIPOCONTREMPTMO '                                                                          + #13 +
   '   ) REC_QUIT_FP, '                                                                                     + #13 +
   '-- FIM QUITAÇÕES RECEBIDAS FP ------------------------------------------------------------------- '     + #13 +


   '-- QUITAÇÕES RECEBIDAS FB ----------------------------------------------------------------------- '     + #13 +
   '   ( '                                                                                               + #13 +
   '   SELECT '                                                                                          + #13 +
   '      A.IDTIPOCONTREMPTMO, NVL(SUM(CON.HMEVLREFETIVO), 0) AS REC_QUIT, '                             + #13 +
   '      NVL(COUNT(CON.IDCONTRATOEMPTMO),0) AS TOT_REC_QUIT '                                           + #13 +
   '   FROM '                                                                                            + #13 +
   '      TIPOCONTREMPTMO A, '                                                                           + #13 +
   '      ( '                                                                                            + #13 +
   '      SELECT '                                                                                       + #13 +
   '         TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO, '                               + #13 +
   '         TC.IDTIPOCONTREMPTMO, '                                                                     + #13 +

   '         NVL(HME.HMEVLREFETIVO, 0) AS HMEVLREFETIVO'   + #13 +

   '      FROM '                                                                                         + #13 +
   '         HISTMOVEMPTMO HME, CONTRATOEMPTMO C, '                                                      + #13 +
   '         ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC '                                                    + #13 +
   '      WHERE '                                                                                        + #13 +
   '             C.FLGSITUACAO          <> ''C'' '                                                       + #13 +
   '         AND C.IDPATRO              IN (' + molListaPatro.PegaPatro + ') '                           + #13 +
   '         AND C.IDPLANOPREV          IN (' + molListaPlano.PegaPlano + ') '                           + #13;

   // Tipo de Empréstimo
   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   '         AND TC.IDTIPOEMPTMO        = ' + DBcboTipoEmptmo.LookupValue                                + #13;

   // Tipo de Contrato
   if DBcboTipoContr.LookupValue <> '' then sSQL := sSQL +
   '         AND TC.IDTIPOCONTREMPTMO   = ' + DBcboTipoContr.LookupValue                              + #13;

   // Contrato
   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '         AND C.IDCONTRATOEMPTMO     = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)                     + #13;

   if chkRenovacao.Checked then sSQL := sSQL +
   '         AND HME.HMEORIGEM         <> 0 '                                                            + #13;

   sSQL := sSQL +
   '         AND HMETIPOMOV             = 3 '                                                            + #13 +
   '         AND HME.FLGBAIXADO         IS NULL '                                                            + #13 +
   '         AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) ) '                               + #13 +
   '         AND HME.HMEFORMACOBRANCA   = ''F'' '                                                            + #13 +
   '         AND HME.HMETIPOFOLHA       = ''B'' '                                                            + #13 +

   '         AND NVL(HME.FLGESTORNADO, 0) = 0 '                                                          + #13 +
   '         AND HME.HMEDATAEFETIVA BETWEEN TO_DATE(' + sDataIni + ', ''DD/MM/YYYY'') AND TO_DATE(' + sDataAtu + ', ''DD/MM/YYYY'') '                                     + #13 +

   '         AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO '                                           + #13 +
   '         AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO '                                         + #13 +
   '         AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO '                                        + #13 +
   '         AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO '                                             + #13 +
   '      ) CON '                                                                                        + #13 +
   '   WHERE '                                                                                           + #13 +
   '      A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO(+) '                                               + #13 +
   '   GROUP BY '                                                                                        + #13 +
   '      A.IDTIPOCONTREMPTMO '                                                                          + #13 +
   '   ) REC_QUIT_FB, '                                                                                     + #13 +
   '-- FIM QUITAÇÕES RECEBIDAS FB ------------------------------------------------------------------- '     + #13 +

   '-- ITENS ABONADOS ---------------------------------------------------------------------------- '     + #13 +
   '   ( '                                                                                               + #13 +
   '   SELECT '                                                                                          + #13 +
   '      A.IDTIPOCONTREMPTMO, NVL(SUM(CON.HMEVLREFETIVO), 0) AS ABONADO, '                              + #13 +
   '      NVL(COUNT(CON.IDCONTRATOEMPTMO),0) AS TOT_ABONADO '                                            + #13 +
   '   FROM '                                                                                            + #13 +
   '      TIPOCONTREMPTMO A, '                                                                           + #13 +
   '      ( '                                                                                            + #13 +
   '      SELECT '                                                                                       + #13 +
   '         TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO, '                               + #13 +
   '         TC.IDTIPOCONTREMPTMO, '                                                                     + #13 +

   '         DECODE(NVL(FLGABONADO, 0), 0, 0, NVL(HME.HMEVLRPREVISTO, 0)) AS HMEVLREFETIVO '             + #13 +

   '      FROM '                                                                                         + #13 +
   '         HISTMOVEMPTMO HME, CONTRATOEMPTMO C, '                                                      + #13 +
   '         ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC '                                                    + #13 +
   '      WHERE '                                                                                        + #13 +
   '             C.FLGSITUACAO          <> ''C'' '                                                       + #13 +
   '         AND C.IDPATRO              IN (' + molListaPatro.PegaPatro + ') '                           + #13 +
   '         AND C.IDPLANOPREV          IN (' + molListaPlano.PegaPlano + ') '                           + #13;

   // Tipo de Empréstimo
   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   '         AND TC.IDTIPOEMPTMO        = ' + DBcboTipoEmptmo.LookupValue                                + #13;

   // Tipo de Contrato
   if DBcboTipoContr.LookupValue <> '' then sSQL := sSQL +
   '         AND TC.IDTIPOCONTREMPTMO   = ' + DBcboTipoContr.LookupValue                                 + #13;

   // Contrato
   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '         AND C.IDCONTRATOEMPTMO     = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)            + #13;

   if chkAbonoContab.Checked then sSQL := sSQL +
   '         AND HME.PLNCODIGOESTORNO   IS NOT NULL '                                                    + #13;

   sSQL := sSQL +
   '         AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) ) '                               + #13 +
   '         AND ( (HME.FLGESTORNADO    IS NULL) OR (HME.FLGESTORNADO = 0) ) '                           + #13 +

   '         AND NVL(HME.FLGABONADO, 0) = 1 '                                                            + #13 +

   '         AND HME.HMEDATAQUITABONO   BETWEEN ' + OraData(dDataIni) + ' AND ' + OraData(dDataAtu)      + #13 +

   '         AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO '                                           + #13 +
   '         AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO '                                         + #13 +
   '         AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO '                                        + #13 +
   '         AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO '                                             + #13 +
   '      ) CON '                                                                                        + #13 +
   '   WHERE '                                                                                           + #13 +
   '      A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO(+) '                                               + #13 +
   '   GROUP BY '                                                                                        + #13 +
   '      A.IDTIPOCONTREMPTMO '                                                                          + #13 +
   '   ) ABONADO, '                                                                                      + #13 +
   '-- FIM ITENS ABONADOS ------------------------------------------------------------------------ '     + #13 +


   '-- ITENS QUITADOS ---------------------------------------------------------------------------- '     + #13 +
   '   ( '                                                                                               + #13 +
   '   SELECT '                                                                                          + #13 +
   '      A.IDTIPOCONTREMPTMO, NVL(SUM(CON.HMEVLREFETIVO), 0) AS QUITADO, '                              + #13 +
   '      NVL(COUNT(CON.IDCONTRATOEMPTMO),0) AS TOT_QUITADO '                                            + #13 +
   '   FROM '                                                                                            + #13 +
   '      TIPOCONTREMPTMO A, '                                                                           + #13 +
   '      ( '                                                                                            + #13 +
   '      SELECT '                                                                                       + #13 +
   '         TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO, '                               + #13 +
   '         TC.IDTIPOCONTREMPTMO, '                                                                     + #13 +

   '         DECODE(NVL(FLGQUITADO, 0), 0, 0, NVL(HME.HMEVLRPREVISTO, 0)) AS HMEVLREFETIVO '             + #13 +

   '      FROM '                                                                                         + #13 +
   '         HISTMOVEMPTMO HME, CONTRATOEMPTMO C, '                                                      + #13 +
   '         ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC '                                                    + #13 +
   '      WHERE '                                                                                        + #13 +
   '             C.FLGSITUACAO          <> ''C'' '                                                       + #13 +
   '         AND C.IDPATRO              IN (' + molListaPatro.PegaPatro + ') '                           + #13 +
   '         AND C.IDPLANOPREV          IN (' + molListaPlano.PegaPlano + ') '                           + #13;

   // Tipo de Empréstimo
   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   '         AND TC.IDTIPOEMPTMO        = ' + DBcboTipoEmptmo.LookupValue                                + #13;

   // Tipo de Contrato
   if DBcboTipoContr.LookupValue <> '' then sSQL := sSQL +
   '         AND TC.IDTIPOCONTREMPTMO   = ' + DBcboTipoContr.LookupValue                              + #13;

   // Contrato
   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '         AND C.IDCONTRATOEMPTMO     = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)                     + #13;

   sSQL := sSQL +
   '         AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) ) '                               + #13 +
   '         AND ( (HME.FLGESTORNADO    IS NULL) OR (HME.FLGESTORNADO = 0) ) '                           + #13 +

   '         AND NVL(HME.FLGQUITADO, 0) = 1 '                                                            + #13 +

   '         AND HME.HMEDATAQUITABONO   BETWEEN ' + OraData(dDataIni) + ' AND ' + OraData(dDataAtu)      + #13 +

   '         AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO '                                           + #13 +
   '         AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO '                                         + #13 +
   '         AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO '                                        + #13 +
   '         AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO '                                             + #13 +
   '      ) CON '                                                                                        + #13 +
   '   WHERE '                                                                                           + #13 +
   '      A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO(+) '                                               + #13 +
   '   GROUP BY '                                                                                        + #13 +
   '      A.IDTIPOCONTREMPTMO '                                                                          + #13 +
   '   ) QUITADO, '                                                                                      + #13 +
   '-- FIM ITENS QUITADOS ------------------------------------------------------------------------ '     + #13 +


   '-- SALDO ATUAL ------------------------------------------------------------------------------- '     + #13 +
   '   ( '                                                                                               + #13 +
   '   SELECT '                                                                                          + #13 +
   '      A.IDTIPOCONTREMPTMO, '                                                                         + #13 +
   '      SUM(CON.DEVE) AS SALDO_DEV, '                                                                  + #13 +
   '      SUM(CON.QUANT) AS TOTALSALDO_DEV '                                                             + #13 +
   '   FROM '                                                                                            + #13 +
   '      TIPOCONTREMPTMO A, '                                                                           + #13 +
   '      ( '                                                                                            + #13 +
   '      SELECT '                                                                                       + #13 +
   '         C.IDCONTRATOEMPTMO, C.IDTIPOCONTREMPTMO, '                                                  + #13 +
   '         (NVL(PAR_DEV.VLR_DEV, 0) - NVL(PAR_PAG.VLR_PAG, 0)) AS DEVE, '                                       + #13 +
   '         DECODE((ROUND(NVL(PAR_DEV.VLR_DEV, 0), 2) - ROUND(NVL(PAR_PAG.VLR_PAG, 0), 2)), 0, 0, 1) AS QUANT '  +
   '      FROM '                                                                                         + #13 +
   '         CONTRATOEMPTMO C, '                                                                         + #13 +
   '         ( '                                                                                         + #13 +
   '         SELECT '                                                                                    + #13 +
   '            CON.IDCONTRATOEMPTMO, SUM(NVL(HME.HMEVLRPREVISTO, 0)) AS VLR_DEV '                       + #13 +
   '         FROM '                                                                                      + #13 +
   '            HISTMOVEMPTMO HME, CONTRATOEMPTMO CON '                                                  + #13 +
   '         WHERE '                                                                                     + #13 +
   '                CON.FLGSITUACAO        <> ''C'' '                                                    + #13 +
   '            AND HME.HMETIPOMOV         IN (1, 2, 3, 4) '                                             + #13 +
   '            AND HME.HMESEQCOBRANCA     = 1 '                                                         + #13 +
   '            AND HME.HMEDATAPREVISTA    <= TO_DATE(' + sDataAtu + ', ''DD/MM/YYYY'') '                + #13 +
   '            AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) ) '                            + #13 +
   '            AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO IS NULL) ) '                        + #13 +
   '            AND CON.IDPATRO            IN (' + molListaPatro.PegaPatro + ') '                        + #13 +
   '            AND CON.IDPLANOPREV        IN (' + molListaPlano.PegaPlano + ') '                        + #13;

   // Tipo de Contrato
   if DBcboTipoContr.LookupValue <> '' then sSQL := sSQL +
   '            AND CON.IDTIPOCONTREMPTMO  = ' + DBcboTipoContr.LookupValue                           + #13;

   // Contrato
   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '            AND CON.IDCONTRATOEMPTMO   = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)         + #13;

   sSQL := sSQL +
   '            AND ( CON.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO ) '                                    + #13 +
   '         GROUP BY '                                                                                  + #13 +
   '            CON.IDCONTRATOEMPTMO '                                                                   + #13 +
   '         ) PAR_DEV, '                                                                                + #13 +
   '         ( '                                                                                         + #13 +
   '         SELECT '                                                                                    + #13 +
   '            CON.IDCONTRATOEMPTMO, '                                                                  + #13 +
   '            SUM(DECODE(FLGQUITADO, 1, NVL(HME.HMEVLRPREVISTO, 0), '                                        + #13 +
   '                                      DECODE(FLGABONADO, 1, NVL(HME.HMEVLRPREVISTO, 0), '                  + #13 +
   '                                                            NVL(HME.HMEVLREFETIVO, 0)))) AS VLR_PAG '      + #13 +
   '         FROM '                                                                                      + #13 +
   '            HISTMOVEMPTMO HME, CONTRATOEMPTMO CON '                                                  + #13 +
   '         WHERE '                                                                                     + #13 +
   '                CON.FLGSITUACAO        <> ''C'' '                                                    + #13 +
   '            AND HME.HMETIPOMOV         IN (1, 2, 3, 4) '                                             + #13 +
   '            AND HME.HMEDATAPREVISTA    <= TO_DATE(' + sDataAtu + ', ''DD/MM/YYYY'') '                + #13 +
   '            AND ( '                                                                                  + #13 +
   '                (HME.HMEDATAEFETIVA    <= TO_DATE(' + sDataAtu + ', ''DD/MM/YYYY'')) '               + #13 +
   '                OR ( (HME.FLGQUITADO = 1) AND (HME.HMEDATAQUITABONO <= TO_DATE(' + sDataAtu + ',''DD/MM/YYYY'')) ) '   + #13 +
   '                OR ( (HME.FLGABONADO = 1) AND (HME.HMEDATAQUITABONO <= TO_DATE(' + sDataAtu + ',''DD/MM/YYYY'')) ) '   + #13 +
   '                ) '                                                                                  + #13 +
   '            AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) ) '                            + #13 +
   '            AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO IS NULL) ) '                        + #13 +
   '            AND CON.IDPATRO            IN (' + molListaPatro.PegaPatro + ') '                        + #13 +
   '            AND CON.IDPLANOPREV        IN (' + molListaPlano.PegaPlano + ') '                        + #13;

   // Tipo de Contrato
   if DBcboTipoContr.LookupValue <> '' then sSQL := sSQL +
   '            AND CON.IDTIPOCONTREMPTMO  = ' + DBcboTipoContr.LookupValue                           + #13;

   // Contrato
   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '            AND CON.IDCONTRATOEMPTMO   = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)         + #13;

   sSQL := sSQL +
   '            AND ( CON.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO ) '                                    + #13 +
   '         GROUP BY '                                                                                  + #13 +
   '            CON.IDCONTRATOEMPTMO '                                                                   + #13 +
   '         ) PAR_PAG '                                                                                 + #13 +
   '      WHERE '                                                                                        + #13 +
   '             C.IDCONTRATOEMPTMO   = PAR_DEV.IDCONTRATOEMPTMO(+) '                                    + #13 +
   '         AND C.IDPATRO            IN (' + molListaPatro.PegaPatro + ') '                             + #13 +
   '         AND C.IDPLANOPREV        IN (' + molListaPlano.PegaPlano + ') '                             + #13;

   // Tipo de Contrato
   if DBcboTipoContr.LookupValue <> '' then sSQL := sSQL +
   '         AND C.IDTIPOCONTREMPTMO  = ' + DBcboTipoContr.LookupValue                                + #13;

   // Contrato
   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '         AND C.IDCONTRATOEMPTMO   = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)                       + #13;

   sSQL := sSQL +
   '         AND C.IDCONTRATOEMPTMO   = PAR_PAG.IDCONTRATOEMPTMO(+) '                                    + #13 +
   '      ) CON '                                                                                        + #13 +
   '   WHERE '                                                                                           + #13 +
   '      A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO(+) '                                               + #13 +
   '   GROUP BY '                                                                                        + #13 +
   '      A.IDTIPOCONTREMPTMO '                                                                          + #13 +
   '   ) SALDO_DEV '                                                                                     + #13 +
   '-- FIM SALDO ATUAL --------------------------------------------------------------------------- '     + #13 +


   'WHERE '                                                                                              + #13 +
   '       TEP.IDEMPRESAPROP      = ' + IntToStr(Sistema.idEmpresa)                                      + #13;

   // Tipo de Empréstimo
   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   '   AND TEP.IDTIPOEMPTMO       = ' + DBcboTipoEmptmo.LookupValue                                      + #13;

   // Tipo de Contrato
   if DBcboTipoContr.LookupValue <> '' then sSQL := sSQL +
   '   AND TCE.IDTIPOCONTREMPTMO  = ' + DBcboTipoContr.LookupValue                                    + #13;

   sSQL := sSQL +
   '   AND TCE.IDTIPOCONTREMPTMO  = SALDO_ANT.IDTIPOCONTREMPTMO(+) '                                     + #13 +

   '   AND TCE.IDTIPOCONTREMPTMO  = PARCELAS_CR.IDTIPOCONTREMPTMO(+) '                                   + #13 +
   '   AND TCE.IDTIPOCONTREMPTMO  = PARCELAS_FP.IDTIPOCONTREMPTMO(+) '                                   + #13 +
   '   AND TCE.IDTIPOCONTREMPTMO  = PARCELAS_FB.IDTIPOCONTREMPTMO(+) '                                   + #13 +
   '   AND TCE.IDTIPOCONTREMPTMO  = ENCARGOS_CR.IDTIPOCONTREMPTMO(+) '                                      + #13 +
   '   AND TCE.IDTIPOCONTREMPTMO  = ENCARGOS_FP.IDTIPOCONTREMPTMO(+) '                                      + #13 +
   '   AND TCE.IDTIPOCONTREMPTMO  = ENCARGOS_FB.IDTIPOCONTREMPTMO(+) '                                      + #13 +
   '   AND TCE.IDTIPOCONTREMPTMO  = AMORT_CR.IDTIPOCONTREMPTMO(+) '                                         + #13 +
   '   AND TCE.IDTIPOCONTREMPTMO  = AMORT_FP.IDTIPOCONTREMPTMO(+) '                                         + #13 +
   '   AND TCE.IDTIPOCONTREMPTMO  = AMORT_FB.IDTIPOCONTREMPTMO(+) '                                         + #13 +
   '   AND TCE.IDTIPOCONTREMPTMO  = QUITACAO_CR.IDTIPOCONTREMPTMO(+) '                                      + #13 +
   '   AND TCE.IDTIPOCONTREMPTMO  = QUITACAO_FP.IDTIPOCONTREMPTMO(+) '                                      + #13 +
   '   AND TCE.IDTIPOCONTREMPTMO  = QUITACAO_FB.IDTIPOCONTREMPTMO(+) '                                      + #13 +

   '   AND TCE.IDTIPOCONTREMPTMO  = REC_PARC_CR.IDTIPOCONTREMPTMO(+) '                                   + #13 +
   '   AND TCE.IDTIPOCONTREMPTMO  = REC_PARC_FP.IDTIPOCONTREMPTMO(+) '                                   + #13 +
   '   AND TCE.IDTIPOCONTREMPTMO  = REC_PARC_FB.IDTIPOCONTREMPTMO(+) '                                   + #13 +

   '   AND TCE.IDTIPOCONTREMPTMO  = REC_ENC_CR.IDTIPOCONTREMPTMO(+) '                                       + #13 +
   '   AND TCE.IDTIPOCONTREMPTMO  = REC_ENC_FP.IDTIPOCONTREMPTMO(+) '                                       + #13 +
   '   AND TCE.IDTIPOCONTREMPTMO  = REC_ENC_FB.IDTIPOCONTREMPTMO(+) '                                       + #13 +

   '   AND TCE.IDTIPOCONTREMPTMO  = REC_AMORT_CR.IDTIPOCONTREMPTMO(+) '                                     + #13 +
   '   AND TCE.IDTIPOCONTREMPTMO  = REC_AMORT_FP.IDTIPOCONTREMPTMO(+) '                                     + #13 +
   '   AND TCE.IDTIPOCONTREMPTMO  = REC_AMORT_FB.IDTIPOCONTREMPTMO(+) '                                     + #13 +

   '   AND TCE.IDTIPOCONTREMPTMO  = REC_QUIT_CR.IDTIPOCONTREMPTMO(+) '                                      + #13 +
   '   AND TCE.IDTIPOCONTREMPTMO  = REC_QUIT_FP.IDTIPOCONTREMPTMO(+) '                                      + #13 +
   '   AND TCE.IDTIPOCONTREMPTMO  = REC_QUIT_FB.IDTIPOCONTREMPTMO(+) '                                      + #13 +

   '   AND TCE.IDTIPOCONTREMPTMO  = ABONADO.IDTIPOCONTREMPTMO(+) '                                      + #13 +
   '   AND TCE.IDTIPOCONTREMPTMO  = QUITADO.IDTIPOCONTREMPTMO(+) '                                      + #13 +

   '   AND TCE.IDTIPOCONTREMPTMO  = SALDO_DEV.IDTIPOCONTREMPTMO(+) '                                     + #13 +
   '   AND TCE.IDTIPOEMPTMO       = TEP.IDTIPOEMPTMO '                                                   + #13 +

   'ORDER BY '                                                                                           + #13 +
   '   TEP.DESCTIPOEMPTMO, TCE.TCEDESCRICAO ';

   dtmRelFechamentoCarteiraLinear.qryFechamentoCarteiraCaixa.Close;
   dtmRelFechamentoCarteiraLinear.qryFechamentoCarteiraCaixa.Open;

   with qryCalculo do
   begin
      Close;
      SQL.Clear;
      SQL.Add(sSQL);
    //Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
    //Sql.SaveToFile(Sistema.TempDir + 'EP-RelResumoCarteiraLinear.txt');
      Sql.SaveToFile(ftempregra + '\' + 'EP-RelResumoCarteiraLinear.txt');
      Open;

      while not(qryCalculo.EOF) do
      begin
         with dtmRelFechamentoCarteiraLinear do
         begin
            qryFechamentoCarteiraCaixa.Append;

            qryFechamentoCarteiraCaixaDESCTIPOEMPTMO.Value           :=  qryCalculoDESCTIPOEMPTMO.Value;
            qryFechamentoCarteiraCaixaTCEDESCRICAO.Value             :=  qryCalculoTCEDESCRICAO.Value;

            qryFechamentoCarteiraCaixaSALDO_ANT.Value                :=  qryCalculoSALDO_ANT.Value;
            qryFechamentoCarteiraCaixaTOTALSALDO_ANT.Value           :=  qryCalculoTOTALSALDO_ANT.Value;

            qryFechamentoCarteiraCaixaPARCELAS_CR.Value              :=  qryCalculoPARCELAS_CR.Value;
            qryFechamentoCarteiraCaixaTOTALPARC_CR.Value             :=  qryCalculoTOTALPARC_CR.Value;
            qryFechamentoCarteiraCaixaPARCELAS_FP.Value              :=  qryCalculoPARCELAS_FP.Value;
            qryFechamentoCarteiraCaixaTOTALPARC_FP.Value             :=  qryCalculoTOTALPARC_FP.Value;
            qryFechamentoCarteiraCaixaPARCELAS_FB.Value              :=  qryCalculoPARCELAS_FB.Value;
            qryFechamentoCarteiraCaixaTOTALPARC_FB.Value             :=  qryCalculoTOTALPARC_FB.Value;
            qryFechamentoCarteiraCaixaENCARGOS_CR.Value              :=  qryCalculoENCARGOS_CR.Value;
            qryFechamentoCarteiraCaixaTOTALENC_CR.Value              :=  qryCalculoTOTALENC_CR.Value;
            qryFechamentoCarteiraCaixaENCARGOS_FP.Value              :=  qryCalculoENCARGOS_FP.Value;
            qryFechamentoCarteiraCaixaTOTALENC_FP.Value              :=  qryCalculoTOTALENC_FP.Value;
            qryFechamentoCarteiraCaixaENCARGOS_FB.Value              :=  qryCalculoENCARGOS_FB.Value;
            qryFechamentoCarteiraCaixaTOTALENC_FB.Value              :=  qryCalculoTOTALENC_FB.Value;
            qryFechamentoCarteiraCaixaAMORTIZACAO_CR.Value           :=  qryCalculoAMORTIZACAO_CR.Value;
            qryFechamentoCarteiraCaixaTOTALAMO_CR.Value              :=  qryCalculoTOTALAMO_CR.Value;
            qryFechamentoCarteiraCaixaAMORTIZACAO_FP.Value           :=  qryCalculoAMORTIZACAO_FP.Value;
            qryFechamentoCarteiraCaixaTOTALAMO_FP.Value              :=  qryCalculoTOTALAMO_FP.Value;
            qryFechamentoCarteiraCaixaAMORTIZACAO_FB.Value           :=  qryCalculoAMORTIZACAO_FB.Value;
            qryFechamentoCarteiraCaixaTOTALAMO_FB.Value              :=  qryCalculoTOTALAMO_FB.Value;
            qryFechamentoCarteiraCaixaQUITACAO_CR.Value              :=  qryCalculoQUITACAO_CR.Value;
            qryFechamentoCarteiraCaixaTOTALQUI_CR.Value              :=  qryCalculoTOTALQUI_CR.Value;
            qryFechamentoCarteiraCaixaQUITACAO_FP.Value              :=  qryCalculoQUITACAO_FP.Value;
            qryFechamentoCarteiraCaixaTOTALQUI_FP.Value              :=  qryCalculoTOTALQUI_FP.Value;
            qryFechamentoCarteiraCaixaQUITACAO_FB.Value              :=  qryCalculoQUITACAO_FB.Value;
            qryFechamentoCarteiraCaixaTOTALQUI_FB.Value              :=  qryCalculoTOTALQUI_FB.Value;

            qryFechamentoCarteiraCaixaREC_PARC_CR.Value              :=  qryCalculoREC_PARC_CR.Value;
            qryFechamentoCarteiraCaixaTOT_REC_PARC_CR.Value          :=  qryCalculoTOT_REC_PARC_CR.Value;
            qryFechamentoCarteiraCaixaREC_PARC_FP.Value              :=  qryCalculoREC_PARC_FP.Value;
            qryFechamentoCarteiraCaixaTOT_REC_PARC_FP.Value          :=  qryCalculoTOT_REC_PARC_FP.Value;
            qryFechamentoCarteiraCaixaREC_PARC_FB.Value              :=  qryCalculoREC_PARC_FB.Value;
            qryFechamentoCarteiraCaixaTOT_REC_PARC_FB.Value          :=  qryCalculoTOT_REC_PARC_FB.Value;

            qryFechamentoCarteiraCaixaREC_ENC_CR.Value               :=  qryCalculoREC_ENC_CR.Value;
            qryFechamentoCarteiraCaixaTOT_REC_ENC_CR.Value           :=  qryCalculoTOT_REC_ENC_CR.Value;
            qryFechamentoCarteiraCaixaREC_ENC_FP.Value               :=  qryCalculoREC_ENC_FP.Value;
            qryFechamentoCarteiraCaixaTOT_REC_ENC_FP.Value           :=  qryCalculoTOT_REC_ENC_FP.Value;
            qryFechamentoCarteiraCaixaREC_ENC_FB.Value               :=  qryCalculoREC_ENC_FB.Value;
            qryFechamentoCarteiraCaixaTOT_REC_ENC_FB.Value           :=  qryCalculoTOT_REC_ENC_FB.Value;

            qryFechamentoCarteiraCaixaREC_AMORT_CR.Value             :=  qryCalculoREC_AMORT_CR.Value;
            qryFechamentoCarteiraCaixaTOT_REC_AMORT_CR.Value         :=  qryCalculoTOT_REC_AMORT_CR.Value;
            qryFechamentoCarteiraCaixaREC_AMORT_FP.Value             :=  qryCalculoREC_AMORT_FP.Value;
            qryFechamentoCarteiraCaixaTOT_REC_AMORT_FP.Value         :=  qryCalculoTOT_REC_AMORT_FP.Value;
            qryFechamentoCarteiraCaixaREC_AMORT_FB.Value             :=  qryCalculoREC_AMORT_FB.Value;
            qryFechamentoCarteiraCaixaTOT_REC_AMORT_FB.Value         :=  qryCalculoTOT_REC_AMORT_FB.Value;
            qryFechamentoCarteiraCaixaREC_QUIT_CR.Value              :=  qryCalculoREC_QUIT_CR.Value;
            qryFechamentoCarteiraCaixaTOT_REC_QUIT_CR.Value          :=  qryCalculoTOT_REC_QUIT_CR.Value;
            qryFechamentoCarteiraCaixaREC_QUIT_FP.Value              :=  qryCalculoREC_QUIT_FP.Value;
            qryFechamentoCarteiraCaixaTOT_REC_QUIT_FP.Value          :=  qryCalculoTOT_REC_QUIT_FP.Value;
            qryFechamentoCarteiraCaixaREC_QUIT_FB.Value              :=  qryCalculoREC_QUIT_FB.Value;
            qryFechamentoCarteiraCaixaTOT_REC_QUIT_FB.Value          :=  qryCalculoTOT_REC_QUIT_FB.Value;

            qryFechamentoCarteiraCaixaABONADO.Value                  :=  qryCalculoABONADO.Value;
            qryFechamentoCarteiraCaixaTOT_ABONADO.Value              :=  qryCalculoTOT_ABONADO.Value;

            qryFechamentoCarteiraCaixaQUITADO.Value                  :=  qryCalculoQUITADO.Value;
            qryFechamentoCarteiraCaixaTOT_QUITADO.Value              :=  qryCalculoTOT_QUITADO.Value;

            qryFechamentoCarteiraCaixaSALDO_DEV.Value                :=  qryCalculoSALDO_DEV.Value;
            qryFechamentoCarteiraCaixaTOTALSALDO_DEV.Value           :=  qryCalculoTOTALSALDO_DEV.Value;

            qryFechamentoCarteiraCaixa.Post;
         end;

         Next;
      end;
   end;
end;



procedure TcfgRelFechamentoCarteiraLinear.FormShow(Sender: TObject);
begin
   inherited;

   // preenche a data de lançamento e o ano de referência/competência
   cboMes.ItemIndex := DiasUteis.ExtraiMes(Date) - 1;
   DBspnAno.Value   := DiasUteis.ExtraiAno(Date);

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




procedure TcfgRelFechamentoCarteiraLinear.DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
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



procedure TcfgRelFechamentoCarteiraLinear.DBcboTipoEmptmoExit(Sender: TObject);
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



procedure TcfgRelFechamentoCarteiraLinear.molContratoEmptmobtnBuscaContratoClick(Sender: TObject);
begin
   inherited;
   molContratoEmptmo.btnBuscaContratoClick(Sender);
end;



procedure TcfgRelFechamentoCarteiraLinear.molContratoEmptmobtnLimpaContratoClick(Sender: TObject);
begin
   inherited;
   molContratoEmptmo.btnLimpaContratoClick(Sender);
end;



procedure TcfgRelFechamentoCarteiraLinear.molListaPatrobtnInvertePatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnInvertePatroClick(Sender);
end;



procedure TcfgRelFechamentoCarteiraLinear.molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnMarcaTodosPatroClick(Sender);
end;



procedure TcfgRelFechamentoCarteiraLinear.molListaPlanobtnInvertePlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnInvertePlanoClick(Sender);
end;



procedure TcfgRelFechamentoCarteiraLinear.molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnMarcaTodosPlanoClick(Sender);
end;



procedure TcfgRelFechamentoCarteiraLinear.FiltraRelatorioAtuDia;
var
   Arquivo           : TextFile;
   sArquivo          : String;
   sLinha            : String;

   iRegistro         : Integer;

   iPatro            : Integer;
   iPlano            : Integer;
   iTipoContr        : Integer;

   iContadorCima     : Integer;
   iContadorBaixo    : Integer;

   iContadorPlano    : Integer;
   iContadorPatro    : Integer;

   iQuantTipoContr   : Integer;
   iTotalPxPxTC      : Integer;

   bGrava            : Boolean;

   rSaldoDevAnt      : TSaldoDevAnt;
   rSaldoDevAtu      : TSaldoDevAnt;

   dDataAnt          : TDateTime;
   dDataAtu          : TDateTime;
begin

   dDataAtu := DiasUteis.UltDiaMes(trunc(DBspnAno.Value), (cboMes.ItemIndex + 1));

   dDataAnt := EncodeDate(Trunc(DBspnAno.Value), (cboMes.ItemIndex + 1), 1);
   dDataAnt := DiasUteis.SomaMeses(dDataAnt, -1);
   dDataAnt := DiasUteis.UltDiaMes(DiasUteis.ExtraiAno(dDataAnt), DiasUteis.ExtraiMes(dDataAnt));

   with qryLookTipoContr do
   begin
      LimpaParametros(qryLookTipoContr);
      ParamByName('PIDEMPRESAPROP').AsInteger := Sistema.IDEmpresa;
      Open;
   end;


   iRegistro         := 0;
   iQuantTipoContr   := qryLookTipoContr.RecordCount;
   iTotalPxPxTC      := molListaPlano.lstPlano.Items.Count *
                        molListaPatro.lstPatro.Items.Count *
                        iQuantTipoContr;

   dtmRelFechamentoCarteiraLinear.qryFechamentoCarteiraCaixa.Close;
   dtmRelFechamentoCarteiraLinear.qryFechamentoCarteiraCaixa.Open;

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

                     with qryContrato do
                     begin
                        LimpaParametros(qryContrato);
                        ParamByName('PIDEMPRESAPROP').AsInteger         := Sistema.IDEmpresa;
                        ParamByName('PIDPATRO').AsInteger               := molListaPatro.vIDPatro[iContadorPatro];
                        ParamByName('IDPLANOPREV').AsInteger            := molListaPlano.vIDPlano[iContadorPlano];
                        ParamByName('PIDTIPOCONTREMPTMO').AsInteger     := qryLookTipoContrIDTIPOCONTREMPTMO.AsInteger;

                        ParamByName('PHMEDATAINI').AsDateTime           := dDataAnt;
                        ParamByName('PHMEDATAFIM').AsDateTime           := dDataAtu;

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

                        with qrySaldoAnt do
                        begin
                           LimpaParametros(qrySaldoAnt);
                           ParamByName('PIDCONTRATOEMPTMO').AsFloat  := qryContratoIDCONTRATOEMPTMO.AsFloat;
                           ParamByName('PHMEDATAINI').AsDateTime     := dDataAnt;

                           Open;

                        end;

                        with qrySaldoAtu do
                        begin
                           LimpaParametros(qrySaldoAtu);
                           ParamByName('PIDCONTRATOEMPTMO').AsFloat  := qryContratoIDCONTRATOEMPTMO.AsFloat;
                           ParamByName('PHMEDATAFIM').AsDateTime     := dDataAtu;

                           Open;
                        end;

                        with qryParcelas_CR do
                        begin
                           LimpaParametros(qryParcelas_CR);
                           ParamByName('PIDCONTRATOEMPTMO').AsFloat  := qryContratoIDCONTRATOEMPTMO.AsFloat;
                           ParamByName('PHMEDATAINI').AsDateTime     := dDataAnt + 1;
                           ParamByName('PHMEDATAFIM').AsDateTime     := dDataAtu;

                           Open;
                        end;

                        with qryParcelas_FP do
                        begin
                           LimpaParametros(qryParcelas_FP);
                           ParamByName('PIDCONTRATOEMPTMO').AsFloat  := qryContratoIDCONTRATOEMPTMO.AsFloat;
                           ParamByName('PHMEDATAINI').AsDateTime     := dDataAnt + 1;
                           ParamByName('PHMEDATAFIM').AsDateTime     := dDataAtu;

                           Open;
                        end;

                        with qryParcelas_FB do
                        begin
                           LimpaParametros(qryParcelas_FB);
                           ParamByName('PIDCONTRATOEMPTMO').AsFloat  := qryContratoIDCONTRATOEMPTMO.AsFloat;
                           ParamByName('PHMEDATAINI').AsDateTime     := dDataAnt + 1;
                           ParamByName('PHMEDATAFIM').AsDateTime     := dDataAtu;

                           Open;
                        end;

                        with qryEncargos_CR do
                        begin
                           LimpaParametros(qryEncargos_CR);
                           ParamByName('PIDCONTRATOEMPTMO').AsFloat  := qryContratoIDCONTRATOEMPTMO.AsFloat;
                           ParamByName('PHMEDATAINI').AsDateTime     := dDataAnt + 1;
                           ParamByName('PHMEDATAFIM').AsDateTime     := dDataAtu;
                           ParamByName('PAPROPIADO').AsInteger       := Ord(chkApropriado.Checked);

                           Open;
                        end;

                        with qryEncargos_FP do
                        begin
                           LimpaParametros(qryEncargos_FP);
                           ParamByName('PIDCONTRATOEMPTMO').AsFloat  := qryContratoIDCONTRATOEMPTMO.AsFloat;
                           ParamByName('PHMEDATAINI').AsDateTime     := dDataAnt + 1;
                           ParamByName('PHMEDATAFIM').AsDateTime     := dDataAtu;
                           ParamByName('PAPROPIADO').AsInteger       := Ord(chkApropriado.Checked);

                           Open;
                        end;

                        with qryEncargos_FB do
                        begin
                           LimpaParametros(qryEncargos_FB);
                           ParamByName('PIDCONTRATOEMPTMO').AsFloat  := qryContratoIDCONTRATOEMPTMO.AsFloat;
                           ParamByName('PHMEDATAINI').AsDateTime     := dDataAnt + 1;
                           ParamByName('PHMEDATAFIM').AsDateTime     := dDataAtu;
                           ParamByName('PAPROPIADO').AsInteger       := Ord(chkApropriado.Checked);

                           Open;
                        end;

                        with qryAmort_CR do
                        begin
                           LimpaParametros(qryAmort_CR);
                           ParamByName('PIDCONTRATOEMPTMO').AsFloat  := qryContratoIDCONTRATOEMPTMO.AsFloat;
                           ParamByName('PHMEDATAINI').AsDateTime     := dDataAnt + 1;
                           ParamByName('PHMEDATAFIM').AsDateTime     := dDataAtu;

                           Open;
                        end;

                        with qryAmort_FP do
                        begin
                           LimpaParametros(qryAmort_FP);
                           ParamByName('PIDCONTRATOEMPTMO').AsFloat  := qryContratoIDCONTRATOEMPTMO.AsFloat;
                           ParamByName('PHMEDATAINI').AsDateTime     := dDataAnt + 1;
                           ParamByName('PHMEDATAFIM').AsDateTime     := dDataAtu;

                           Open;
                        end;

                        with qryAmort_FB do
                        begin
                           LimpaParametros(qryAmort_FB);
                           ParamByName('PIDCONTRATOEMPTMO').AsFloat  := qryContratoIDCONTRATOEMPTMO.AsFloat;
                           ParamByName('PHMEDATAINI').AsDateTime     := dDataAnt + 1;
                           ParamByName('PHMEDATAFIM').AsDateTime     := dDataAtu;

                           Open;
                        end;

                        with qryQuitacao_CR do
                        begin
                           LimpaParametros(qryQuitacao_CR);
                           ParamByName('PIDCONTRATOEMPTMO').AsFloat  := qryContratoIDCONTRATOEMPTMO.AsFloat;
                           ParamByName('PHMEDATAINI').AsDateTime     := dDataAnt + 1;
                           ParamByName('PHMEDATAFIM').AsDateTime     := dDataAtu;
                           ParamByName('PRENOVA').AsInteger          := Ord(chkRenovacao.Checked);

                           Open;
                        end;

                        with qryQuitacao_FP do
                        begin
                           LimpaParametros(qryQuitacao_FP);
                           ParamByName('PIDCONTRATOEMPTMO').AsFloat  := qryContratoIDCONTRATOEMPTMO.AsFloat;
                           ParamByName('PHMEDATAINI').AsDateTime     := dDataAnt + 1;
                           ParamByName('PHMEDATAFIM').AsDateTime     := dDataAtu;
                           ParamByName('PRENOVA').AsInteger          := Ord(chkRenovacao.Checked);

                           Open;
                        end;

                        with qryQuitacao_FB do
                        begin
                           LimpaParametros(qryQuitacao_FB);
                           ParamByName('PIDCONTRATOEMPTMO').AsFloat  := qryContratoIDCONTRATOEMPTMO.AsFloat;
                           ParamByName('PHMEDATAINI').AsDateTime     := dDataAnt + 1;
                           ParamByName('PHMEDATAFIM').AsDateTime     := dDataAtu;
                           ParamByName('PRENOVA').AsInteger          := Ord(chkRenovacao.Checked);

                           Open;
                        end;

                        with qryRecParc_CR do
                        begin
                           LimpaParametros(qryRecParc_CR);
                           ParamByName('PIDCONTRATOEMPTMO').AsFloat  := qryContratoIDCONTRATOEMPTMO.AsFloat;
                           ParamByName('PHMEDATAINI').AsDateTime     := dDataAnt + 1;
                           ParamByName('PHMEDATAFIM').AsDateTime     := dDataAtu;

                           Open;
                        end;

                        with qryRecParc_FP do
                        begin
                           LimpaParametros(qryRecParc_FP);
                           ParamByName('PIDCONTRATOEMPTMO').AsFloat  := qryContratoIDCONTRATOEMPTMO.AsFloat;
                           ParamByName('PHMEDATAINI').AsDateTime     := dDataAnt + 1;
                           ParamByName('PHMEDATAFIM').AsDateTime     := dDataAtu;

                           Open;
                        end;

                        with qryRecParc_FB do
                        begin
                           LimpaParametros(qryRecParc_FB);
                           ParamByName('PIDCONTRATOEMPTMO').AsFloat  := qryContratoIDCONTRATOEMPTMO.AsFloat;
                           ParamByName('PHMEDATAINI').AsDateTime     := dDataAnt + 1;
                           ParamByName('PHMEDATAFIM').AsDateTime     := dDataAtu;

                           Open;
                        end;

                        with qryRecEnc_CR do
                        begin
                           LimpaParametros(qryRecEnc_CR);
                           ParamByName('PIDCONTRATOEMPTMO').AsFloat  := qryContratoIDCONTRATOEMPTMO.AsFloat;
                           ParamByName('PHMEDATAINI').AsDateTime     := dDataAnt + 1;
                           ParamByName('PHMEDATAFIM').AsDateTime     := dDataAtu;

                           Open;
                        end;

                        with qryRecEnc_FP do
                        begin
                           LimpaParametros(qryRecEnc_FP);
                           ParamByName('PIDCONTRATOEMPTMO').AsFloat  := qryContratoIDCONTRATOEMPTMO.AsFloat;
                           ParamByName('PHMEDATAINI').AsDateTime     := dDataAnt + 1;
                           ParamByName('PHMEDATAFIM').AsDateTime     := dDataAtu;

                           Open;
                        end;

                        with qryRecEnc_FB do
                        begin
                           LimpaParametros(qryRecEnc_FB);
                           ParamByName('PIDCONTRATOEMPTMO').AsFloat  := qryContratoIDCONTRATOEMPTMO.AsFloat;
                           ParamByName('PHMEDATAINI').AsDateTime     := dDataAnt + 1;
                           ParamByName('PHMEDATAFIM').AsDateTime     := dDataAtu;

                           Open;
                        end;

                        with qryRecAmort_CR do
                        begin
                           LimpaParametros(qryRecAmort_CR);
                           ParamByName('PIDCONTRATOEMPTMO').AsFloat  := qryContratoIDCONTRATOEMPTMO.AsFloat;
                           ParamByName('PHMEDATAINI').AsDateTime     := dDataAnt + 1;
                           ParamByName('PHMEDATAFIM').AsDateTime     := dDataAtu;

                           Open;
                        end;

                        with qryRecAmort_FP do
                        begin
                           LimpaParametros(qryRecAmort_FP);
                           ParamByName('PIDCONTRATOEMPTMO').AsFloat  := qryContratoIDCONTRATOEMPTMO.AsFloat;
                           ParamByName('PHMEDATAINI').AsDateTime     := dDataAnt + 1;
                           ParamByName('PHMEDATAFIM').AsDateTime     := dDataAtu;

                           Open;
                        end;

                        with qryRecAmort_FB do
                        begin
                           LimpaParametros(qryRecAmort_FB);
                           ParamByName('PIDCONTRATOEMPTMO').AsFloat  := qryContratoIDCONTRATOEMPTMO.AsFloat;
                           ParamByName('PHMEDATAINI').AsDateTime     := dDataAnt + 1;
                           ParamByName('PHMEDATAFIM').AsDateTime     := dDataAtu;

                           Open;
                        end;

                        with qryRecQuit_CR do
                        begin
                           LimpaParametros(qryRecQuit_CR);
                           ParamByName('PIDCONTRATOEMPTMO').AsFloat  := qryContratoIDCONTRATOEMPTMO.AsFloat;
                           ParamByName('PHMEDATAINI').AsDateTime     := dDataAnt + 1;
                           ParamByName('PHMEDATAFIM').AsDateTime     := dDataAtu;
                           ParamByName('PRENOVA').AsInteger          := Ord(chkRenovacao.Checked);

                           Open;
                        end;

                        with qryRecQuit_FP do
                        begin
                           LimpaParametros(qryRecQuit_FP);
                           ParamByName('PIDCONTRATOEMPTMO').AsFloat  := qryContratoIDCONTRATOEMPTMO.AsFloat;
                           ParamByName('PHMEDATAINI').AsDateTime     := dDataAnt + 1;
                           ParamByName('PHMEDATAFIM').AsDateTime     := dDataAtu;
                           ParamByName('PRENOVA').AsInteger          := Ord(chkRenovacao.Checked);

                           Open;
                        end;

                        with qryRecQuit_FB do
                        begin
                           LimpaParametros(qryRecQuit_FB);
                           ParamByName('PIDCONTRATOEMPTMO').AsFloat  := qryContratoIDCONTRATOEMPTMO.AsFloat;
                           ParamByName('PHMEDATAINI').AsDateTime     := dDataAnt + 1;
                           ParamByName('PHMEDATAFIM').AsDateTime     := dDataAtu;
                           ParamByName('PRENOVA').AsInteger          := Ord(chkRenovacao.Checked);

                           Open;
                        end;

                        with qryItensAbonados do
                        begin
                           LimpaParametros(qryItensAbonados);
                           ParamByName('PIDCONTRATOEMPTMO').AsFloat  := qryContratoIDCONTRATOEMPTMO.AsFloat;
                           ParamByName('PHMEDATAINI').AsDateTime     := dDataAnt + 1;
                           ParamByName('PHMEDATAFIM').AsDateTime     := dDataAtu;
                           ParamByName('PABONOCONTAB').AsInteger     := Ord(chkAbonoContab.Checked);

                           Open;
                        end;

                        with qryItensQuitados do
                        begin
                           LimpaParametros(qryItensQuitados);
                           ParamByName('PIDCONTRATOEMPTMO').AsFloat  := qryContratoIDCONTRATOEMPTMO.AsFloat;
                           ParamByName('PHMEDATAINI').AsDateTime     := dDataAnt + 1;
                           ParamByName('PHMEDATAFIM').AsDateTime     := dDataAtu;

                           Open;
                        end;

                        bGrava      := ( qrySaldoAntSALDO_ANT.AsCurrency <> 0 )      or
                                       ( qryParcelas_CRPARCELAS.AsCurrency <> 0 )    or
                                       ( qryParcelas_FPPARCELAS.AsCurrency <> 0 )    or
                                       ( qryParcelas_FBPARCELAS.AsCurrency <> 0 )    or
                                       ( qryEncargos_CRENCARGOS_CR.AsCurrency <> 0 ) or
                                       ( qryEncargos_FPENCARGOS_FP.AsCurrency <> 0 ) or
                                       ( qryEncargos_FBENCARGOS_FB.AsCurrency <> 0 ) or
                                       ( qryAmort_CRAMORTIZACAO_CR.AsCurrency <> 0 ) or
                                       ( qryAmort_FPAMORTIZACAO_FP.AsCurrency <> 0 ) or
                                       ( qryAmort_FBAMORTIZACAO_FB.AsCurrency <> 0 ) or
                                       ( qryQuitacao_CRQUITACAO_CR.AsCurrency <> 0 ) or
                                       ( qryQuitacao_FPQUITACAO_FP.AsCurrency <> 0 ) or
                                       ( qryQuitacao_FBQUITACAO_FB.AsCurrency <> 0 ) or
                                       ( qryRecParc_CRREC_PARC.AsCurrency <> 0 )     or
                                       ( qryRecParc_FPREC_PARC.AsCurrency <> 0 )     or
                                       ( qryRecParc_FBREC_PARC.AsCurrency <> 0 )     or
                                       ( qryRecEnc_CRREC_ENC.AsCurrency <> 0 )       or
                                       ( qryRecEnc_FPREC_ENC.AsCurrency <> 0 )       or
                                       ( qryRecEnc_FBREC_ENC.AsCurrency <> 0 )       or
                                       ( qryRecAmort_CRREC_AMORT.AsCurrency <> 0 )   or
                                       ( qryRecAmort_FPREC_AMORT.AsCurrency <> 0 )   or
                                       ( qryRecAmort_FBREC_AMORT.AsCurrency <> 0 )   or
                                       ( qryRecQuit_CRREC_QUIT.AsCurrency <> 0 )     or
                                       ( qryRecQuit_FPREC_QUIT.AsCurrency <> 0 )     or
                                       ( qryRecQuit_FBREC_QUIT.AsCurrency <> 0 )     or
                                       ( qryItensAbonadosABONADO.AsCurrency <> 0 )   or
                                       ( qryItensQuitadosQUITADO.AsCurrency <> 0 )   or
                                       ( qrySaldoAtuSALDO_DEV.AsCurrency <> 0);

                        // -------------------------------------------------------------------------

                        if bGrava then
                        begin
                           // ----------------------------------------------------------------------
                           with dtmRelFechamentoCarteiraLinear do
                           begin

                              if not qryFechamentoCarteiraCaixa.Locate('DESCTIPOEMPTMO;TCEDESCRICAO',
                                                                        VarArrayOf([qryContratoDESCTIPOEMPTMO.AsString,qryContratoTCEDESCRICAO.AsString]),[]) then
                              begin
                                 qryFechamentoCarteiraCaixa.Append;
                                 qryFechamentoCarteiraCaixaDESCTIPOEMPTMO.AsString      := qryContratoDESCTIPOEMPTMO.AsString;
                                 qryFechamentoCarteiraCaixaTCEDESCRICAO.AsString        := qryContratoTCEDESCRICAO.AsString;
                              end
                              else
                                 qryFechamentoCarteiraCaixa.Edit;
   
                              qryFechamentoCarteiraCaixaSALDO_ANT.Value                :=  qryFechamentoCarteiraCaixaSALDO_ANT.Value         +  qrySaldoAntSALDO_ANT.Value;
                              qryFechamentoCarteiraCaixaTOTALSALDO_ANT.Value           :=  qryFechamentoCarteiraCaixaTOTALSALDO_ANT.Value    +  qrySaldoAntTOTALSALDO_ANT.Value;

                              qryFechamentoCarteiraCaixaPARCELAS_CR.Value              :=  qryFechamentoCarteiraCaixaPARCELAS_CR.Value       +  qryParcelas_CRPARCELAS.Value;
                              qryFechamentoCarteiraCaixaTOTALPARC_CR.Value             :=  qryFechamentoCarteiraCaixaTOTALPARC_CR.Value      +  qryParcelas_CRTOTALPARC.Value;
                              qryFechamentoCarteiraCaixaPARCELAS_FP.Value              :=  qryFechamentoCarteiraCaixaPARCELAS_FP.Value       +  qryParcelas_FPPARCELAS.Value;
                              qryFechamentoCarteiraCaixaTOTALPARC_FP.Value             :=  qryFechamentoCarteiraCaixaTOTALPARC_FP.Value      +  qryParcelas_FPTOTALPARC.Value;
                              qryFechamentoCarteiraCaixaPARCELAS_FB.Value              :=  qryFechamentoCarteiraCaixaPARCELAS_FB.Value       +  qryParcelas_FBPARCELAS.Value;
                              qryFechamentoCarteiraCaixaTOTALPARC_FB.Value             :=  qryFechamentoCarteiraCaixaTOTALPARC_FB.Value      +  qryParcelas_FBTOTALPARC.Value;
                              qryFechamentoCarteiraCaixaENCARGOS_CR.Value              :=  qryFechamentoCarteiraCaixaENCARGOS_CR.Value       +  qryEncargos_CRENCARGOS_CR.Value;
                              qryFechamentoCarteiraCaixaTOTALENC_CR.Value              :=  qryFechamentoCarteiraCaixaTOTALENC_CR.Value       +  qryEncargos_CRTOTALENC_CR.Value;
                              qryFechamentoCarteiraCaixaENCARGOS_FP.Value              :=  qryFechamentoCarteiraCaixaENCARGOS_FP.Value       +  qryEncargos_FPENCARGOS_FP.Value;
                              qryFechamentoCarteiraCaixaTOTALENC_FP.Value              :=  qryFechamentoCarteiraCaixaTOTALENC_FP.Value       +  qryEncargos_FPTOTALENC_FP.Value;
                              qryFechamentoCarteiraCaixaENCARGOS_FB.Value              :=  qryFechamentoCarteiraCaixaENCARGOS_FB.Value       +  qryEncargos_FBENCARGOS_FB.Value;
                              qryFechamentoCarteiraCaixaTOTALENC_FB.Value              :=  qryFechamentoCarteiraCaixaTOTALENC_FB.Value       +  qryEncargos_FBTOTALENC_FB.Value;
                              qryFechamentoCarteiraCaixaAMORTIZACAO_CR.Value           :=  qryFechamentoCarteiraCaixaAMORTIZACAO_CR.Value    +  qryAmort_CRAMORTIZACAO_CR.Value;
                              qryFechamentoCarteiraCaixaTOTALAMO_CR.Value              :=  qryFechamentoCarteiraCaixaTOTALAMO_CR.Value       +  qryAmort_CRTOTALAMO_CR.Value;
                              qryFechamentoCarteiraCaixaAMORTIZACAO_FP.Value           :=  qryFechamentoCarteiraCaixaAMORTIZACAO_FP.Value    +  qryAmort_FPAMORTIZACAO_FP.Value;
                              qryFechamentoCarteiraCaixaTOTALAMO_FP.Value              :=  qryFechamentoCarteiraCaixaTOTALAMO_FP.Value       +  qryAmort_FPTOTALAMO_FP.Value;
                              qryFechamentoCarteiraCaixaAMORTIZACAO_FB.Value           :=  qryFechamentoCarteiraCaixaAMORTIZACAO_FB.Value    +  qryAmort_FBAMORTIZACAO_FB.Value;
                              qryFechamentoCarteiraCaixaTOTALAMO_FB.Value              :=  qryFechamentoCarteiraCaixaTOTALAMO_FB.Value       +  qryAmort_FBTOTALAMO_FB.Value;
                              qryFechamentoCarteiraCaixaQUITACAO_CR.Value              :=  qryFechamentoCarteiraCaixaQUITACAO_CR.Value       +  qryQuitacao_CRQUITACAO_CR.Value;
                              qryFechamentoCarteiraCaixaTOTALQUI_CR.Value              :=  qryFechamentoCarteiraCaixaTOTALQUI_CR.Value       +  qryQuitacao_CRTOTALQUI_CR.Value;
                              qryFechamentoCarteiraCaixaQUITACAO_FP.Value              :=  qryFechamentoCarteiraCaixaQUITACAO_FP.Value       +  qryQuitacao_FPQUITACAO_FP.Value;
                              qryFechamentoCarteiraCaixaTOTALQUI_FP.Value              :=  qryFechamentoCarteiraCaixaTOTALQUI_FP.Value       +  qryQuitacao_FPTOTALQUI_FP.Value;
                              qryFechamentoCarteiraCaixaQUITACAO_FB.Value              :=  qryFechamentoCarteiraCaixaQUITACAO_FB.Value       +  qryQuitacao_FBQUITACAO_FB.Value;
                              qryFechamentoCarteiraCaixaTOTALQUI_FB.Value              :=  qryFechamentoCarteiraCaixaTOTALQUI_FB.Value       +  qryQuitacao_FBTOTALQUI_FB.Value;
                              qryFechamentoCarteiraCaixaREC_PARC_CR.Value              :=  qryFechamentoCarteiraCaixaREC_PARC_CR.Value       +  qryRecParc_CRREC_PARC.Value;
                              qryFechamentoCarteiraCaixaTOT_REC_PARC_CR.Value          :=  qryFechamentoCarteiraCaixaTOT_REC_PARC_CR.Value   +  qryRecParc_CRTOT_REC_PARC.Value;
                              qryFechamentoCarteiraCaixaREC_PARC_FP.Value              :=  qryFechamentoCarteiraCaixaREC_PARC_FP.Value       +  qryRecParc_FPREC_PARC.Value;
                              qryFechamentoCarteiraCaixaTOT_REC_PARC_FP.Value          :=  qryFechamentoCarteiraCaixaTOT_REC_PARC_FP.Value   +  qryRecParc_FPTOT_REC_PARC.Value;
                              qryFechamentoCarteiraCaixaREC_PARC_FB.Value              :=  qryFechamentoCarteiraCaixaREC_PARC_FB.Value       +  qryRecParc_FBREC_PARC.Value;
                              qryFechamentoCarteiraCaixaTOT_REC_PARC_FB.Value          :=  qryFechamentoCarteiraCaixaTOT_REC_PARC_FB.Value   +  qryRecParc_FBTOT_REC_PARC.Value;
                              qryFechamentoCarteiraCaixaREC_ENC_CR.Value               :=  qryFechamentoCarteiraCaixaREC_ENC_CR.Value        +  qryRecEnc_CRREC_ENC.Value;
                              qryFechamentoCarteiraCaixaTOT_REC_ENC_CR.Value           :=  qryFechamentoCarteiraCaixaTOT_REC_ENC_CR.Value    +  qryRecEnc_CRTOT_REC_ENC.Value;
                              qryFechamentoCarteiraCaixaREC_ENC_FP.Value               :=  qryFechamentoCarteiraCaixaREC_ENC_FP.Value        +  qryRecEnc_FPREC_ENC.Value;
                              qryFechamentoCarteiraCaixaTOT_REC_ENC_FP.Value           :=  qryFechamentoCarteiraCaixaTOT_REC_ENC_FP.Value    +  qryRecEnc_FPTOT_REC_ENC.Value;
                              qryFechamentoCarteiraCaixaREC_ENC_FB.Value               :=  qryFechamentoCarteiraCaixaREC_ENC_FB.Value        +  qryRecEnc_FBREC_ENC.Value;
                              qryFechamentoCarteiraCaixaTOT_REC_ENC_FB.Value           :=  qryFechamentoCarteiraCaixaTOT_REC_ENC_FB.Value    +  qryRecEnc_FBTOT_REC_ENC.Value;
                              qryFechamentoCarteiraCaixaREC_AMORT_CR.Value             :=  qryFechamentoCarteiraCaixaREC_AMORT_CR.Value      +  qryRecAmort_CRREC_AMORT.Value;
                              qryFechamentoCarteiraCaixaTOT_REC_AMORT_CR.Value         :=  qryFechamentoCarteiraCaixaTOT_REC_AMORT_CR.Value  +  qryRecAmort_CRTOT_REC_AMORT.Value;
                              qryFechamentoCarteiraCaixaREC_AMORT_FP.Value             :=  qryFechamentoCarteiraCaixaREC_AMORT_FP.Value      +  qryRecAmort_FPREC_AMORT.Value;
                              qryFechamentoCarteiraCaixaTOT_REC_AMORT_FP.Value         :=  qryFechamentoCarteiraCaixaTOT_REC_AMORT_FP.Value  +  qryRecAmort_FPTOT_REC_AMORT.Value;
                              qryFechamentoCarteiraCaixaREC_AMORT_FB.Value             :=  qryFechamentoCarteiraCaixaREC_AMORT_FB.Value      +  qryRecAmort_FBREC_AMORT.Value;
                              qryFechamentoCarteiraCaixaTOT_REC_AMORT_FB.Value         :=  qryFechamentoCarteiraCaixaTOT_REC_AMORT_FB.Value  +  qryRecAmort_FBTOT_REC_AMORT.Value;
                              qryFechamentoCarteiraCaixaREC_QUIT_CR.Value              :=  qryFechamentoCarteiraCaixaREC_QUIT_CR.Value       +  qryRecQuit_CRREC_QUIT.Value;
                              qryFechamentoCarteiraCaixaTOT_REC_QUIT_CR.Value          :=  qryFechamentoCarteiraCaixaTOT_REC_QUIT_CR.Value   +  qryRecQuit_CRTOT_REC_QUIT.Value;
                              qryFechamentoCarteiraCaixaREC_QUIT_FP.Value              :=  qryFechamentoCarteiraCaixaREC_QUIT_FP.Value       +  qryRecQuit_FPREC_QUIT.Value;
                              qryFechamentoCarteiraCaixaTOT_REC_QUIT_FP.Value          :=  qryFechamentoCarteiraCaixaTOT_REC_QUIT_FP.Value   +  qryRecQuit_FPTOT_REC_QUIT.Value;
                              qryFechamentoCarteiraCaixaREC_QUIT_FB.Value              :=  qryFechamentoCarteiraCaixaREC_QUIT_FB.Value       +  qryRecQuit_FBREC_QUIT.Value;
                              qryFechamentoCarteiraCaixaTOT_REC_QUIT_FB.Value          :=  qryFechamentoCarteiraCaixaTOT_REC_QUIT_FB.Value   +  qryRecQuit_FBTOT_REC_QUIT.Value;
                                                                                                                                             
                              qryFechamentoCarteiraCaixaABONADO.Value                  :=  qryFechamentoCarteiraCaixaABONADO.Value           +  qryItensAbonadosABONADO.Value;
                              qryFechamentoCarteiraCaixaTOT_ABONADO.Value              :=  qryFechamentoCarteiraCaixaTOT_ABONADO.Value       +  qryItensAbonadosTOT_ABONADO.Value;

                              qryFechamentoCarteiraCaixaQUITADO.Value                  :=  qryFechamentoCarteiraCaixaQUITADO.Value           +  qryItensQuitadosQUITADO.Value;
                              qryFechamentoCarteiraCaixaTOT_QUITADO.Value              :=  qryFechamentoCarteiraCaixaTOT_QUITADO.Value       +  qryItensQuitadosTOT_QUITADO.Value;

                              qryFechamentoCarteiraCaixaSALDO_DEV.Value                :=  qryFechamentoCarteiraCaixaSALDO_DEV.Value         +  qrySaldoAtuSALDO_DEV.Value;
                              qryFechamentoCarteiraCaixaTOTALSALDO_DEV.Value           :=  qryFechamentoCarteiraCaixaTOTALSALDO_DEV.Value    +  qrySaldoAtuTOTALSALDO_DEV.Value;

                              qryFechamentoCarteiraCaixa.Post;
                           end;

                           // ----------------------------------------------------------------------

                           inc(iRegistro);

                           // ----------------------------------------------------------------------
                        end;  // if bGrava

                        qryContrato.Next;

                        inc(iContadorBaixo);

                        frmProgressoDuplo.AndaFormProgressoDuplo(iContadorCima, iContadorBaixo);
                     end;
                     // ----------------------------------------------------------------------------

                     inc(iContadorCima);
                     frmProgressoDuplo.AndaFormProgressoDuplo(iContadorCima, 0);

                     qryLookTipoContr.Next;
                  end;  // while not(qryLookTipoContr.EOF)
               end
               else    // if molListaPatro.lstPatro.Checked
               begin
                  iContadorCima := iContadorCima + iQuantTipoContr;
                  frmProgressoDuplo.AndaFormProgressoDuplo(iContadorCima, 0);
               end;  // if molListaPatro.lstPatro.Checked
            end;  // for(Patro)
         end
         else  // if molListaPlano.lstPlano.Checked
         begin
            iContadorCima := iContadorCima + (molListaPatro.lstPatro.Items.Count * iQuantTipoContr);
            frmProgressoDuplo.AndaFormProgressoDuplo(iContadorCima, 0);
         end;  // if molListaPlano.lstPlano.Checked
      end;  // for(Plano)
      // -------------------------------------------------------------------------------------------
      // FIM dos loops
      // -------------------------------------------------------------------------------------------

   finally
      frmProgressoDuplo.EscondeFormProgressoDuplo;
   end;
end;




end.
