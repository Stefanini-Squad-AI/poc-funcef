unit cRelFechaCarteiraLinearPP;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   CRel, fcCombo, fcColorCombo, StdCtrls, Mask, wwdbedit, Wwdbspin,
   wwdblook, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97,
   ExtCtrls, Db, mContratoEmptmo, DBTables, Wwquery, mListaPlano,
   mListaPatro;

type
   TcfgRelFechaCarteiraLinearPP = class(TcfgRel)
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
      molListaPatro: TmolListaPatro;
      molListaPlano: TmolListaPlano;
      qryTipoContrato: TwwQuery;
      qryTipoContratoIDTIPOEMPTMO: TFloatField;
      qryTipoContratoDESCTIPOEMPTMO: TStringField;
      qryTipoContratoIDTIPOCONTREMPTMO: TFloatField;
      qryTipoContratoTCEDESCRICAO: TStringField;
      qrySaldoAnt: TwwQuery;
      qrySaldoAntSALDODEV: TFloatField;
      qryQuantSaldoAnt: TwwQuery;
      qryQuantSaldoAntTOTALSLDDEV: TFloatField;
      qryConcessoes: TwwQuery;
      qryConcessoesCONCESSOES: TFloatField;
      qryQuantConcessoes: TwwQuery;
      qryQuantConcessoesTOTALCONCESSOES: TFloatField;
      qrySaldoAtu: TwwQuery;
      qrySaldoAtuSALDODEV: TFloatField;
      qryQuantSaldoAtu: TwwQuery;
      qryQuantSaldoAtuTOTALSLDDEV: TFloatField;
      qryParcelas_CR: TwwQuery;
      qryQuantParcelas_CR: TwwQuery;
      qryParcelas_FP: TwwQuery;
      qryParcelas_FB: TwwQuery;
      qryQuantParcelas_FP: TwwQuery;
      qryQuantParcelas_FB: TwwQuery;
      qryEncargos_CR: TwwQuery;
      qryQuantEncargos_CR: TwwQuery;
      qryEncargos_FP: TwwQuery;
      qryEncargos_FB: TwwQuery;
      qryQuantEncargos_FP: TwwQuery;
      qryAmort_CR: TwwQuery;
      qryQuantAmort_CR: TwwQuery;
      qryAmort_FP: TwwQuery;
      qryQuantAmort_FP: TwwQuery;
      qryAmort_FB: TwwQuery;
      qryQuantAmort_FB: TwwQuery;
      qryQuit_CR: TwwQuery;
      qryQuit_FP: TwwQuery;
      qryQuit_FB: TwwQuery;
      qryQuantQuit_CR: TwwQuery;
      qryQuantQuit_FP: TwwQuery;
      qryQuantQuit_FB: TwwQuery;
      qryAbonados: TwwQuery;
      qryParcAtras_CR: TwwQuery;
      qryParcAtras_FP: TwwQuery;
      qryParcAtras_FB: TwwQuery;
      qryQuantEncargos_FB: TwwQuery;
      qryParcelas_CRPARCELAS_CR: TFloatField;
      qryQuantParcelas_CRTOTALPARC_CR: TFloatField;
      qryParcelas_FPPARCELAS_FP: TFloatField;
      qryQuantParcelas_FPTOTALPARC_FP: TFloatField;
      qryParcelas_FBPARCELAS_FB: TFloatField;
      qryQuantParcelas_FBTOTALPARC_FB: TFloatField;
      qryEncargos_CRENCARGOS_CR: TFloatField;
      qryQuantEncargos_CRTOTALENC_CR: TFloatField;
      qryEncargos_FPENCARGOS_FP: TFloatField;
      qryQuantEncargos_FPTOTALENC_FP: TFloatField;
      qryEncargos_FBENCARGOS_FB: TFloatField;
      qryQuantEncargos_FBTOTALENC_FB: TFloatField;
      qryAmort_CRAMORT_CR: TFloatField;
      qryQuantAmort_CRTOTALAMORT_CR: TFloatField;
      qryAmort_FPAMORT_FP: TFloatField;
      qryQuantAmort_FPTOTALAMORT_FP: TFloatField;
      qryAmort_FBAMORT_FB: TFloatField;
      qryQuantAmort_FBTOTALAMORT_FB: TFloatField;
      qryQuit_CRQUIT_CR: TFloatField;
      qryQuantQuit_CRTOTALQUIT_CR: TFloatField;
      qryQuit_FPQUIT_FP: TFloatField;
      qryQuantQuit_FPTOTALQUIT_FP: TFloatField;
      qryQuit_FBQUIT_FB: TFloatField;
      qryQuantQuit_FBTOTALQUIT_FB: TFloatField;
      qryAbonadosIDTIPOCONTREMPTMO: TFloatField;
      qryAbonadosABONADOS: TFloatField;
      qryAbonadosTOT_ABONADOS: TFloatField;
      qryParcAtras_CRIDTIPOCONTREMPTMO: TFloatField;
      qryParcAtras_CRREC_PARC_ATRAS: TFloatField;
      qryParcAtras_CRTOT_REC_PARC_ATRAS: TFloatField;
      qryParcAtras_FPIDTIPOCONTREMPTMO: TFloatField;
      qryParcAtras_FPREC_PARC_ATRAS: TFloatField;
      qryParcAtras_FPTOT_REC_PARC_ATRAS: TFloatField;
      qryParcAtras_FBIDTIPOCONTREMPTMO: TFloatField;
      qryParcAtras_FBREC_PARC_ATRAS: TFloatField;
      qryParcAtras_FBTOT_REC_PARC_ATRAS: TFloatField;
    chkImprimeCobranca: TCheckBox;
    Label3: TLabel;

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


   public   // Public declarations


   end;



var
  cfgRelFechaCarteiraLinearPP: TcfgRelFechaCarteiraLinearPP;



implementation
{$R *.DFM}
uses
   DLookEmptmo,
   UDiasUteis,
   UMensErro,
   USistema,
   UfuncoesEmptmo,
//   fProgressoDuplo,
   dRelFechaCarteiraLinearPP;




procedure TcfgRelFechaCarteiraLinearPP.AbreQueries;
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



procedure TcfgRelFechaCarteiraLinearPP.MontaQuery;
begin
   inherited;

   with dtmRelFechaCarteiraLinearPP do
   begin
      sMesCompetencia   := cboMes.Text + ' / ' + DBspnAno.Text;

      bSeparador        := chkLinhas.Checked;

      // -------------------------------------------------------------------------------------------

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

   FiltraRelatorio;
end;



procedure TcfgRelFechaCarteiraLinearPP.FiltraRelatorio;
var
   dDataAtu       : TDateTime;
   dDataAnt       : TDateTime;
   dDataIni       : TDateTime;
   dDataFim       : TDateTime;
   iAnoAtu        : Integer;
   iMesAtu        : Integer;
   iAnoAnt        : Integer;
   iMesAnt        : Integer;
   iPatro         : Integer;
   iPlano         : Integer;
   iContadorPatro : Integer;
   iContadorPlano : Integer;
   sAno           : String;
   sMes           : String;
   fSoma          : Extended;
   fGrava         : Boolean;
begin

   iAnoAtu  := trunc(DBspnAno.Value);
   iMesAtu  := (cboMes.ItemIndex + 1);

   dDataIni := EncodeDate(trunc(DBspnAno.Value), (cboMes.ItemIndex + 1), 1);
   dDataFim := DiasUteis.UltDiaMes(trunc(DBspnAno.Value), (cboMes.ItemIndex + 1));
   dDataAtu := DiasUteis.UltDiaMes(trunc(DBspnAno.Value), (cboMes.ItemIndex + 1));


   sAno     := IntToStr(iAnoAtu);
   sMes     := IntToStr(iMesAtu);

   if Length(sMes) = 1 then sMes := '0' + sMes;

   dDataAnt := EncodeDate(trunc(DBspnAno.Value), (cboMes.ItemIndex + 1), 1);
   dDataAnt := DiasUteis.SomaMeses(dDataAnt, -1);
   dDataAnt := DiasUteis.UltDiaMes(DiasUteis.ExtraiAno(dDataAnt), DiasUteis.ExtraiMes(dDataAnt));

   iAnoAnt  := DiasUteis.ExtraiAno(dDataAnt);
   iMesAnt  := DiasUteis.ExtraiMes(dDataAnt);

   dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPP.Close;
   dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPP.Open;


   try
      // ----------------------------------------------------------------------------------------------
      // Faz TRÊS loops aninhados: por Plano, por Patro e por Tipo de Contrato
      // ----------------------------------------------------------------------------------------------
//      frmProgressoDuplo.MostraFormProgressoDuplo('Processando Planos',                 // Legenda de cima
//                                                 'Processando Patrocinadoras',         // Legenda de Baixo
//                                                 0,                                    // Mínimo de cima
//                                                 0,                                    // Mínimo de baixo
//                                                 molListaPlano.lstPlano.Items.Count,   // Máximo de cima
//                                                 molListaPatro.lstPatro.Items.Count,   // Máximo de baixo
//                                                 False,
//                                                 False
//                                                );

      for iContadorPlano := 0 to (molListaPlano.lstPlano.Items.Count - 1) do
      begin
         if molListaPlano.lstPlano.Checked[iContadorPlano] then
         begin
            // -------------------------------------------------------------------------------------
            for iContadorPatro := 0 to (molListaPatro.lstPatro.Items.Count - 1) do
            begin
               if molListaPatro.lstPatro.Checked[iContadorPatro] then
               begin
                  // -------------------------------------------------------------------------------
                  // Abre a query de tipos de contrato (aqui por que pode ser filtrada por plano
                  // -------------------------------------------------------------------------------
                  LimpaParametros(qryTipoContrato);
                  qryTipoContrato.ParamByName('PIDEMPRESAPROP').AsInteger           := Sistema.IDEmpresa;

                  if molContratoEmptmo.IDContrato > 0 then
                  begin
                     qryTipoContrato.ParamByName('PIDTIPOCONTREMPTMO').AsInteger    := molContratoEmptmo.IDTipoContr;
                  end
                  else
                  begin
                     if DBcboTipoEmptmo.LookupValue <> '' then
                        qryTipoContrato.ParamByName('PIDTIPOEMPTMO').AsInteger      := StrToInt(DBcboTipoEmptmo.LookupValue);

                     if DBcboTipoContr.LookupValue <> '' then
                        qryTipoContrato.ParamByName('PIDTIPOCONTREMPTMO').AsInteger := StrToInt(DBcboTipoContr.LookupValue);

                     qryTipoContrato.ParamByName('PIDPLANOPREV').AsInteger          := molListaPlano.vIDPlano[iContadorPlano];
                  end;

                  qryTipoContrato.Open;
                  // -------------------------------------------------------------------------------
                  while not(qryTipoContrato.EOF) do
                  begin
                     dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPP.Insert;

                     dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPDESCTIPOEMPTMO.AsString  := qryTipoContratoDESCTIPOEMPTMO.AsString;
                     dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPTCEDESCRICAO.AsString    := qryTipoContratoTCEDESCRICAO.AsString;
                     dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPNOMEPLANO.AsString       := molListaPlano.lstPlano.Items[iContadorPlano];
                     dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPNOMEPATRO.AsString       := molListaPatro.lstPatro.Items[iContadorPatro];

                     // ----------------------------------------------------------------------------
                     // Saldo Anterior
                     // ----------------------------------------------------------------------------

                     LimpaParametros(qrySaldoAnt);

                     if molContratoEmptmo.IDContrato > 0 then qrySaldoAnt.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qrySaldoAnt.ParamByName('PIDPLANOPREV').AsInteger        := molListaPlano.vIDPlano[iContadorPlano];
                     qrySaldoAnt.ParamByName('PIDPATRO').AsInteger            := molListaPatro.vIDPatro[iContadorPatro];
                     qrySaldoAnt.ParamByName('PIDTIPOCONTREMPTMO').AsInteger  := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qrySaldoAnt.ParamByName('PHMEDATAATUALIZA').AsDate       := dDataAnt;
                     qrySaldoAnt.ParamByName('PHMEANOCOMPETENCIA').AsInteger  := iAnoAnt;
                     qrySaldoAnt.ParamByName('PHMEMESCOMPETENCIA').AsInteger  := iMesAnt;
                     qrySaldoAnt.Open;

                     dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPSALDO_ANT.AsCurrency := qrySaldoAntSALDODEV.AsCurrency;

                     LimpaParametros(qryQuantSaldoAnt);

                     if molContratoEmptmo.IDContrato > 0 then qryQuantSaldoAnt.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qryQuantSaldoAnt.ParamByName('PIDPLANOPREV').AsInteger         := molListaPlano.vIDPlano[iContadorPlano];
                     qryQuantSaldoAnt.ParamByName('PIDPATRO').AsInteger             := molListaPatro.vIDPatro[iContadorPatro];
                     qryQuantSaldoAnt.ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qryQuantSaldoAnt.ParamByName('PHMEDATAATUALIZA').AsDate        := dDataAnt;
                     qryQuantSaldoAnt.ParamByName('PHMEANOCOMPETENCIA').AsInteger   := iAnoAnt;
                     qryQuantSaldoAnt.ParamByName('PHMEMESCOMPETENCIA').AsInteger   := iMesAnt;
                     qryQuantSaldoAnt.Open;

                     dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPTOTALSALDO_ANT.AsInteger := qryQuantSaldoAntTOTALSLDDEV.AsInteger;

                     // ----------------------------------------------------------------------------
                     // Concessões
                     // ----------------------------------------------------------------------------
                     LimpaParametros(qryConcessoes);

                     if molContratoEmptmo.IDContrato > 0 then qryConcessoes.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qryConcessoes.ParamByName('PIDPLANOPREV').AsInteger         := molListaPlano.vIDPlano[iContadorPlano];
                     qryConcessoes.ParamByName('PIDPATRO').AsInteger             := molListaPatro.vIDPatro[iContadorPatro];
                     qryConcessoes.ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qryConcessoes.ParamByName('PHMEANOCOMPETENCIA').AsInteger   := iAnoAtu;
                     qryConcessoes.ParamByName('PHMEMESCOMPETENCIA').AsInteger   := iMesAtu;
                     qryConcessoes.Open;

                     dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPCONCESSOES.AsCurrency := qryConcessoesCONCESSOES.AsCurrency;

                     LimpaParametros(qryQuantConcessoes);

                     if molContratoEmptmo.IDContrato > 0 then qryQuantConcessoes.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qryQuantConcessoes.ParamByName('PIDPLANOPREV').AsInteger         := molListaPlano.vIDPlano[iContadorPlano];
                     qryQuantConcessoes.ParamByName('PIDPATRO').AsInteger             := molListaPatro.vIDPatro[iContadorPatro];
                     qryQuantConcessoes.ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qryQuantConcessoes.ParamByName('PHMEANOCOMPETENCIA').AsInteger   := iAnoAtu;
                     qryQuantConcessoes.ParamByName('PHMEMESCOMPETENCIA').AsInteger   := iMesAtu;
                     qryQuantConcessoes.Open;

                     dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPTOTALCONCESSOES.AsInteger := qryQuantConcessoesTOTALCONCESSOES.AsInteger;

                     // ----------------------------------------------------------------------------
                     // Parcelas Geradas
                     // ----------------------------------------------------------------------------
                     LimpaParametros(qryParcelas_CR);

                     if molContratoEmptmo.IDContrato > 0 then qryParcelas_CR.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qryParcelas_CR.ParamByName('PIDPLANOPREV').AsInteger         := molListaPlano.vIDPlano[iContadorPlano];
                     qryParcelas_CR.ParamByName('PIDPATRO').AsInteger             := molListaPatro.vIDPatro[iContadorPatro];
                     qryParcelas_CR.ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qryParcelas_CR.ParamByName('PHMEANOCOMPETENCIA').AsInteger   := iAnoAtu;
                     qryParcelas_CR.ParamByName('PHMEMESCOMPETENCIA').AsInteger   := iMesAtu;
                     qryParcelas_CR.Open;

                     LimpaParametros(qryQuantParcelas_CR);

                     if molContratoEmptmo.IDContrato > 0 then qryQuantParcelas_CR.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qryQuantParcelas_CR.ParamByName('PIDPLANOPREV').AsInteger         := molListaPlano.vIDPlano[iContadorPlano];
                     qryQuantParcelas_CR.ParamByName('PIDPATRO').AsInteger             := molListaPatro.vIDPatro[iContadorPatro];
                     qryQuantParcelas_CR.ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qryQuantParcelas_CR.ParamByName('PHMEANOCOMPETENCIA').AsInteger   := iAnoAtu;
                     qryQuantParcelas_CR.ParamByName('PHMEMESCOMPETENCIA').AsInteger   := iMesAtu;
                     qryQuantParcelas_CR.Open;

                     LimpaParametros(qryParcelas_FP);

                     if molContratoEmptmo.IDContrato > 0 then qryParcelas_FP.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qryParcelas_FP.ParamByName('PIDPLANOPREV').AsInteger         := molListaPlano.vIDPlano[iContadorPlano];
                     qryParcelas_FP.ParamByName('PIDPATRO').AsInteger             := molListaPatro.vIDPatro[iContadorPatro];
                     qryParcelas_FP.ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qryParcelas_FP.ParamByName('PHMEANOCOMPETENCIA').AsInteger   := iAnoAtu;
                     qryParcelas_FP.ParamByName('PHMEMESCOMPETENCIA').AsInteger   := iMesAtu;
                     qryParcelas_FP.Open;

                     LimpaParametros(qryQuantParcelas_FP);

                     if molContratoEmptmo.IDContrato > 0 then qryQuantParcelas_FP.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qryQuantParcelas_FP.ParamByName('PIDPLANOPREV').AsInteger         := molListaPlano.vIDPlano[iContadorPlano];
                     qryQuantParcelas_FP.ParamByName('PIDPATRO').AsInteger             := molListaPatro.vIDPatro[iContadorPatro];
                     qryQuantParcelas_FP.ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qryQuantParcelas_FP.ParamByName('PHMEANOCOMPETENCIA').AsInteger   := iAnoAtu;
                     qryQuantParcelas_FP.ParamByName('PHMEMESCOMPETENCIA').AsInteger   := iMesAtu;
                     qryQuantParcelas_FP.Open;

                     LimpaParametros(qryParcelas_FB);

                     if molContratoEmptmo.IDContrato > 0 then qryParcelas_FB.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qryParcelas_FB.ParamByName('PIDPLANOPREV').AsInteger         := molListaPlano.vIDPlano[iContadorPlano];
                     qryParcelas_FB.ParamByName('PIDPATRO').AsInteger             := molListaPatro.vIDPatro[iContadorPatro];
                     qryParcelas_FB.ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qryParcelas_FB.ParamByName('PHMEANOCOMPETENCIA').AsInteger   := iAnoAtu;
                     qryParcelas_FB.ParamByName('PHMEMESCOMPETENCIA').AsInteger   := iMesAtu;
                     qryParcelas_FB.Open;

                     LimpaParametros(qryQuantParcelas_FB);

                     if molContratoEmptmo.IDContrato > 0 then qryQuantParcelas_FB.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qryQuantParcelas_FB.ParamByName('PIDPLANOPREV').AsInteger         := molListaPlano.vIDPlano[iContadorPlano];
                     qryQuantParcelas_FB.ParamByName('PIDPATRO').AsInteger             := molListaPatro.vIDPatro[iContadorPatro];
                     qryQuantParcelas_FB.ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qryQuantParcelas_FB.ParamByName('PHMEANOCOMPETENCIA').AsInteger   := iAnoAtu;
                     qryQuantParcelas_FB.ParamByName('PHMEMESCOMPETENCIA').AsInteger   := iMesAtu;
                     qryQuantParcelas_FB.Open;

                     dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPPARCELAS_CR.AsCurrency := qryParcelas_CRPARCELAS_CR.AsCurrency;
                     dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPPARCELAS_FP.AsCurrency := qryParcelas_FPPARCELAS_FP.AsCurrency;
                     dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPPARCELAS_FB.AsCurrency := qryParcelas_FBPARCELAS_FB.AsCurrency;

                     dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPTOTALPARC_CR.AsInteger := qryQuantParcelas_CRTOTALPARC_CR.AsInteger;
                     dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPTOTALPARC_FP.AsInteger := qryQuantParcelas_FPTOTALPARC_FP.AsInteger;
                     dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPTOTALPARC_FB.AsInteger := qryQuantParcelas_FBTOTALPARC_FB.AsInteger;

                     // ----------------------------------------------------------------------------
                     // Encargos Geradas
                     // ----------------------------------------------------------------------------
                     LimpaParametros(qryEncargos_CR);

                     if molContratoEmptmo.IDContrato > 0 then qryEncargos_CR.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qryEncargos_CR.ParamByName('PIDPLANOPREV').AsInteger         := molListaPlano.vIDPlano[iContadorPlano];
                     qryEncargos_CR.ParamByName('PIDPATRO').AsInteger             := molListaPatro.vIDPatro[iContadorPatro];
                     qryEncargos_CR.ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qryEncargos_CR.ParamByName('PHMEANOCOMPETENCIA').AsInteger   := iAnoAtu;
                     qryEncargos_CR.ParamByName('PHMEMESCOMPETENCIA').AsInteger   := iMesAtu;
                     qryEncargos_CR.Open;

                     LimpaParametros(qryQuantEncargos_CR);

                     if molContratoEmptmo.IDContrato > 0 then qryQuantEncargos_CR.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qryQuantEncargos_CR.ParamByName('PIDPLANOPREV').AsInteger         := molListaPlano.vIDPlano[iContadorPlano];
                     qryQuantEncargos_CR.ParamByName('PIDPATRO').AsInteger             := molListaPatro.vIDPatro[iContadorPatro];
                     qryQuantEncargos_CR.ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qryQuantEncargos_CR.ParamByName('PHMEANOCOMPETENCIA').AsInteger   := iAnoAtu;
                     qryQuantEncargos_CR.ParamByName('PHMEMESCOMPETENCIA').AsInteger   := iMesAtu;
                     qryQuantEncargos_CR.Open;

                     LimpaParametros(qryEncargos_FP);

                     if molContratoEmptmo.IDContrato > 0 then qryEncargos_FP.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qryEncargos_FP.ParamByName('PIDPLANOPREV').AsInteger         := molListaPlano.vIDPlano[iContadorPlano];
                     qryEncargos_FP.ParamByName('PIDPATRO').AsInteger             := molListaPatro.vIDPatro[iContadorPatro];
                     qryEncargos_FP.ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qryEncargos_FP.ParamByName('PHMEANOCOMPETENCIA').AsInteger   := iAnoAtu;
                     qryEncargos_FP.ParamByName('PHMEMESCOMPETENCIA').AsInteger   := iMesAtu;
                     qryEncargos_FP.Open;

                     LimpaParametros(qryQuantEncargos_FP);

                     if molContratoEmptmo.IDContrato > 0 then qryQuantEncargos_FP.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qryQuantEncargos_FP.ParamByName('PIDPLANOPREV').AsInteger         := molListaPlano.vIDPlano[iContadorPlano];
                     qryQuantEncargos_FP.ParamByName('PIDPATRO').AsInteger             := molListaPatro.vIDPatro[iContadorPatro];
                     qryQuantEncargos_FP.ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qryQuantEncargos_FP.ParamByName('PHMEANOCOMPETENCIA').AsInteger   := iAnoAtu;
                     qryQuantEncargos_FP.ParamByName('PHMEMESCOMPETENCIA').AsInteger   := iMesAtu;
                     qryQuantEncargos_FP.Open;

                     LimpaParametros(qryEncargos_FB);

                     if molContratoEmptmo.IDContrato > 0 then qryEncargos_FB.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qryEncargos_FB.ParamByName('PIDPLANOPREV').AsInteger         := molListaPlano.vIDPlano[iContadorPlano];
                     qryEncargos_FB.ParamByName('PIDPATRO').AsInteger             := molListaPatro.vIDPatro[iContadorPatro];
                     qryEncargos_FB.ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qryEncargos_FB.ParamByName('PHMEANOCOMPETENCIA').AsInteger   := iAnoAtu;
                     qryEncargos_FB.ParamByName('PHMEMESCOMPETENCIA').AsInteger   := iMesAtu;
                     qryEncargos_FB.Open;

                     LimpaParametros(qryQuantEncargos_FB);

                     if molContratoEmptmo.IDContrato > 0 then qryQuantEncargos_FB.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qryQuantEncargos_FB.ParamByName('PIDPLANOPREV').AsInteger         := molListaPlano.vIDPlano[iContadorPlano];
                     qryQuantEncargos_FB.ParamByName('PIDPATRO').AsInteger             := molListaPatro.vIDPatro[iContadorPatro];
                     qryQuantEncargos_FB.ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qryQuantEncargos_FB.ParamByName('PHMEANOCOMPETENCIA').AsInteger   := iAnoAtu;
                     qryQuantEncargos_FB.ParamByName('PHMEMESCOMPETENCIA').AsInteger   := iMesAtu;
                     qryQuantEncargos_FB.Open;

                     dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPEncargos_CR.AsCurrency := qryEncargos_CREncargos_CR.AsCurrency;
                     dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPEncargos_FP.AsCurrency := qryEncargos_FPEncargos_FP.AsCurrency;
                     dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPEncargos_FB.AsCurrency := qryEncargos_FBEncargos_FB.AsCurrency;

                     dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPTOTALENC_CR.AsInteger := qryQuantEncargos_CRTOTALENC_CR.AsInteger;
                     dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPTOTALENC_FP.AsInteger := qryQuantEncargos_FPTOTALENC_FP.AsInteger;
                     dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPTOTALENC_FB.AsInteger := qryQuantEncargos_FBTOTALENC_FB.AsInteger;

                     // ----------------------------------------------------------------------------
                     // Amortizações Geradas
                     // ----------------------------------------------------------------------------
                     LimpaParametros(qryAmort_CR);

                     if molContratoEmptmo.IDContrato > 0 then qryAmort_CR.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qryAmort_CR.ParamByName('PIDPLANOPREV').AsInteger         := molListaPlano.vIDPlano[iContadorPlano];
                     qryAmort_CR.ParamByName('PIDPATRO').AsInteger             := molListaPatro.vIDPatro[iContadorPatro];
                     qryAmort_CR.ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qryAmort_CR.ParamByName('PHMEANOCOMPETENCIA').AsInteger   := iAnoAtu;
                     qryAmort_CR.ParamByName('PHMEMESCOMPETENCIA').AsInteger   := iMesAtu;
                     qryAmort_CR.Open;

                     LimpaParametros(qryQuantAmort_CR);

                     if molContratoEmptmo.IDContrato > 0 then qryQuantAmort_CR.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qryQuantAmort_CR.ParamByName('PIDPLANOPREV').AsInteger         := molListaPlano.vIDPlano[iContadorPlano];
                     qryQuantAmort_CR.ParamByName('PIDPATRO').AsInteger             := molListaPatro.vIDPatro[iContadorPatro];
                     qryQuantAmort_CR.ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qryQuantAmort_CR.ParamByName('PHMEANOCOMPETENCIA').AsInteger   := iAnoAtu;
                     qryQuantAmort_CR.ParamByName('PHMEMESCOMPETENCIA').AsInteger   := iMesAtu;
                     qryQuantAmort_CR.Open;

                     LimpaParametros(qryAmort_FP);

                     if molContratoEmptmo.IDContrato > 0 then qryAmort_FP.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qryAmort_FP.ParamByName('PIDPLANOPREV').AsInteger         := molListaPlano.vIDPlano[iContadorPlano];
                     qryAmort_FP.ParamByName('PIDPATRO').AsInteger             := molListaPatro.vIDPatro[iContadorPatro];
                     qryAmort_FP.ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qryAmort_FP.ParamByName('PHMEANOCOMPETENCIA').AsInteger   := iAnoAtu;
                     qryAmort_FP.ParamByName('PHMEMESCOMPETENCIA').AsInteger   := iMesAtu;
                     qryAmort_FP.Open;

                     LimpaParametros(qryQuantAmort_FP);

                     if molContratoEmptmo.IDContrato > 0 then qryQuantAmort_FP.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qryQuantAmort_FP.ParamByName('PIDPLANOPREV').AsInteger         := molListaPlano.vIDPlano[iContadorPlano];
                     qryQuantAmort_FP.ParamByName('PIDPATRO').AsInteger             := molListaPatro.vIDPatro[iContadorPatro];
                     qryQuantAmort_FP.ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qryQuantAmort_FP.ParamByName('PHMEANOCOMPETENCIA').AsInteger   := iAnoAtu;
                     qryQuantAmort_FP.ParamByName('PHMEMESCOMPETENCIA').AsInteger   := iMesAtu;
                     qryQuantAmort_FP.Open;

                     LimpaParametros(qryAmort_FB);

                     if molContratoEmptmo.IDContrato > 0 then qryAmort_FB.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qryAmort_FB.ParamByName('PIDPLANOPREV').AsInteger         := molListaPlano.vIDPlano[iContadorPlano];
                     qryAmort_FB.ParamByName('PIDPATRO').AsInteger             := molListaPatro.vIDPatro[iContadorPatro];
                     qryAmort_FB.ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qryAmort_FB.ParamByName('PHMEANOCOMPETENCIA').AsInteger   := iAnoAtu;
                     qryAmort_FB.ParamByName('PHMEMESCOMPETENCIA').AsInteger   := iMesAtu;
                     qryAmort_FB.Open;

                     LimpaParametros(qryQuantAmort_FB);

                     if molContratoEmptmo.IDContrato > 0 then qryQuantAmort_FB.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qryQuantAmort_FB.ParamByName('PIDPLANOPREV').AsInteger         := molListaPlano.vIDPlano[iContadorPlano];
                     qryQuantAmort_FB.ParamByName('PIDPATRO').AsInteger             := molListaPatro.vIDPatro[iContadorPatro];
                     qryQuantAmort_FB.ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qryQuantAmort_FB.ParamByName('PHMEANOCOMPETENCIA').AsInteger   := iAnoAtu;
                     qryQuantAmort_FB.ParamByName('PHMEMESCOMPETENCIA').AsInteger   := iMesAtu;
                     qryQuantAmort_FB.Open;

                     dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPAMORTIZACAO_CR.AsCurrency := qryAmort_CRAmort_CR.AsCurrency;
                     dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPAMORTIZACAO_FP.AsCurrency := qryAmort_FPAmort_FP.AsCurrency;
                     dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPAMORTIZACAO_FB.AsCurrency := qryAmort_FBAmort_FB.AsCurrency;

                     dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPTOTALAMO_CR.AsInteger := qryQuantAmort_CRTOTALAMORT_CR.AsInteger;
                     dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPTOTALAMO_FP.AsInteger := qryQuantAmort_FPTOTALAMORT_FP.AsInteger;
                     dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPTOTALAMO_FB.AsInteger := qryQuantAmort_FBTOTALAMORT_FB.AsInteger;

                     // ----------------------------------------------------------------------------
                     // Quitações Geradas
                     // ----------------------------------------------------------------------------
                     LimpaParametros(qryQuit_CR);

                     if molContratoEmptmo.IDContrato > 0 then qryQuit_CR.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qryQuit_CR.ParamByName('PIDPLANOPREV').AsInteger         := molListaPlano.vIDPlano[iContadorPlano];
                     qryQuit_CR.ParamByName('PIDPATRO').AsInteger             := molListaPatro.vIDPatro[iContadorPatro];
                     qryQuit_CR.ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qryQuit_CR.ParamByName('PHMEANOCOMPETENCIA').AsInteger   := iAnoAtu;
                     qryQuit_CR.ParamByName('PHMEMESCOMPETENCIA').AsInteger   := iMesAtu;
                     qryQuit_CR.Open;

                     LimpaParametros(qryQuantQuit_CR);

                     if molContratoEmptmo.IDContrato > 0 then qryQuantQuit_CR.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qryQuantQuit_CR.ParamByName('PIDPLANOPREV').AsInteger         := molListaPlano.vIDPlano[iContadorPlano];
                     qryQuantQuit_CR.ParamByName('PIDPATRO').AsInteger             := molListaPatro.vIDPatro[iContadorPatro];
                     qryQuantQuit_CR.ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qryQuantQuit_CR.ParamByName('PHMEANOCOMPETENCIA').AsInteger   := iAnoAtu;
                     qryQuantQuit_CR.ParamByName('PHMEMESCOMPETENCIA').AsInteger   := iMesAtu;
                     qryQuantQuit_CR.Open;

                     LimpaParametros(qryQuit_FP);

                     if molContratoEmptmo.IDContrato > 0 then qryQuit_FP.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qryQuit_FP.ParamByName('PIDPLANOPREV').AsInteger         := molListaPlano.vIDPlano[iContadorPlano];
                     qryQuit_FP.ParamByName('PIDPATRO').AsInteger             := molListaPatro.vIDPatro[iContadorPatro];
                     qryQuit_FP.ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qryQuit_FP.ParamByName('PHMEANOCOMPETENCIA').AsInteger   := iAnoAtu;
                     qryQuit_FP.ParamByName('PHMEMESCOMPETENCIA').AsInteger   := iMesAtu;
                     qryQuit_FP.Open;

                     LimpaParametros(qryQuantQuit_FP);

                     if molContratoEmptmo.IDContrato > 0 then qryQuantQuit_FP.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qryQuantQuit_FP.ParamByName('PIDPLANOPREV').AsInteger         := molListaPlano.vIDPlano[iContadorPlano];
                     qryQuantQuit_FP.ParamByName('PIDPATRO').AsInteger             := molListaPatro.vIDPatro[iContadorPatro];
                     qryQuantQuit_FP.ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qryQuantQuit_FP.ParamByName('PHMEANOCOMPETENCIA').AsInteger   := iAnoAtu;
                     qryQuantQuit_FP.ParamByName('PHMEMESCOMPETENCIA').AsInteger   := iMesAtu;
                     qryQuantQuit_FP.Open;

                     LimpaParametros(qryQuit_FB);

                     if molContratoEmptmo.IDContrato > 0 then qryQuit_FB.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qryQuit_FB.ParamByName('PIDPLANOPREV').AsInteger         := molListaPlano.vIDPlano[iContadorPlano];
                     qryQuit_FB.ParamByName('PIDPATRO').AsInteger             := molListaPatro.vIDPatro[iContadorPatro];
                     qryQuit_FB.ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qryQuit_FB.ParamByName('PHMEANOCOMPETENCIA').AsInteger   := iAnoAtu;
                     qryQuit_FB.ParamByName('PHMEMESCOMPETENCIA').AsInteger   := iMesAtu;
                     qryQuit_FB.Open;

                     LimpaParametros(qryQuantQuit_FB);

                     if molContratoEmptmo.IDContrato > 0 then qryQuantQuit_FB.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qryQuantQuit_FB.ParamByName('PIDPLANOPREV').AsInteger         := molListaPlano.vIDPlano[iContadorPlano];
                     qryQuantQuit_FB.ParamByName('PIDPATRO').AsInteger             := molListaPatro.vIDPatro[iContadorPatro];
                     qryQuantQuit_FB.ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qryQuantQuit_FB.ParamByName('PHMEANOCOMPETENCIA').AsInteger   := iAnoAtu;
                     qryQuantQuit_FB.ParamByName('PHMEMESCOMPETENCIA').AsInteger   := iMesAtu;
                     qryQuantQuit_FB.Open;

                     dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPQuitacao_CR.AsCurrency := qryQuit_CRQuit_CR.AsCurrency;
                     dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPQuitacao_FP.AsCurrency := qryQuit_FPQuit_FP.AsCurrency;
                     dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPQuitacao_FB.AsCurrency := qryQuit_FBQuit_FB.AsCurrency;

                     dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPTOTALQUI_CR.AsInteger := qryQuantQuit_CRTOTALQUIT_CR.AsInteger;
                     dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPTOTALQUI_FP.AsInteger := qryQuantQuit_FPTOTALQUIT_FP.AsInteger;
                     dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPTOTALQUI_FB.AsInteger := qryQuantQuit_FBTOTALQUIT_FB.AsInteger;

                     // ----------------------------------------------------------------------------
                     // Parcelas Enviadas
                     // ----------------------------------------------------------------------------
                     LimpaParametros(qryParcelas_CR);

                     if molContratoEmptmo.IDContrato > 0 then qryParcelas_CR.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qryParcelas_CR.ParamByName('PIDPLANOPREV').AsInteger         := molListaPlano.vIDPlano[iContadorPlano];
                     qryParcelas_CR.ParamByName('PIDPATRO').AsInteger             := molListaPatro.vIDPatro[iContadorPatro];
                     qryParcelas_CR.ParamByName('PENVIADO').AsInteger             := 1;
                     qryParcelas_CR.ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qryParcelas_CR.ParamByName('PHMEANOCOMPETENCIA').AsInteger   := iAnoAtu;
                     qryParcelas_CR.ParamByName('PHMEMESCOMPETENCIA').AsInteger   := iMesAtu;
                     qryParcelas_CR.Open;

                     LimpaParametros(qryQuantParcelas_CR);

                     if molContratoEmptmo.IDContrato > 0 then qryQuantParcelas_CR.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qryQuantParcelas_CR.ParamByName('PIDPLANOPREV').AsInteger         := molListaPlano.vIDPlano[iContadorPlano];
                     qryQuantParcelas_CR.ParamByName('PIDPATRO').AsInteger             := molListaPatro.vIDPatro[iContadorPatro];
                     qryQuantParcelas_CR.ParamByName('PENVIADO').AsInteger             := 1;
                     qryQuantParcelas_CR.ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qryQuantParcelas_CR.ParamByName('PHMEANOCOMPETENCIA').AsInteger   := iAnoAtu;
                     qryQuantParcelas_CR.ParamByName('PHMEMESCOMPETENCIA').AsInteger   := iMesAtu;
                     qryQuantParcelas_CR.Open;

                     LimpaParametros(qryParcelas_FP);

                     if molContratoEmptmo.IDContrato > 0 then qryParcelas_FP.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qryParcelas_FP.ParamByName('PIDPLANOPREV').AsInteger         := molListaPlano.vIDPlano[iContadorPlano];
                     qryParcelas_FP.ParamByName('PIDPATRO').AsInteger             := molListaPatro.vIDPatro[iContadorPatro];
                     qryParcelas_FP.ParamByName('PENVIADO').AsInteger             := 1;
                     qryParcelas_FP.ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qryParcelas_FP.ParamByName('PHMEANOCOMPETENCIA').AsInteger   := iAnoAtu;
                     qryParcelas_FP.ParamByName('PHMEMESCOMPETENCIA').AsInteger   := iMesAtu;
                     qryParcelas_FP.Open;

                     LimpaParametros(qryQuantParcelas_FP);
                     
                     if molContratoEmptmo.IDContrato > 0 then qryQuantParcelas_FP.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qryQuantParcelas_FP.ParamByName('PIDPLANOPREV').AsInteger         := molListaPlano.vIDPlano[iContadorPlano];
                     qryQuantParcelas_FP.ParamByName('PIDPATRO').AsInteger             := molListaPatro.vIDPatro[iContadorPatro];
                     qryQuantParcelas_FP.ParamByName('PENVIADO').AsInteger             := 1;
                     qryQuantParcelas_FP.ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qryQuantParcelas_FP.ParamByName('PHMEANOCOMPETENCIA').AsInteger   := iAnoAtu;
                     qryQuantParcelas_FP.ParamByName('PHMEMESCOMPETENCIA').AsInteger   := iMesAtu;
                     qryQuantParcelas_FP.Open;

                     LimpaParametros(qryParcelas_FB);

                     if molContratoEmptmo.IDContrato > 0 then qryParcelas_FB.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qryParcelas_FB.ParamByName('PIDPLANOPREV').AsInteger         := molListaPlano.vIDPlano[iContadorPlano];
                     qryParcelas_FB.ParamByName('PIDPATRO').AsInteger             := molListaPatro.vIDPatro[iContadorPatro];
                     qryParcelas_FB.ParamByName('PENVIADO').AsInteger             := 1;
                     qryParcelas_FB.ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qryParcelas_FB.ParamByName('PHMEANOCOMPETENCIA').AsInteger   := iAnoAtu;
                     qryParcelas_FB.ParamByName('PHMEMESCOMPETENCIA').AsInteger   := iMesAtu;
                     qryParcelas_FB.Open;

                     LimpaParametros(qryQuantParcelas_FB);

                     if molContratoEmptmo.IDContrato > 0 then qryQuantParcelas_FB.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qryQuantParcelas_FB.ParamByName('PIDPLANOPREV').AsInteger         := molListaPlano.vIDPlano[iContadorPlano];
                     qryQuantParcelas_FB.ParamByName('PIDPATRO').AsInteger             := molListaPatro.vIDPatro[iContadorPatro];
                     qryQuantParcelas_FB.ParamByName('PENVIADO').AsInteger             := 1;
                     qryQuantParcelas_FB.ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qryQuantParcelas_FB.ParamByName('PHMEANOCOMPETENCIA').AsInteger   := iAnoAtu;
                     qryQuantParcelas_FB.ParamByName('PHMEMESCOMPETENCIA').AsInteger   := iMesAtu;
                     qryQuantParcelas_FB.Open;

                     dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPPARCELAS_ECR.AsCurrency := qryParcelas_CRPARCELAS_CR.AsCurrency;
                     dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPPARCELAS_EFP.AsCurrency := qryParcelas_FPPARCELAS_FP.AsCurrency;
                     dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPPARCELAS_EFB.AsCurrency := qryParcelas_FBPARCELAS_FB.AsCurrency;

                     dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPTOTALPARC_ECR.AsInteger := qryQuantParcelas_CRTOTALPARC_CR.AsInteger;
                     dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPTOTALPARC_EFP.AsInteger := qryQuantParcelas_FPTOTALPARC_FP.AsInteger;
                     dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPTOTALPARC_EFB.AsInteger := qryQuantParcelas_FBTOTALPARC_FB.AsInteger;

                     // ----------------------------------------------------------------------------
                     // Encargos Enviados
                     // ----------------------------------------------------------------------------
                     LimpaParametros(qryEncargos_CR);

                     if molContratoEmptmo.IDContrato > 0 then qryEncargos_CR.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qryEncargos_CR.ParamByName('PIDPLANOPREV').AsInteger         := molListaPlano.vIDPlano[iContadorPlano];
                     qryEncargos_CR.ParamByName('PIDPATRO').AsInteger             := molListaPatro.vIDPatro[iContadorPatro];
                     qryEncargos_CR.ParamByName('PENVIADO').AsInteger             := 1;
                     qryEncargos_CR.ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qryEncargos_CR.ParamByName('PHMEANOCOMPETENCIA').AsInteger   := iAnoAtu;
                     qryEncargos_CR.ParamByName('PHMEMESCOMPETENCIA').AsInteger   := iMesAtu;
                     qryEncargos_CR.Open;

                     LimpaParametros(qryQuantEncargos_CR);

                     if molContratoEmptmo.IDContrato > 0 then qryQuantEncargos_CR.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qryQuantEncargos_CR.ParamByName('PIDPLANOPREV').AsInteger         := molListaPlano.vIDPlano[iContadorPlano];
                     qryQuantEncargos_CR.ParamByName('PIDPATRO').AsInteger             := molListaPatro.vIDPatro[iContadorPatro];
                     qryQuantEncargos_CR.ParamByName('PENVIADO').AsInteger             := 1;
                     qryQuantEncargos_CR.ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qryQuantEncargos_CR.ParamByName('PHMEANOCOMPETENCIA').AsInteger   := iAnoAtu;
                     qryQuantEncargos_CR.ParamByName('PHMEMESCOMPETENCIA').AsInteger   := iMesAtu;
                     qryQuantEncargos_CR.Open;

                     LimpaParametros(qryEncargos_FP);

                     if molContratoEmptmo.IDContrato > 0 then qryEncargos_FP.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qryEncargos_FP.ParamByName('PIDPLANOPREV').AsInteger         := molListaPlano.vIDPlano[iContadorPlano];
                     qryEncargos_FP.ParamByName('PIDPATRO').AsInteger             := molListaPatro.vIDPatro[iContadorPatro];
                     qryEncargos_FP.ParamByName('PENVIADO').AsInteger             := 1;
                     qryEncargos_FP.ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qryEncargos_FP.ParamByName('PHMEANOCOMPETENCIA').AsInteger   := iAnoAtu;
                     qryEncargos_FP.ParamByName('PHMEMESCOMPETENCIA').AsInteger   := iMesAtu;
                     qryEncargos_FP.Open;

                     LimpaParametros(qryQuantEncargos_FP);
                     
                     if molContratoEmptmo.IDContrato > 0 then qryQuantEncargos_FP.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qryQuantEncargos_FP.ParamByName('PIDPLANOPREV').AsInteger         := molListaPlano.vIDPlano[iContadorPlano];
                     qryQuantEncargos_FP.ParamByName('PIDPATRO').AsInteger             := molListaPatro.vIDPatro[iContadorPatro];
                     qryQuantEncargos_FP.ParamByName('PENVIADO').AsInteger             := 1;
                     qryQuantEncargos_FP.ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qryQuantEncargos_FP.ParamByName('PHMEANOCOMPETENCIA').AsInteger   := iAnoAtu;
                     qryQuantEncargos_FP.ParamByName('PHMEMESCOMPETENCIA').AsInteger   := iMesAtu;
                     qryQuantEncargos_FP.Open;

                     LimpaParametros(qryEncargos_FB);

                     if molContratoEmptmo.IDContrato > 0 then qryEncargos_FB.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qryEncargos_FB.ParamByName('PIDPLANOPREV').AsInteger         := molListaPlano.vIDPlano[iContadorPlano];
                     qryEncargos_FB.ParamByName('PIDPATRO').AsInteger             := molListaPatro.vIDPatro[iContadorPatro];
                     qryEncargos_FB.ParamByName('PENVIADO').AsInteger             := 1;
                     qryEncargos_FB.ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qryEncargos_FB.ParamByName('PHMEANOCOMPETENCIA').AsInteger   := iAnoAtu;
                     qryEncargos_FB.ParamByName('PHMEMESCOMPETENCIA').AsInteger   := iMesAtu;
                     qryEncargos_FB.Open;

                     LimpaParametros(qryQuantEncargos_FB);
                     
                     if molContratoEmptmo.IDContrato > 0 then qryQuantEncargos_FB.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qryQuantEncargos_FB.ParamByName('PIDPLANOPREV').AsInteger         := molListaPlano.vIDPlano[iContadorPlano];
                     qryQuantEncargos_FB.ParamByName('PIDPATRO').AsInteger             := molListaPatro.vIDPatro[iContadorPatro];
                     qryQuantEncargos_FB.ParamByName('PENVIADO').AsInteger             := 1;
                     qryQuantEncargos_FB.ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qryQuantEncargos_FB.ParamByName('PHMEANOCOMPETENCIA').AsInteger   := iAnoAtu;
                     qryQuantEncargos_FB.ParamByName('PHMEMESCOMPETENCIA').AsInteger   := iMesAtu;
                     qryQuantEncargos_FB.Open;

                     dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPEncargos_ECR.AsCurrency := qryEncargos_CREncargos_CR.AsCurrency;
                     dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPEncargos_EFP.AsCurrency := qryEncargos_FPEncargos_FP.AsCurrency;
                     dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPEncargos_EFB.AsCurrency := qryEncargos_FBEncargos_FB.AsCurrency;

                     dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPTOTALENC_ECR.AsInteger := qryQuantEncargos_CRTOTALENC_CR.AsInteger;
                     dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPTOTALENC_EFP.AsInteger := qryQuantEncargos_FPTOTALENC_FP.AsInteger;
                     dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPTOTALENC_EFB.AsInteger := qryQuantEncargos_FBTOTALENC_FB.AsInteger;

                     // ----------------------------------------------------------------------------
                     // Amortizações Enviadas
                     // ----------------------------------------------------------------------------
                     LimpaParametros(qryAmort_CR);

                     if molContratoEmptmo.IDContrato > 0 then qryAmort_CR.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qryAmort_CR.ParamByName('PIDPLANOPREV').AsInteger         := molListaPlano.vIDPlano[iContadorPlano];
                     qryAmort_CR.ParamByName('PIDPATRO').AsInteger             := molListaPatro.vIDPatro[iContadorPatro];
                     qryAmort_CR.ParamByName('PENVIADO').AsInteger             := 1;
                     qryAmort_CR.ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qryAmort_CR.ParamByName('PHMEANOCOMPETENCIA').AsInteger   := iAnoAtu;
                     qryAmort_CR.ParamByName('PHMEMESCOMPETENCIA').AsInteger   := iMesAtu;
                     qryAmort_CR.Open;

                     LimpaParametros(qryQuantAmort_CR);

                     if molContratoEmptmo.IDContrato > 0 then qryQuantAmort_CR.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qryQuantAmort_CR.ParamByName('PIDPLANOPREV').AsInteger         := molListaPlano.vIDPlano[iContadorPlano];
                     qryQuantAmort_CR.ParamByName('PIDPATRO').AsInteger             := molListaPatro.vIDPatro[iContadorPatro];
                     qryQuantAmort_CR.ParamByName('PENVIADO').AsInteger             := 1;
                     qryQuantAmort_CR.ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qryQuantAmort_CR.ParamByName('PHMEANOCOMPETENCIA').AsInteger   := iAnoAtu;
                     qryQuantAmort_CR.ParamByName('PHMEMESCOMPETENCIA').AsInteger   := iMesAtu;
                     qryQuantAmort_CR.Open;

                     LimpaParametros(qryAmort_FP);

                     if molContratoEmptmo.IDContrato > 0 then qryAmort_FP.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qryAmort_FP.ParamByName('PIDPLANOPREV').AsInteger         := molListaPlano.vIDPlano[iContadorPlano];
                     qryAmort_FP.ParamByName('PIDPATRO').AsInteger             := molListaPatro.vIDPatro[iContadorPatro];
                     qryAmort_FP.ParamByName('PENVIADO').AsInteger             := 1;
                     qryAmort_FP.ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qryAmort_FP.ParamByName('PHMEANOCOMPETENCIA').AsInteger   := iAnoAtu;
                     qryAmort_FP.ParamByName('PHMEMESCOMPETENCIA').AsInteger   := iMesAtu;
                     qryAmort_FP.Open;

                     LimpaParametros(qryQuantAmort_FP);

                     if molContratoEmptmo.IDContrato > 0 then qryQuantAmort_FP.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qryQuantAmort_FP.ParamByName('PIDPLANOPREV').AsInteger         := molListaPlano.vIDPlano[iContadorPlano];
                     qryQuantAmort_FP.ParamByName('PIDPATRO').AsInteger             := molListaPatro.vIDPatro[iContadorPatro];
                     qryQuantAmort_FP.ParamByName('PENVIADO').AsInteger             := 1;
                     qryQuantAmort_FP.ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qryQuantAmort_FP.ParamByName('PHMEANOCOMPETENCIA').AsInteger   := iAnoAtu;
                     qryQuantAmort_FP.ParamByName('PHMEMESCOMPETENCIA').AsInteger   := iMesAtu;
                     qryQuantAmort_FP.Open;

                     LimpaParametros(qryAmort_FB);

                     if molContratoEmptmo.IDContrato > 0 then qryAmort_FB.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qryAmort_FB.ParamByName('PIDPLANOPREV').AsInteger         := molListaPlano.vIDPlano[iContadorPlano];
                     qryAmort_FB.ParamByName('PIDPATRO').AsInteger             := molListaPatro.vIDPatro[iContadorPatro];
                     qryAmort_FB.ParamByName('PENVIADO').AsInteger             := 1;
                     qryAmort_FB.ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qryAmort_FB.ParamByName('PHMEANOCOMPETENCIA').AsInteger   := iAnoAtu;
                     qryAmort_FB.ParamByName('PHMEMESCOMPETENCIA').AsInteger   := iMesAtu;
                     qryAmort_FB.Open;

                     LimpaParametros(qryQuantAmort_FB);

                     if molContratoEmptmo.IDContrato > 0 then qryQuantAmort_FB.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qryQuantAmort_FB.ParamByName('PIDPLANOPREV').AsInteger         := molListaPlano.vIDPlano[iContadorPlano];
                     qryQuantAmort_FB.ParamByName('PIDPATRO').AsInteger             := molListaPatro.vIDPatro[iContadorPatro];
                     qryQuantAmort_FB.ParamByName('PENVIADO').AsInteger             := 1;
                     qryQuantAmort_FB.ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qryQuantAmort_FB.ParamByName('PHMEANOCOMPETENCIA').AsInteger   := iAnoAtu;
                     qryQuantAmort_FB.ParamByName('PHMEMESCOMPETENCIA').AsInteger   := iMesAtu;
                     qryQuantAmort_FB.Open;

                     dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPAmortizacao_ECR.AsCurrency := qryAmort_CRAmort_CR.AsCurrency;
                     dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPAmortizacao_EFP.AsCurrency := qryAmort_FPAmort_FP.AsCurrency;
                     dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPAmortizacao_EFB.AsCurrency := qryAmort_FBAmort_FB.AsCurrency;

                     dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPTOTALAMO_ECR.AsInteger := qryQuantAmort_CRTOTALAMORT_CR.AsInteger;
                     dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPTOTALAMO_EFP.AsInteger := qryQuantAmort_FPTOTALAMORT_FP.AsInteger;
                     dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPTOTALAMO_EFB.AsInteger := qryQuantAmort_FBTOTALAMORT_FB.AsInteger;

                     // ----------------------------------------------------------------------------
                     // Quitações Enviadas
                     // ----------------------------------------------------------------------------
                     LimpaParametros(qryQuit_CR);

                     if molContratoEmptmo.IDContrato > 0 then qryQuit_CR.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qryQuit_CR.ParamByName('PIDPLANOPREV').AsInteger         := molListaPlano.vIDPlano[iContadorPlano];
                     qryQuit_CR.ParamByName('PIDPATRO').AsInteger             := molListaPatro.vIDPatro[iContadorPatro];
                     qryQuit_CR.ParamByName('PENVIADO').AsInteger             := 1;
                     qryQuit_CR.ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qryQuit_CR.ParamByName('PHMEANOCOMPETENCIA').AsInteger   := iAnoAtu;
                     qryQuit_CR.ParamByName('PHMEMESCOMPETENCIA').AsInteger   := iMesAtu;
                     qryQuit_CR.Open;

                     LimpaParametros(qryQuantQuit_CR);

                     if molContratoEmptmo.IDContrato > 0 then qryQuantQuit_CR.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qryQuantQuit_CR.ParamByName('PIDPLANOPREV').AsInteger         := molListaPlano.vIDPlano[iContadorPlano];
                     qryQuantQuit_CR.ParamByName('PIDPATRO').AsInteger             := molListaPatro.vIDPatro[iContadorPatro];
                     qryQuantQuit_CR.ParamByName('PENVIADO').AsInteger             := 1;
                     qryQuantQuit_CR.ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qryQuantQuit_CR.ParamByName('PHMEANOCOMPETENCIA').AsInteger   := iAnoAtu;
                     qryQuantQuit_CR.ParamByName('PHMEMESCOMPETENCIA').AsInteger   := iMesAtu;
                     qryQuantQuit_CR.Open;

                     LimpaParametros(qryQuit_FP);

                     if molContratoEmptmo.IDContrato > 0 then qryQuit_FP.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qryQuit_FP.ParamByName('PIDPLANOPREV').AsInteger         := molListaPlano.vIDPlano[iContadorPlano];
                     qryQuit_FP.ParamByName('PIDPATRO').AsInteger             := molListaPatro.vIDPatro[iContadorPatro];
                     qryQuit_FP.ParamByName('PENVIADO').AsInteger             := 1;
                     qryQuit_FP.ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qryQuit_FP.ParamByName('PHMEANOCOMPETENCIA').AsInteger   := iAnoAtu;
                     qryQuit_FP.ParamByName('PHMEMESCOMPETENCIA').AsInteger   := iMesAtu;
                     qryQuit_FP.Open;

                     LimpaParametros(qryQuantQuit_FP);

                     if molContratoEmptmo.IDContrato > 0 then qryQuantQuit_FP.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qryQuantQuit_FP.ParamByName('PIDPLANOPREV').AsInteger         := molListaPlano.vIDPlano[iContadorPlano];
                     qryQuantQuit_FP.ParamByName('PIDPATRO').AsInteger             := molListaPatro.vIDPatro[iContadorPatro];
                     qryQuantQuit_FP.ParamByName('PENVIADO').AsInteger             := 1;
                     qryQuantQuit_FP.ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qryQuantQuit_FP.ParamByName('PHMEANOCOMPETENCIA').AsInteger   := iAnoAtu;
                     qryQuantQuit_FP.ParamByName('PHMEMESCOMPETENCIA').AsInteger   := iMesAtu;
                     qryQuantQuit_FP.Open;

                     LimpaParametros(qryQuit_FB);

                     if molContratoEmptmo.IDContrato > 0 then qryQuit_FB.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qryQuit_FB.ParamByName('PIDPLANOPREV').AsInteger         := molListaPlano.vIDPlano[iContadorPlano];
                     qryQuit_FB.ParamByName('PIDPATRO').AsInteger             := molListaPatro.vIDPatro[iContadorPatro];
                     qryQuit_FB.ParamByName('PENVIADO').AsInteger             := 1;
                     qryQuit_FB.ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qryQuit_FB.ParamByName('PHMEANOCOMPETENCIA').AsInteger   := iAnoAtu;
                     qryQuit_FB.ParamByName('PHMEMESCOMPETENCIA').AsInteger   := iMesAtu;
                     qryQuit_FB.Open;

                     LimpaParametros(qryQuantQuit_FB);
                     
                     if molContratoEmptmo.IDContrato > 0 then qryQuantQuit_FB.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qryQuantQuit_FB.ParamByName('PIDPLANOPREV').AsInteger         := molListaPlano.vIDPlano[iContadorPlano];
                     qryQuantQuit_FB.ParamByName('PIDPATRO').AsInteger             := molListaPatro.vIDPatro[iContadorPatro];
                     qryQuantQuit_FB.ParamByName('PENVIADO').AsInteger             := 1;
                     qryQuantQuit_FB.ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qryQuantQuit_FB.ParamByName('PHMEANOCOMPETENCIA').AsInteger   := iAnoAtu;
                     qryQuantQuit_FB.ParamByName('PHMEMESCOMPETENCIA').AsInteger   := iMesAtu;
                     qryQuantQuit_FB.Open;

                     dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPQuitacao_ECR.AsCurrency := qryQuit_CRQuit_CR.AsCurrency;
                     dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPQuitacao_EFP.AsCurrency := qryQuit_FPQuit_FP.AsCurrency;
                     dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPQuitacao_EFB.AsCurrency := qryQuit_FBQuit_FB.AsCurrency;

                     dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPTOTALQUI_ECR.AsInteger := qryQuantQuit_CRTOTALQUIT_CR.AsInteger;
                     dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPTOTALQUI_EFP.AsInteger := qryQuantQuit_FPTOTALQUIT_FP.AsInteger;
                     dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPTOTALQUI_EFB.AsInteger := qryQuantQuit_FBTOTALQUIT_FB.AsInteger;

                     // ----------------------------------------------------------------------------
                     // Parcelas Baixadas
                     // ----------------------------------------------------------------------------
                     LimpaParametros(qryParcelas_CR);

                     if molContratoEmptmo.IDContrato > 0 then qryParcelas_CR.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qryParcelas_CR.ParamByName('PIDPLANOPREV').AsInteger         := molListaPlano.vIDPlano[iContadorPlano];
                     qryParcelas_CR.ParamByName('PIDPATRO').AsInteger             := molListaPatro.vIDPatro[iContadorPatro];
                     qryParcelas_CR.ParamByName('PENVIADO').AsInteger             := 1;
                     qryParcelas_CR.ParamByName('PBAIXADO').AsInteger             := 1;
                     qryParcelas_CR.ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qryParcelas_CR.ParamByName('PHMEANOCOMPETENCIA').AsInteger   := iAnoAtu;
                     qryParcelas_CR.ParamByName('PHMEMESCOMPETENCIA').AsInteger   := iMesAtu;
                     qryParcelas_CR.Open;

                     LimpaParametros(qryQuantParcelas_CR);
                     
                     if molContratoEmptmo.IDContrato > 0 then qryQuantParcelas_CR.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qryQuantParcelas_CR.ParamByName('PIDPLANOPREV').AsInteger         := molListaPlano.vIDPlano[iContadorPlano];
                     qryQuantParcelas_CR.ParamByName('PIDPATRO').AsInteger             := molListaPatro.vIDPatro[iContadorPatro];
                     qryQuantParcelas_CR.ParamByName('PENVIADO').AsInteger             := 1;
                     qryQuantParcelas_CR.ParamByName('PBAIXADO').AsInteger             := 1;
                     qryQuantParcelas_CR.ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qryQuantParcelas_CR.ParamByName('PHMEANOCOMPETENCIA').AsInteger   := iAnoAtu;
                     qryQuantParcelas_CR.ParamByName('PHMEMESCOMPETENCIA').AsInteger   := iMesAtu;
                     qryQuantParcelas_CR.Open;

                     LimpaParametros(qryParcelas_FP);

                     if molContratoEmptmo.IDContrato > 0 then qryParcelas_FP.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qryParcelas_FP.ParamByName('PIDPLANOPREV').AsInteger         := molListaPlano.vIDPlano[iContadorPlano];
                     qryParcelas_FP.ParamByName('PIDPATRO').AsInteger             := molListaPatro.vIDPatro[iContadorPatro];
                     qryParcelas_FP.ParamByName('PENVIADO').AsInteger             := 1;
                     qryParcelas_FP.ParamByName('PBAIXADO').AsInteger             := 1;
                     qryParcelas_FP.ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qryParcelas_FP.ParamByName('PHMEANOCOMPETENCIA').AsInteger   := iAnoAtu;
                     qryParcelas_FP.ParamByName('PHMEMESCOMPETENCIA').AsInteger   := iMesAtu;
                     qryParcelas_FP.Open;

                     LimpaParametros(qryQuantParcelas_FP);

                     if molContratoEmptmo.IDContrato > 0 then qryQuantParcelas_FP.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qryQuantParcelas_FP.ParamByName('PIDPLANOPREV').AsInteger         := molListaPlano.vIDPlano[iContadorPlano];
                     qryQuantParcelas_FP.ParamByName('PIDPATRO').AsInteger             := molListaPatro.vIDPatro[iContadorPatro];
                     qryQuantParcelas_FP.ParamByName('PENVIADO').AsInteger             := 1;
                     qryQuantParcelas_FP.ParamByName('PBAIXADO').AsInteger             := 1;
                     qryQuantParcelas_FP.ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qryQuantParcelas_FP.ParamByName('PHMEANOCOMPETENCIA').AsInteger   := iAnoAtu;
                     qryQuantParcelas_FP.ParamByName('PHMEMESCOMPETENCIA').AsInteger   := iMesAtu;
                     qryQuantParcelas_FP.Open;

                     LimpaParametros(qryParcelas_FB);

                     if molContratoEmptmo.IDContrato > 0 then qryParcelas_FB.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qryParcelas_FB.ParamByName('PIDPLANOPREV').AsInteger         := molListaPlano.vIDPlano[iContadorPlano];
                     qryParcelas_FB.ParamByName('PIDPATRO').AsInteger             := molListaPatro.vIDPatro[iContadorPatro];
                     qryParcelas_FB.ParamByName('PENVIADO').AsInteger             := 1;
                     qryParcelas_FB.ParamByName('PBAIXADO').AsInteger             := 1;
                     qryParcelas_FB.ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qryParcelas_FB.ParamByName('PHMEANOCOMPETENCIA').AsInteger   := iAnoAtu;
                     qryParcelas_FB.ParamByName('PHMEMESCOMPETENCIA').AsInteger   := iMesAtu;
                     qryParcelas_FB.Open;

                     LimpaParametros(qryQuantParcelas_FB);

                     if molContratoEmptmo.IDContrato > 0 then qryQuantParcelas_FB.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qryQuantParcelas_FB.ParamByName('PIDPLANOPREV').AsInteger         := molListaPlano.vIDPlano[iContadorPlano];
                     qryQuantParcelas_FB.ParamByName('PIDPATRO').AsInteger             := molListaPatro.vIDPatro[iContadorPatro];
                     qryQuantParcelas_FB.ParamByName('PENVIADO').AsInteger             := 1;
                     qryQuantParcelas_FB.ParamByName('PBAIXADO').AsInteger             := 1;
                     qryQuantParcelas_FB.ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qryQuantParcelas_FB.ParamByName('PHMEANOCOMPETENCIA').AsInteger   := iAnoAtu;
                     qryQuantParcelas_FB.ParamByName('PHMEMESCOMPETENCIA').AsInteger   := iMesAtu;
                     qryQuantParcelas_FB.Open;

                     dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPREC_PARC_CR.AsCurrency := qryParcelas_CRPARCELAS_CR.AsCurrency;
                     dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPREC_PARC_FP.AsCurrency := qryParcelas_FPPARCELAS_FP.AsCurrency;
                     dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPREC_PARC_FB.AsCurrency := qryParcelas_FBPARCELAS_FB.AsCurrency;

                     dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPTOT_REC_PARC_CR.AsInteger := qryQuantParcelas_CRTOTALPARC_CR.AsInteger;
                     dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPTOT_REC_PARC_FP.AsInteger := qryQuantParcelas_FPTOTALPARC_FP.AsInteger;
                     dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPTOT_REC_PARC_FB.AsInteger := qryQuantParcelas_FBTOTALPARC_FB.AsInteger;

                     // ----------------------------------------------------------------------------
                     // Encargos Baixados
                     // ----------------------------------------------------------------------------
                     LimpaParametros(qryEncargos_CR);

                     if molContratoEmptmo.IDContrato > 0 then qryEncargos_CR.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qryEncargos_CR.ParamByName('PIDPLANOPREV').AsInteger         := molListaPlano.vIDPlano[iContadorPlano];
                     qryEncargos_CR.ParamByName('PIDPATRO').AsInteger             := molListaPatro.vIDPatro[iContadorPatro];
                     qryEncargos_CR.ParamByName('PENVIADO').AsInteger             := 1;
                     qryEncargos_CR.ParamByName('PBAIXADO').AsInteger             := 1;
                     qryEncargos_CR.ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qryEncargos_CR.ParamByName('PHMEANOCOMPETENCIA').AsInteger   := iAnoAtu;
                     qryEncargos_CR.ParamByName('PHMEMESCOMPETENCIA').AsInteger   := iMesAtu;
                     qryEncargos_CR.Open;

                     LimpaParametros(qryQuantEncargos_CR);

                     if molContratoEmptmo.IDContrato > 0 then qryQuantEncargos_CR.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qryQuantEncargos_CR.ParamByName('PIDPLANOPREV').AsInteger         := molListaPlano.vIDPlano[iContadorPlano];
                     qryQuantEncargos_CR.ParamByName('PIDPATRO').AsInteger             := molListaPatro.vIDPatro[iContadorPatro];
                     qryQuantEncargos_CR.ParamByName('PENVIADO').AsInteger             := 1;
                     qryQuantEncargos_CR.ParamByName('PBAIXADO').AsInteger             := 1;
                     qryQuantEncargos_CR.ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qryQuantEncargos_CR.ParamByName('PHMEANOCOMPETENCIA').AsInteger   := iAnoAtu;
                     qryQuantEncargos_CR.ParamByName('PHMEMESCOMPETENCIA').AsInteger   := iMesAtu;
                     qryQuantEncargos_CR.Open;

                     LimpaParametros(qryEncargos_FP);

                     if molContratoEmptmo.IDContrato > 0 then qryEncargos_FP.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qryEncargos_FP.ParamByName('PIDPLANOPREV').AsInteger         := molListaPlano.vIDPlano[iContadorPlano];
                     qryEncargos_FP.ParamByName('PIDPATRO').AsInteger             := molListaPatro.vIDPatro[iContadorPatro];
                     qryEncargos_FP.ParamByName('PENVIADO').AsInteger             := 1;
                     qryEncargos_FP.ParamByName('PBAIXADO').AsInteger             := 1;
                     qryEncargos_FP.ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qryEncargos_FP.ParamByName('PHMEANOCOMPETENCIA').AsInteger   := iAnoAtu;
                     qryEncargos_FP.ParamByName('PHMEMESCOMPETENCIA').AsInteger   := iMesAtu;
                     qryEncargos_FP.Open;

                     LimpaParametros(qryQuantEncargos_FP);

                     if molContratoEmptmo.IDContrato > 0 then qryQuantEncargos_FP.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qryQuantEncargos_FP.ParamByName('PIDPLANOPREV').AsInteger         := molListaPlano.vIDPlano[iContadorPlano];
                     qryQuantEncargos_FP.ParamByName('PIDPATRO').AsInteger             := molListaPatro.vIDPatro[iContadorPatro];
                     qryQuantEncargos_FP.ParamByName('PENVIADO').AsInteger             := 1;
                     qryQuantEncargos_FP.ParamByName('PBAIXADO').AsInteger             := 1;
                     qryQuantEncargos_FP.ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qryQuantEncargos_FP.ParamByName('PHMEANOCOMPETENCIA').AsInteger   := iAnoAtu;
                     qryQuantEncargos_FP.ParamByName('PHMEMESCOMPETENCIA').AsInteger   := iMesAtu;
                     qryQuantEncargos_FP.Open;

                     LimpaParametros(qryEncargos_FB);

                     if molContratoEmptmo.IDContrato > 0 then qryEncargos_FB.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qryEncargos_FB.ParamByName('PIDPLANOPREV').AsInteger         := molListaPlano.vIDPlano[iContadorPlano];
                     qryEncargos_FB.ParamByName('PIDPATRO').AsInteger             := molListaPatro.vIDPatro[iContadorPatro];
                     qryEncargos_FB.ParamByName('PENVIADO').AsInteger             := 1;
                     qryEncargos_FB.ParamByName('PBAIXADO').AsInteger             := 1;
                     qryEncargos_FB.ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qryEncargos_FB.ParamByName('PHMEANOCOMPETENCIA').AsInteger   := iAnoAtu;
                     qryEncargos_FB.ParamByName('PHMEMESCOMPETENCIA').AsInteger   := iMesAtu;
                     qryEncargos_FB.Open;

                     LimpaParametros(qryQuantEncargos_FB);

                     if molContratoEmptmo.IDContrato > 0 then qryQuantEncargos_FB.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qryQuantEncargos_FB.ParamByName('PIDPLANOPREV').AsInteger         := molListaPlano.vIDPlano[iContadorPlano];
                     qryQuantEncargos_FB.ParamByName('PIDPATRO').AsInteger             := molListaPatro.vIDPatro[iContadorPatro];
                     qryQuantEncargos_FB.ParamByName('PENVIADO').AsInteger             := 1;
                     qryQuantEncargos_FB.ParamByName('PBAIXADO').AsInteger             := 1;
                     qryQuantEncargos_FB.ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qryQuantEncargos_FB.ParamByName('PHMEANOCOMPETENCIA').AsInteger   := iAnoAtu;
                     qryQuantEncargos_FB.ParamByName('PHMEMESCOMPETENCIA').AsInteger   := iMesAtu;
                     qryQuantEncargos_FB.Open;

                     dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPREC_ENC_CR.AsCurrency := qryEncargos_CREncargos_CR.AsCurrency;
                     dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPREC_ENC_FP.AsCurrency := qryEncargos_FPEncargos_FP.AsCurrency;
                     dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPREC_ENC_FB.AsCurrency := qryEncargos_FBEncargos_FB.AsCurrency;

                     dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPTOT_REC_ENC_CR.AsInteger := qryQuantEncargos_CRTOTALENC_CR.AsInteger;
                     dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPTOT_REC_ENC_FP.AsInteger := qryQuantEncargos_FPTOTALENC_FP.AsInteger;
                     dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPTOT_REC_ENC_FB.AsInteger := qryQuantEncargos_FBTOTALENC_FB.AsInteger;

                     // ----------------------------------------------------------------------------
                     // Amortizações Baixadas
                     // ----------------------------------------------------------------------------
                     LimpaParametros(qryAmort_CR);

                     if molContratoEmptmo.IDContrato > 0 then qryAmort_CR.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qryAmort_CR.ParamByName('PIDPLANOPREV').AsInteger         := molListaPlano.vIDPlano[iContadorPlano];
                     qryAmort_CR.ParamByName('PIDPATRO').AsInteger             := molListaPatro.vIDPatro[iContadorPatro];
                     qryAmort_CR.ParamByName('PENVIADO').AsInteger             := 1;
                     qryAmort_CR.ParamByName('PBAIXADO').AsInteger             := 1;
                     qryAmort_CR.ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qryAmort_CR.ParamByName('PHMEANOCOMPETENCIA').AsInteger   := iAnoAtu;
                     qryAmort_CR.ParamByName('PHMEMESCOMPETENCIA').AsInteger   := iMesAtu;
                     qryAmort_CR.Open;

                     LimpaParametros(qryQuantAmort_CR);

                     if molContratoEmptmo.IDContrato > 0 then qryQuantAmort_CR.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qryQuantAmort_CR.ParamByName('PIDPLANOPREV').AsInteger         := molListaPlano.vIDPlano[iContadorPlano];
                     qryQuantAmort_CR.ParamByName('PIDPATRO').AsInteger             := molListaPatro.vIDPatro[iContadorPatro];
                     qryQuantAmort_CR.ParamByName('PENVIADO').AsInteger             := 1;
                     qryQuantAmort_CR.ParamByName('PBAIXADO').AsInteger             := 1;
                     qryQuantAmort_CR.ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qryQuantAmort_CR.ParamByName('PHMEANOCOMPETENCIA').AsInteger   := iAnoAtu;
                     qryQuantAmort_CR.ParamByName('PHMEMESCOMPETENCIA').AsInteger   := iMesAtu;
                     qryQuantAmort_CR.Open;

                     LimpaParametros(qryAmort_FP);

                     if molContratoEmptmo.IDContrato > 0 then qryAmort_FP.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qryAmort_FP.ParamByName('PIDPLANOPREV').AsInteger         := molListaPlano.vIDPlano[iContadorPlano];
                     qryAmort_FP.ParamByName('PIDPATRO').AsInteger             := molListaPatro.vIDPatro[iContadorPatro];
                     qryAmort_FP.ParamByName('PENVIADO').AsInteger             := 1;
                     qryAmort_FP.ParamByName('PBAIXADO').AsInteger             := 1;
                     qryAmort_FP.ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qryAmort_FP.ParamByName('PHMEANOCOMPETENCIA').AsInteger   := iAnoAtu;
                     qryAmort_FP.ParamByName('PHMEMESCOMPETENCIA').AsInteger   := iMesAtu;
                     qryAmort_FP.Open;

                     LimpaParametros(qryQuantAmort_FP);

                     if molContratoEmptmo.IDContrato > 0 then qryQuantAmort_FP.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qryQuantAmort_FP.ParamByName('PIDPLANOPREV').AsInteger         := molListaPlano.vIDPlano[iContadorPlano];
                     qryQuantAmort_FP.ParamByName('PIDPATRO').AsInteger             := molListaPatro.vIDPatro[iContadorPatro];
                     qryQuantAmort_FP.ParamByName('PENVIADO').AsInteger             := 1;
                     qryQuantAmort_FP.ParamByName('PBAIXADO').AsInteger             := 1;
                     qryQuantAmort_FP.ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qryQuantAmort_FP.ParamByName('PHMEANOCOMPETENCIA').AsInteger   := iAnoAtu;
                     qryQuantAmort_FP.ParamByName('PHMEMESCOMPETENCIA').AsInteger   := iMesAtu;
                     qryQuantAmort_FP.Open;

                     LimpaParametros(qryAmort_FB);

                     if molContratoEmptmo.IDContrato > 0 then qryAmort_FB.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qryAmort_FB.ParamByName('PIDPLANOPREV').AsInteger         := molListaPlano.vIDPlano[iContadorPlano];
                     qryAmort_FB.ParamByName('PIDPATRO').AsInteger             := molListaPatro.vIDPatro[iContadorPatro];
                     qryAmort_FB.ParamByName('PENVIADO').AsInteger             := 1;
                     qryAmort_FB.ParamByName('PBAIXADO').AsInteger             := 1;
                     qryAmort_FB.ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qryAmort_FB.ParamByName('PHMEANOCOMPETENCIA').AsInteger   := iAnoAtu;
                     qryAmort_FB.ParamByName('PHMEMESCOMPETENCIA').AsInteger   := iMesAtu;
                     qryAmort_FB.Open;

                     LimpaParametros(qryQuantAmort_FB);

                     if molContratoEmptmo.IDContrato > 0 then qryQuantAmort_FB.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qryQuantAmort_FB.ParamByName('PIDPLANOPREV').AsInteger         := molListaPlano.vIDPlano[iContadorPlano];
                     qryQuantAmort_FB.ParamByName('PIDPATRO').AsInteger             := molListaPatro.vIDPatro[iContadorPatro];
                     qryQuantAmort_FB.ParamByName('PENVIADO').AsInteger             := 1;
                     qryQuantAmort_FB.ParamByName('PBAIXADO').AsInteger             := 1;
                     qryQuantAmort_FB.ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qryQuantAmort_FB.ParamByName('PHMEANOCOMPETENCIA').AsInteger   := iAnoAtu;
                     qryQuantAmort_FB.ParamByName('PHMEMESCOMPETENCIA').AsInteger   := iMesAtu;
                     qryQuantAmort_FB.Open;

                     dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPRec_Amort_CR.AsCurrency := qryAmort_CRAmort_CR.AsCurrency;
                     dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPRec_Amort_FP.AsCurrency := qryAmort_FPAmort_FP.AsCurrency;
                     dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPRec_Amort_FB.AsCurrency := qryAmort_FBAmort_FB.AsCurrency;

                     dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPTOT_REC_AMORT_CR.AsInteger := qryQuantAmort_CRTOTALAMORT_CR.AsInteger;
                     dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPTOT_REC_AMORT_FP.AsInteger := qryQuantAmort_FPTOTALAMORT_FP.AsInteger;
                     dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPTOT_REC_AMORT_FB.AsInteger := qryQuantAmort_FBTOTALAMORT_FB.AsInteger;

                     // ----------------------------------------------------------------------------
                     // Quitações Baixadas
                     // ----------------------------------------------------------------------------
                     LimpaParametros(qryQuit_CR);

                     if molContratoEmptmo.IDContrato > 0 then qryQuit_CR.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qryQuit_CR.ParamByName('PIDPLANOPREV').AsInteger         := molListaPlano.vIDPlano[iContadorPlano];
                     qryQuit_CR.ParamByName('PIDPATRO').AsInteger             := molListaPatro.vIDPatro[iContadorPatro];
                     qryQuit_CR.ParamByName('PENVIADO').AsInteger             := 1;
                     qryQuit_CR.ParamByName('PBAIXADO').AsInteger             := 1;
                     qryQuit_CR.ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qryQuit_CR.ParamByName('PHMEANOCOMPETENCIA').AsInteger   := iAnoAtu;
                     qryQuit_CR.ParamByName('PHMEMESCOMPETENCIA').AsInteger   := iMesAtu;
                     qryQuit_CR.Open;

                     LimpaParametros(qryQuantQuit_CR);

                     if molContratoEmptmo.IDContrato > 0 then qryQuantQuit_CR.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qryQuantQuit_CR.ParamByName('PIDPLANOPREV').AsInteger         := molListaPlano.vIDPlano[iContadorPlano];
                     qryQuantQuit_CR.ParamByName('PIDPATRO').AsInteger             := molListaPatro.vIDPatro[iContadorPatro];
                     qryQuantQuit_CR.ParamByName('PENVIADO').AsInteger             := 1;
                     qryQuantQuit_CR.ParamByName('PBAIXADO').AsInteger             := 1;
                     qryQuantQuit_CR.ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qryQuantQuit_CR.ParamByName('PHMEANOCOMPETENCIA').AsInteger   := iAnoAtu;
                     qryQuantQuit_CR.ParamByName('PHMEMESCOMPETENCIA').AsInteger   := iMesAtu;
                     qryQuantQuit_CR.Open;

                     LimpaParametros(qryQuit_FP);

                     if molContratoEmptmo.IDContrato > 0 then qryQuit_FP.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qryQuit_FP.ParamByName('PIDPLANOPREV').AsInteger         := molListaPlano.vIDPlano[iContadorPlano];
                     qryQuit_FP.ParamByName('PIDPATRO').AsInteger             := molListaPatro.vIDPatro[iContadorPatro];
                     qryQuit_FP.ParamByName('PENVIADO').AsInteger             := 1;
                     qryQuit_FP.ParamByName('PBAIXADO').AsInteger             := 1;
                     qryQuit_FP.ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qryQuit_FP.ParamByName('PHMEANOCOMPETENCIA').AsInteger   := iAnoAtu;
                     qryQuit_FP.ParamByName('PHMEMESCOMPETENCIA').AsInteger   := iMesAtu;
                     qryQuit_FP.Open;

                     LimpaParametros(qryQuantQuit_FP);

                     if molContratoEmptmo.IDContrato > 0 then qryQuantQuit_FP.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qryQuantQuit_FP.ParamByName('PIDPLANOPREV').AsInteger         := molListaPlano.vIDPlano[iContadorPlano];
                     qryQuantQuit_FP.ParamByName('PIDPATRO').AsInteger             := molListaPatro.vIDPatro[iContadorPatro];
                     qryQuantQuit_FP.ParamByName('PENVIADO').AsInteger             := 1;
                     qryQuantQuit_FP.ParamByName('PBAIXADO').AsInteger             := 1;
                     qryQuantQuit_FP.ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qryQuantQuit_FP.ParamByName('PHMEANOCOMPETENCIA').AsInteger   := iAnoAtu;
                     qryQuantQuit_FP.ParamByName('PHMEMESCOMPETENCIA').AsInteger   := iMesAtu;
                     qryQuantQuit_FP.Open;

                     LimpaParametros(qryQuit_FB);

                     if molContratoEmptmo.IDContrato > 0 then qryQuit_FB.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qryQuit_FB.ParamByName('PIDPLANOPREV').AsInteger         := molListaPlano.vIDPlano[iContadorPlano];
                     qryQuit_FB.ParamByName('PIDPATRO').AsInteger             := molListaPatro.vIDPatro[iContadorPatro];
                     qryQuit_FB.ParamByName('PENVIADO').AsInteger             := 1;
                     qryQuit_FB.ParamByName('PBAIXADO').AsInteger             := 1;
                     qryQuit_FB.ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qryQuit_FB.ParamByName('PHMEANOCOMPETENCIA').AsInteger   := iAnoAtu;
                     qryQuit_FB.ParamByName('PHMEMESCOMPETENCIA').AsInteger   := iMesAtu;
                     qryQuit_FB.Open;

                     LimpaParametros(qryQuantQuit_FB);

                     if molContratoEmptmo.IDContrato > 0 then qryQuantQuit_FB.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qryQuantQuit_FB.ParamByName('PIDPLANOPREV').AsInteger         := molListaPlano.vIDPlano[iContadorPlano];
                     qryQuantQuit_FB.ParamByName('PIDPATRO').AsInteger             := molListaPatro.vIDPatro[iContadorPatro];
                     qryQuantQuit_FB.ParamByName('PENVIADO').AsInteger             := 1;
                     qryQuantQuit_FB.ParamByName('PBAIXADO').AsInteger             := 1;
                     qryQuantQuit_FB.ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qryQuantQuit_FB.ParamByName('PHMEANOCOMPETENCIA').AsInteger   := iAnoAtu;
                     qryQuantQuit_FB.ParamByName('PHMEMESCOMPETENCIA').AsInteger   := iMesAtu;
                     qryQuantQuit_FB.Open;

                     dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPRec_Quit_CR.AsCurrency := qryQuit_CRQuit_CR.AsCurrency;
                     dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPRec_Quit_FP.AsCurrency := qryQuit_FPQuit_FP.AsCurrency;
                     dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPRec_Quit_FB.AsCurrency := qryQuit_FBQuit_FB.AsCurrency;

                     dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPTOT_REC_QUIT_CR.AsInteger := qryQuantQuit_CRTOTALQUIT_CR.AsInteger;
                     dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPTOT_REC_QUIT_FP.AsInteger := qryQuantQuit_FPTOTALQUIT_FP.AsInteger;
                     dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPTOT_REC_QUIT_FB.AsInteger := qryQuantQuit_FBTOTALQUIT_FB.AsInteger;

                     // ----------------------------------------------------------------------------
                     // Abonados
                     // ----------------------------------------------------------------------------

                     LimpaParametros(qryAbonados);

                     if molContratoEmptmo.IDContrato > 0 then qryAbonados.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qryAbonados.ParamByName('PIDPLANOPREV').AsInteger         := molListaPlano.vIDPlano[iContadorPlano];
                     qryAbonados.ParamByName('PIDPATRO').AsInteger             := molListaPatro.vIDPatro[iContadorPatro];
                     qryAbonados.ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qryAbonados.ParamByName('PHMEANOCOMPETENCIA').AsInteger   := iAnoAtu;
                     qryAbonados.ParamByName('PHMEMESCOMPETENCIA').AsInteger   := iMesAtu;
                     qryAbonados.ParamByName('PDATAINI').AsDate                := dDataIni;
                     qryAbonados.ParamByName('PDATAINI').AsDate                := dDataFim;
                     qryAbonados.Open;

                     dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPABONADOS.AsFloat       := qryAbonadosABONADOS.AsFloat;
                     dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPTOT_ABONADOS.AsInteger := qryAbonadosTOT_ABONADOS.AsInteger;

                     // ----------------------------------------------------------------------------
                     // Parcelas Atrasadas Recebidas
                     // ----------------------------------------------------------------------------
                     LimpaParametros(qryParcAtras_CR);

                     if molContratoEmptmo.IDContrato > 0 then qryParcAtras_CR.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qryParcAtras_CR.ParamByName('PIDPLANOPREV').AsInteger         := molListaPlano.vIDPlano[iContadorPlano];
                     qryParcAtras_CR.ParamByName('PIDPATRO').AsInteger             := molListaPatro.vIDPatro[iContadorPatro];
                     qryParcAtras_CR.ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qryParcAtras_CR.ParamByName('PDATAINI').AsDate                := dDataIni;
                     qryParcAtras_CR.ParamByName('PDATAINI').AsDate                := dDataFim;
                     qryParcAtras_CR.ParamByName('PANOMES').AsString               := sAno + sMes;
                     qryParcAtras_CR.Open;

                     LimpaParametros(qryParcAtras_FP);

                     if molContratoEmptmo.IDContrato > 0 then qryParcAtras_FP.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qryParcAtras_FP.ParamByName('PIDPLANOPREV').AsInteger         := molListaPlano.vIDPlano[iContadorPlano];
                     qryParcAtras_FP.ParamByName('PIDPATRO').AsInteger             := molListaPatro.vIDPatro[iContadorPatro];
                     qryParcAtras_FP.ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qryParcAtras_FP.ParamByName('PDATAINI').AsDate                := dDataIni;
                     qryParcAtras_FP.ParamByName('PDATAINI').AsDate                := dDataFim;
                     qryParcAtras_FP.ParamByName('PANOMES').AsString               := sAno + sMes;
                     qryParcAtras_FP.Open;

                     LimpaParametros(qryParcAtras_FB);

                     if molContratoEmptmo.IDContrato > 0 then qryParcAtras_FB.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qryParcAtras_FB.ParamByName('PIDPLANOPREV').AsInteger         := molListaPlano.vIDPlano[iContadorPlano];
                     qryParcAtras_FB.ParamByName('PIDPATRO').AsInteger             := molListaPatro.vIDPatro[iContadorPatro];
                     qryParcAtras_FB.ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qryParcAtras_FB.ParamByName('PDATAINI').AsDate                := dDataIni;
                     qryParcAtras_FB.ParamByName('PDATAINI').AsDate                := dDataFim;
                     qryParcAtras_FB.ParamByName('PANOMES').AsString               := sAno + sMes;
                     qryParcAtras_FB.Open;

                     dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPREC_PARC_ATRAS_CR.AsFloat       := qryParcAtras_CRREC_PARC_ATRAS.AsFloat;
                     dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPREC_PARC_ATRAS_FP.AsFloat       := qryParcAtras_FPREC_PARC_ATRAS.AsFloat;
                     dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPREC_PARC_ATRAS_FB.AsFloat       := qryParcAtras_FBREC_PARC_ATRAS.AsFloat;
                     dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPTOT_REC_PARC_ATRAS_CR.AsInteger := qryParcAtras_CRTOT_REC_PARC_ATRAS.AsInteger;
                     dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPTOT_REC_PARC_ATRAS_FP.AsInteger := qryParcAtras_FPTOT_REC_PARC_ATRAS.AsInteger;
                     dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPTOT_REC_PARC_ATRAS_FB.AsInteger := qryParcAtras_FBTOT_REC_PARC_ATRAS.AsInteger;

                     // ----------------------------------------------------------------------------
                     // Saldo Atual
                     // ----------------------------------------------------------------------------
                     LimpaParametros(qrySaldoAtu);

                     if molContratoEmptmo.IDContrato > 0 then qrySaldoAtu.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qrySaldoAtu.ParamByName('PIDPLANOPREV').AsInteger        := molListaPlano.vIDPlano[iContadorPlano];
                     qrySaldoAtu.ParamByName('PIDPATRO').AsInteger            := molListaPatro.vIDPatro[iContadorPatro];
                     qrySaldoAtu.ParamByName('PIDTIPOCONTREMPTMO').AsInteger  := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qrySaldoAtu.ParamByName('PHMEDATAATUALIZA').AsDate       := dDataAtu;
                     qrySaldoAtu.ParamByName('PHMEANOCOMPETENCIA').AsInteger  := iAnoAtu;
                     qrySaldoAtu.ParamByName('PHMEMESCOMPETENCIA').AsInteger  := iMesAtu;
                     qrySaldoAtu.Open;

                     dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPSALDO_DEV.AsCurrency := qrySaldoAtuSALDODEV.AsCurrency;

                     LimpaParametros(qryQuantSaldoAtu);

                     if molContratoEmptmo.IDContrato > 0 then qryQuantSaldoAtu.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qryQuantSaldoAtu.ParamByName('PIDPLANOPREV').AsInteger        := molListaPlano.vIDPlano[iContadorPlano];
                     qryQuantSaldoAtu.ParamByName('PIDPATRO').AsInteger            := molListaPatro.vIDPatro[iContadorPatro];
                     qryQuantSaldoAtu.ParamByName('PIDTIPOCONTREMPTMO').AsInteger  := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qryQuantSaldoAtu.ParamByName('PHMEDATAATUALIZA').AsDate       := dDataAtu;
                     qryQuantSaldoAtu.ParamByName('PHMEANOCOMPETENCIA').AsInteger  := iAnoAtu;
                     qryQuantSaldoAtu.ParamByName('PHMEMESCOMPETENCIA').AsInteger  := iMesAtu;
                     qryQuantSaldoAtu.Open;

                     dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPTOTALSALDO_DEV.AsInteger := qryQuantSaldoAtuTOTALSLDDEV.AsInteger;
                     // ----------------------------------------------------------------------------

                     fGrava := False;

                     fSoma := dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPPARCELAS_CR.AsCurrency +
                              dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPPARCELAS_FP.AsCurrency +
                              dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPPARCELAS_FB.AsCurrency +
                              dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPEncargos_CR.AsCurrency +
                              dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPEncargos_FP.AsCurrency +
                              dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPEncargos_FB.AsCurrency +
                              dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPAMORTIZACAO_CR.AsCurrency +
                              dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPAMORTIZACAO_FP.AsCurrency +
                              dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPAMORTIZACAO_FB.AsCurrency +
                              dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPQuitacao_CR.AsCurrency +
                              dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPQuitacao_FP.AsCurrency +
                              dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPQuitacao_FB.AsCurrency;

                     if fSoma = 0 then
                     begin
                        fSoma := dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPREC_PARC_CR.AsCurrency     +
                                 dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPREC_PARC_FP.AsCurrency     +
                                 dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPREC_PARC_FB.AsCurrency     +
                                 dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPREC_ENC_CR.AsCurrency      +
                                 dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPREC_ENC_FP.AsCurrency      +
                                 dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPREC_ENC_FB.AsCurrency      +
                                 dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPRec_Amort_CR.AsCurrency    +
                                 dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPRec_Amort_FP.AsCurrency    +
                                 dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPRec_Amort_FB.AsCurrency    +
                                 dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPRec_Quit_CR.AsCurrency     +
                                 dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPRec_Quit_FP.AsCurrency     +
                                 dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPRec_Quit_FB.AsCurrency     +
                                 dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPABONADOS.AsFloat           +
                                 dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPREC_PARC_ATRAS_CR.AsFloat  +
                                 dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPREC_PARC_ATRAS_FP.AsFloat  +
                                 dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPPREC_PARC_ATRAS_FB.AsFloat;
                     end;
                      
                     if ((chkImprimeCobranca.Checked) and (fSoma <> 0)) or
                        (not chkImprimeCobranca.Checked) then
                        fGrava := True;

                     if fGrava then
                        dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPP.Post
                     else
                        dtmRelFechaCarteiraLinearPP.qryFechamentoCarteiraPP.Cancel;

                     qryTipoContrato.Next;
                  end;
                 // --------------------------------------------------------------------------------
               end;

//               frmProgressoDuplo.AndaFormProgressoDuplo(iContadorPlano + 1, iContadorPatro + 1);
            end;  // for(Patro)
            // -------------------------------------------------------------------------------------
         end;

//         frmProgressoDuplo.AndaFormProgressoDuplo(iContadorPlano + 1, iContadorPatro + 1);
      end;  // for(Plano)
      // -------------------------------------------------------------------------------------------
      // FIM dos loops
      // -------------------------------------------------------------------------------------------

   finally
//      frmProgressoDuplo.EscondeFormProgressoDuplo;
   end;
end;



procedure TcfgRelFechaCarteiraLinearPP.FormShow(Sender: TObject);
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




procedure TcfgRelFechaCarteiraLinearPP.DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
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



procedure TcfgRelFechaCarteiraLinearPP.DBcboTipoEmptmoExit(Sender: TObject);
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



procedure TcfgRelFechaCarteiraLinearPP.molContratoEmptmobtnBuscaContratoClick(Sender: TObject);
begin
   inherited;
   molContratoEmptmo.btnBuscaContratoClick(Sender);
end;



procedure TcfgRelFechaCarteiraLinearPP.molContratoEmptmobtnLimpaContratoClick(Sender: TObject);
begin
   inherited;
   molContratoEmptmo.btnLimpaContratoClick(Sender);
end;



procedure TcfgRelFechaCarteiraLinearPP.molListaPatrobtnInvertePatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnInvertePatroClick(Sender);
end;



procedure TcfgRelFechaCarteiraLinearPP.molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnMarcaTodosPatroClick(Sender);
end;



procedure TcfgRelFechaCarteiraLinearPP.molListaPlanobtnInvertePlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnInvertePlanoClick(Sender);
end;



procedure TcfgRelFechaCarteiraLinearPP.molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnMarcaTodosPlanoClick(Sender);
end;



end.
