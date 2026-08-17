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

unit cRelFechamentoCarteiraCaixa;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   CRel, fcCombo, fcColorCombo, StdCtrls, Mask, wwdbedit, Wwdbspin,
   wwdblook, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97,
   ExtCtrls, Db, mContratoEmptmo, mListaPlano, mListaPatro, uTypesEmptmo,
   mListaPlanoContab, DBTables, Wwquery;

type
   TcfgRelFechamentoCarteiraCaixa = class(TcfgRel)
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
      chkApropriado: TCheckBox;
      chkAbonoContab: TCheckBox;
      chkRenovacao: TCheckBox;
      molListaPlano: TmolListaPlanoContab;
      qryLookTipoContr: TwwQuery;
      qryLookTipoContrIDTIPOCONTREMPTMO: TFloatField;
      qryLookTipoContrTCEDESCRICAO: TStringField;
      qryLookTipoContrIDTIPOEMPTMO: TFloatField;
      qryLookTipoContrDESCTIPOEMPTMO: TStringField;
      qryLookTipoContrIDPLANOPREV: TFloatField;
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
      qryParcelas: TwwQuery;
      qryEncargos: TwwQuery;
      qryAmortizacao: TwwQuery;
    qrySaldoAnt: TwwQuery;
      qryParcRec: TwwQuery;
      qryEncRec: TwwQuery;
      qryAmoRec: TwwQuery;
      qryQuiRec: TwwQuery;
      qryItensAbonados: TwwQuery;
      qryItensQuitados: TwwQuery;
    qryParcelasIDCONTRATOEMPTMO: TFloatField;
    qryParcelasPARCELAS: TFloatField;
    qryParcelasTOTALPARC: TFloatField;
    qryEncargosIDCONTRATOEMPTMO: TFloatField;
    qryEncargosENCARGOS: TFloatField;
    qryEncargosTOTALENC: TFloatField;
    qryAmortizacaoIDCONTRATOEMPTMO: TFloatField;
    qryAmortizacaoAMORTIZACAO: TFloatField;
    qryAmortizacaoTOTALAMO: TFloatField;
    qryItensQuitadosIDCONTRATOEMPTMO: TFloatField;
    qryItensQuitadosQUITADO: TFloatField;
    qryItensQuitadosTOT_QUITADO: TFloatField;
    qryParcRecIDCONTRATOEMPTMO: TFloatField;
    qryParcRecREC_PARC: TFloatField;
    qryParcRecTOT_REC_PARC: TFloatField;
    qryEncRecIDCONTRATOEMPTMO: TFloatField;
    qryEncRecREC_ENC: TFloatField;
    qryEncRecTOT_REC_ENC: TFloatField;
    qryAmoRecIDCONTRATOEMPTMO: TFloatField;
    qryAmoRecREC_AMORT: TFloatField;
    qryAmoRecTOT_REC_AMORT: TFloatField;
    qryQuiRecIDCONTRATOEMPTMO: TFloatField;
    qryQuiRecREC_QUIT: TFloatField;
    qryQuiRecTOT_REC_QUIT: TFloatField;
    qryItensAbonadosIDCONTRATOEMPTMO: TFloatField;
    qryItensAbonadosABONADO: TFloatField;
    qryItensAbonadosTOT_ABONADO: TFloatField;
    qryQuitacao: TwwQuery;
    qrySaldoAntIDCONTRATOEMPTMO: TFloatField;
    qrySaldoAntSALDO_ANT: TFloatField;
    qrySaldoAntTOTALSALDO_ANT: TFloatField;
    qrySaldoAtu: TwwQuery;
    qrySaldoAtuIDCONTRATOEMPTMO: TFloatField;
    qrySaldoAtuSALDO_DEV: TFloatField;
    qrySaldoAtuTOTALSALDO_DEV: TFloatField;
    qryQuitacaoIDCONTRATOEMPTMO: TFloatField;
    qryQuitacaoQUITACAO: TFloatField;
    qryQuitacaoTOTALQUI: TFloatField;

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
  cfgRelFechamentoCarteiraCaixa: TcfgRelFechamentoCarteiraCaixa;



implementation
{$R *.DFM}
uses
   DLookEmptmo,
   UDiasUteis,
   UMensErro,                 (* MsgDlg *)
   USistema,
   UfuncoesEmptmo,
   dEmptmo,
   FProgresso,
   FProgressoDuplo,
   uCalcEmptmo,
   dRelFechamentoCarteira,
   dRelFechamentoCarteiraCaixa;




procedure TcfgRelFechamentoCarteiraCaixa.AbreQueries;
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



procedure TcfgRelFechamentoCarteiraCaixa.MontaQuery;
begin
   inherited;

   with dtmRelFechamentoCarteiraCaixa do
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



procedure TcfgRelFechamentoCarteiraCaixa.FiltraRelatorio;
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

   '   0                                           AS CONCESSOES, '                                      + #13 +
   '   0                                           AS TOTALCONCESSOES, '                                 + #13 +

   '   NVL(PARCELAS.PARCELAS, 0)                   AS PARCELAS, '                                        + #13 +
   '   NVL(PARCELAS.TOTALPARC, 0)                  AS TOTALPARC, '                                       + #13 +

   '   NVL(ENCARGOS.ENCARGOS, 0)                   AS ENCARGOS, '                                        + #13 +
   '   NVL(ENCARGOS.TOTALENC, 0)                   AS TOTALENC, '                                        + #13 +

   '   NVL(REC_PARC.REC_PARC, 0)                   AS REC_PARC, '                                        + #13 +
   '   NVL(REC_PARC.TOT_REC_PARC, 0)               AS TOT_REC_PARC, '                                    + #13 +

   '   NVL(REC_ENC.REC_ENC, 0)                     AS REC_ENC, '                                         + #13 +
   '   NVL(REC_ENC.TOT_REC_ENC, 0)                 AS TOT_REC_ENC, '                                     + #13 +

   '   0                                           AS REC_PARC_ATRAS, '                                  + #13 +
   '   0                                           AS TOT_REC_PARC_ATRAS, '                              + #13 +

   '   NVL(REC_AMORT.REC_AMORT, 0)                 AS REC_AMORT, '                                       + #13 +
   '   NVL(REC_AMORT.TOT_REC_AMORT, 0)             AS TOT_REC_AMORT, '                                   + #13 +

   '   NVL(REC_QUIT.REC_QUIT, 0)                   AS REC_QUIT, '                                        + #13 +
   '   NVL(REC_QUIT.TOT_REC_QUIT, 0)               AS TOT_REC_QUIT, '                                    + #13 +

   '   NVL(AMORT.AMORTIZACAO, 0)                   AS AMORTIZACAO, '                                     + #13 +
   '   NVL(AMORT.TOTALAMO, 0)                      AS TOTALAMO, '                                        + #13 +

   '   NVL(QUITACAO.QUITACAO, 0)                   AS QUITACAO, '                                        + #13 +
   '   NVL(QUITACAO.TOTALQUI, 0)                   AS TOTALQUI, '                                        + #13 +

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
   // Pendência 26919 - 14/11/2007
   //'            HISTMOVEMPTMO HME, CONTRATOEMPTMO CON '                                                  + #13 +
   '           CONTRATOEMPTMO CON, HISTMOVEMPTMO HME '                                                   + #13 +
   '           left outer join MIGRACONTRATOEP MIG '                                                     + #13 +
   '           on (MIG.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO AND '                                     + #13 +
   '               MIG.DATAMIGRA        = F_MIGRAEP_DATA(HME.IDCONTRATOEMPTMO, HME.HMEDATAPREVISTA)) '   + #13 +
   // Fim Pendência 26919
   '         WHERE '                                                                                     + #13 +
   '                CON.FLGSITUACAO        <> ''C'' '                                                    + #13 +
   '            AND HME.HMETIPOMOV         IN (1, 2, 3, 4, 6, 7) '                                       + #13 +
   '            AND HME.HMESEQCOBRANCA     = 1 '                                                         + #13 +
   '            AND HME.HMEDATAPREVISTA    <= TO_DATE(' + sDataAnt + ', ''DD/MM/YYYY'') '                + #13 +
   '            AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) ) '                            + #13 +
   '            AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO IS NULL) ) '                        + #13 +
   // Pendência 26919 - 14/11/2007
   //'            AND CON.IDPATRO            IN (' + molListaPatro.PegaPatro + ') '                        + #13 +
   //'            AND CON.IDPLANOPREV        IN (' + molListaPlano.PegaPlano + ') '                        + #13;
   '            AND NVL(MIG.IDPATROANT, CON.IDPATRO) IN (' + molListaPatro.PegaPatro + ') '              + #13 +
   '            AND NVL(MIG.IDPLANOCONTANT, CON.IDPLANOORIGEM) IN (' + molListaPlano.PegaPlano + ') '    + #13;
   // Fim Pendência 26919

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
   // Pendência 26919 - 14/11/2007
   //'            HISTMOVEMPTMO HME, CONTRATOEMPTMO CON '                                                  + #13 +
   '            CONTRATOEMPTMO CON, HISTMOVEMPTMO HME '                                                  + #13 +
   '            left outer join MIGRACONTRATOEP MIG '                                                    + #13 +
   '            on (MIG.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO AND '                                    + #13 +
   '                MIG.DATAMIGRA        = F_MIGRAEP_DATA(HME.IDCONTRATOEMPTMO, HME.HMEDATAPREVISTA)) '  + #13 +
   // Fim Pendência 26919
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
   // Pendência 26919 - 14/11/2007
   //'            AND CON.IDPATRO            IN (' + molListaPatro.PegaPatro + ') '                        + #13 +
   //'            AND CON.IDPLANOPREV        IN (' + molListaPlano.PegaPlano + ') '                        + #13;
   '            AND NVL(MIG.IDPATROANT, CON.IDPATRO) IN (' + molListaPatro.PegaPatro + ') '              + #13 +
   '            AND NVL(MIG.IDPLANOCONTANT, CON.IDPLANOORIGEM) IN (' + molListaPlano.PegaPlano + ') '    + #13;
   // Fim Pendência 26919

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
   '         AND C.IDCONTRATOEMPTMO   = PAR_PAG.IDCONTRATOEMPTMO(+) '                                    + #13;
   // Pendência 26919 - 14/11/2007
   //'         AND C.IDPATRO            IN (' + molListaPatro.PegaPatro + ') '                             + #13 +
   //'         AND C.IDPLANOPREV        IN (' + molListaPlano.PegaPlano + ') '                             + #13;
   // Fim Pendência 26919

   // Tipo de Contrato
   if DBcboTipoContr.LookupValue <> '' then sSQL := sSQL +
   '         AND C.IDTIPOCONTREMPTMO  = ' + DBcboTipoContr.LookupValue                                + #13;

   // Contrato
   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '         AND C.IDCONTRATOEMPTMO   = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)                       + #13;

   sSQL := sSQL +
   '      ) CON '                                                                                        + #13 +
   '   WHERE '                                                                                           + #13 +
   '      A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO(+) '                                               + #13 +
   '   GROUP BY '                                                                                        + #13 +
   '      A.IDTIPOCONTREMPTMO '                                                                          + #13 +
   '   ) SALDO_ANT, '                                                                                    + #13 +
   '-- FIM SALDO ANTERIOR ------------------------------------------------------------------------ '     + #13 +


   '-- PARCELAS ---------------------------------------------------------------------------------- '     + #13 +
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
   // Pendência 26919 - 14/11/2007
   //'         HISTMOVEMPTMO HME, CONTRATOEMPTMO C '                                                       + #13 +
   '         CONTRATOEMPTMO C, HISTMOVEMPTMO HME '                                                       + #13 +
   '         left outer join MIGRACONTRATOEP MIG '                                                       + #13 +
   '         on (MIG.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO AND '                                       + #13 +
   '             MIG.DATAMIGRA        = F_MIGRAEP_DATA(HME.IDCONTRATOEMPTMO, HME.HMEDATAPREVISTA)) '     + #13 +
   // Fim Pendência 26919
   '      WHERE '                                                                                        + #13 +
   '             C.FLGSITUACAO          <> ''C'' '                                                       + #13 +
   // Pendência 26919 - 14/11/2007
   //'         AND C.IDPATRO              IN (' + molListaPatro.PegaPatro + ') '                           + #13 +
   //'         AND C.IDPLANOPREV          IN (' + molListaPlano.PegaPlano + ') '                           + #13;
   '         AND NVL(MIG.IDPATROANT, C.IDPATRO) IN (' + molListaPatro.PegaPatro + ') '                   + #13 +
   '         AND NVL(MIG.IDPLANOCONTANT, C.IDPLANOORIGEM) IN (' + molListaPlano.PegaPlano + ') '         + #13;
   // Fim Pendência 26919

   // Tipo de Contrato
   if DBcboTipoContr.LookupValue <> '' then sSQL := sSQL +
   '         AND C.IDTIPOCONTREMPTMO    = ' + DBcboTipoContr.LookupValue                              + #13;

   // Contrato
   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '         AND C.IDCONTRATOEMPTMO     = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)                     + #13;

   sSQL := sSQL +
   '         AND HME.HMETIPOMOV         = 1 '                                                            + #13 +
   '         AND HME.HMEPARCELA         > 0 '                                                            + #13 +
   '         AND HME.HMESEQCOBRANCA     = 1 '                                                            + #13 +
   '         AND ( HME.HMECENTRALIZA    = 1 OR HME.HMEDESTACADO = 1 ) '                                  + #13 +
   '         AND ( (HME.FLGESTORNADO    IS NULL) OR (HME.FLGESTORNADO = 0) ) '                           + #13 +
   '         AND HME.HMEDATAPREVISTA    BETWEEN TO_DATE(' + sDataIni + ', ''DD/MM/YYYY'') AND TO_DATE(' + sDataAtu + ', ''DD/MM/YYYY'') ' + #13 +
   '         AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO '                                           + #13 +
   '      ) CON '                                                                                        + #13 +
   '   WHERE '                                                                                           + #13 +
   '      A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO(+) '                                               + #13 +
   '   GROUP BY '                                                                                        + #13 +
   '      A.IDTIPOCONTREMPTMO '                                                                          + #13 +
   '   ) PARCELAS, '                                                                                     + #13 +

   '-- FIM PARCELAS ------------------------------------------------------------------------------ '     + #13 +

   
   '-- ENCARGOS ---------------------------------------------------------------------------------- '     + #13 +
   '   ( '                                                                                               + #13 +
   '   SELECT '                                                                                          + #13 +
   '      A.IDTIPOCONTREMPTMO, NVL(SUM(CON.HMEVLRPREVISTO), 0) AS ENCARGOS, '                            + #13 +
   '      NVL(COUNT(CON.IDCONTRATOEMPTMO), 0) AS TOTALENC '                                              + #13 +
   '   FROM '                                                                                            + #13 +
   '      TIPOCONTREMPTMO A, '                                                                           + #13 +
   '      ( '                                                                                            + #13 +
   //Wylliam Leite da Silva SOL 253185 PPM 771995 - Início
   '      SELECT '                                                                     + #13 +
   //Wylliam Leite da Silva SOL 253185 PPM 771995 - Fim
   '         TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO, '                               + #13 +
   '         TC.IDTIPOCONTREMPTMO, HMEVLRPREVISTO '                                                      + #13 +
   '      FROM '                                                                                         + #13 +
   // Pendência 26919 - 14/11/2007
   //'         HISTMOVEMPTMO HME, CONTRATOEMPTMO C, '                                                      + #13 +
   '         CONTRATOEMPTMO C, HISTMOVEMPTMO HME '                                                       + #13 +
   '         left outer join MIGRACONTRATOEP MIG '                                                       + #13 +
   '         on (MIG.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO AND '                                       + #13 +
   '             MIG.DATAMIGRA        = F_MIGRAEP_DATA(HME.IDCONTRATOEMPTMO, HME.HMEDATAPREVISTA)), '    + #13 +
   // Fim Pendência 26919
   '         ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC '                                                    + #13 +
   '      WHERE '                                                                                        + #13 +
   '             C.FLGSITUACAO          <> ''C'' '                                                       + #13 +
   // Pendência 26919 - 14/11/2007
   //'         AND C.IDPATRO                 IN (' + molListaPatro.PegaPatro + ') '                        + #13 +
   //'         AND C.IDPLANOPREV             IN (' + molListaPlano.PegaPlano + ') '                        + #13;
   '         AND NVL(MIG.IDPATROANT, C.IDPATRO) IN (' + molListaPatro.PegaPatro + ') '                   + #13 +
   '         AND NVL(MIG.IDPLANOCONTANT, C.IDPLANOORIGEM) IN (' + molListaPlano.PegaPlano + ') '         + #13;
   // Fim Pendência 26919

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
   '         AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) ) '                               + #13 +
   '         AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO IS NULL) ) '                           + #13 +
   '         AND HME.HMEDATAPREVISTA    BETWEEN TO_DATE(' + sDataIni + ', ''DD/MM/YYYY'') AND TO_DATE(' + sDataAtu + ', ''DD/MM/YYYY'') ' + #13 +
   '         AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO '                                           + #13 +
   '         AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO '                                         + #13 +
   '         AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO '                                        + #13 +
   '         AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO '                                             + #13 +
   '      ) CON '                                                                                        + #13 +
   '   WHERE '                                                                                           + #13 +
   '      A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO(+) '                                               + #13 +
   '   GROUP BY '                                                                                        + #13 +
   '      A.IDTIPOCONTREMPTMO '                                                                          + #13 +
   '   ) ENCARGOS, '                                                                                     + #13 +
   ' '                                                                                                   + #13 +
   '-- FIM ENCARGOS ------------------------------------------------------------------------------ '     + #13 +

   
   '-- AMORTIZAÇÃO ------------------------------------------------------------------------------- '     + #13 +
   '   ( '                                                                                               + #13 +
   '   SELECT '                                                                                          + #13 +
   '      A.IDTIPOCONTREMPTMO, '                                                                         + #13 +
   '      NVL(SUM(CON.HMEVLRPREVISTO), 0) AS AMORTIZACAO, '                                              + #13 +
   '      NVL(COUNT(CON.IDCONTRATOEMPTMO), 0) AS TOTALAMO '                                              + #13 +
   '   FROM '                                                                                            + #13 +
   '      TIPOCONTREMPTMO A, '                                                                           + #13 +
   '      ( '                                                                                            + #13 +
   //Wylliam Leite da Silva SOL 253185 PPM 771995 - Início
   '      SELECT '                                                                     + #13 +
   //Wylliam Leite da Silva SOL 253185 PPM 771995 - Fim
   '         TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO, '                               + #13 +
   '         TC.IDTIPOCONTREMPTMO, HMEVLRPREVISTO '                                                      + #13 +
   '      FROM '                                                                                         + #13 +
   // Pendência 26919 - 14/11/2007
   //'         HISTMOVEMPTMO HME, CONTRATOEMPTMO C, '                                                      + #13 +
   '         CONTRATOEMPTMO C, HISTMOVEMPTMO HME '                                                       + #13 +
   '         left outer join MIGRACONTRATOEP MIG '                                                       + #13 +
   '         on (MIG.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO AND '                                       + #13 +
   '             MIG.DATAMIGRA        = F_MIGRAEP_DATA(HME.IDCONTRATOEMPTMO, HME.HMEDATAPREVISTA)), '    + #13 +
   // Fim Pendência 26919
   '         ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC '                                                    + #13 +
   '      WHERE '                                                                                        + #13 +
   '             C.FLGSITUACAO          <> ''C'' '                                                       + #13 +
   // Pendência 26919 - 14/11/2007
   //'         AND C.IDPATRO              IN (' + molListaPatro.PegaPatro + ') '                           + #13 +
   //'         AND C.IDPLANOPREV          IN (' + molListaPlano.PegaPlano + ') '                           + #13;
   '         AND NVL(MIG.IDPATROANT, C.IDPATRO) IN (' + molListaPatro.PegaPatro + ') '                   + #13 +
   '         AND NVL(MIG.IDPLANOCONTANT, C.IDPLANOORIGEM) IN (' + molListaPlano.PegaPlano + ') '         + #13;
   // Fim Pendência 26919

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
   '         AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) ) '                               + #13 +
   '         AND ( (HME.FLGESTORNADO    IS NULL) OR (HME.FLGESTORNADO = 0) ) '                           + #13 +
   '         AND HME.HMEDATAPREVISTA    BETWEEN TO_DATE(' + sDataIni + ', ''DD/MM/YYYY'') AND TO_DATE(' + sDataAtu + ', ''DD/MM/YYYY'') ' + #13 +
   '         AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO '                                           + #13 +
   '         AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO '                                         + #13 +
   '         AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO '                                        + #13 +
   '         AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO '                                             + #13 +
   '      ) CON '                                                                                        + #13 +
   '   WHERE '                                                                                           + #13 +
   '      A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO(+) '                                               + #13 +
   '   GROUP BY '                                                                                        + #13 +
   '      A.IDTIPOCONTREMPTMO '                                                                          + #13 +
   '   ) AMORT, '                                                                                        + #13 +

   '-- FIM AMORTIZAÇÃO --------------------------------------------------------------------------- '     + #13 +

   
   '-- QUITAÇÂO ---------------------------------------------------------------------------------- '     + #13 +
   '   ( '                                                                                               + #13 +
   '   SELECT '                                                                                          + #13 +
   '      A.IDTIPOCONTREMPTMO, NVL(SUM(CON.HMEVLRPREVISTO), 0) AS QUITACAO, '                            + #13 +
   '      NVL(COUNT(CON.IDCONTRATOEMPTMO), 0) AS TOTALQUI '                                              + #13 +
   '   FROM '                                                                                            + #13 +
   '      TIPOCONTREMPTMO A, '                                                                           + #13 +
   '      ( '                                                                                            + #13 +
   //Wylliam Leite da Silva SOL 253185 PPM 771995 - Início
   '      SELECT '                                                                     + #13 +
   //Wylliam Leite da Silva SOL 253185 PPM 771995 - Fim
   '         TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO, '                               + #13 +
   '         TC.IDTIPOCONTREMPTMO, HME.HMEVLRPREVISTO '                                                  + #13 +
   '      FROM '                                                                                         + #13 +
   // Pendência 26919 - 14/11/2007
   //'         HISTMOVEMPTMO HME, CONTRATOEMPTMO C, '                                                      + #13 +
   '         CONTRATOEMPTMO C, HISTMOVEMPTMO HME '                                                       + #13 +
   '         left outer join MIGRACONTRATOEP MIG '                                                       + #13 +
   '         on (MIG.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO AND '                                       + #13 +
   '             MIG.DATAMIGRA        = F_MIGRAEP_DATA(HME.IDCONTRATOEMPTMO, HME.HMEDATAPREVISTA)), '    + #13 +
   // Fim Pendência 26919
   '         ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC '                                                    + #13 +
   '      WHERE '                                                                                        + #13 +
   '             C.FLGSITUACAO          <> ''C'' '                                                       + #13 +
   // Pendência 26919 - 14/11/2007
   //'         AND C.IDPATRO              IN (' + molListaPatro.PegaPatro + ') '                           + #13 +
   //'         AND C.IDPLANOPREV          IN (' + molListaPlano.PegaPlano + ') '                           + #13;
   '         AND NVL(MIG.IDPATROANT, C.IDPATRO) IN (' + molListaPatro.PegaPatro + ') '                   + #13 +
   '         AND NVL(MIG.IDPLANOCONTANT, C.IDPLANOORIGEM) IN (' + molListaPlano.PegaPlano + ') '         + #13;
   // Fim Pendência 26919

   // Tipo de Empréstimo
   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   '         AND TC.IDTIPOEMPTMO        = ' + DBcboTipoEmptmo.LookupValue                                + #13;

   // Tipo de Contrato
   if DBcboTipoContr.LookupValue <> '' then sSQL := sSQL +
   '         AND TC.IDTIPOCONTREMPTMO   = ' + DBcboTipoContr.LookupValue                                 + #13;

   // Contrato
   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '         AND C.IDCONTRATOEMPTMO     = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)            + #13;

   if chkRenovacao.Checked then sSQL := sSQL +
   '         AND HME.HMEORIGEM         <> 0 '                                                            + #13;

   sSQL := sSQL +
   '         AND HME.HMETIPOMOV         = 3 '                                                            + #13 +
   '         AND HME.HMESEQCOBRANCA     = 1 '                                                            + #13 +
   '         AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) ) '                               + #13 +
   '         AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO IS NULL) ) '                           + #13 +
   '         AND HME.HMEDATAPREVISTA    BETWEEN TO_DATE(' + sDataIni + ', ''DD/MM/YYYY'') AND TO_DATE(' + sDataAtu + ', ''DD/MM/YYYY'') ' + #13 +
   '         AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO '                                           + #13 +
   '         AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO '                                         + #13 +
   '         AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO '                                        + #13 +
   '         AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO '                                             + #13 +
   '      ) CON '                                                                                        + #13 +
   '   WHERE '                                                                                           + #13 +
   '      A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO(+) '                                               + #13 +
   '   GROUP BY '                                                                                        + #13 +
   '      A.IDTIPOCONTREMPTMO '                                                                          + #13 +
   '   ) QUITACAO, '                                                                                     + #13 +

   '-- FIM QUITAÇÃO ------------------------------------------------------------------------------ '     + #13 +


   '-- PARCELAS RECEBIDAS ------------------------------------------------------------------------ '     + #13 +
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
   '         NVL(HME.HMEVLREFETIVO, 0) AS HMEVLREFETIVO '                                                + #13 +
   '      FROM '                                                                                         + #13 +
   // Pendência 26919 - 14/11/2007
   //'         HISTMOVEMPTMO HME, CONTRATOEMPTMO C, '                                                      + #13 +
   '         CONTRATOEMPTMO C, HISTMOVEMPTMO HME '                                                       + #13 +
   '         left outer join MIGRACONTRATOEP MIG '                                                       + #13 +
   '         on (MIG.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO AND '                                       + #13 +
   '             MIG.DATAMIGRA        = F_MIGRAEP_DATA(HME.IDCONTRATOEMPTMO, HME.HMEDATAPREVISTA)), '    + #13 +
   // Fim Pendência 26919
   '         ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC '                                                    + #13 +
   '      WHERE '                                                                                        + #13 +
   '             C.FLGSITUACAO          <> ''C'' '                                                       + #13 +
   // Pendência 26919 - 14/11/2007
   //'         AND C.IDPATRO              IN (' + molListaPatro.PegaPatro + ') '                           + #13 +
   //'         AND C.IDPLANOPREV          IN (' + molListaPlano.PegaPlano + ') '                           + #13;
   '         AND NVL(MIG.IDPATROANT, C.IDPATRO) IN (' + molListaPatro.PegaPatro + ') '                   + #13 +
   '         AND NVL(MIG.IDPLANOCONTANT, C.IDPLANOORIGEM) IN (' + molListaPlano.PegaPlano + ') '         + #13;
   // Fim Pendência 26919

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
   '         AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) ) '                               + #13 +
   '         AND ( (HME.FLGESTORNADO    IS NULL) OR (HME.FLGESTORNADO = 0) ) '                           + #13 +
   '         AND HME.HMEDATAEFETIVA     BETWEEN TO_DATE(' + sDataIni + ', ''DD/MM/YYYY'') AND TO_DATE(' + sDataAtu + ', ''DD/MM/YYYY'') '                                     + #13 +
   '         AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO '                                           + #13 +
   '         AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO '                                         + #13 +
   '         AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO '                                        + #13 +
   '         AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO '                                             + #13 +
   '      ) CON '                                                                                        + #13 +
   '   WHERE '                                                                                           + #13 +
   '      A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO(+) '                                               + #13 +
   '   GROUP BY '                                                                                        + #13 +
   '      A.IDTIPOCONTREMPTMO '                                                                          + #13 +
   '   ) REC_PARC, '                                                                                     + #13 +
   '-- FIM PARCELAS RECEBIDAS -------------------------------------------------------------------- '     + #13 +


   '-- ENCARGOS RECEBIDOS ------------------------------------------------------------------------ '     + #13 +
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
   '         NVL(HME.HMEVLREFETIVO, 0) AS HMEVLREFETIVO '                                                + #13 +
   '      FROM '                                                                                         + #13 +
   // Pendência 26919 - 14/11/2007
   //'         HISTMOVEMPTMO HME, CONTRATOEMPTMO C, '                                                      + #13 +
   '         CONTRATOEMPTMO C, HISTMOVEMPTMO HME '                                                       + #13 +
   '         left outer join MIGRACONTRATOEP MIG '                                                       + #13 +
   '         on (MIG.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO AND '                                       + #13 +
   '             MIG.DATAMIGRA        = F_MIGRAEP_DATA(HME.IDCONTRATOEMPTMO, HME.HMEDATAPREVISTA)), '    + #13 +
   // Fim Pendência 26919
   '         ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC '                                                    + #13 +
   '      WHERE '                                                                                        + #13 +
   '             C.FLGSITUACAO          <> ''C'' '                                                       + #13 +
   // Pendência 26919 - 14/11/2007
   //'         AND C.IDPATRO              IN (' + molListaPatro.PegaPatro + ') '                           + #13 +
   //'         AND C.IDPLANOPREV          IN (' + molListaPlano.PegaPlano + ') '                           + #13;
   '         AND NVL(MIG.IDPATROANT, C.IDPATRO) IN (' + molListaPatro.PegaPatro + ') '                   + #13 +
   '         AND NVL(MIG.IDPLANOCONTANT, C.IDPLANOORIGEM) IN (' + molListaPlano.PegaPlano + ') '         + #13;
   // Fim Pendência 26919

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
   '         AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) ) '                               + #13 +
   '         AND ( (HME.FLGESTORNADO    IS NULL) OR (HME.FLGESTORNADO = 0) ) '                           + #13 +
   '         AND HME.HMEDATAEFETIVA     BETWEEN TO_DATE(' + sDataIni + ', ''DD/MM/YYYY'') AND TO_DATE(' + sDataAtu + ', ''DD/MM/YYYY'') '                                     + #13 +
   '         AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO '                                           + #13 +
   '         AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO '                                         + #13 +
   '         AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO '                                        + #13 +
   '         AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO '                                             + #13 +
   '      ) CON '                                                                                        + #13 +
   '   WHERE '                                                                                           + #13 +
   '      A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO(+) '                                               + #13 +
   '   GROUP BY '                                                                                        + #13 +
   '      A.IDTIPOCONTREMPTMO '                                                                          + #13 +
   '   ) REC_ENC, '                                                                                      + #13 +
   '-- FIM ENCARGOS DO MÊS RECEBIDOS ------------------------------------------------------------- '     + #13 +


   '-- AMORTIZAÇÕES RECEBIDAS -------------------------------------------------------------------- '     + #13 +
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
   '         NVL(HME.HMEVLREFETIVO, 0) AS HMEVLREFETIVO '                                                + #13 +
   '      FROM '                                                                                         + #13 +
   // Pendência 26919 - 14/11/2007
   //'         HISTMOVEMPTMO HME, CONTRATOEMPTMO C, '                                                      + #13 +
   '         CONTRATOEMPTMO C, HISTMOVEMPTMO HME '                                                       + #13 +
   '         left outer join MIGRACONTRATOEP MIG '                                                       + #13 +
   '         on (MIG.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO AND '                                       + #13 +
   '             MIG.DATAMIGRA        = F_MIGRAEP_DATA(HME.IDCONTRATOEMPTMO, HME.HMEDATAPREVISTA)), '    + #13 +
   // Fim Pendência 26919
   '         ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC '                                                    + #13 +
   '      WHERE '                                                                                        + #13 +
   '             C.FLGSITUACAO          <> ''C'' '                                                       + #13 +
   // Pendência 26919 - 14/11/2007
   //'         AND C.IDPATRO              IN (' + molListaPatro.PegaPatro + ') '                           + #13 +
   //'         AND C.IDPLANOPREV          IN (' + molListaPlano.PegaPlano + ') '                           + #13;
   '         AND NVL(MIG.IDPATROANT, C.IDPATRO) IN (' + molListaPatro.PegaPatro + ') '                   + #13 +
   '         AND NVL(MIG.IDPLANOCONTANT, C.IDPLANOORIGEM) IN (' + molListaPlano.PegaPlano + ') '         + #13;
   // Fim Pendência 26919

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
   '         AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) ) '                               + #13 +
   '         AND ( (HME.FLGESTORNADO    IS NULL) OR (HME.FLGESTORNADO = 0) ) '                           + #13 +
   '         AND HME.HMEDATAEFETIVA     BETWEEN TO_DATE(' + sDataIni + ', ''DD/MM/YYYY'') AND TO_DATE(' + sDataAtu + ', ''DD/MM/YYYY'') '                                     + #13 +
   '         AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO '                                           + #13 +
   '         AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO '                                         + #13 +
   '         AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO '                                        + #13 +
   '         AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO '                                             + #13 +
   '      ) CON '                                                                                        + #13 +
   '   WHERE '                                                                                           + #13 +
   '      A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO(+) '                                               + #13 +
   '   GROUP BY '                                                                                        + #13 +
   '      A.IDTIPOCONTREMPTMO '                                                                          + #13 +
   '   ) REC_AMORT, '                                                                                    + #13 +
   '-- FIM AMORTIZAÇÕES RECEBIDAS ---------------------------------------------------------------- '     + #13 +


   '-- QUITAÇÕES RECEBIDAS ----------------------------------------------------------------------- '     + #13 +
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
   '         NVL(HME.HMEVLREFETIVO, 0) AS HMEVLREFETIVO '                                                + #13 +
   '      FROM '                                                                                         + #13 +
   // Pendência 26919 - 14/11/2007
   //'         HISTMOVEMPTMO HME, CONTRATOEMPTMO C, '                                                      + #13 +
   '         CONTRATOEMPTMO C, HISTMOVEMPTMO HME '                                                       + #13 +
   '         left outer join MIGRACONTRATOEP MIG '                                                       + #13 +
   '         on (MIG.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO AND '                                       + #13 +
   '             MIG.DATAMIGRA        = F_MIGRAEP_DATA(HME.IDCONTRATOEMPTMO, HME.HMEDATAPREVISTA)), '    + #13 +
   // Fim Pendência 26919
   '         ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC '                                                    + #13 +
   '      WHERE '                                                                                        + #13 +
   '             C.FLGSITUACAO          <> ''C'' '                                                       + #13 +
   // Pendência 26919 - 14/11/2007
   //'         AND C.IDPATRO              IN (' + molListaPatro.PegaPatro + ') '                           + #13 +
   //'         AND C.IDPLANOPREV          IN (' + molListaPlano.PegaPlano + ') '                           + #13;
   '         AND NVL(MIG.IDPATROANT, C.IDPATRO) IN (' + molListaPatro.PegaPatro + ') '                   + #13 +
   '         AND NVL(MIG.IDPLANOCONTANT, C.IDPLANOORIGEM) IN (' + molListaPlano.PegaPlano + ') '         + #13;
   // Fim Pendência 26919

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
   '         AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) ) '                               + #13 +
   '         AND ( (HME.FLGESTORNADO    IS NULL) OR (HME.FLGESTORNADO = 0) ) '                           + #13 +
   '         AND HME.HMEDATAEFETIVA     BETWEEN TO_DATE(' + sDataIni + ', ''DD/MM/YYYY'') AND TO_DATE(' + sDataAtu + ', ''DD/MM/YYYY'') '                                     + #13 +
   '         AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO '                                           + #13 +
   '         AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO '                                         + #13 +
   '         AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO '                                        + #13 +
   '         AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO '                                             + #13 +
   '      ) CON '                                                                                        + #13 +
   '   WHERE '                                                                                           + #13 +
   '      A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO(+) '                                               + #13 +
   '   GROUP BY '                                                                                        + #13 +
   '      A.IDTIPOCONTREMPTMO '                                                                          + #13 +
   '   ) REC_QUIT, '                                                                                     + #13 +
   '-- FIM QUITAÇÕES RECEBIDAS ------------------------------------------------------------------- '     + #13 +


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
   // Pendência 26919 - 14/11/2007
   //'         HISTMOVEMPTMO HME, CONTRATOEMPTMO C, '                                                      + #13 +
   '         CONTRATOEMPTMO C, HISTMOVEMPTMO HME '                                                       + #13 +
   '         left outer join MIGRACONTRATOEP MIG '                                                       + #13 +
   '         on (MIG.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO AND '                                       + #13 +
   '             MIG.DATAMIGRA        = F_MIGRAEP_DATA(HME.IDCONTRATOEMPTMO, HME.HMEDATAPREVISTA)), '    + #13 +
   // Fim Pendência 26919
   '         ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC '                                                    + #13 +
   '      WHERE '                                                                                        + #13 +
   '             C.FLGSITUACAO          <> ''C'' '                                                       + #13 +
   // Pendência 26919 - 14/11/2007
   //'         AND C.IDPATRO              IN (' + molListaPatro.PegaPatro + ') '                           + #13 +
   //'         AND C.IDPLANOPREV          IN (' + molListaPlano.PegaPlano + ') '                           + #13;
   '         AND NVL(MIG.IDPATROANT, C.IDPATRO) IN (' + molListaPatro.PegaPatro + ') '                   + #13 +
   '         AND NVL(MIG.IDPLANOCONTANT, C.IDPLANOORIGEM) IN (' + molListaPlano.PegaPlano + ') '         + #13;
   // Fim Pendência 26919

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
   // Pendência 26919 - 14/11/2007
   //'         HISTMOVEMPTMO HME, CONTRATOEMPTMO C, '                                                      + #13 +
   '         CONTRATOEMPTMO C, HISTMOVEMPTMO HME '                                                       + #13 +
   '         left outer join MIGRACONTRATOEP MIG '                                                       + #13 +
   '         on (MIG.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO AND '                                       + #13 +
   '             MIG.DATAMIGRA        = F_MIGRAEP_DATA(HME.IDCONTRATOEMPTMO, HME.HMEDATAPREVISTA)), '    + #13 +
   // Fim Pendência 26919
   '         ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC '                                                    + #13 +
   '      WHERE '                                                                                        + #13 +
   '             C.FLGSITUACAO          <> ''C'' '                                                       + #13 +
   // Pendência 26919 - 14/11/2007
   //'         AND C.IDPATRO              IN (' + molListaPatro.PegaPatro + ') '                           + #13 +
   //'         AND C.IDPLANOPREV          IN (' + molListaPlano.PegaPlano + ') '                           + #13;
   '         AND NVL(MIG.IDPATROANT, C.IDPATRO) IN (' + molListaPatro.PegaPatro + ') '                   + #13 +
   '         AND NVL(MIG.IDPLANOCONTANT, C.IDPLANOORIGEM) IN (' + molListaPlano.PegaPlano + ') '         + #13;
   // Fim Pendência 26919

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
   '         DECODE((ROUND(NVL(PAR_DEV.VLR_DEV, 0), 2) - ROUND(NVL(PAR_PAG.VLR_PAG, 0), 2)), 0, 0, 1) AS QUANT '  + #13 +
   '      FROM '                                                                                         + #13 +
   '         CONTRATOEMPTMO C, '                                                                         + #13 +
   '         ( '                                                                                         + #13 +
   '         SELECT '                                                                                    + #13 +
   '            CON.IDCONTRATOEMPTMO, SUM(NVL(HME.HMEVLRPREVISTO, 0)) AS VLR_DEV '                       + #13 +
   '         FROM '                                                                                      + #13 +
   // Pendência 26919 - 14/11/2007
   //'            HISTMOVEMPTMO HME, CONTRATOEMPTMO CON '                                                  + #13 +
   '            CONTRATOEMPTMO CON, HISTMOVEMPTMO HME '                                                  + #13 +
   '            left outer join MIGRACONTRATOEP MIG '                                                    + #13 +
   '            on (MIG.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO AND '                                    + #13 +
   '                MIG.DATAMIGRA        = F_MIGRAEP_DATA(HME.IDCONTRATOEMPTMO, HME.HMEDATAPREVISTA)) '  + #13 +
   // Fim Pendência 26919
   '         WHERE '                                                                                     + #13 +
   '                CON.FLGSITUACAO        <> ''C'' '                                                    + #13 +
   // Pendência 26919 - 14/11/2007
   //'            AND CON.IDPATRO            IN (' + molListaPatro.PegaPatro + ') '                        + #13 +
   //'            AND CON.IDPLANOPREV        IN (' + molListaPlano.PegaPlano + ') '                        + #13 +
   '            AND NVL(MIG.IDPATROANT, CON.IDPATRO) IN (' + molListaPatro.PegaPatro + ') '              + #13 +
   '            AND NVL(MIG.IDPLANOCONTANT, CON.IDPLANOORIGEM) IN (' + molListaPlano.PegaPlano + ') '    + #13 +
   // Fim Pendência 26919
   '            AND HME.HMETIPOMOV         IN (1, 2, 3, 4, 6, 7) '                                       + #13 +
   '            AND HME.HMESEQCOBRANCA     = 1 '                                                         + #13 +
   '            AND HME.HMEDATAPREVISTA    <= TO_DATE(' + sDataAtu + ', ''DD/MM/YYYY'') '                + #13 +
   '            AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) ) '                            + #13 +
   '            AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO IS NULL) ) '                        + #13;

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
   // Pendência 26919 - 14/11/2007
   //'            HISTMOVEMPTMO HME, CONTRATOEMPTMO CON '                                                  + #13 +
   '            CONTRATOEMPTMO CON, HISTMOVEMPTMO HME '                                                  + #13 +
   '            left outer join MIGRACONTRATOEP MIG '                                                    + #13 +
   '            on (MIG.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO AND '                                    + #13 +
   '                MIG.DATAMIGRA        = F_MIGRAEP_DATA(HME.IDCONTRATOEMPTMO, HME.HMEDATAPREVISTA)) '  + #13 +
   // Fim Pendência 26919
   '         WHERE '                                                                                     + #13 +
   '                CON.FLGSITUACAO        <> ''C'' '                                                    + #13 +
   // Pendência 26919 - 14/11/2007
   //'            AND CON.IDPATRO            IN (' + molListaPatro.PegaPatro + ') '                        + #13 +
   //'            AND CON.IDPLANOPREV        IN (' + molListaPlano.PegaPlano + ') '                        + #13 +
   '            AND NVL(MIG.IDPATROANT, CON.IDPATRO) IN (' + molListaPatro.PegaPatro + ') '              + #13 +
   '            AND NVL(MIG.IDPLANOCONTANT, CON.IDPLANOORIGEM) IN (' + molListaPlano.PegaPlano + ') '    + #13 +
   // Fim Pendência 26919
   '            AND HME.HMETIPOMOV         IN (1, 2, 3, 4, 6, 7) '                                       + #13 +
   '            AND HME.HMEDATAPREVISTA    <= TO_DATE(' + sDataAtu + ', ''DD/MM/YYYY'') '                + #13 +
   '            AND ( '                                                                                  + #13 +
   '                (HME.HMEDATAEFETIVA    <= TO_DATE(' + sDataAtu + ', ''DD/MM/YYYY'')) '               + #13 +
   '                OR ( (HME.FLGQUITADO = 1) AND (HME.HMEDATAQUITABONO <= TO_DATE(' + sDataAtu + ',''DD/MM/YYYY'')) ) '   + #13 +
   '                OR ( (HME.FLGABONADO = 1) AND (HME.HMEDATAQUITABONO <= TO_DATE(' + sDataAtu + ',''DD/MM/YYYY'')) ) '   + #13 +
   '                ) '                                                                                  + #13 +
   '            AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) ) '                            + #13 +
   '            AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO IS NULL) ) '                        + #13;

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
   '             C.IDCONTRATOEMPTMO   = PAR_DEV.IDCONTRATOEMPTMO(+) '                                    + #13;
   // Pendência 26919 - 14/11/2007
   //'         AND C.IDPATRO            IN (' + molListaPatro.PegaPatro + ') '                             + #13 +
   //'         AND C.IDPLANOPREV        IN (' + molListaPlano.PegaPlano + ') '                             + #13;
   // Fim Pendência 26919

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
   '   AND TCE.IDTIPOCONTREMPTMO  = PARCELAS.IDTIPOCONTREMPTMO(+) '                                      + #13 +
   '   AND TCE.IDTIPOCONTREMPTMO  = ENCARGOS.IDTIPOCONTREMPTMO(+) '                                      + #13 +
   '   AND TCE.IDTIPOCONTREMPTMO  = AMORT.IDTIPOCONTREMPTMO(+) '                                         + #13 +
   '   AND TCE.IDTIPOCONTREMPTMO  = QUITACAO.IDTIPOCONTREMPTMO(+) '                                      + #13 +
   '   AND TCE.IDTIPOCONTREMPTMO  = REC_PARC.IDTIPOCONTREMPTMO(+) '                                      + #13 +
   '   AND TCE.IDTIPOCONTREMPTMO  = REC_ENC.IDTIPOCONTREMPTMO(+) '                                       + #13 +
   '   AND TCE.IDTIPOCONTREMPTMO  = REC_AMORT.IDTIPOCONTREMPTMO(+) '                                     + #13 +
   '   AND TCE.IDTIPOCONTREMPTMO  = REC_QUIT.IDTIPOCONTREMPTMO(+) '                                      + #13 +
   '   AND TCE.IDTIPOCONTREMPTMO  = ABONADO.IDTIPOCONTREMPTMO(+) '                                       + #13 +
   '   AND TCE.IDTIPOCONTREMPTMO  = QUITADO.IDTIPOCONTREMPTMO(+) '                                       + #13 +
   '   AND TCE.IDTIPOCONTREMPTMO  = SALDO_DEV.IDTIPOCONTREMPTMO(+) '                                     + #13 +
   '   AND TCE.IDTIPOEMPTMO       = TEP.IDTIPOEMPTMO '                                                   + #13 +

   'ORDER BY '                                                                                           + #13 +
   '   TEP.DESCTIPOEMPTMO, TCE.TCEDESCRICAO ';


   with dtmRelFechamentoCarteiraCaixa.qryFechamentoCarteiraCaixa do
   begin
      Close;
      SQL.Clear;
      SQL.Text := sSQL;
    //Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
    //Sql.SavetoFile(Sistema.TempDir + 'EP-RelFechamentoCarteiraCaixa.txt');
      Sql.SavetoFile(ftempregra + '\' + 'EP-RelFechamentoCarteiraCaixa.txt');
      Open;
   end;
end;



procedure TcfgRelFechamentoCarteiraCaixa.FormShow(Sender: TObject);
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



procedure TcfgRelFechamentoCarteiraCaixa.DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
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



procedure TcfgRelFechamentoCarteiraCaixa.DBcboTipoEmptmoExit(Sender: TObject);
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



procedure TcfgRelFechamentoCarteiraCaixa.molContratoEmptmobtnBuscaContratoClick(Sender: TObject);
begin
   inherited;
   molContratoEmptmo.btnBuscaContratoClick(Sender);
end;



procedure TcfgRelFechamentoCarteiraCaixa.molContratoEmptmobtnLimpaContratoClick(Sender: TObject);
begin
   inherited;
   molContratoEmptmo.btnLimpaContratoClick(Sender);
end;



procedure TcfgRelFechamentoCarteiraCaixa.molListaPatrobtnInvertePatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnInvertePatroClick(Sender);
end;



procedure TcfgRelFechamentoCarteiraCaixa.molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnMarcaTodosPatroClick(Sender);
end;



procedure TcfgRelFechamentoCarteiraCaixa.molListaPlanobtnInvertePlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnInvertePlanoClick(Sender);
end;



procedure TcfgRelFechamentoCarteiraCaixa.molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnMarcaTodosPlanoClick(Sender);
end;



procedure TcfgRelFechamentoCarteiraCaixa.FiltraRelatorioAtuDia;
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

   fSaldo_Ant        : Currency;
   fParcelas         : Currency;
   fEncargos         : Currency;
   fAmortizacao      : Currency;
   fQuitacao         : Currency;
   fRec_Parc         : Currency;
   fRec_Enc          : Currency;
   fRec_Amort        : Currency;
   fRec_Quit         : Currency;
   fAbonado          : Currency;
   fQuitado          : Currency;
   fSaldo_Atu        : Currency;

   iTotalSaldo_Ant   : Integer;
   iTotalParc        : Integer;
   iTotalEnc         : Integer;
   iTotalAmo         : Integer;
   iTotalQui         : Integer;
   iTot_Rec_Parc     : Integer;
   iTot_Rec_Enc      : Integer;
   iTot_Rec_Amort    : Integer;
   iTot_Rec_Quit     : Integer;
   iTot_Abonado      : Integer;
   iTot_Quitado      : Integer;
   iTotalSaldo_Atu   : Integer;



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

   dtmRelFechamentoCarteiraCaixa.qryFechamentoCarteiraCaixa.Close;
   dtmRelFechamentoCarteiraCaixa.qryFechamentoCarteiraCaixa.Open;

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

                        fSaldo_Ant        := 0;
                        fParcelas         := 0;
                        fEncargos         := 0;
                        fAmortizacao      := 0;
                        fQuitacao         := 0;
                        fRec_Parc         := 0;
                        fRec_Enc          := 0;
                        fRec_Amort        := 0;
                        fRec_Quit         := 0;
                        fAbonado          := 0;
                        fQuitado          := 0;
                        fSaldo_Atu        := 0;

                        iTotalSaldo_Ant   := 0;
                        iTotalParc        := 0;
                        iTotalEnc         := 0;
                        iTotalAmo         := 0;
                        iTotalQui         := 0;
                        iTot_Rec_Parc     := 0;
                        iTot_Rec_Enc      := 0;
                        iTot_Rec_Amort    := 0;
                        iTot_Rec_Quit     := 0;
                        iTot_Abonado      := 0;
                        iTot_Quitado      := 0;
                        iTotalSaldo_Atu   := 0;

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
                        with qrySaldoAnt do
                        begin
                           LimpaParametros(qrySaldoAnt);
                           ParamByName('PIDCONTRATOEMPTMO').AsFloat  := qryContratoIDCONTRATOEMPTMO.AsFloat;
                           ParamByName('PHMEDATAINI').AsDateTime     := dDataAnt;

                           Open;

                           fSaldo_Ant      := qrySaldoAntSALDO_ANT.AsCurrency;
                           iTotalsaldo_Ant := qrySaldoAntTOTALSALDO_ANT.AsInteger;
                        end;


                        // Saldo Devedor -----------------------------------------------------------
                        with qrySaldoAtu do
                        begin
                           LimpaParametros(qrySaldoAtu);
                           ParamByName('PIDCONTRATOEMPTMO').AsFloat  := qryContratoIDCONTRATOEMPTMO.AsFloat;
                           ParamByName('PHMEDATAFIM').AsDateTime     := dDataAtu;

                           Open;

                           fSaldo_Atu      := qrySaldoAtuSALDO_DEV.AsCurrency;
                           iTotalsaldo_Atu := qrySaldoAtuTOTALSALDO_DEV.AsInteger;
                        end;

                        // -------------------------------------------------------------------------

                        // Parcelas ---------------------------------------------------------------
                        with qryParcelas do
                        begin
                           LimpaParametros(qryParcelas);
                           ParamByName('PIDCONTRATOEMPTMO').AsFloat  := qryContratoIDCONTRATOEMPTMO.AsFloat;
                           ParamByName('PHMEDATAINI').AsDateTime     := dDataAnt + 1;
                           ParamByName('PHMEDATAFIM').AsDateTime     := dDataAtu;

                           Open;

                           fParcelas  := qryParcelasPARCELAS.AsCurrency;
                           iTotalParc := qryParcelasTOTALPARC.AsInteger;
                        end;

                        // Encargos ---------------------------------------------------------------
                        with qryEncargos do
                        begin
                           LimpaParametros(qryEncargos);
                           ParamByName('PIDCONTRATOEMPTMO').AsFloat  := qryContratoIDCONTRATOEMPTMO.AsFloat;
                           ParamByName('PHMEDATAINI').AsDateTime     := dDataAnt + 1;
                           ParamByName('PHMEDATAFIM').AsDateTime     := dDataAtu;

                           if chkApropriado.Checked then
                              ParamByName('PAPROPRIADO').AsInteger      := 1;

                           Open;

                           fEncargos  := qryEncargosENCARGOS.AsCurrency;
                           iTotalEnc  := qryEncargosTOTALENC.AsInteger;
                        end;

                        // Amortizacao ---------------------------------------------------------------
                        with qryAmortizacao do
                        begin
                           LimpaParametros(qryAmortizacao);
                           ParamByName('PIDCONTRATOEMPTMO').AsFloat  := qryContratoIDCONTRATOEMPTMO.AsFloat;
                           ParamByName('PHMEDATAINI').AsDateTime     := dDataAnt + 1;
                           ParamByName('PHMEDATAFIM').AsDateTime     := dDataAtu;

                           Open;

                           fAmortizacao  := qryAmortizacaoAMORTIZACAO.AsCurrency;
                           iTotalAmo     := qryAmortizacaoTOTALAMO.AsInteger;
                        end;

                        // Quitacao ---------------------------------------------------------------
                        with qryQuitacao do
                        begin
                           LimpaParametros(qryQuitacao);
                           ParamByName('PIDCONTRATOEMPTMO').AsFloat  := qryContratoIDCONTRATOEMPTMO.AsFloat;
                           ParamByName('PHMEDATAINI').AsDateTime     := dDataAnt + 1;
                           ParamByName('PHMEDATAFIM').AsDateTime     := dDataAtu;

                           if chkRenovacao.Checked then
                              ParamByName('PCONSIDERARENOVA').AsInteger  := 1;

                           Open;

                           fQuitacao  := qryQuitacaoQUITACAO.AsCurrency;
                           iTotalQui  := qryQuitacaoTOTALQUI.AsInteger;
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
                           iTot_Rec_Parc := qryParcRecTOT_REC_PARC.AsInteger;
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
                           iTot_Rec_Enc := qryEncRecTOT_REC_ENC.AsInteger;
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
                           iTot_Rec_Amort := qryAmoRecTOT_REC_AMORT.AsInteger;
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
                           iTot_Rec_Quit := qryQuiRecTOT_REC_QUIT.AsInteger;
                        end;

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

                           fAbonado     := qryItensAbonadosABONADO.AsCurrency;
                           iTot_Abonado := qryItensAbonadosTOT_ABONADO.AsInteger;
                        end;

                        // Itens quitados ---------------------------------------------------------------
                        with qryItensQuitados do
                        begin
                           LimpaParametros(qryItensQuitados);
                           ParamByName('PIDCONTRATOEMPTMO').AsFloat  := qryContratoIDCONTRATOEMPTMO.AsFloat;
                           ParamByName('PHMEDATAINI').AsDateTime     := dDataAnt + 1;
                           ParamByName('PHMEDATAFIM').AsDateTime     := dDataAtu;

                           Open;

                           fQuitado     := qryItensQuitadosQUITADO.AsCurrency;
                           iTot_Quitado := qryItensQuitadosTOT_QUITADO.AsInteger;
                        end;


                        bGrava      := ( fSaldo_Ant <> 0 )   or
                                       ( fParcelas <> 0 )    or
                                       ( fEncargos <> 0 )    or
                                       ( fAmortizacao <> 0 ) or
                                       ( fQuitacao <> 0 )    or
                                       ( fRec_Parc <> 0 )    or
                                       ( fRec_Enc <> 0 )     or
                                       ( fRec_Amort <> 0 )   or
                                       ( fRec_Quit <> 0 )    or
                                       ( fAbonado <> 0 )     or
                                       ( fQuitado <> 0 )     or
                                       ( fSaldo_Atu <> 0);

                        // -------------------------------------------------------------------------

                        if bGrava then
                        begin
                           // ----------------------------------------------------------------------
                           with dtmRelFechamentoCarteiraCaixa do
                           begin
                              if not qryFechamentoCarteiraCaixa.Locate('DESCTIPOEMPTMO;TCEDESCRICAO',
                                                                        VarArrayOf([qryContratoDESCTIPOEMPTMO.AsString,qryContratoTCEDESCRICAO.AsString]),[]) then
                              begin
                                 qryFechamentoCarteiraCaixa.Insert;
                                 qryFechamentoCarteiraCaixaDESCTIPOEMPTMO.AsString      := qryContratoDESCTIPOEMPTMO.AsString;
                                 qryFechamentoCarteiraCaixaTCEDESCRICAO.AsString        := qryContratoTCEDESCRICAO.AsString;
                              end
                              else
                                 qryFechamentoCarteiraCaixa.Edit;

                              qryFechamentoCarteiraCaixaSALDO_ANT.AsCurrency         := qryFechamentoCarteiraCaixaSALDO_ANT.AsCurrency + fSaldo_Ant;
                              qryFechamentoCarteiraCaixaTOTALSALDO_ANT.AsInteger     := qryFechamentoCarteiraCaixaTOTALSALDO_ANT.AsInteger + iTotalSaldo_Ant;

                              qryFechamentoCarteiraCaixaPARCELAS.AsCurrency          := qryFechamentoCarteiraCaixaPARCELAS.AsCurrency + fParcelas;
                              qryFechamentoCarteiraCaixaTOTALPARC.AsInteger          := qryFechamentoCarteiraCaixaTOTALPARC.AsInteger + iTotalParc;

                              qryFechamentoCarteiraCaixaENCARGOS.AsCurrency          := qryFechamentoCarteiraCaixaENCARGOS.AsCurrency + fEncargos;
                              qryFechamentoCarteiraCaixaTOTALENC.AsInteger           := qryFechamentoCarteiraCaixaTOTALENC.AsInteger + iTotalEnc;

                              qryFechamentoCarteiraCaixaAMORTIZACAO.AsCurrency       := qryFechamentoCarteiraCaixaAMORTIZACAO.AsCurrency + fAmortizacao;
                              qryFechamentoCarteiraCaixaTOTALAMO.AsInteger           := qryFechamentoCarteiraCaixaTOTALAMO.AsInteger + iTotalAmo;

                              qryFechamentoCarteiraCaixaQUITACAO.AsCurrency          := qryFechamentoCarteiraCaixaQUITACAO.AsCurrency + fQuitacao;
                              qryFechamentoCarteiraCaixaTOTALQUI.AsInteger           := qryFechamentoCarteiraCaixaTOTALQUI.AsInteger + iTotalQui;

                              qryFechamentoCarteiraCaixaREC_PARC.AsCurrency          := qryFechamentoCarteiraCaixaREC_PARC.AsCurrency + fRec_Parc;
                              qryFechamentoCarteiraCaixaTOT_REC_PARC.AsInteger       := qryFechamentoCarteiraCaixaTOT_REC_PARC.AsInteger + iTot_Rec_Parc;

                              qryFechamentoCarteiraCaixaREC_ENC.AsCurrency           := qryFechamentoCarteiraCaixaREC_ENC.AsCurrency + fRec_Enc;
                              qryFechamentoCarteiraCaixaTOT_REC_ENC.AsInteger        := qryFechamentoCarteiraCaixaTOT_REC_ENC.AsInteger + iTot_Rec_Enc;

                              qryFechamentoCarteiraCaixaREC_AMORT.AsCurrency         := qryFechamentoCarteiraCaixaREC_AMORT.AsCurrency + fRec_Amort;
                              qryFechamentoCarteiraCaixaTOT_REC_AMORT.AsInteger      := qryFechamentoCarteiraCaixaTOT_REC_AMORT.AsInteger + iTot_Rec_Amort;

                              qryFechamentoCarteiraCaixaREC_QUIT.AsCurrency          := qryFechamentoCarteiraCaixaREC_QUIT.AsCurrency + fRec_Quit;
                              qryFechamentoCarteiraCaixaTOT_REC_QUIT.AsInteger       := qryFechamentoCarteiraCaixaTOT_REC_QUIT.AsInteger + iTot_Rec_Quit;

                              qryFechamentoCarteiraCaixaSALDO_DEV.AsCurrency         := qryFechamentoCarteiraCaixaSALDO_DEV.AsCurrency + fSaldo_Atu;
                              qryFechamentoCarteiraCaixaTOTALSALDO_DEV.AsInteger     := qryFechamentoCarteiraCaixaTOTALSALDO_DEV.AsInteger + iTotalSaldo_Atu;

                              qryFechamentoCarteiraCaixaABONADO.AsCurrency           := qryFechamentoCarteiraCaixaABONADO.AsCurrency + fAbonado;
                              qryFechamentoCarteiraCaixaTOT_ABONADO.AsInteger        := qryFechamentoCarteiraCaixaTOT_ABONADO.AsInteger + iTot_Abonado;

                              qryFechamentoCarteiraCaixaQUITADO.AsCurrency           := qryFechamentoCarteiraCaixaQUITADO.AsCurrency + fQuitado;
                              qryFechamentoCarteiraCaixaTOT_QUITADO.AsInteger        := qryFechamentoCarteiraCaixaTOT_QUITADO.AsInteger + iTot_Quitado;

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
