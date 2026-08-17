unit cRelFechamentoCarteiraPP;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   CRel, fcCombo, fcColorCombo, StdCtrls, Mask, wwdbedit, Wwdbspin,
   wwdblook, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97,
   ExtCtrls, Db, mContratoEmptmo, mListaPlano, mListaPatro, DBTables,
   Wwquery;

type
   TcfgRelFechamentoCarteiraPP = class(TcfgRel)
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
      qrySaldoAnt: TwwQuery;
      qryQuantSaldoAnt: TwwQuery;
      qryQuantSaldoAntTOTALSLDDEV: TFloatField;
      qrySaldoAntSALDODEV: TFloatField;
      qryConcessoes: TwwQuery;
      qryConcessoesCONCESSOES: TFloatField;
      qryQuantConcessoes: TwwQuery;
      qryQuantConcessoesTOTALCONCESSOES: TFloatField;
      qryQuantQuitPar: TwwQuery;
      qryQuantQuitParTOTQUITPARC: TFloatField;
      qryParcelas: TwwQuery;
      qryQuantParcelas: TwwQuery;
      qryParcelasPARCELAS: TFloatField;
      qryQuantParcelasTOTALPARC: TFloatField;
      qryEncerrados: TwwQuery;
      qryAmortizacao: TwwQuery;
      qryQuantAmortizacao: TwwQuery;
      qryQuitacao: TwwQuery;
      qryQuantQuitacao: TwwQuery;
      qryQuitMorte: TwwQuery;
      qryQuantQuitMorte: TwwQuery;
      qryAmortizacaoAMORTIZACAO: TFloatField;
      qryQuantAmortizacaoTOTALAMO: TFloatField;
      qryQuitacaoQUITACAO: TFloatField;
      qrySaldoAtu: TwwQuery;
      qryQuantSaldoAtu: TwwQuery;
      qryQuitMorteQUIT_MORT: TFloatField;
      qryQuantQuitMorteTOTALQUM: TFloatField;
      qrySaldoAtuSALDODEV: TFloatField;
      qryQuantSaldoAtuTOTALSLDDEV: TFloatField;
      qryTipoContrato: TwwQuery;
      qryTipoContratoIDTIPOEMPTMO: TFloatField;
      qryTipoContratoDESCTIPOEMPTMO: TStringField;
      qryTipoContratoIDTIPOCONTREMPTMO: TFloatField;
      qryTipoContratoTCEDESCRICAO: TStringField;
      qryEncerradosENCERRADOS: TFloatField;
      qryEncerradosQUANTENCERRA: TFloatField;
      qryQuantQuitacaoTOTALQUI: TFloatField;

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
  cfgRelFechamentoCarteiraPP: TcfgRelFechamentoCarteiraPP;



implementation
{$R *.DFM}
uses
   DLookEmptmo,
   UDiasUteis,
   UMensErro,
   USistema,
   UfuncoesEmptmo,
   fProgressoDuplo,
   dRelFechamentoCarteiraPP;




procedure TcfgRelFechamentoCarteiraPP.AbreQueries;
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



procedure TcfgRelFechamentoCarteiraPP.MontaQuery;
begin
   inherited;

   with dtmRelFechamentoCarteiraPP do
   begin
      sMesCompetencia   := cboMes.Text + ' / ' + DBspnAno.Text;

      // -------------------------------------------------------------------------------------------

      lblTipoEmptmo.Caption := ' < todos > ';
      if DBcboTipoEmptmo.LookupValue <> ''   then lblTipoEmptmo.Caption := DBcboTipoEmptmo.Text;

      lblTipoContr.Caption  := ' < todos > ';
      if DBcboTipoContr.LookupValue <> ''    then lblTipoContr.Caption  := DBcboTipoContr.Text;

      memPatro.RichText := molListaPatro.ListaPatro;
      memPlano.RichText := molListaPlano.ListaPlano;

      // -------------------------------------------------------------------------------------------

      bSeparador        := chkLinhas.Checked;
      bCorlinha         := chkCorLinha.Checked;
      CorLinha          := cboCorLinha.SelectedColor;
   end;

   FiltraRelatorio;
end;



procedure TcfgRelFechamentoCarteiraPP.FiltraRelatorio;
var
   dDataAtu       : TDateTime;
   dDataAnt       : TDateTime;
   iAnoAtu        : Integer;
   iMesAtu        : Integer;
   iAnoAnt        : Integer;
   iMesAnt        : Integer;
   iPatro         : Integer;
   iPlano         : Integer;
   iContadorPatro : Integer;
   iContadorPlano : Integer;
begin
   dDataAtu := DiasUteis.UltDiaMes(trunc(DBspnAno.Value), (cboMes.ItemIndex + 1));

   iAnoAtu  := trunc(DBspnAno.Value);
   iMesAtu  := (cboMes.ItemIndex + 1);

   dDataAnt := EncodeDate(trunc(DBspnAno.Value), (cboMes.ItemIndex + 1), 1);
   dDataAnt := DiasUteis.SomaMeses(dDataAnt, -1);
   dDataAnt := DiasUteis.UltDiaMes(DiasUteis.ExtraiAno(dDataAnt), DiasUteis.ExtraiMes(dDataAnt));

   iAnoAnt  := DiasUteis.ExtraiAno(dDataAnt);
   iMesAnt  := DiasUteis.ExtraiMes(dDataAnt);

   dtmRelFechamentoCarteiraPP.qryFechamentoCarteiraPP.Close;
   dtmRelFechamentoCarteiraPP.qryFechamentoCarteiraPP.Open;

   try
      // ----------------------------------------------------------------------------------------------
      // Faz TRÊS loops aninhados: por Plano, por Patro e por Tipo de Contrato
      // ----------------------------------------------------------------------------------------------
      frmProgressoDuplo.MostraFormProgressoDuplo('Processando Planos',                 // Legenda de cima
                                                 'Processando Patrocinadoras',         // Legenda de Baixo
                                                 0,                                    // Mínimo de cima
                                                 0,                                    // Mínimo de baixo
                                                 molListaPlano.lstPlano.Items.Count,   // Máximo de cima
                                                 molListaPatro.lstPatro.Items.Count,   // Máximo de baixo
                                                 False,
                                                 False
                                                );

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
                     dtmRelFechamentoCarteiraPP.qryFechamentoCarteiraPP.Insert;

                     dtmRelFechamentoCarteiraPP.qryFechamentoCarteiraPPDESCTIPOEMPTMO.AsString  := qryTipoContratoDESCTIPOEMPTMO.AsString;
                     dtmRelFechamentoCarteiraPP.qryFechamentoCarteiraPPTCEDESCRICAO.AsString    := qryTipoContratoTCEDESCRICAO.AsString;
                     dtmRelFechamentoCarteiraPP.qryFechamentoCarteiraPPNOMEPLANO.AsString       := molListaPlano.lstPlano.Items[iContadorPlano];
                     dtmRelFechamentoCarteiraPP.qryFechamentoCarteiraPPNOMEPATRO.AsString       := molListaPatro.lstPatro.Items[iContadorPatro];

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

                     dtmRelFechamentoCarteiraPP.qryFechamentoCarteiraPPSALDODEV.AsCurrency := qrySaldoAntSALDODEV.AsCurrency;

                     // ----------------------------------------------------------------------------
                     LimpaParametros(qryQuantSaldoAnt);

                     if molContratoEmptmo.IDContrato > 0 then qryQuantSaldoAnt.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qryQuantSaldoAnt.ParamByName('PIDPLANOPREV').AsInteger         := molListaPlano.vIDPlano[iContadorPlano];
                     qryQuantSaldoAnt.ParamByName('PIDPATRO').AsInteger             := molListaPatro.vIDPatro[iContadorPatro];
                     qryQuantSaldoAnt.ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qryQuantSaldoAnt.ParamByName('PHMEDATAATUALIZA').AsDate        := dDataAnt;
                     qryQuantSaldoAnt.ParamByName('PHMEANOCOMPETENCIA').AsInteger   := iAnoAnt;
                     qryQuantSaldoAnt.ParamByName('PHMEMESCOMPETENCIA').AsInteger   := iMesAnt;
                     qryQuantSaldoAnt.Open;

                     dtmRelFechamentoCarteiraPP.qryFechamentoCarteiraPPTOTALSLDDEV.AsInteger := qryQuantSaldoAntTOTALSLDDEV.AsInteger;

                     // ----------------------------------------------------------------------------
                     LimpaParametros(qryConcessoes);

                     if molContratoEmptmo.IDContrato > 0 then qryConcessoes.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qryConcessoes.ParamByName('PIDPLANOPREV').AsInteger         := molListaPlano.vIDPlano[iContadorPlano];
                     qryConcessoes.ParamByName('PIDPATRO').AsInteger             := molListaPatro.vIDPatro[iContadorPatro];
                     qryConcessoes.ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qryConcessoes.ParamByName('PHMEANOCOMPETENCIA').AsInteger   := iAnoAtu;
                     qryConcessoes.ParamByName('PHMEMESCOMPETENCIA').AsInteger   := iMesAtu;
                     qryConcessoes.Open;

                     dtmRelFechamentoCarteiraPP.qryFechamentoCarteiraPPCONCESSOES.AsCurrency := qryConcessoesCONCESSOES.AsCurrency;

                     // ----------------------------------------------------------------------------
                     LimpaParametros(qryQuantConcessoes);

                     if molContratoEmptmo.IDContrato > 0 then qryQuantConcessoes.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qryQuantConcessoes.ParamByName('PIDPLANOPREV').AsInteger         := molListaPlano.vIDPlano[iContadorPlano];
                     qryQuantConcessoes.ParamByName('PIDPATRO').AsInteger             := molListaPatro.vIDPatro[iContadorPatro];
                     qryQuantConcessoes.ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qryQuantConcessoes.ParamByName('PHMEANOCOMPETENCIA').AsInteger   := iAnoAtu;
                     qryQuantConcessoes.ParamByName('PHMEMESCOMPETENCIA').AsInteger   := iMesAtu;
                     qryQuantConcessoes.Open;

                     dtmRelFechamentoCarteiraPP.qryFechamentoCarteiraPPTOTALCONCESSOES.AsInteger := qryQuantConcessoesTOTALCONCESSOES.AsInteger;

                     // ----------------------------------------------------------------------------
                     LimpaParametros(qryQuantQuitPar);

                     if molContratoEmptmo.IDContrato > 0 then qryQuantQuitPar.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qryQuantQuitPar.ParamByName('PIDPLANOPREV').AsInteger         := molListaPlano.vIDPlano[iContadorPlano];
                     qryQuantQuitPar.ParamByName('PIDPATRO').AsInteger             := molListaPatro.vIDPatro[iContadorPatro];
                     qryQuantQuitPar.ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qryQuantQuitPar.ParamByName('PHMEANOCOMPETENCIA').AsInteger   := iAnoAtu;
                     qryQuantQuitPar.ParamByName('PHMEMESCOMPETENCIA').AsInteger   := iMesAtu;
                     qryQuantQuitPar.Open;

                     dtmRelFechamentoCarteiraPP.qryFechamentoCarteiraPPTOTALQUIPARC.AsInteger := qryQuantQuitParTOTQUITPARC.AsInteger;

                     // ----------------------------------------------------------------------------
                     LimpaParametros(qryParcelas);

                     if molContratoEmptmo.IDContrato > 0 then qryParcelas.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qryParcelas.ParamByName('PIDPLANOPREV').AsInteger         := molListaPlano.vIDPlano[iContadorPlano];
                     qryParcelas.ParamByName('PIDPATRO').AsInteger             := molListaPatro.vIDPatro[iContadorPatro];
                     qryParcelas.ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qryParcelas.ParamByName('PHMEANOCOMPETENCIA').AsInteger   := iAnoAtu;
                     qryParcelas.ParamByName('PHMEMESCOMPETENCIA').AsInteger   := iMesAtu;
                     qryParcelas.Open;

                     dtmRelFechamentoCarteiraPP.qryFechamentoCarteiraPPPARCELAS.AsCurrency := qryParcelasPARCELAS.AsCurrency;

                     // ----------------------------------------------------------------------------
                     LimpaParametros(qryQuantParcelas);

                     if molContratoEmptmo.IDContrato > 0 then qryQuantParcelas.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qryQuantParcelas.ParamByName('PIDPLANOPREV').AsInteger         := molListaPlano.vIDPlano[iContadorPlano];
                     qryQuantParcelas.ParamByName('PIDPATRO').AsInteger             := molListaPatro.vIDPatro[iContadorPatro];
                     qryQuantParcelas.ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qryQuantParcelas.ParamByName('PHMEANOCOMPETENCIA').AsInteger   := iAnoAtu;
                     qryQuantParcelas.ParamByName('PHMEMESCOMPETENCIA').AsInteger   := iMesAtu;
                     qryQuantParcelas.Open;

                     dtmRelFechamentoCarteiraPP.qryFechamentoCarteiraPPTOTALPARC.AsInteger := qryQuantParcelasTOTALPARC.AsInteger;

                     // ----------------------------------------------------------------------------
                     LimpaParametros(qryEncerrados);

                     if molContratoEmptmo.IDContrato > 0 then qryEncerrados.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qryEncerrados.ParamByName('PIDPLANOPREV').AsInteger         := molListaPlano.vIDPlano[iContadorPlano];
                     qryEncerrados.ParamByName('PIDPATRO').AsInteger             := molListaPatro.vIDPatro[iContadorPatro];
                     qryEncerrados.ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qryEncerrados.ParamByName('PHMEANOCOMPETENCIA').AsInteger   := iAnoAtu;
                     qryEncerrados.ParamByName('PHMEMESCOMPETENCIA').AsInteger   := iMesAtu;
                     qryEncerrados.Open;

                     dtmRelFechamentoCarteiraPP.qryFechamentoCarteiraPPENCERRADOS.AsCurrency   := qryEncerradosENCERRADOS.AsCurrency;
                     dtmRelFechamentoCarteiraPP.qryFechamentoCarteiraPPTOTAL_ENCERRA.AsInteger := qryEncerradosQUANTENCERRA.AsInteger;

                     // ----------------------------------------------------------------------------
                     LimpaParametros(qryAmortizacao);

                     if molContratoEmptmo.IDContrato > 0 then qryAmortizacao.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qryAmortizacao.ParamByName('PIDPLANOPREV').AsInteger         := molListaPlano.vIDPlano[iContadorPlano];
                     qryAmortizacao.ParamByName('PIDPATRO').AsInteger             := molListaPatro.vIDPatro[iContadorPatro];
                     qryAmortizacao.ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qryAmortizacao.ParamByName('PHMEANOCOMPETENCIA').AsInteger   := iAnoAtu;
                     qryAmortizacao.ParamByName('PHMEMESCOMPETENCIA').AsInteger   := iMesAtu;
                     qryAmortizacao.Open;

                     dtmRelFechamentoCarteiraPP.qryFechamentoCarteiraPPAMORTIZACAO.AsCurrency := qryAmortizacaoAMORTIZACAO.AsCurrency;

                     // ----------------------------------------------------------------------------
                     LimpaParametros(qryQuantAmortizacao);

                     if molContratoEmptmo.IDContrato > 0 then qryQuantAmortizacao.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qryQuantAmortizacao.ParamByName('PIDPLANOPREV').AsInteger         := molListaPlano.vIDPlano[iContadorPlano];
                     qryQuantAmortizacao.ParamByName('PIDPATRO').AsInteger             := molListaPatro.vIDPatro[iContadorPatro];
                     qryQuantAmortizacao.ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qryQuantAmortizacao.ParamByName('PHMEANOCOMPETENCIA').AsInteger   := iAnoAtu;
                     qryQuantAmortizacao.ParamByName('PHMEMESCOMPETENCIA').AsInteger   := iMesAtu;
                     qryQuantAmortizacao.Open;

                     dtmRelFechamentoCarteiraPP.qryFechamentoCarteiraPPTOTALAMO.AsInteger := qryQuantAmortizacaoTOTALAMO.AsInteger;

                     // ----------------------------------------------------------------------------
                     LimpaParametros(qryQuitacao);

                     if molContratoEmptmo.IDContrato > 0 then qryQuitacao.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qryQuitacao.ParamByName('PIDPLANOPREV').AsInteger         := molListaPlano.vIDPlano[iContadorPlano];
                     qryQuitacao.ParamByName('PIDPATRO').AsInteger             := molListaPatro.vIDPatro[iContadorPatro];
                     qryQuitacao.ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qryQuitacao.ParamByName('PHMEANOCOMPETENCIA').AsInteger   := iAnoAtu;
                     qryQuitacao.ParamByName('PHMEMESCOMPETENCIA').AsInteger   := iMesAtu;
                     qryQuitacao.Open;

                     dtmRelFechamentoCarteiraPP.qryFechamentoCarteiraPPQUITACAO.AsCurrency := qryQuitacaoQUITACAO.AsCurrency;

                     // ----------------------------------------------------------------------------
                     LimpaParametros(qryQuantQuitacao);

                     if molContratoEmptmo.IDContrato > 0 then qryQuantQuitacao.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qryQuantQuitacao.ParamByName('PIDPLANOPREV').AsInteger         := molListaPlano.vIDPlano[iContadorPlano];
                     qryQuantQuitacao.ParamByName('PIDPATRO').AsInteger             := molListaPatro.vIDPatro[iContadorPatro];
                     qryQuantQuitacao.ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qryQuantQuitacao.ParamByName('PHMEANOCOMPETENCIA').AsInteger   := iAnoAtu;
                     qryQuantQuitacao.ParamByName('PHMEMESCOMPETENCIA').AsInteger   := iMesAtu;
                     qryQuantQuitacao.Open;

                     dtmRelFechamentoCarteiraPP.qryFechamentoCarteiraPPTOTALQUI.AsInteger := qryQuantQuitacaoTOTALQUI.AsInteger;

                     // ----------------------------------------------------------------------------
                     LimpaParametros(qryQuitMorte);

                     if molContratoEmptmo.IDContrato > 0 then qryQuitMorte.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qryQuitMorte.ParamByName('PIDPLANOPREV').AsInteger         := molListaPlano.vIDPlano[iContadorPlano];
                     qryQuitMorte.ParamByName('PIDPATRO').AsInteger             := molListaPatro.vIDPatro[iContadorPatro];
                     qryQuitMorte.ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qryQuitMorte.ParamByName('PHMEANOCOMPETENCIA').AsInteger   := iAnoAtu;
                     qryQuitMorte.ParamByName('PHMEMESCOMPETENCIA').AsInteger   := iMesAtu;
                     qryQuitMorte.Open;

                     dtmRelFechamentoCarteiraPP.qryFechamentoCarteiraPPQUIT_MORT.AsCurrency := qryQuitMorteQUIT_MORT.AsCurrency;

                     // ----------------------------------------------------------------------------
                     LimpaParametros(qryQuantQuitMorte);

                     if molContratoEmptmo.IDContrato > 0 then qryQuantQuitMorte.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qryQuantQuitMorte.ParamByName('PIDPLANOPREV').AsInteger         := molListaPlano.vIDPlano[iContadorPlano];
                     qryQuantQuitMorte.ParamByName('PIDPATRO').AsInteger             := molListaPatro.vIDPatro[iContadorPatro];
                     qryQuantQuitMorte.ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qryQuantQuitMorte.ParamByName('PHMEANOCOMPETENCIA').AsInteger   := iAnoAtu;
                     qryQuantQuitMorte.ParamByName('PHMEMESCOMPETENCIA').AsInteger   := iMesAtu;
                     qryQuantQuitMorte.Open;

                     dtmRelFechamentoCarteiraPP.qryFechamentoCarteiraPPTOTALQUM.AsInteger := qryQuantQuitMorteTOTALQUM.AsInteger;

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

                     dtmRelFechamentoCarteiraPP.qryFechamentoCarteiraPPSALDOATU.AsCurrency := qrySaldoAtuSALDODEV.AsCurrency;

                     // ----------------------------------------------------------------------------
                     LimpaParametros(qryQuantSaldoAtu);

                     if molContratoEmptmo.IDContrato > 0 then qryQuantSaldoAtu.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

                     qryQuantSaldoAtu.ParamByName('PIDPLANOPREV').AsInteger        := molListaPlano.vIDPlano[iContadorPlano];
                     qryQuantSaldoAtu.ParamByName('PIDPATRO').AsInteger            := molListaPatro.vIDPatro[iContadorPatro];
                     qryQuantSaldoAtu.ParamByName('PIDTIPOCONTREMPTMO').AsInteger  := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     qryQuantSaldoAtu.ParamByName('PHMEDATAATUALIZA').AsDate       := dDataAtu;
                     qryQuantSaldoAtu.ParamByName('PHMEANOCOMPETENCIA').AsInteger  := iAnoAtu;
                     qryQuantSaldoAtu.ParamByName('PHMEMESCOMPETENCIA').AsInteger  := iMesAtu;
                     qryQuantSaldoAtu.Open;

                     dtmRelFechamentoCarteiraPP.qryFechamentoCarteiraPPTOTALSLA.AsInteger := qryQuantSaldoAtuTOTALSLDDEV.AsInteger;

                     // ----------------------------------------------------------------------------

                     dtmRelFechamentoCarteiraPP.qryFechamentoCarteiraPP.Post;

                     qryTipoContrato.Next;
                  end;
                 // --------------------------------------------------------------------------------
               end;

               frmProgressoDuplo.AndaFormProgressoDuplo(iContadorPlano + 1, iContadorPatro + 1);
            end;  // for(Patro)
            // -------------------------------------------------------------------------------------
         end;

         frmProgressoDuplo.AndaFormProgressoDuplo(iContadorPlano + 1, iContadorPatro + 1);
      end;  // for(Plano)
      // -------------------------------------------------------------------------------------------
      // FIM dos loops
      // -------------------------------------------------------------------------------------------

   finally
      frmProgressoDuplo.EscondeFormProgressoDuplo;

      LimpaParametros(qryTipoContrato);

      LimpaParametros(qrySaldoAnt);
      LimpaParametros(qryQuantSaldoAnt);
      LimpaParametros(qryConcessoes);
      LimpaParametros(qryQuantConcessoes);
      LimpaParametros(qryQuantQuitPar);
      LimpaParametros(qryParcelas);
      LimpaParametros(qryQuantParcelas);
      LimpaParametros(qryEncerrados);
      LimpaParametros(qryAmortizacao);
      LimpaParametros(qryQuantAmortizacao);
      LimpaParametros(qryQuitacao);
      LimpaParametros(qryQuantQuitacao);
      LimpaParametros(qryQuitMorte);
      LimpaParametros(qryQuantQuitMorte);
      LimpaParametros(qrySaldoAtu);
      LimpaParametros(qryQuantSaldoAtu);
   end;
end;



procedure TcfgRelFechamentoCarteiraPP.FormShow(Sender: TObject);
begin
   inherited;

   molContratoEmptmo.btnLimpaContrato.Click;

   // preenche o ano de referência/competência
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



procedure TcfgRelFechamentoCarteiraPP.DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
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



procedure TcfgRelFechamentoCarteiraPP.DBcboTipoEmptmoExit(Sender: TObject);
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



procedure TcfgRelFechamentoCarteiraPP.molContratoEmptmobtnBuscaContratoClick(Sender: TObject);
begin
   inherited;
   molContratoEmptmo.btnBuscaContratoClick(Sender);
end;



procedure TcfgRelFechamentoCarteiraPP.molContratoEmptmobtnLimpaContratoClick(Sender: TObject);
begin
   inherited;
   molContratoEmptmo.btnLimpaContratoClick(Sender);
end;



procedure TcfgRelFechamentoCarteiraPP.molListaPatrobtnInvertePatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnInvertePatroClick(Sender);
end;



procedure TcfgRelFechamentoCarteiraPP.molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnMarcaTodosPatroClick(Sender);
end;



procedure TcfgRelFechamentoCarteiraPP.molListaPlanobtnInvertePlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnInvertePlanoClick(Sender);
end;



procedure TcfgRelFechamentoCarteiraPP.molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnMarcaTodosPlanoClick(Sender);
end;



end.
