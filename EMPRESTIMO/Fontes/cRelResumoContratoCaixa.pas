unit cRelResumoContratoCaixa;

// Alterações:
{ --------------------------------------------------------------------------------------------------
Pendência   : SOL 114575 KINTANA 535771
Responsável : Jéssica Lana
Data        : 24/04/2009
Descrição   : Gravar arquivos com a query de entrada na pasta C:\PLANUS\TEMP.
----------------------------------------------------------------------------------------------------
Rotina    :
Data      : 20/12/2005
Autor     : André Pontes
Pendencia : 21060
Descrição : Filtro para exibir apenas itens em aberto
----------------------------------------------------------------------------------------------------
Rotina    : - qryRelatorio
Data      : 28/11/2003
Autor     : André Pontes
Pendencia :
Descrição : Retiradas as cláusulas flgBaixado is null (não rola quando é abonada/quitado)
----------------------------------------------------------------------------------------------------
Rotina    : FiltraRelatorio
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
   ExtCtrls, Db, mListaPlano, mListaPatro, mContratoEmptmo, DBTables, Wwquery,
   uTypesEmptmo, fProgressoDuplo, mListaPlanoContab;

type
   TcfgRelResumoContratoCaixa = class(TcfgRel)
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
      chkDivergente: TCheckBox;
      qryRelatorio: TwwQuery;
      qryContratos: TwwQuery;
      qryContratosIDCONTRATOEMPTMO: TFloatField;
      qryContratosDESCTIPOEMPTMO: TStringField;
      qryContratosTCEDESCRICAO: TStringField;
      qryLookTipoContr: TwwQuery;
      qryLookTipoContrIDTIPOCONTREMPTMO: TFloatField;
      qryLookTipoContrTCEDESCRICAO: TStringField;
      qryLookTipoContrIDTIPOEMPTMO: TFloatField;
      qryLookTipoContrDESCTIPOEMPTMO: TStringField;
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
      qryMovimentoNormal: TwwQuery;
      qryMovimentoNormalHMEVLRPREVISTO: TFloatField;
      chkEmAberto: TCheckBox;
      qryRelatorioDESCTIPOEMPTMO: TStringField;
      qryRelatorioTCEDESCRICAO: TStringField;
      qryRelatorioIDCONTRATOEMPTMO: TFloatField;
      qryRelatorioMATRICULA: TStringField;
      qryRelatorioINSCRICAONUMERO: TFloatField;
      qryRelatorioNOME: TStringField;
      qryRelatorioSALDO_ANT: TFloatField;
      qryRelatorioPARCELAS: TFloatField;
      qryRelatorioENCARGOS: TFloatField;
      qryRelatorioREC_PARC: TFloatField;
      qryRelatorioREC_ENC: TFloatField;
      qryRelatorioREC_AMORT: TFloatField;
      qryRelatorioREC_QUIT: TFloatField;
      qryRelatorioAMORTIZACAO: TFloatField;
      qryRelatorioQUITACAO: TFloatField;
      qryRelatorioABONADO: TFloatField;
      qryRelatorioQUITADO: TFloatField;
      qryRelatorioSALDO_DEV: TFloatField;
      qryRelatorioDIFERENCA: TFloatField;
      chkApropriado: TCheckBox;
      chkAbonoContab: TCheckBox;
      chkRenovacao: TCheckBox;
      chkSintetico: TCheckBox;
    molListaPlano: TmolListaPlanoContab;
    qryQuitacao: TwwQuery;
    qryQuitacaoIDTIPOCONTREMPTMO: TFloatField;
    qryQuitacaoHMEVLRPREVISTO: TFloatField;
    qryQuitacaoTOTALQUI: TFloatField;
    qryQuitacaoMorte: TwwQuery;
    qryQuitacaoMorteIDTIPOCONTREMPTMO: TFloatField;
    qryQuitacaoMorteHMEVLRPREVISTO: TFloatField;
    qryQuitacaoMorteTOTALQUM: TFloatField;
    qryContratoINSCRICAONUMERO: TFloatField;
    qryItensAbonados: TwwQuery;
    qryItensAbonadosIDCONTRATOEMPTMO: TFloatField;
    qryItensAbonadosABONADO: TFloatField;
    qryItensAbonadosTOT_ABONADO: TFloatField;
    qryItensQuitados: TwwQuery;
    qryItensQuitadosIDCONTRATOEMPTMO: TFloatField;
    qryItensQuitadosQUITADO: TFloatField;
    qryItensQuitadosTOT_QUITADO: TFloatField;
    qryParcRec: TwwQuery;
    qryParcRecIDCONTRATOEMPTMO: TFloatField;
    qryParcRecREC_PARC: TFloatField;
    qryParcRecTOT_REC_PARC: TFloatField;
    qryAmoRec: TwwQuery;
    qryAmoRecIDCONTRATOEMPTMO: TFloatField;
    qryAmoRecREC_AMORT: TFloatField;
    qryAmoRecTOT_REC_AMORT: TFloatField;
    qryQuiRec: TwwQuery;
    qryQuiRecIDCONTRATOEMPTMO: TFloatField;
    qryQuiRecREC_QUIT: TFloatField;
    qryQuiRecTOT_REC_QUIT: TFloatField;
    qryEncRec: TwwQuery;
    qryEncRecIDCONTRATOEMPTMO: TFloatField;
    qryEncRecREC_ENC: TFloatField;
    qryEncRecTOT_REC_ENC: TFloatField;
    qryAjusteRec: TwwQuery;
    qryAjusteRecIDCONTRATOEMPTMO: TFloatField;
    qryAjusteRecREC_AJUSTE: TFloatField;
    qryAjusteRecTOT_REC_PARC: TFloatField;

      procedure FormShow(Sender: TObject);
      procedure DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure DBcboTipoEmptmoExit(Sender: TObject);
      procedure qryContratosBeforeOpen(DataSet: TDataSet);
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
  cfgRelResumoContratoCaixa: TcfgRelResumoContratoCaixa;



implementation
{$R *.DFM}
uses
   DLookEmptmo,
   UDiasUteis,
   UMensErro,
   USistema,
   UfuncoesEmptmo,
   dEmptmo,
   dRelResumoContratoCaixa,
   uCalcEmptmo,
   FProgresso;




procedure TcfgRelResumoContratoCaixa.AbreQueries;
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



procedure TcfgRelResumoContratoCaixa.MontaQuery;
begin
   inherited;

   with dtmRelResumoContratoCaixa do
   begin
      lblApropriado.Visible   := chkApropriado.Checked;
      lblAbonoContab.Visible  := chkAbonoContab.Checked;
      lblRenovacao.Visible    := chkRenovacao.Checked;
      lblEmAberto.Visible     := chkEmAberto.Checked;

      sMesCompetencia   := cboMes.Text + ' / ' + DBspnAno.Text;

      bSeparador        := chkLinhas.Checked;

      // determina se as linhas do relatório serão impressas em cores alternadas, e qual cor usar
      bCorlinha         := chkCorLinha.Checked;
      CorLinha          := cboCorLinha.SelectedColor;

      bSintetico        := chkSintetico.Checked;

      // -------------------------------------------------------------------------------------------

      lblTipoEmptmo.Caption := ' < todos > ';
      if DBcboTipoEmptmo.LookupValue <> ''   then lblTipoEmptmo.Caption := DBcboTipoEmptmo.Text;

      lblTipoContr.Caption  := ' < todos > ';
      if DBcboTipoContr.LookupValue <> ''    then lblTipoContr.Caption  := DBcboTipoContr.Text;

      memPatro.RichText := molListaPatro.ListaPatro;
      memPlano.RichText := molListaPlano.ListaPlano;

      // -------------------------------------------------------------------------------------------
   end;

   ParametrosSistema;

   case dtmEmptmo.qryParamEmptmoFLGCALCDIA.AsInteger of
      0: FiltraRelatorio;
      1: FiltraRelatorioAtuDia;
   end;
end;



procedure TcfgRelResumoContratoCaixa.FiltraRelatorio;
var
   sSQL        : String;
   sAno        : String;
   sMes        : String;
   sDataAnt    : String;
   sDataAtu    : String;
   sDataIni    : String;
   dDataAnt    : TDateTime;
   dDataAtu    : TDateTime;
   dDataIni    : TDateTime;
   iAnoAnt     : Integer;
   iMesAnt     : Integer;
   iAnoAtu     : Integer;
   iMesAtu     : Integer;
   iContador   : Integer;
   bInsere     : Boolean;
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

   // ----------------------------------------------------------------------------------------------
   sSQL :=
   'SELECT '                                                                                          + #13 +
   '  CON.IDCONTRATOEMPTMO, '                                                                         + #13 +
   '  TEP.DESCTIPOEMPTMO, '                                                                           + #13 +
   '  TCE.TCEDESCRICAO '                                                                              + #13 +

   'FROM '                                                                                            + #13 +
   '  CONTRATOEMPTMO  CON, '                                                                          + #13 +

   '-- SALDO ANTERIOR ---------------------------------------------------------------------------- '  + #13 +
   '   ( '                                                                                            + #13 +
   '   SELECT '                                                                                       + #13 +
   '      C.IDCONTRATOEMPTMO, C.IDTIPOCONTREMPTMO, '                                                  + #13 +
   '      (NVL(PAR_DEV.VLR_DEV, 0) - NVL(PAR_PAG.VLR_PAG, 0)) AS DEVE, '                                       + #13 +
   '      DECODE((ROUND(NVL(PAR_DEV.VLR_DEV, 0), 2) - ROUND(NVL(PAR_PAG.VLR_PAG, 0), 2)), 0, 0, 1) AS QUANT '  + #13 +
   '   FROM '                                                                                         + #13 +
   '      CONTRATOEMPTMO C, '                                                                         + #13 +
   '      ( '                                                                                         + #13 +
   '      SELECT '                                                                                    + #13 +
   '         CON.IDCONTRATOEMPTMO, SUM(NVL(HME.HMEVLRPREVISTO, 0)) AS VLR_DEV '                       + #13 +
   '      FROM '                                                                                      + #13 +
   '         HISTMOVEMPTMO HME, CONTRATOEMPTMO CON '                                                  + #13 +
   '      WHERE '                                                                                     + #13 +
   '             CON.FLGSITUACAO        <> ''C'' '                                                    + #13 +
   '         AND HME.HMETIPOMOV         IN (1, 2, 3, 4, 7) '                                          + #13 +
   '         AND HME.HMESEQCOBRANCA     = 1 '                                                         + #13 +
   '         AND HME.HMEDATAPREVISTA    <= TO_DATE(' + sDataAtu + ', ''DD/MM/YYYY'') '                + #13 +
   '         AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) ) '                            + #13 +
   '         AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO IS NULL) ) '                        + #13;

   // Tipo de Contrato
   if DBcboTipoContr.LookupValue <> '' then sSQL := sSQL +
   '         AND CON.IDTIPOCONTREMPTMO  = ' + DBcboTipoContr.LookupValue                           + #13;

   // Contrato
   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '         AND CON.IDCONTRATOEMPTMO   = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)         + #13;

   sSQL := sSQL +
   '         AND ( CON.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO ) '                                    + #13 +
   '      GROUP BY '                                                                                  + #13 +
   '         CON.IDCONTRATOEMPTMO '                                                                   + #13 +
   '      ) PAR_DEV, '                                                                                + #13 +
   '      ( '                                                                                         + #13 +
   '      SELECT '                                                                                    + #13 +
   '         CON.IDCONTRATOEMPTMO, '                                                                  + #13 +
   '         SUM(DECODE(FLGQUITADO, 1, NVL(HME.HMEVLRPREVISTO, 0), '                                        + #13 +
   '                                   DECODE(FLGABONADO, 1, NVL(HME.HMEVLRPREVISTO, 0), '                  + #13 +
   '                                                         NVL(HME.HMEVLREFETIVO, 0)))) AS VLR_PAG '      + #13 +
   '      FROM '                                                                                      + #13 +
   '         HISTMOVEMPTMO HME, CONTRATOEMPTMO CON '                                                  + #13 +
   '      WHERE '                                                                                     + #13 +
   '             CON.FLGSITUACAO        <> ''C'' '                                                    + #13 +
   '         AND HME.HMETIPOMOV         IN (1, 2, 3, 4, 7) '                                          + #13 +
   '         AND HME.HMEDATAPREVISTA    <= TO_DATE(' + sDataAtu + ', ''DD/MM/YYYY'') '                + #13 +
   '         AND ( '                                                                                  + #13 +
   '             (HME.HMEDATAEFETIVA    <= TO_DATE(' + sDataAtu + ', ''DD/MM/YYYY'')) '               + #13 +
   '             OR ( (HME.FLGQUITADO = 1) AND (HME.HMEDATAQUITABONO <= TO_DATE(' + sDataAtu + ',''DD/MM/YYYY'')) ) '   + #13 +
   '             OR ( (HME.FLGABONADO = 1) AND (HME.HMEDATAQUITABONO <= TO_DATE(' + sDataAtu + ',''DD/MM/YYYY'')) ) '   + #13 +
   '             ) '                                                                                  + #13 +
   '         AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) ) '                            + #13 +
   '         AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO IS NULL) ) '                        + #13;

   // Tipo de Contrato
   if DBcboTipoContr.LookupValue <> '' then sSQL := sSQL +
   '         AND CON.IDTIPOCONTREMPTMO  = ' + DBcboTipoContr.LookupValue                           + #13;

   // Contrato
   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '         AND CON.IDCONTRATOEMPTMO   = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)         + #13;

   sSQL := sSQL +
   '         AND ( CON.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO ) '                                    + #13 +
   '      GROUP BY '                                                                                  + #13 +
   '         CON.IDCONTRATOEMPTMO '                                                                   + #13 +
   '      ) PAR_PAG '                                                                                 + #13 +
   '   WHERE '                                                                                        + #13 +
   '          C.IDCONTRATOEMPTMO   = PAR_DEV.IDCONTRATOEMPTMO '                                       + #13;

   if chkEmAberto.Checked then sSQL := sSQL +
   '      AND (NVL(PAR_DEV.VLR_DEV, 0) - NVL(PAR_PAG.VLR_PAG, 0)) <> 0 '                              + #13;

   // Tipo de Contrato
   if DBcboTipoContr.LookupValue <> '' then sSQL := sSQL +
   '      AND C.IDTIPOCONTREMPTMO  = ' + DBcboTipoContr.LookupValue                                + #13;

   // Contrato
   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '      AND C.IDCONTRATOEMPTMO   = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)              + #13;

   sSQL := sSQL +
   '      AND C.IDCONTRATOEMPTMO   = PAR_PAG.IDCONTRATOEMPTMO(+) '                                    + #13 +
   '      ) SALDO_ANT, '                                                                              + #13 +
   '-- FIM SALDO ANTERIOR ------------------------------------------------------------------------ '  + #13 +

   '  TIPOCONTREMPTMO TCE, '                                                                    + #13 +
   '  TIPOEMPTMO      TEP '                                                                     + #13 +

   'WHERE '                                                                                     + #13 +
   '      TEP.IDEMPRESAPROP               = ' + IntToStr(Sistema.IDEmpresa)                     + #13 +
   '  AND CON.FLGSITUACAO                 <> ''C'' '                                            + #13 +
   '  AND CON.IDPATRO                     IN (' + molListaPatro.PegaPatro + ') '                + #13 +
   '  AND CON.IDPLANOPREV                 IN (' + molListaPlano.PegaPlano + ') '                + #13;

   // Contrato
   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '  AND CON.IDCONTRATOEMPTMO            = ' + FormatFloat('#0', molContratoEmptmo.IDContrato) + #13;

   // Tipo de Empréstimo
   if DBcboTipoContr.LookupValue <> '' then sSQL := sSQL +
   '  AND TCE.IDTIPOEMPTMO                = ' + DBcboTipoEmptmo.LookupValue                     + #13;

   // Tipo de Contrato
   if DBcboTipoContr.LookupValue <> '' then sSQL := sSQL +
   '  AND CON.IDTIPOCONTREMPTMO           = ' + DBcboTipoContr.LookupValue                   + #13;

   sSQL := sSQL +
   '  AND TEP.IDTIPOEMPTMO                = TCE.IDTIPOEMPTMO '                                  + #13 +
   '  AND TCE.IDTIPOCONTREMPTMO           = CON.IDTIPOCONTREMPTMO '                             + #13 +
   '  AND CON.IDCONTRATOEMPTMO            = SALDO_ANT.IDCONTRATOEMPTMO '                        + #13 +

   'ORDER BY '                                                                                  + #13 +
   '   TEP.DESCTIPOEMPTMO, TCE.TCEDESCRICAO, CON.IDCONTRATOEMPTMO ';

   qryContratos.Close;
   qryContratos.SQL.Clear;
   qryContratos.SQL.Text := sSQL;

 //Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
 //qryContratos.SQL.SaveToFile(Sistema.TempDir + 'EP-RelResumoContratoCaixa(base).txt');
   qryContratos.SQL.SaveToFile(ftempregra + '\' + 'EP-RelResumoContratoCaixa(base).txt');

   Application.ProcessMessages;

   MostraEspera('Selecionando Contratos...');
   Application.ProcessMessages;

   qryContratos.Open;

   EscondeEspera;
   Application.ProcessMessages;

   if qryContratos.IsEmpty then Exit;

   qryContratos.First;
   Application.ProcessMessages;
   // ----------------------------------------------------------------------------------------------

   dtmRelResumoContratoCaixa.qryResumoContratoCaixa.Close;
   dtmRelResumoContratoCaixa.qryResumoContratoCaixa.Open;

   EscondeEspera;

   iContador := 0;

   frmProgresso.MostraFormProgresso('Gerando relatório...',
                                    True,
                                    True,
                                    True,
                                    0,
                                    qryContratos.RecordCount
                                   );

   try
      while not(qryContratos.EOF) do
      begin
         with qryRelatorio do
         begin
            if frmProgresso.Cancelou then
            begin
               qryContratos.Close;
               qryRelatorio.Close;
               Exit;
            end;

            LimpaParametros(qryRelatorio);

            ParamByName('PIDEMPRESAPROP').AsInteger      := Sistema.IDEmpresa;
            ParamByName('PIDCONTRATOEMPTMO').AsFloat     := qryContratosIDCONTRATOEMPTMO.AsFloat;

            ParamByName('PDATAANT').AsDateTime           := dDataAnt;
            ParamByName('PDATAINI').AsDateTime           := dDataIni;
            ParamByName('PDATAATU').AsDateTime           := dDataAtu;

            if chkApropriado.Checked then
               ParamByName('PAPROPRIADO').AsInteger      := 1;

            if chkAbonoContab.Checked then
               ParamByName('PABONOCONTAB').AsInteger     := 1;

            if chkRenovacao.Checked then
               ParamByName('PRENOVACAO').AsInteger       := 1;

            Open;

            if not(qryRelatorio.IsEmpty) then
            begin
               bInsere  := True;

               bInsere  := (qryRelatorioSALDO_ANT.AsCurrency <> 0) or
                           (qryRelatorioPARCELAS.AsCurrency <> 0) or
                           (qryRelatorioENCARGOS.AsCurrency <> 0) or
                           (qryRelatorioAMORTIZACAO.AsCurrency <> 0) or
                           (qryRelatorioQUITACAO.AsCurrency <> 0) or
                           (qryRelatorioREC_PARC.AsCurrency <> 0) or
                           (qryRelatorioREC_ENC.AsCurrency <> 0) or
                           (qryRelatorioREC_AMORT.AsCurrency <> 0) or
                           (qryRelatorioREC_QUIT.AsCurrency <> 0) or
                           (qryRelatorioABONADO.AsCurrency <> 0) or
                           (qryRelatorioQUITADO.AsCurrency <> 0) or
                           (qryRelatorioSALDO_DEV.AsCurrency <> 0);

               if chkDivergente.Checked then bInsere := qryRelatorioDIFERENCA.AsCurrency <> 0;

               if bInsere then
               begin
                  with dtmRelResumoContratoCaixa.qryResumoContratoCaixa do
                  begin
                     Append;

                     FieldByName('IDCONTRATOEMPTMO').AsFloat   := qryRelatorioIDCONTRATOEMPTMO.AsFloat;

                     FieldByName('MATRICULA').AsString         := qryRelatorioMATRICULA.AsString;
                     FieldByName('INSCRICAONUMERO').AsInteger  := qryRelatorioINSCRICAONUMERO.AsInteger;

                     FieldByName('NOME').AsString              := qryRelatorioNOME.AsString;

                     FieldByName('DESCTIPOEMPTMO').AsString    := qryRelatorioDESCTIPOEMPTMO.AsString;
                     FieldByName('TCEDESCRICAO').AsString      := qryRelatorioTCEDESCRICAO.AsString;

                     FieldByName('SALDO_ANT').AsCurrency       := qryRelatorioSALDO_ANT.AsCurrency;
                     FieldByName('CONCESSOES').AsCurrency      := 0;
                     FieldByName('PARCELAS').AsCurrency        := qryRelatorioPARCELAS.AsCurrency;
                     FieldByName('ENCARGOS').AsCurrency        := qryRelatorioENCARGOS.AsCurrency;
                     FieldByName('AMORTIZACAO').AsCurrency     := qryRelatorioAMORTIZACAO.AsCurrency;
                     FieldByName('QUITACAO').AsCurrency        := qryRelatorioQUITACAO.AsCurrency;
                     FieldByName('REC_PARC').AsCurrency        := qryRelatorioREC_PARC.AsCurrency;
                     FieldByName('REC_ENC').AsCurrency         := qryRelatorioREC_ENC.AsCurrency;
                     FieldByName('REC_AMORT').AsCurrency       := qryRelatorioREC_AMORT.AsCurrency;
                     FieldByName('REC_QUIT').AsCurrency        := qryRelatorioREC_QUIT.AsCurrency;

                     FieldByName('ABONADO').AsCurrency         := qryRelatorioABONADO.AsCurrency;
                     FieldByName('QUITADO').AsCurrency         := qryRelatorioQUITADO.AsCurrency;

                     FieldByName('SALDO_DEV').AsCurrency       := qryRelatorioSALDO_DEV.AsCurrency;

                     Post;
                  end;  // with dtmRelResumoContratoCaixa.qryResumoContratoCaixa
               end;  // if bInsere
            end;  // if not(qryRelatorio.IsEmpty)

            Close;
         end;  // with qryRelatorio

         inc(iContador);

         AndaFormProgresso(iContador);

         qryContratos.Next;
      end;  // while not(qryContratos.EOF)

   finally
      frmProgresso.EscondeFormProgresso;
      EscondeEspera;
   end;
end;



procedure TcfgRelResumoContratoCaixa.FiltraRelatorioAtuDia;
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

   bGrava            : Boolean;

   rSaldoDevAnt      : TSaldoDevAnt;
   rSaldoDevAtu      : TSaldoDevAnt;

   dDataAnt          : TDateTime;
   dDataAtu          : TDateTime;

   fVlrConcessao     : Currency;
   fVlrParcela       : Currency;
   fVlrAmortizacao   : Currency;
   fVlrAtuDia        : Currency;
   fVlrAjuste        : Currency;
   fVlrQuitacao      : Currency;
   fVlrQuitacaoMorte : Currency;
   fVlrDiverg        : Currency;
   fVlrEncargo       : Currency;
   fVlrAbonado       : Currency;
   fVlrQuitado       : Currency;
   fRec_Parc         : Currency;
   fRec_Enc          : Currency;
   fRec_Amort        : Currency;
   fRec_Quit         : Currency;
   fRec_ajuste       : Currency;
begin

   dDataAtu := DiasUteis.UltDiaMes(Trunc(DBspnAno.Value), (cboMes.ItemIndex + 1));

   dDataAnt := EncodeDate(Trunc(DBspnAno.Value), (cboMes.ItemIndex + 1), 1);
   dDataAnt := DiasUteis.SomaMeses(dDataAnt, -1);
   dDataAnt := DiasUteis.UltDiaMes(DiasUteis.ExtraiAno(dDataAnt), DiasUteis.ExtraiMes(dDataAnt));

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

   // ----------------------------------------------------------------------------------------------

   dtmRelResumoContratoCaixa.qryResumoContratoCaixa.Close;
   dtmRelResumoContratoCaixa.qryResumoContratoCaixa.Open;

   // ----------------------------------------------------------------------------------------------

   try
      // ----------------------------------------------------------------------------------------------
      // Faz TRÊS loops aninhados: por Plano, por Patro e por Tipo de Contrato
      // ----------------------------------------------------------------------------------------------
      frmProgressoDuplo.MostraFormProgressoDuplo('Processando Plano, Patrociandora, Tipo de Contrato...',   // Legenda de cima
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
            inc(iContadorCima);
            frmProgressoDuplo.AndaFormProgressoDuplo(iContadorCima, 0);
            // -------------------------------------------------------------------------------------
            for iContadorPatro := 0 to (molListaPatro.lstPatro.Items.Count - 1) do
            begin
               inc(iContadorCima);
               frmProgressoDuplo.AndaFormProgressoDuplo(iContadorCima, 0);
               // ----------------------------------------------------------------------------------
               if molListaPatro.lstPatro.Checked[iContadorPatro] then
               begin
                  qryLookTipoContr.First;
                  while not(qryLookTipoContr.EOF) do
                  begin
                     inc(iContadorCima);
                     frmProgressoDuplo.AndaFormProgressoDuplo(iContadorCima, 0);

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

                     // ----------------------------------------------------------------------------
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

                        ParamByName('PORDEM').AsInteger                 := 0;

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

                        // Saldo Devedor -----------------------------------------------------------
                        // -------------------------------------------------------------------------

                        rSaldoDevAnt := CalcEmptmo.SaldoDevAnt(qryContratoIDCONTRATOEMPTMO.AsFloat,
                                                               dDataAnt, -1, -1);

                        // Saldo Devedor -----------------------------------------------------------
                        // -------------------------------------------------------------------------
                        rSaldoDevAtu := CalcEmptmo.SaldoDevAnt(qryContratoIDCONTRATOEMPTMO.AsFloat,
                                                               dDataAtu, -1, -1);
                                                               
                        // Concessao ---------------------------------------------------------------
                        with qryMovimentoNormal do
                        begin
                           LimpaParametros(qryMovimentoNormal);
                           ParamByName('PIDCONTRATOEMPTMO').AsFloat  := qryContratoIDCONTRATOEMPTMO.AsFloat;
                           ParamByName('PDATAINI').AsDateTime        := dDataAnt + 1;
                           ParamByName('PDATAFIM').AsDateTime        := dDataAtu;
                           ParamByName('PHMETIPOMOV').AsInteger      := 0;

                           Open;
                           fVlrConcessao := qryMovimentoNormalHMEVLRPREVISTO.AsCurrency;
                           Close;
                        end;
                        // -------------------------------------------------------------------------

                        // Parcelas ----------------------------------------------------------------
                        with qryMovimentoNormal do
                        begin
                           LimpaParametros(qryMovimentoNormal);
                           ParamByName('PIDCONTRATOEMPTMO').AsFloat  := qryContratoIDCONTRATOEMPTMO.AsFloat;
                           ParamByName('PDATAINI').AsDateTime        := dDataAnt + 1;
                           ParamByName('PDATAFIM').AsDateTime        := dDataAtu;
                           ParamByName('PHMETIPOMOV').AsInteger      := 1;

                           Open;
                           fVlrParcela := qryMovimentoNormalHMEVLRPREVISTO.AsCurrency;
                           Close;
                        end;
                        // -------------------------------------------------------------------------

                        // Amortização -------------------------------------------------------------
                        with qryMovimentoNormal do
                        begin
                           LimpaParametros(qryMovimentoNormal);
                           ParamByName('PIDCONTRATOEMPTMO').AsFloat  := qryContratoIDCONTRATOEMPTMO.AsFloat;
                           ParamByName('PDATAINI').AsDateTime        := dDataAnt + 1;
                           ParamByName('PDATAFIM').AsDateTime        := dDataAtu;
                           ParamByName('PHMETIPOMOV').AsInteger      := 2;

                           Open;
                           fVlrAmortizacao := qryMovimentoNormalHMEVLRPREVISTO.AsCurrency;
                           Close;
                        end;
                        // -------------------------------------------------------------------------

                        // Atualizacao Diária ------------------------------------------------------
                        with qryMovimentoNormal do
                        begin
                           LimpaParametros(qryMovimentoNormal);
                           ParamByName('PIDCONTRATOEMPTMO').AsFloat  := qryContratoIDCONTRATOEMPTMO.AsFloat;
                           ParamByName('PDATAINI').AsDateTime        := dDataAnt + 1;
                           ParamByName('PDATAFIM').AsDateTime        := dDataAtu;
                           ParamByName('PHMETIPOMOV').AsInteger      := 5;

                           Open;
                           fVlrAtuDia := qryMovimentoNormalHMEVLRPREVISTO.AsCurrency;
                           Close;
                        end;
                        // -------------------------------------------------------------------------


                        // Encargo -----------------------------------------------------------------
                        with qryMovimentoNormal do
                        begin
                           LimpaParametros(qryMovimentoNormal);
                           ParamByName('PIDCONTRATOEMPTMO').AsFloat  := qryContratoIDCONTRATOEMPTMO.AsFloat;
                           ParamByName('PDATAINI').AsDateTime        := dDataAnt + 1;
                           ParamByName('PDATAFIM').AsDateTime        := dDataAtu;
                           ParamByName('PHMETIPOMOV').AsInteger      := 4;

                           Open;
                           fVlrEncargo := qryMovimentoNormalHMEVLRPREVISTO.AsCurrency;
                           Close;
                        end;
                        // -------------------------------------------------------------------------

                        // Ajustes -----------------------------------------------------------------
                        with qryMovimentoNormal do
                        begin
                           LimpaParametros(qryMovimentoNormal);
                           ParamByName('PIDCONTRATOEMPTMO').AsFloat  := qryContratoIDCONTRATOEMPTMO.AsFloat;
                           ParamByName('PDATAINI').AsDateTime        := dDataAnt + 1;
                           ParamByName('PDATAFIM').AsDateTime        := dDataAtu;
                           ParamByName('PHMETIPOMOV').AsInteger      := 8;

                           Open;
                           fVlrAjuste := qryMovimentoNormalHMEVLRPREVISTO.AsCurrency;
                           Close;
                        end;
                        // -------------------------------------------------------------------------

                        // Quitacao ----------------------------------------------------------------
                        with qryQuitacao do
                        begin
                           LimpaParametros(qryQuitacao);
                           ParamByName('PIDCONTRATOEMPTMO').AsFloat  := qryContratoIDCONTRATOEMPTMO.AsFloat;
                           ParamByName('PDATAINI').AsDateTime        := dDataAnt + 1;
                           ParamByName('PDATAFIM').AsDateTime        := dDataAtu;

                           Open;
                           fVlrQuitacao := qryQuitacaoHMEVLRPREVISTO.AsCurrency;
                           Close;
                        end;
                        // -------------------------------------------------------------------------

                        // Quitacao ----------------------------------------------------------------
                        with qryQuitacaoMorte do
                        begin
                           LimpaParametros(qryQuitacaoMorte);
                           ParamByName('PIDCONTRATOEMPTMO').AsFloat  := qryContratoIDCONTRATOEMPTMO.AsFloat;
                           ParamByName('PDATAINI').AsDateTime        := dDataAnt + 1;
                           ParamByName('PDATAFIM').AsDateTime        := dDataAtu;

                           Open;
                           fVlrQuitacaoMorte := qryQuitacaoMorteHMEVLRPREVISTO.AsCurrency;
                           Close;
                        end;
                        // -------------------------------------------------------------------------

                        // Itens abonados ---------------------------------------------------------------
                        with qryItensAbonados do
                        begin
                           LimpaParametros(qryItensAbonados);
                           ParamByName('PIDCONTRATOEMPTMO').AsFloat  := qryContratoIDCONTRATOEMPTMO.AsFloat;
                           ParamByName('PHMEDATAINI').AsDateTime     := dDataAnt + 1;
                           ParamByName('PHMEDATAFIM').AsDateTime     := dDataAtu;

                           if chkAbonoContab.Checked then
                              ParamByName('PABONOCONTAB').AsInteger := 1;

                           Open;

                           fVlrAbonado  := qryItensAbonadosABONADO.AsCurrency;
                        end;
                        // -------------------------------------------------------------------------

                        // Itens quitados ---------------------------------------------------------------
                        with qryItensQuitados do
                        begin
                           LimpaParametros(qryItensQuitados);
                           ParamByName('PIDCONTRATOEMPTMO').AsFloat  := qryContratoIDCONTRATOEMPTMO.AsFloat;
                           ParamByName('PHMEDATAINI').AsDateTime     := dDataAnt + 1;
                           ParamByName('PHMEDATAFIM').AsDateTime     := dDataAtu;

                           Open;

                           fVlrQuitado   := qryItensQuitadosQUITADO.AsCurrency;
                        end;

                        // Parcelas recebidas ---------------------------------------------------------
                        with qryParcRec do
                        begin
                           LimpaParametros(qryParcRec);
                           ParamByName('PIDCONTRATOEMPTMO').AsFloat  := qryContratoIDCONTRATOEMPTMO.AsFloat;
                           ParamByName('PHMEDATAINI').AsDateTime     := dDataAnt + 1;
                           ParamByName('PHMEDATAFIM').AsDateTime     := dDataAtu;

                           Open;

                           fRec_Parc     := qryParcRecREC_PARC.AsCurrency;
                        end;

                        // Encergos recebidos ----------------------------------------------------------
                        with qryEncRec do
                        begin
                           LimpaParametros(qryEncRec);
                           ParamByName('PIDCONTRATOEMPTMO').AsFloat  := qryContratoIDCONTRATOEMPTMO.AsFloat;
                           ParamByName('PHMEDATAINI').AsDateTime     := dDataAnt + 1;
                           ParamByName('PHMEDATAFIM').AsDateTime     := dDataAtu;

                           Open;

                           fRec_Enc     := qryEncRecREC_ENC.AsCurrency;
                        end;

                        // Amortizacoes recebidas ------------------------------------------------------
                        with qryAmoRec do
                        begin
                           LimpaParametros(qryAmoRec);
                           ParamByName('PIDCONTRATOEMPTMO').AsFloat  := qryContratoIDCONTRATOEMPTMO.AsFloat;
                           ParamByName('PHMEDATAINI').AsDateTime     := dDataAnt + 1;
                           ParamByName('PHMEDATAFIM').AsDateTime     := dDataAtu;

                           Open;

                           fRec_Amort     := qryAmoRecREC_AMORT.AsCurrency;
                        end;

                        // Quitacoes recebidas ----------------------------------------------------------
                        with qryQuiRec do
                        begin
                           LimpaParametros(qryQuiRec);
                           ParamByName('PIDCONTRATOEMPTMO').AsFloat  := qryContratoIDCONTRATOEMPTMO.AsFloat;
                           ParamByName('PHMEDATAINI').AsDateTime     := dDataAnt + 1;
                           ParamByName('PHMEDATAFIM').AsDateTime     := dDataAtu;

                           Open;

                           fRec_Quit     := qryQuiRecREC_QUIT.AsCurrency;
                        end;

                        // Ajustes recebidos ----------------------------------------------------------
                        with qryAjusteRec do
                        begin
                           LimpaParametros(qryAjusteRec);
                           ParamByName('PIDCONTRATOEMPTMO').AsFloat  := qryContratoIDCONTRATOEMPTMO.AsFloat;
                           ParamByName('PHMEDATAINI').AsDateTime     := dDataAnt + 1;
                           ParamByName('PHMEDATAFIM').AsDateTime     := dDataAtu;

                           Open;

                           fRec_Ajuste     := qryAjusteRecREC_AJUSTE.AsCurrency;
                        end;


                        bGrava      := (rSaldoDevAnt.fSaldoDevAnt <> 0) or
                                       (fVlrConcessao <> 0) or
                                       (fVlrAtuDia <> 0) or
                                       (fVlrParcela <> 0) or
                                       (fVlrAmortizacao <> 0) or
                                       (fVlrQuitacao <> 0) or
                                       (fVlrQuitacaoMorte <> 0) or
                                       (fVlrEncargo <> 0) or
                                       (fVlrAjuste <> 0) or
                                       (fVlrAbonado <> 0) or
                                       (fVlrQuitado <> 0) or
                                       (fRec_Parc <> 0) or
                                       (fRec_Enc <> 0) or
                                       (fRec_Amort <> 0) or
                                       (fRec_Quit <> 0) or
                                       (fRec_ajuste <> 0) or
                                       (rSaldoDevAtu.fSaldoDevAnt <> 0);

                        if bGrava then
                        begin
                           dtmRelResumoContratoCaixa.qryResumoContratoCaixa.Insert;

                           dtmRelResumoContratoCaixa.qryResumoContratoCaixaIDCONTRATOEMPTMO.AsFloat   := qryContratoIDCONTRATOEMPTMO.AsFloat;
                           dtmRelResumoContratoCaixa.qryResumoContratoCaixaNOME.AsString              := qryContratoNOME.AsString;
                           dtmRelResumoContratoCaixa.qryResumoContratoCaixaMATRICULA.AsString         := qryContratoMATRICULA.AsString;
                           dtmRelResumoContratoCaixa.qryResumoContratoCaixaINSCRICAONUMERO.AsFloat    := qryContratoINSCRICAONUMERO.AsFloat;
                           dtmRelResumoContratoCaixa.qryResumoContratoCaixaDESCTIPOEMPTMO.AsString    := '';
                           dtmRelResumoContratoCaixa.qryResumoContratoCaixaTCEDESCRICAO.AsString      := qryContratoTCEDESCRICAO.AsString;
                           dtmRelResumoContratoCaixa.qryResumoContratoCaixaNOME_PLANO.AsString        := qryContratoNOMEPLANO.AsString;
                           dtmRelResumoContratoCaixa.qryResumoContratoCaixaNOME_PATRO.AsString        := qryContratoNOMEPATRO.AsString;
                           dtmRelResumoContratoCaixa.qryResumoContratoCaixaSITDESCRICAO.AsString      := qryContratoSIT_PART.AsString;

                           dtmRelResumoContratoCaixa.qryResumoContratoCaixaSALDO_ANT.AsCurrency        := rSaldoDevAnt.fSaldoDevAnt;
                           dtmRelResumoContratoCaixa.qryResumoContratoCaixaSALDO_DEV.AsCurrency        := rSaldoDevAtu.fSaldoDevAnt;

                           dtmRelResumoContratoCaixa.qryResumoContratoCaixaCONCESSOES.AsCurrency      := fVlrConcessao;
                           dtmRelResumoContratoCaixa.qryResumoContratoCaixaPARCELAS.AsCurrency        := fVlrParcela;
                           dtmRelResumoContratoCaixa.qryResumoContratoCaixaAMORTIZACAO.AsCurrency     := fVlrAmortizacao;
                           dtmRelResumoContratoCaixa.qryResumoContratoCaixaQUITACAO.AsCurrency        := fVlrQuitacao;
                           dtmRelResumoContratoCaixa.qryResumoContratoCaixaAJUSTES.AsCurrency         := fVlrAjuste;
                           dtmRelResumoContratoCaixa.qryResumoContratoCaixaENCARGOS.AsCurrency        := fVlrEncargo;
                           dtmRelResumoContratoCaixa.qryResumoContratoCaixaABONADO.AsCurrency         := fVlrAbonado;
                           dtmRelResumoContratoCaixa.qryResumoContratoCaixaQUITADO.AsCurrency         := fVlrQuitado;
                           dtmRelResumoContratoCaixa.qryResumoContratoCaixaREC_PARC.AsCurrency        := fRec_Parc;
                           dtmRelResumoContratoCaixa.qryResumoContratoCaixaREC_ENC.AsCurrency         := fRec_Enc;
                           dtmRelResumoContratoCaixa.qryResumoContratoCaixaREC_AMORT.AsCurrency       := fRec_Amort;
                           dtmRelResumoContratoCaixa.qryResumoContratoCaixaREC_QUIT.AsCurrency        := fRec_Quit;
                           dtmRelResumoContratoCaixa.qryResumoContratoCaixaREC_AJUSTES.AsCurrency     := fRec_Ajuste;

                           dtmRelResumoContratoCaixa.qryResumoContratoCaixa.Post;

                        end;  // if bGrava

                        qryContrato.Next;

                        inc(iContadorBaixo);

                        frmProgressoDuplo.AndaFormProgressoDuplo(iContadorCima, iContadorBaixo);
                     end;
                     // ----------------------------------------------------------------------------

                     qryLookTipoContr.Next;
                  end;  // while not(qryLookTipoContr.EOF)
               end;  // if molListaPatro.lstPatro.Checked
            end;  // for(Patro)
         end;  // if molListaPlano.lstPlano.Checked
      end;  // for(Plano)
      // -------------------------------------------------------------------------------------------
      // FIM dos loops
      // -------------------------------------------------------------------------------------------

   finally
      frmProgressoDuplo.EscondeFormProgressoDuplo;
   end;

end;



procedure TcfgRelResumoContratoCaixa.FormShow(Sender: TObject);
begin
   inherited;

   molContratoEmptmo.btnLimpaContrato.Click;

   // preenche o ano de referência/competência
   cboMes.ItemIndex := DiasUteis.ExtraiMes(Date) - 1;
   DBspnAno.Value   := DiasUteis.ExtraiAno(Date);

   AbreQueries;

   // limpa a seleção de Contrato
   // Preenche a listbox de patrocinadoras...
   molListaPatro.PreenchePatro;
   // ...e marca todas por default
   molListaPatrobtnMarcaTodosPatroClick(self);

   // Preenche a listbox de Planos...
   molListaPlano.PreenchePlano;
   // ...e marca todos por default
   molListaPlanobtnMarcaTodosPlanoClick(self);
end;



procedure TcfgRelResumoContratoCaixa.DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;

   // seleciona apenas os Tipos de Contrato do Tipo de Empréstimo selecionado
   with dtmLookEmptmo.qryLookTipoContr do begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoContr);

      if DBcboTipoEmptmo.LookupValue <> '' then begin
         ParamByName('PIDTIPOEMPTMO').AsInteger    := StrToInt(DBcboTipoEmptmo.LookupValue);
         ParamByName('PIDEMPRESAPROP').AsInteger   := Sistema.IDEmpresa;
      end;

      Open;

      DBcboTipoContr.Enabled := True;
   end;
end;



procedure TcfgRelResumoContratoCaixa.DBcboTipoEmptmoExit(Sender: TObject);
begin
   inherited;

   // seleciona apenas os Tipos de Contrato do Tipo de Empréstimo selecionado
   with dtmLookEmptmo.qryLookTipoContr do begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoContr);

      if DBcboTipoEmptmo.LookupValue <> '' then begin
         ParamByName('PIDTIPOEMPTMO').AsInteger    := StrToInt(DBcboTipoEmptmo.LookupValue);
         ParamByName('PIDEMPRESAPROP').AsInteger   := Sistema.IDEmpresa;
      end;

      Open;

      DBcboTipoContr.Enabled := True;
   end;
end;



procedure TcfgRelResumoContratoCaixa.qryContratosBeforeOpen(DataSet: TDataSet);
begin
   inherited;

 //Grava o SQL na pasta TEMP
 //Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
 //qryContratos.SQL.SaveToFile(Sistema.TempDir + 'EP-RelResumoContratoCaixa-Contratos.txt');
   qryContratos.SQL.SaveToFile(ftempregra + '\' + 'EP-RelResumoContratoCaixa-Contratos.txt');
   Application.ProcessMessages;
end;



procedure TcfgRelResumoContratoCaixa.molListaPatrobtnInvertePatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnInvertePatroClick(Sender);
end;



procedure TcfgRelResumoContratoCaixa.molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnMarcaTodosPatroClick(Sender);
end;



procedure TcfgRelResumoContratoCaixa.molListaPlanobtnInvertePlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnInvertePlanoClick(Sender);
end;



procedure TcfgRelResumoContratoCaixa.molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnMarcaTodosPlanoClick(Sender);
end;



end.
