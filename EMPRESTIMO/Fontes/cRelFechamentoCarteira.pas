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
Rotina    : qryContrato
Data      : 08/11/2007
Pendência : 26919
Autor     :
Descrição : Utilização de MIG.IDPATROATU no lugar de CON.IDPATRO na query
---------------------------------------------------------------------------------------------------}

unit cRelFechamentoCarteira;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   CRel, fcCombo, fcColorCombo, StdCtrls, Mask, wwdbedit, Wwdbspin,
   wwdblook, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97,
   ExtCtrls, Db, mContratoEmptmo, mListaPlano, mListaPatro,
   mListaPlanoContab, fProgressoDuplo, DBTables, Wwquery;

type
   TcfgRelFechamentoCarteira = class(TcfgRel)
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
      molListaPlano: TmolListaPlanoContab;
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
    qrySaldoAnt: TwwQuery;
    qryQuant_Ant: TwwQuery;
    qryQuant_AntIDTIPOCONTREMPTMO: TFloatField;
    qryQuant_AntTOTALSLDDEV: TFloatField;
    qryConcessoes: TwwQuery;
    qryConcessoesIDTIPOCONTREMPTMO: TFloatField;
    qryConcessoesCONCESSOES: TFloatField;
    qryConcessoesTOTALCONCESSOES: TFloatField;
    qryQuant_Conc: TwwQuery;
    qryQuant_ConcIDTIPOCONTREMPTMO: TFloatField;
    qryQuant_ConcTOTALCONCESSOES: TFloatField;
    qryQuant_QuitParc: TwwQuery;
    qryQuant_QuitParcIDTIPOCONTREMPTMO: TFloatField;
    qryQuant_QuitParcTOTQUITPARC: TFloatField;
    qryParcelas: TwwQuery;
    qryParcelasIDTIPOCONTREMPTMO: TFloatField;
    qryParcelasPARCELAS: TFloatField;
    qryParcelasTOTALPARC: TFloatField;
    qryQuant_Parc: TwwQuery;
    qryQuant_ParcIDTIPOCONTREMPTMO: TFloatField;
    qryQuant_ParcTOTALPARC: TFloatField;
    qryEncerra: TwwQuery;
    qryEncerraIDTIPOCONTREMPTMO: TFloatField;
    qryEncerraENCERRADOS: TFloatField;
    qryEncerraQUANTENCERRA: TFloatField;
    qryAmort: TwwQuery;
    qryAmortIDTIPOCONTREMPTMO: TFloatField;
    qryAmortAMORTIZACAO: TFloatField;
    qryAmortTOTALAMO: TFloatField;
    qryQuant_Amort: TwwQuery;
    qryQuant_AmortIDTIPOCONTREMPTMO: TFloatField;
    qryQuant_AmortTOTALAMO: TFloatField;
    qryQuitacao: TwwQuery;
    qryQuitacaoIDTIPOCONTREMPTMO: TFloatField;
    qryQuitacaoQUITACAO: TFloatField;
    qryQuitacaoTOTALQUI: TFloatField;
    qryQuant_Quit: TwwQuery;
    qryQuant_QuitIDTIPOCONTREMPTMO: TFloatField;
    qryQuant_QuitTOTALQUI: TFloatField;
    qryQuitMort: TwwQuery;
    qryQuitMortIDTIPOCONTREMPTMO: TFloatField;
    qryQuitMortQUIT_MORT: TFloatField;
    qryQuitMortTOTALQUM: TFloatField;
    qryQuant_Mort: TwwQuery;
    qryQuant_MortIDTIPOCONTREMPTMO: TFloatField;
    qryQuant_MortTOTALQUM: TFloatField;
    qryQuant_Atu: TwwQuery;
    qryQuant_AtuIDTIPOCONTREMPTMO: TFloatField;
    qryQuant_AtuTOTALSLDDEV: TFloatField;
    qrySaldoAntIDTIPOCONTREMPTMO: TFloatField;
    qrySaldoAntSALDODEV: TFloatField;
    qrySaldoAntTOTALSLDDEV: TFloatField;
    qrySaldoAtuIDTIPOCONTREMPTMO: TFloatField;
    qrySaldoAtuSALDODEV: TFloatField;
    qrySaldoAtuTOTALSLDDEV: TFloatField;

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
  cfgRelFechamentoCarteira: TcfgRelFechamentoCarteira;



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
   dRelFechamentoCarteira;




procedure TcfgRelFechamentoCarteira.AbreQueries;
begin
   // Tipo de Empréstimo
   with dtmLookEmptmo.qryLookTipoEmptmo do begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoEmptmo);
      ParamByName('PIDEMPRESAPROP').AsInteger := Sistema.IDEmpresa;
      Open;
   end;

   // Tipo de Contrato
   LimpaParametros(dtmLookEmptmo.qryLookPlanPrev);
   dtmLookEmptmo.qryLookPlanPrev.Open;
end;



procedure TcfgRelFechamentoCarteira.MontaQuery;
begin
   inherited;

   with dtmRelFechamentoCarteira do
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

   ParametrosSistema;
   case dtmEmptmo.qryParamEmptmoFLGCALCDIA.AsInteger of
      0: FiltraRelatorio;
      1: FiltraRelatorioAtuDia;
   end;
end;



procedure TcfgRelFechamentoCarteira.FiltraRelatorio;
var
   sSQL     : String;
   sMesAnt  : String;
   sAnoAnt  : String;
   sDataAtu : String;
   sDataAnt : String;
   dDataAtu : TDateTime;
begin
   sDataAtu := FormatDateTime('dd/mm/yyyy', DiasUteis.UltDiaMes(Trunc(DBspnAno.Value), (cboMes.ItemIndex + 1)));
   sDataAtu := QuotedStr(sDataAtu);

   dDataAtu := EncodeDate(Trunc(DBspnAno.Value), (cboMes.ItemIndex + 1), 1);
   dDataAtu := DiasUteis.SomaMeses(dDataAtu, -1);

   sDataAnt := FormatDateTime('dd/mm/yyyy', DiasUteis.UltDiaMes(DiasUteis.ExtraiAno(dDataAtu), DiasUteis.ExtraiMes(dDataAtu)));

   sAnoAnt  := copy(sDataAnt, 7, 4);
   sMesAnt  := copy(sDataAnt, 4, 2);

   sDataAnt := QuotedStr(sDataAnt);

   sSQL :=
   'SELECT '                                                                                             + #13 +

   '   TEP.DESCTIPOEMPTMO, '                                                                             + #13 +
   '   TCE.TCEDESCRICAO, '                                                                               + #13 +

   '   NVL(SALDOANT.SALDODEV, 0)           AS SALDODEV, '                                                + #13 +
   '   NVL(QUANT_ANT.TOTALSLDDEV, 0)       AS TOTALSLDDEV, '                                             + #13 +

   '   NVL(CONCESSOES.CONCESSOES, 0)       AS CONCESSOES, '                                              + #13 +
   '   NVL(QUANT_CONC.TOTALCONCESSOES, 0)  AS TOTALCONCESSOES, '                                         + #13 +

   '   NVL(QUANT_QUITPARC.TOTQUITPARC, 0)  AS TOTALQUIPARC, '                                            + #13 +

   '   NVL(PARCELAS.PARCELAS, 0)           AS PARCELAS, '                                                + #13 +
   '   NVL(QUANT_PARC.TOTALPARC, 0)        AS TOTALPARC, '                                               + #13 +

   '   NVL(ENCERRA.ENCERRADOS, 0)          AS ENCERRADOS, '                                              + #13 +
   '   NVL(ENCERRA.QUANTENCERRA, 0)        AS TOTAL_ENCERRA, '                                           + #13 +

   '   NVL(AMORT.AMORTIZACAO, 0)           AS AMORTIZACAO, '                                             + #13 +
   '   NVL(QUANT_AMORT.TOTALAMO, 0)        AS TOTALAMO, '                                                + #13 +

   '   NVL(QUITACAO.QUITACAO, 0)           AS QUITACAO, '                                                + #13 +
   '   NVL(QUANT_QUIT.TOTALQUI, 0)         AS TOTALQUI, '                                                + #13 +

   '   NVL(QUITMORT.QUIT_MORT, 0)          AS QUIT_MORT, '                                               + #13 +
   '   NVL(QUANT_MORT.TOTALQUM, 0)         AS TOTALQUM, '                                                + #13 +

   '   NVL(SALDOATU.SALDODEV, 0)           AS SALDOATU, '                                                + #13 +
   '   NVL(QUANT_ATU.TOTALSLDDEV, 0)       AS TOTALSLA '                                                 + #13 +

   'FROM '                                                                                               + #13 +
   '   TIPOCONTREMPTMO TCE, TIPOEMPTMO TEP, '                                                            + #13 +


   '-- SALDO ANTERIOR ---------------------------------------------------------------------------- '     + #13 +
   '   ( '                                                                                               + #13 +
   '   SELECT '                                                                                          + #13 +
   '      A.IDTIPOCONTREMPTMO, NVL(SUM(SLD.HMESALDODEV), 0) AS SALDODEV, '                               + #13 +
   '      NVL(COUNT(SLD.IDCONTRATOEMPTMO),0) AS TOTALSLDDEV '                                            + #13 +
   '   FROM '                                                                                            + #13 +
   '      TIPOCONTREMPTMO A, '                                                                           + #13 +
   '      ( '                                                                                            + #13 +
   '      SELECT '                                                                                       + #13 +
   '         TC.IDTIPOCONTREMPTMO, M.IDCONTRATOEMPTMO, '                                                 + #13 +
   '         NVL(SUM(H.HMESALDODEV),0) AS HMESALDODEV '                                                  + #13 +
   '      FROM '                                                                                         + #13 +
   '         TIPOCONTREMPTMO TC, HISTMOVEMPTMO H, CONTRATOEMPTMO C, '                                    + #13 +
   '         ( '                                                                                         + #13 +
   '         SELECT '                                                                                    + #13 +
   '            CON.IDCONTRATOEMPTMO, MAX(IDHISTMOVEMPTMO) AS IDHISTMOVEMPTMO '                          + #13 +
   '         FROM '                                                                                      + #13 +
   // Pendência 26919 - 14/11/2007
   //'            HISTMOVEMPTMO HME, CONTRATOEMPTMO CON, '                                                 + #13 +
   '            CONTRATOEMPTMO CON, HISTMOVEMPTMO HME '                                                  + #13 +
   '            left outer join MIGRACONTRATOEP MIG '                                                    + #13 +
   '            on (MIG.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO AND '                                    + #13 +
   '                MIG.DATAMIGRA        = F_MIGRAEP_DATA(HME.IDCONTRATOEMPTMO, HME.HMEDATAPREVISTA)), ' + #13 +
   // Fim Pendência 26919
   '            ITEMXTIPOCONTR ITC, ITEMEMPTMO ITE, TIPOCONTREMPTMO TCE '                                + #13 +
   '         WHERE '                                                                                     + #13 +
   '                CON.FLGSITUACAO         <> ''C'' '                                                   + #13 +
   '            AND ITC.ITCTRATASALDODEV    <> 0 '                                                       + #13 +
   // Pendência 26919 - 14/11/2007
   //'            AND CON.IDPATRO             IN (' + molListaPatro.PegaPatro + ') '                       + #13 +
   //'            AND CON.IDPLANOPREV         IN (' + molListaPlano.PegaPlano + ') '                       + #13;
   '            AND NVL(MIG.IDPATROANT, CON.IDPATRO) IN (' + molListaPatro.PegaPatro + ') '              + #13 +
   '            AND NVL(MIG.IDPLANOCONTANT, CON.IDPLANOORIGEM) IN (' + molListaPlano.PegaPlano + ') '    + #13;
   // Fim Pendência 26919

   // Tipo de Empréstimo
   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   '            AND TCE.IDTIPOEMPTMO         = ' + DBcboTipoEmptmo.LookupValue                           + #13;

   // Tipo de Contrato
   if DBcboTipoContr.LookupValue <> '' then sSQL := sSQL +
   '            AND TCE.IDTIPOCONTREMPTMO    = ' + DBcboTipoContr.LookupValue                         + #13;

   // Contrato
   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '            AND CON.IDCONTRATOEMPTMO     = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)                + #13;

   sSQL := sSQL +
   '            AND ( HME.HMEDATAATUALIZA    = '                                                         + #13 +
   '                  ( '                                                                                + #13 +
   '                  SELECT '                                                                           + #13 +
   '                     MAX(H.HMEDATAATUALIZA) '                                                        + #13 +
   '                  FROM '                                                                             + #13 +
   '                     HISTMOVEMPTMO   H, '                                                            + #13 +
   '                     CONTRATOEMPTMO  C, '                                                            + #13 +
   '                     ITEMXTIPOCONTR  IT '                                                            + #13 +
   '                  WHERE '                                                                            + #13 +
   '                         C.IDCONTRATOEMPTMO    = CON.IDCONTRATOEMPTMO '                              + #13 +
   '                     AND H.HMEDATAATUALIZA    <= TO_DATE(' + sDataAnt + ', ''DD/MM/YYYY'') '         + #13 +
   '                     AND IT.ITCTRATASALDODEV  <> 0 '                                                 + #13 +
   '                     AND HME.HMEANOCOMPETENCIA = ' + sAnoAnt                                         + #13 +
   '                     AND HME.HMEMESCOMPETENCIA = ' + sMesAnt                                         + #13 +
   '                     AND ( H.FLGESTORNADO      = 0 OR H.FLGESTORNADO IS NULL ) '                     + #13 +
   '                     AND H.IDCONTRATOEMPTMO    = C.IDCONTRATOEMPTMO '                                + #13 +
   '                     AND C.IDTIPOCONTREMPTMO   = IT.IDTIPOCONTREMPTMO '                              + #13 +
   '                     AND H.IDITEMEMPTMO        = IT.IDITEMEMPTMO '                                   + #13 +
   '                  ) '                                                                                + #13 +
   '                ) '                                                                                  + #13 +
   '            AND ( (HME.FLGESTORNADO      = 0) OR (HME.FLGESTORNADO IS NULL) ) '                      + #13 +
   '            AND HME.HMEANOCOMPETENCIA    = ' + sAnoAnt                                               + #13 +
   '            AND HME.HMEMESCOMPETENCIA    = ' + sMesAnt                                               + #13 +
   '            AND ( HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO ) '                                  + #13 +
   '            AND ( CON.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPTMO ) '                                 + #13 +
   '            AND ( CON.IDTIPOCONTREMPTMO  = TCE.IDTIPOCONTREMPTMO ) '                                 + #13 +
   '            AND ( TCE.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPTMO ) '                                 + #13 +
   '            AND ( HME.IDITEMEMPTMO       = ITE.IDITEMEMPTMO ) '                                      + #13 +
   '            AND ( ITE.IDITEMEMPTMO       = ITC.IDITEMEMPTMO ) '                                      + #13 +
   '            AND ( HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO ) '                                      + #13 +
   '         GROUP BY '                                                                                  + #13 +
   '            CON.IDCONTRATOEMPTMO '                                                                   + #13 +
   '         ) M '                                                                                       + #13 +
   '      WHERE '                                                                                        + #13 +
   // Pendência 26919 - 14/11/2007
   //'             C.IDPATRO           IN (' + molListaPatro.PegaPatro + ') '                              + #13 +
   //'         AND C.IDPLANOPREV       IN (' + molListaPlano.PegaPlano + ') '                              + #13 +
   // Fim Pendência 26919
   '             M.IDHISTMOVEMPTMO   = H.IDHISTMOVEMPTMO '                                               + #13 +
   '         AND M.IDCONTRATOEMPTMO  = H.IDCONTRATOEMPTMO '                                              + #13 +
   '         AND H.IDCONTRATOEMPTMO  = C.IDCONTRATOEMPTMO '                                              + #13 +
   '         AND C.IDTIPOCONTREMPTMO = TC.IDTIPOCONTREMPTMO '                                            + #13 +
   '      GROUP BY '                                                                                     + #13 +
   '            TC.IDTIPOCONTREMPTMO, M.IDCONTRATOEMPTMO '                                               + #13 +
   '      ) SLD '                                                                                        + #13 +
   '   WHERE '                                                                                           + #13 +
   '      A.IDTIPOCONTREMPTMO = SLD.IDTIPOCONTREMPTMO(+) '                                               + #13 +
   '   GROUP BY '                                                                                        + #13 +
   '      A.IDTIPOCONTREMPTMO '                                                                          + #13 +
   '   ) SALDOANT, '                                                                                     + #13 +
   '-- FIM SALDO ANTERIOR ------------------------------------------------------------------------ '     + #13 +


   '-- QUANT CONTRATOS NA COLUNA SALDO ANTERIOR -------------------------------------------------- '     + #13 +
   '   ( '                                                                                               + #13 +
   '   SELECT '                                                                                          + #13 +
   '      CON.IDTIPOCONTREMPTMO, COUNT(CON.IDCONTRATOEMPTMO) AS TOTALSLDDEV '                            + #13 +
   '   FROM '                                                                                            + #13 +
   '      HISTMOVEMPTMO HME, CONTRATOEMPTMO CON, '                                                       + #13 +
   '      ( '                                                                                            + #13 +
   '      SELECT '                                                                                       + #13 +
   '         CON.IDCONTRATOEMPTMO, MAX(IDHISTMOVEMPTMO) AS IDHISTMOVEMPTMO '                             + #13 +
   '      FROM '                                                                                         + #13 +
   // Pendência 26919 - 14/11/2007
   //'         HISTMOVEMPTMO HME, CONTRATOEMPTMO CON, '                                                    + #13 +
   '           CONTRATOEMPTMO CON, HISTMOVEMPTMO HME '                                                   + #13 +
   '           left outer join MIGRACONTRATOEP MIG '                                                     + #13 +
   '           on (MIG.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO AND '                                     + #13 +
   '               MIG.DATAMIGRA        = F_MIGRAEP_DATA(HME.IDCONTRATOEMPTMO, HME.HMEDATAPREVISTA)), '  + #13 +
   // Fim Pendência 26919
   '         ITEMXTIPOCONTR ITC, ITEMEMPTMO ITE, TIPOCONTREMPTMO TCE '                                   + #13 +
   '      WHERE '                                                                                        + #13 +
   '             CON.FLGSITUACAO        <> ''C'' '                                                       + #13 +
   '         AND ITC.ITCTRATASALDODEV   <> 0 '                                                           + #13 +
   // Pendência 26919 - 14/11/2007
   //'         AND CON.IDPATRO              IN (' + molListaPatro.PegaPatro + ') '                         + #13 +
   //'         AND CON.IDPLANOPREV          IN (' + molListaPlano.PegaPlano + ') '                         + #13;
   '            AND NVL(MIG.IDPATROANT, CON.IDPATRO) IN (' + molListaPatro.PegaPatro + ') '              + #13 +
   '            AND NVL(MIG.IDPLANOCONTANT, CON.IDPLANOORIGEM) IN (' + molListaPlano.PegaPlano + ') '    + #13;
   // Fim Pendência 26919

   // Tipo de Empréstimo
   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   '         AND TCE.IDTIPOEMPTMO         = ' + DBcboTipoEmptmo.LookupValue                              + #13;

   // Tipo de Contrato
   if DBcboTipoContr.LookupValue <> '' then sSQL := sSQL +
   '         AND TCE.IDTIPOCONTREMPTMO    = ' + DBcboTipoContr.LookupValue                            + #13;

   // Contrato
   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '         AND CON.IDCONTRATOEMPTMO     = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)                   + #13;

   sSQL := sSQL +
   '            AND ( HME.HMEDATAATUALIZA    = '                                                         + #13 +
   '                  ( '                                                                                + #13 +
   '                  SELECT '                                                                           + #13 +
   '                     MAX(H.HMEDATAATUALIZA) '                                                        + #13 +
   '                  FROM '                                                                             + #13 +
   '                     HISTMOVEMPTMO   H, '                                                            + #13 +
   '                     CONTRATOEMPTMO  C, '                                                            + #13 +
   '                     ITEMXTIPOCONTR  IT '                                                            + #13 +
   '                  WHERE '                                                                            + #13 +
   '                         C.IDCONTRATOEMPTMO    = CON.IDCONTRATOEMPTMO '                              + #13 +
   '                     AND H.HMEDATAATUALIZA    <= TO_DATE(' + sDataAnt + ', ''DD/MM/YYYY'') '         + #13 +
   '                     AND IT.ITCTRATASALDODEV  <> 0 '                                                 + #13 +
   '                     AND HME.HMEANOCOMPETENCIA = ' + sAnoAnt                                         + #13 +
   '                     AND HME.HMEMESCOMPETENCIA = ' + sMesAnt                                         + #13 +
   '                     AND ( H.FLGESTORNADO      = 0 OR H.FLGESTORNADO IS NULL ) '                     + #13 +
   '                     AND H.IDCONTRATOEMPTMO    = C.IDCONTRATOEMPTMO '                                + #13 +
   '                     AND C.IDTIPOCONTREMPTMO   = IT.IDTIPOCONTREMPTMO '                              + #13 +
   '                     AND H.IDITEMEMPTMO        = IT.IDITEMEMPTMO '                                   + #13 +
   '                  ) '                                                                                + #13 +
   '                ) '                                                                                  + #13 +
   '         AND ( HME.HMEANOCOMPETENCIA  = ' + sAnoAnt + ' ) '                                          + #13 +
   '         AND ( HME.HMEMESCOMPETENCIA  = ' + sMesAnt + ' ) '                                          + #13 +
   '         AND ( (HME.FLGESTORNADO      = 0) OR (HME.FLGESTORNADO IS NULL) ) '                         + #13 +
   '         AND ( HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO ) '                                     + #13 +
   '         AND ( CON.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPTMO ) '                                    + #13 +
   '         AND ( CON.IDTIPOCONTREMPTMO  = TCE.IDTIPOCONTREMPTMO ) '                                    + #13 +
   '         AND ( TCE.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPTMO ) '                                    + #13 +
   '         AND ( HME.IDITEMEMPTMO       = ITE.IDITEMEMPTMO ) '                                         + #13 +
   '         AND ( ITE.IDITEMEMPTMO       = ITC.IDITEMEMPTMO ) '                                         + #13 +
   '         AND ( HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO ) '                                         + #13 +
   '      GROUP BY '                                                                                     + #13 +
   '         CON.IDCONTRATOEMPTMO '                                                                      + #13 +
   '      ) MAX '                                                                                        + #13 +
   '   WHERE '                                                                                           + #13 +
   '          ( CON.FLGSITUACAO        <> ''C'' ) '                                                      + #13 +
   // Pendência 26919 - 14/11/2007
   //'      AND CON.IDPATRO              IN (' + molListaPatro.PegaPatro + ') '                            + #13 +
   //'      AND CON.IDPLANOPREV          IN (' + molListaPlano.PegaPlano + ') '                            + #13 +
   // Fim Pendência 26919
   '      AND ( HME.HMESALDODEV        > 0 ) '                                                           + #13 +
   '      AND ( CON.IDCONTRATOEMPTMO   = HME.IDCONTRATOEMPTMO ) '                                        + #13 +
   '      AND ( CON.IDCONTRATOEMPTMO   = MAX.IDCONTRATOEMPTMO ) '                                        + #13 +
   '      AND ( HME.IDHISTMOVEMPTMO    = MAX.IDHISTMOVEMPTMO ) '                                         + #13 +
   '   GROUP BY '                                                                                        + #13 +
   '      CON.IDTIPOCONTREMPTMO '                                                                        + #13 +
   '   ) QUANT_ANT, '                                                                                    + #13 +
   '-- FIM QUANT CONTRATOS NA COLUNA SALDO ANTERIOR ---------------------------------------------- '     + #13 +


   '-- CONCESSOES -------------------------------------------------------------------------------- '     + #13 +
   '   ( '                                                                                               + #13 +
   '   SELECT '                                                                                          + #13 +
   '      A.IDTIPOCONTREMPTMO, NVL(SUM(CON.HMEVLRPREVISTO), 0) AS CONCESSOES, '                          + #13 +
   '      NVL(COUNT(CON.IDCONTRATOEMPTMO),0) AS TOTALCONCESSOES '                                        + #13 +
   '   FROM '                                                                                            + #13 +
   '      TIPOCONTREMPTMO A, '                                                                           + #13 +
   '      ( '                                                                                            + #13 +
   //Wylliam Leite da Silva SOL 253185 PPM 771995 - Início
   '      SELECT '                                                                       + #13 +
   //Wylliam Leite da Silva SOL 253185 PPM 771995 - Fim
   '         TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO, '                               + #13 +
   '         TC.IDTIPOCONTREMPTMO, '                                                                     + #13 +
   '         DECODE(ITC.ITCTRATASALDODEV, 1, (HME.HMEVLRPREVISTO * (-1)), 2, HME.HMEVLRPREVISTO, 0) AS HMEVLRPREVISTO ' + #13 +
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
   '             ITC.ITCTRATASALDODEV   <> 0  '                                                          + #13 +
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
   '         AND C.FLGSITUACAO          <> ''C'' '                                                       + #13 +
   '         AND HME.HMETIPOMOV         = 0 '                                                            + #13 +
   '         AND HME.HMEORIGEM          = 0 '                                                            + #13 +
   '         AND HME.HMEPARCELA         = 0 '                                                            + #13 +
   '         AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO IS NULL) ) '                           + #13 +
   '         AND HME.HMEANOCOMPETENCIA  = ' + NumeroIngles(DBspnAno.Value)                               + #13 +
   '         AND HME.HMEMESCOMPETENCIA  = ' + IntToStr(cboMes.ItemIndex + 1)                             + #13 +
   '         AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO '                                           + #13 +
   '         AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO '                                         + #13 +
   '         AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO '                                        + #13 +
   '         AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO '                                             + #13 +
   '      ) CON '                                                                                        + #13 +
   '   WHERE '                                                                                           + #13 +
   '      A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO(+) '                                               + #13 +
   '   GROUP BY '                                                                                        + #13 +
   '      A.IDTIPOCONTREMPTMO '                                                                          + #13 +
   '   ) CONCESSOES, '                                                                                   + #13 +
   '-- FIM CONCESSÕES ---------------------------------------------------------------------------- '     + #13 +


   '-- QUANTIDADE DE CONCESSOES ------------------------------------------------------------------ '     + #13 +
   '   ( '                                                                                               + #13 +
   '   SELECT '                                                                                          + #13 +
   '      A.IDTIPOCONTREMPTMO, '                                                                         + #13 +
   '      COUNT(C.IDCONTRATOEMPTMO) AS TOTALCONCESSOES '                                                 + #13 +
   '   FROM '                                                                                            + #13 +
   // Pendência 26919 - 14/11/2007
   //'      HISTMOVEMPTMO   HME, '                                                                         + #13 +
   //'      CONTRATOEMPTMO  C, '                                                                           + #13 +
   '      CONTRATOEMPTMO C, HISTMOVEMPTMO HME '                                                          + #13 +
   '      left outer join MIGRACONTRATOEP MIG '                                                          + #13 +
   '      on (MIG.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO AND '                                          + #13 +
   '          MIG.DATAMIGRA        = F_MIGRAEP_DATA(HME.IDCONTRATOEMPTMO, HME.HMEDATAPREVISTA)), '       + #13 +
   // Fim Pendência 26919
   '      TIPOCONTREMPTMO A '                                                                            + #13 +
   '   WHERE '                                                                                           + #13 +
   '          C.FLGSITUACAO             <> ''C'' '                                                       + #13 +
   // Pendência 26919 - 14/11/2007
   //'      AND C.IDPATRO                 IN (' + molListaPatro.PegaPatro + ') '                           + #13 +
   //'      AND C.IDPLANOPREV             IN (' + molListaPlano.PegaPlano + ') '                           + #13;
   '      AND NVL(MIG.IDPATROANT, C.IDPATRO) IN (' + molListaPatro.PegaPatro + ') '                      + #13 +
   '      AND NVL(MIG.IDPLANOCONTANT, C.IDPLANOORIGEM) IN (' + molListaPlano.PegaPlano + ') '            + #13;
   // Fim Pendência 26919

   // Tipo de Empréstimo
   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   '      AND A.IDTIPOEMPTMO            = ' + DBcboTipoEmptmo.LookupValue                                + #13;

   // Tipo de Contrato
   if DBcboTipoContr.LookupValue <> '' then sSQL := sSQL +
   '      AND A.IDTIPOCONTREMPTMO       = ' + DBcboTipoContr.LookupValue                              + #13;

   // Contrato
   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '      AND C.IDCONTRATOEMPTMO        = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)                     + #13;

   sSQL := sSQL +
   '      AND HME.HMETIPOMOV            = 0 '                                                            + #13 +
   '      AND HME.HMEORIGEM             = 0 '                                                            + #13 +
   '      AND HME.HMEPARCELA            = 0 '                                                            + #13 +
   '      AND HME.HMESEQCOBRANCA        = 1 '                                                            + #13 +
   '      AND ( (HME.HMECENTRALIZA      = 1) OR (HME.HMEDESTACADO = 1) ) '                               + #13 +
   '      AND ( (HME.FLGESTORNADO       = 0) OR (HME.FLGESTORNADO IS NULL) ) '                           + #13 +
   '      AND HME.HMEANOCOMPETENCIA     = ' + NumeroIngles(DBspnAno.Value)                               + #13 +
   '      AND HME.HMEMESCOMPETENCIA     = ' + IntToStr(cboMes.ItemIndex + 1)                             + #13 +
   '      AND A.IDTIPOCONTREMPTMO       = C.IDTIPOCONTREMPTMO '                                          + #13 +
   '      AND C.IDCONTRATOEMPTMO       = HME.IDCONTRATOEMPTMO '                                          + #13 +
   '   GROUP BY '                                                                                        + #13 +
   '      A.IDTIPOCONTREMPTMO '                                                                          + #13 +
   '   ) QUANT_CONC, '                                                                                   + #13 +
   '-- FIM QUANTIDADE DE CONCESSOES -------------------------------------------------------------- '     + #13 +


   '-- QUANTIDADE DE QUITAÇÕES (ANTES DE GERAR PARCELA) ------------------------------------------ '     + #13 +
   '   ( '                                                                                               + #13 +
   '   SELECT '                                                                                          + #13 +
   '      A.IDTIPOCONTREMPTMO, '                                                                         + #13 +
   '      COUNT(DISTINCT(C.IDCONTRATOEMPTMO)) AS TOTQUITPARC '                                           + #13 +
   '   FROM '                                                                                            + #13 +
   // Pendência 26919 - 14/11/2007
   //'      HISTMOVEMPTMO   HME, '                                                                         + #13 +
   //'      CONTRATOEMPTMO  C, '                                                                           + #13 +
   '      CONTRATOEMPTMO C, HISTMOVEMPTMO HME '                                                          + #13 +
   '      left outer join MIGRACONTRATOEP MIG '                                                          + #13 +
   '      on (MIG.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO AND '                                          + #13 +
   '          MIG.DATAMIGRA        = F_MIGRAEP_DATA(HME.IDCONTRATOEMPTMO, HME.HMEDATAPREVISTA)), '       + #13 +
   // Fim Pendência 26919
   '      ITEMXTIPOCONTR  ITC, '                                                                         + #13 +
   '      TIPOCONTREMPTMO A '                                                                            + #13 +
   '   WHERE '                                                                                           + #13 +
   '          C.FLGSITUACAO             <> ''C'' '                                                       + #13 +
   // Pendência 26919 - 14/11/2007
   //'      AND C.IDPATRO                 IN (' + molListaPatro.PegaPatro + ') '                           + #13 +
   //'      AND C.IDPLANOPREV             IN (' + molListaPlano.PegaPlano + ') '                           + #13;
   '         AND NVL(MIG.IDPATROANT, C.IDPATRO) IN (' + molListaPatro.PegaPatro + ') '                   + #13 +
   '         AND NVL(MIG.IDPLANOCONTANT, C.IDPLANOORIGEM) IN (' + molListaPlano.PegaPlano + ') '         + #13;
   // Fim Pendência 26919

   // Tipo de Empréstimo
   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   '      AND A.IDTIPOEMPTMO            = ' + DBcboTipoEmptmo.LookupValue                                + #13;

   // Tipo de Contrato
   if DBcboTipoContr.LookupValue <> '' then sSQL := sSQL +
   '      AND A.IDTIPOCONTREMPTMO       = ' + DBcboTipoContr.LookupValue                              + #13;

   // Contrato
   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '      AND C.IDCONTRATOEMPTMO        = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)                     + #13;

   sSQL := sSQL +
   '      AND HME.HMETIPOMOV            = 3 '                                                            + #13 +
   '      AND ITC.ITCTRATASALDODEV      = 1 '                                                            + #13 +
   '      AND ( (HME.FLGESTORNADO       = 0) OR (HME.FLGESTORNADO IS NULL) ) '                           + #13 +
   '      AND HME.HMEANOCOMPETENCIA     = ' + NumeroIngles(DBspnAno.Value)                               + #13 +
   '      AND HME.HMEMESCOMPETENCIA     = ' + IntToStr(cboMes.ItemIndex + 1)                             + #13 +
   '      AND NOT EXISTS '                                                                               + #13 +
   '        ( '                                                                                          + #13 +
   '        SELECT '                                                                                     + #13 +
   '           H1.IDCONTRATOEMPTMO '                                                                     + #13 +
   '        FROM '                                                                                       + #13 +
   // Pendência 26919 - 14/11/2007
   //'           HISTMOVEMPTMO  H1, '                                                                      + #13 +
   //'           CONTRATOEMPTMO C1 '                                                                       + #13 +
   '      CONTRATOEMPTMO C1, HISTMOVEMPTMO H1 '                                                          + #13 +
   '      left outer join MIGRACONTRATOEP MIG '                                                          + #13 +
   '      on (MIG.IDCONTRATOEMPTMO = H1.IDCONTRATOEMPTMO AND '                                           + #13 +
   '          MIG.DATAMIGRA        = F_MIGRAEP_DATA(H1.IDCONTRATOEMPTMO, H1.HMEDATAPREVISTA)) '          + #13 +
   // Fim Pendência 26919
   '        WHERE '                                                                                      + #13 +
   '               C1.FLGSITUACAO       <> ''C'' '                                                       + #13 +
   // Pendência 26919 - 14/11/2007
   //'           AND C1.IDPATRO           IN (' + molListaPatro.PegaPatro + ') '                           + #13 +
   //'           AND C1.IDPLANOPREV       IN (' + molListaPlano.PegaPlano + ') '                           + #13;
   '           AND NVL(MIG.IDPATROANT, C1.IDPATRO) IN (' + molListaPatro.PegaPatro + ') '                + #13 +
   '           AND NVL(MIG.IDPLANOCONTANT, C1.IDPLANOORIGEM) IN (' + molListaPlano.PegaPlano + ') '      + #13;
   // Fim Pendência 26919

   // Tipo de Contrato
   if DBcboTipoContr.LookupValue <> '' then sSQL := sSQL +
   '           AND C1.IDTIPOCONTREMPTMO = ' + DBcboTipoContr.LookupValue                              + #13;

   // Contrato
   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '           AND C1.IDCONTRATOEMPTMO  = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)                     + #13;

   sSQL := sSQL +
   '           AND H1.HMETIPOMOV        = 1 '                                                            + #13 +
   '           AND H1.HMEPARCELA        > 0 '                                                            + #13 +
   '           AND H1.HMESEQCOBRANCA    = 1 '                                                            + #13 +
   '           AND ( H1.FLGESTORNADO    = 0 OR H1.FLGESTORNADO IS NULL ) '                               + #13 +
   '           AND H1.HMEANOCOMPETENCIA = ' + NumeroIngles(DBspnAno.Value)                               + #13 +
   '           AND H1.HMEMESCOMPETENCIA = ' + IntToStr(cboMes.ItemIndex + 1)                             + #13 +
   '           AND C1.IDCONTRATOEMPTMO  = C.IDCONTRATOEMPTMO '                                           + #13 +
   '           AND H1.IDCONTRATOEMPTMO  = C.IDCONTRATOEMPTMO '                                           + #13 +
   '        ) '                                                                                          + #13 +
   '      AND A.IDTIPOCONTREMPTMO       = C.IDTIPOCONTREMPTMO '                                          + #13 +
   '      AND A.IDTIPOCONTREMPTMO       = ITC.IDTIPOCONTREMPTMO '                                        + #13 +
   '      AND HME.IDITEMEMPTMO          = ITC.IDITEMEMPTMO '                                             + #13 +
   '      AND C.IDCONTRATOEMPTMO        = HME.IDCONTRATOEMPTMO '                                         + #13 +
   '   GROUP BY '                                                                                        + #13 +
   '      A.IDTIPOCONTREMPTMO '                                                                          + #13 +
   '   ) QUANT_QUITPARC, '                                                                               + #13 +
   '-- FIM QUANTIDADE DE QUITAÇÕES (ANTES DE GERAR PARCELA) -------------------------------------- '     + #13 +


   '-- PARCELAS ---------------------------------------------------------------------------------- '     + #13 +
   '   ( '                                                                                               + #13 +
   '   SELECT '                                                                                          + #13 +
   '      A.IDTIPOCONTREMPTMO, NVL(SUM(CON.HMEVLRPREVISTO), 0) AS PARCELAS, '                            + #13 +
   '      NVL(COUNT(CON.IDCONTRATOEMPTMO),0) AS TOTALPARC '                                              + #13 +
   '   FROM '                                                                                            + #13 +
   '      TIPOCONTREMPTMO A, '                                                                           + #13 +
   '      ( '                                                                                            + #13 +
   //Wylliam Leite da Silva SOL 253185 PPM 771995 - Início
   '      SELECT '                                                                     + #13 +
   //Wylliam Leite da Silva SOL 253185 PPM 771995 - Fim
   '         TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO, '                               + #13 +
   '         TC.IDTIPOCONTREMPTMO, '                                                                     + #13 +

   '         DECODE(ITC.ITCTRATASALDODEV, 1, (HME.HMEVLRPREVISTO * (-1)), 2, HME.HMEVLRPREVISTO, 0) AS HMEVLRPREVISTO ' + #13 +

   '      FROM '                                                                                         + #13 +
   // Pendência 26919 - 14/11/2007
   //'         HISTMOVEMPTMO HME, CONTRATOEMPTMO C, '                                                      + #13 +
   '      CONTRATOEMPTMO C, HISTMOVEMPTMO HME '                                                          + #13 +
   '      left outer join MIGRACONTRATOEP MIG '                                                          + #13 +
   '      on (MIG.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO AND '                                          + #13 +
   '          MIG.DATAMIGRA        = F_MIGRAEP_DATA(HME.IDCONTRATOEMPTMO, HME.HMEDATAPREVISTA)), '       + #13 +
   // Fim Pendência 26919
   '         ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC '                                                    + #13 +
   '      WHERE '                                                                                        + #13 +
   '             HME.HMETIPOMOV         IN (1, 8) '                                                      + #13 +
   '         AND HME.HMEORIGEM          IN (1, 12) '                                                     + #13 +
   '         AND ITC.ITCTRATASALDODEV   <> 0  '                                                          + #13 +
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
   '         AND C.FLGSITUACAO          <> ''C'' '                                                       + #13 +
   '         AND HME.HMEANOCOMPETENCIA  = ' + NumeroIngles(DBspnAno.Value)                               + #13 +
   '         AND HME.HMEMESCOMPETENCIA  = ' + IntToStr(cboMes.ItemIndex + 1)                             + #13 +
   '         AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO IS NULL) ) '                           + #13 +
   '         AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO '                                           + #13 +
   '         AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO '                                         + #13 +
   '         AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO '                                        + #13 +
   '         AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO '                                             + #13 +
   '      ) CON '                                                                                        + #13 +
   '   WHERE '                                                                                           + #13 +
   '      A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO(+) '                                               + #13 +
   '   GROUP BY '                                                                                        + #13 +
   '      A.IDTIPOCONTREMPTMO '                                                                          + #13 +
   '   ) PARCELAS, '                                                                                     + #13 +
   '-- FIM PARCELAS ------------------------------------------------------------------------------ '     + #13 +


   '-- QUANTIDADE DE PARCELAS -------------------------------------------------------------------- '     + #13 +
   '   ( '                                                                                               + #13 +
   '   SELECT '                                                                                          + #13 +
   '      A.IDTIPOCONTREMPTMO, '                                                                         + #13 +
   '      COUNT(C.IDCONTRATOEMPTMO) AS TOTALPARC '                                                       + #13 +
   '   FROM '                                                                                            + #13 +
   // Pendência 26919 - 14/11/2007
   //'      HISTMOVEMPTMO   HME, '                                                                         + #13 +
   //'      CONTRATOEMPTMO  C, '                                                                           + #13 +
   '      CONTRATOEMPTMO C, HISTMOVEMPTMO HME '                                                          + #13 +
   '      left outer join MIGRACONTRATOEP MIG '                                                          + #13 +
   '      on (MIG.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO AND '                                          + #13 +
   '          MIG.DATAMIGRA        = F_MIGRAEP_DATA(HME.IDCONTRATOEMPTMO, HME.HMEDATAPREVISTA)), '       + #13 +
   // Fim Pendência 26919
   '      TIPOCONTREMPTMO A '                                                                            + #13 +
   '   WHERE '                                                                                           + #13 +
   '          C.FLGSITUACAO             <> ''C'' '                                                       + #13 +
   // Pendência 26919 - 14/11/2007
   //'      AND C.IDPATRO                 IN (' + molListaPatro.PegaPatro + ') '                           + #13 +
   //'      AND C.IDPLANOPREV             IN (' + molListaPlano.PegaPlano + ') '                           + #13;
   '         AND NVL(MIG.IDPATROANT, C.IDPATRO) IN (' + molListaPatro.PegaPatro + ') '                   + #13 +
   '         AND NVL(MIG.IDPLANOCONTANT, C.IDPLANOORIGEM) IN (' + molListaPlano.PegaPlano + ') '         + #13;
   // Fim Pendência 26919

   // Tipo de Empréstimo
   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   '      AND A.IDTIPOEMPTMO            = ' + DBcboTipoEmptmo.LookupValue                                + #13;

   // Tipo de Contrato
   if DBcboTipoContr.LookupValue <> '' then sSQL := sSQL +
   '      AND A.IDTIPOCONTREMPTMO       = ' + DBcboTipoContr.LookupValue                              + #13;

   // Contrato
   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '      AND C.IDCONTRATOEMPTMO        = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)            + #13;

   sSQL := sSQL +
   '      AND HME.HMETIPOMOV            IN (1, 8) '                                                      + #13 +
   '      AND HME.HMEORIGEM             IN (1, 12) '                                                     + #13 +
   '      AND HME.HMEPARCELA            > 0 '                                                            + #13 +
   '      AND HME.HMESEQCOBRANCA        = 1 '                                                            + #13 +
   '      AND ( (HME.HMECENTRALIZA      = 1) OR (HME.HMEDESTACADO = 1) ) '                               + #13 +
   '      AND ( (HME.FLGESTORNADO       = 0) OR (HME.FLGESTORNADO IS NULL) ) '                           + #13 +
   '      AND HME.HMEANOCOMPETENCIA     = ' + NumeroIngles(DBspnAno.Value)                               + #13 +
   '      AND HME.HMEMESCOMPETENCIA     = ' + IntToStr(cboMes.ItemIndex + 1)                             + #13 +
   '      AND A.IDTIPOCONTREMPTMO       = C.IDTIPOCONTREMPTMO '                                          + #13 +
   '      AND C.IDCONTRATOEMPTMO        = HME.IDCONTRATOEMPTMO '                                         + #13 +
   '   GROUP BY '                                                                                        + #13 +
   '      A.IDTIPOCONTREMPTMO '                                                                          + #13 +
   '   ) QUANT_PARC, '                                                                                   + #13 +
   '-- FIM QUANTIDADE DE PARCELAS ---------------------------------------------------------------- '     + #13 +


   '-- CONTRATOS ENCERRADOS ---------------------------------------------------------------------- '     + #13 +
   '   ( '                                                                                               + #13 +
   '   SELECT '                                                                                          + #13 +
   '      A.IDTIPOCONTREMPTMO, '                                                                         + #13 +
   '      NVL(SUM(CON.HMEVLRPREVISTO), 0) AS ENCERRADOS, '                                               + #13 +
   '      NVL(COUNT(CON.IDCONTRATOEMPTMO), 0) AS QUANTENCERRA '                                          + #13 +
   '   FROM '                                                                                            + #13 +
   '      TIPOCONTREMPTMO A, '                                                                           + #13 +
   '      ( '                                                                                            + #13 +
   //Wylliam Leite da Silva SOL 253185 PPM 771995 - Início
   '      SELECT '                                                                     + #13 +
   //Wylliam Leite da Silva SOL 253185 PPM 771995 - Fim
   '         TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO, '                               + #13 +
   '         TC.IDTIPOCONTREMPTMO, '                                                                     + #13 +

   '         DECODE(ITC.ITCTRATASALDODEV, 1, (HME.HMEVLRPREVISTO * (-1)), 2, HME.HMEVLRPREVISTO, 0) AS HMEVLRPREVISTO ' + #13 +

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
   '         AND HME.HMETIPOMOV         = 1 '                                                            + #13 +
   '         AND HME.HMEORIGEM          IN (1,12) '                                                      + #13 +
   '         AND ITC.ITCTRATASALDODEV   = 1 '                                                            + #13 +
   '         AND HME.HMESALDODEV        = 0 '                                                            + #13 +
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
   '         AND HME.HMEANOCOMPETENCIA  = ' + NumeroIngles(DBspnAno.Value)                               + #13 +
   '         AND HME.HMEMESCOMPETENCIA  = ' + IntToStr(cboMes.ItemIndex + 1)                             + #13 +
   '         AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO IS NULL) ) '                           + #13 +
   '         AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO '                                           + #13 +
   '         AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO '                                         + #13 +
   '         AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO '                                        + #13 +
   '         AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO '                                             + #13 +
   '      ) CON '                                                                                        + #13 +
   '   WHERE '                                                                                           + #13 +
   '      A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO(+) '                                               + #13 +
   '   GROUP BY '                                                                                        + #13 +
   '      A.IDTIPOCONTREMPTMO '                                                                          + #13 +
   '   ) ENCERRA, '                                                                                      + #13 +

   '-- FIM CONTRATOS ENCERRADOS ------------------------------------------------------------------ '     + #13 +

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
   '         TC.IDTIPOCONTREMPTMO, '                                                                     + #13 +
   '         DECODE(ITC.ITCTRATASALDODEV, 1, (HME.HMEVLRPREVISTO * (-1)), 2, HME.HMEVLRPREVISTO, 0) AS HMEVLRPREVISTO ' + #13 +
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
   '         AND HME.HMETIPOMOV         = 2 '                                                            + #13 +
   '         AND HME.HMEORIGEM          = 2 '                                                            + #13 +
   '         AND ITC.ITCTRATASALDODEV   <> 0  '                                                          + #13 +
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
   '         AND HME.HMEANOCOMPETENCIA  = ' + NumeroIngles(DBspnAno.Value)                               + #13 +
   '         AND HME.HMEMESCOMPETENCIA  = ' + IntToStr(cboMes.ItemIndex + 1)                             + #13 +
   '         AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO IS NULL) ) '                           + #13 +
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

   '-- QUANTIDADE DE AMORTIZAÇÕES ---------------------------------------------------------------- '     + #13 +
   '   ( '                                                                                               + #13 +
   '   SELECT '                                                                                          + #13 +
   '      A.IDTIPOCONTREMPTMO, '                                                                         + #13 +
   '      COUNT(C.IDCONTRATOEMPTMO) AS TOTALAMO '                                                        + #13 +
   '   FROM '                                                                                            + #13 +
   // Pendência 26919 - 14/11/2007
   //'      HISTMOVEMPTMO   HME, '                                                                         + #13 +
   //'      CONTRATOEMPTMO  C, '                                                                           + #13 +
   '      CONTRATOEMPTMO C, HISTMOVEMPTMO HME '                                                          + #13 +
   '      left outer join MIGRACONTRATOEP MIG '                                                          + #13 +
   '      on (MIG.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO AND '                                          + #13 +
   '          MIG.DATAMIGRA        = F_MIGRAEP_DATA(HME.IDCONTRATOEMPTMO, HME.HMEDATAPREVISTA)), '       + #13 +
   // Fim Pendência 26919
   '      TIPOCONTREMPTMO A '                                                                            + #13 +
   '   WHERE '                                                                                           + #13 +
   '          C.FLGSITUACAO             <> ''C'' '                                                       + #13 +
   // Pendência 26919 - 14/11/2007
   //'      AND C.IDPATRO                 IN (' + molListaPatro.PegaPatro + ') '                           + #13 +
   //'      AND C.IDPLANOPREV             IN (' + molListaPlano.PegaPlano + ') '                           + #13;
   '      AND NVL(MIG.IDPATROANT, C.IDPATRO) IN (' + molListaPatro.PegaPatro + ') '                      + #13 +
   '      AND NVL(MIG.IDPLANOCONTANT, C.IDPLANOORIGEM) IN (' + molListaPlano.PegaPlano + ') '            + #13;
   // Fim Pendência 26919

   // Tipo de Empréstimo
   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   '      AND A.IDTIPOEMPTMO            = ' + DBcboTipoEmptmo.LookupValue                                + #13;

   // Tipo de Contrato
   if DBcboTipoContr.LookupValue <> '' then sSQL := sSQL +
   '      AND A.IDTIPOCONTREMPTMO       = ' + DBcboTipoContr.LookupValue                              + #13;

   // Contrato
   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '      AND C.IDCONTRATOEMPTMO        = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)                     + #13;

   sSQL := sSQL +
   '      AND HME.HMETIPOMOV            = 2 '                                                            + #13 +
   '      AND HME.HMEORIGEM             = 2 '                                                            + #13 +
   '      AND HME.HMESEQCOBRANCA        = 1 '                                                            + #13 +
   '      AND ( (HME.HMECENTRALIZA      = 1) OR (HME.HMEDESTACADO = 1) ) '                               + #13 +
   '      AND ( (HME.FLGESTORNADO       = 0) OR (HME.FLGESTORNADO IS NULL) ) '                           + #13 +
   '      AND HME.HMEANOCOMPETENCIA     = ' + NumeroIngles(DBspnAno.Value)                               + #13 +
   '      AND HME.HMEMESCOMPETENCIA     = ' + IntToStr(cboMes.ItemIndex + 1)                             + #13 +
   '      AND A.IDTIPOCONTREMPTMO       = C.IDTIPOCONTREMPTMO '                                          + #13 +
   '      AND C.IDCONTRATOEMPTMO        = HME.IDCONTRATOEMPTMO '                                         + #13 +
   '   GROUP BY '                                                                                        + #13 +
   '      A.IDTIPOCONTREMPTMO '                                                                          + #13 +
   '   ) QUANT_AMORT, '                                                                                  + #13 +
   '-- FIM QUANTIDADE DE AMORTIZAÇÕES ------------------------------------------------------------ '     + #13 +


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
   '         TC.IDTIPOCONTREMPTMO, '                                                                     + #13 +

   '         DECODE(ITC.ITCTRATASALDODEV, 1, (HME.HMEVLRPREVISTO * (-1)), 2, HME.HMEVLRPREVISTO, 0) AS HMEVLRPREVISTO ' + #13 +

   '      FROM '                                                                                         + #13 +
   // Pendência 26919 - 14/11/2007
   //'         HISTMOVEMPTMO HME, CONTRATOEMPTMO C, '                                                      + #13 +
   '        CONTRATOEMPTMO C, HISTMOVEMPTMO HME '                                                        + #13 +
   '        left outer join MIGRACONTRATOEP MIG '                                                        + #13 +
   '        on (MIG.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO AND '                                        + #13 +
   '            MIG.DATAMIGRA        = F_MIGRAEP_DATA(HME.IDCONTRATOEMPTMO, HME.HMEDATAPREVISTA)), '     + #13 +
   // Fim Pendência 26919
   '         ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC '                                                    + #13 +
   '      WHERE '                                                                                        + #13 +
   '             C.FLGSITUACAO          <> ''C'' '                                                       + #13 +
   '         AND HME.HMETIPOMOV         = 3 '                                                            + #13 +
   '         AND HME.HMEORIGEM          <> 8 '                                                           + #13 +
   '         AND ITC.ITCTRATASALDODEV   <> 0 '                                                           + #13 +
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
   '         AND HME.HMEANOCOMPETENCIA  = ' + NumeroIngles(DBspnAno.Value)                               + #13 +
   '         AND HME.HMEMESCOMPETENCIA  = ' + IntToStr(cboMes.ItemIndex + 1)                             + #13 +
   '         AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO IS NULL) ) '                           + #13 +
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


   '-- QUANTIDADE DE QUITAÇÕES ------------------------------------------------------------------- '     + #13 +
   '   ( '                                                                                               + #13 +
   '   SELECT '                                                                                          + #13 +
   '      A.IDTIPOCONTREMPTMO, '                                                                         + #13 +
   '      COUNT(C.IDCONTRATOEMPTMO) AS TOTALQUI '                                                        + #13 +
   '   FROM '                                                                                            + #13 +
   // Pendência 26919 - 14/11/2007
   //'      HISTMOVEMPTMO   HME, '                                                                         + #13 +
   //'      CONTRATOEMPTMO  C, '                                                                           + #13 +
   '        CONTRATOEMPTMO C, HISTMOVEMPTMO HME '                                                        + #13 +
   '        left outer join MIGRACONTRATOEP MIG '                                                        + #13 +
   '        on (MIG.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO AND '                                        + #13 +
   '            MIG.DATAMIGRA        = F_MIGRAEP_DATA(HME.IDCONTRATOEMPTMO, HME.HMEDATAPREVISTA)), '     + #13 +
   // Fim Pendência 26919
   '      ITEMXTIPOCONTR  ITC, '                                                                         + #13 +
   '      TIPOCONTREMPTMO A '                                                                            + #13 +
   '   WHERE '                                                                                           + #13 +
   '          C.FLGSITUACAO             <> ''C'' '                                                       + #13 +
   // Pendência 26919 - 14/11/2007
   //'      AND C.IDPATRO                 IN (' + molListaPatro.PegaPatro + ') '                           + #13 +
   //'      AND C.IDPLANOPREV             IN (' + molListaPlano.PegaPlano + ') '                           + #13;
   '      AND NVL(MIG.IDPATROANT, C.IDPATRO) IN (' + molListaPatro.PegaPatro + ') '                      + #13 +
   '      AND NVL(MIG.IDPLANOCONTANT, C.IDPLANOORIGEM) IN (' + molListaPlano.PegaPlano + ') '            + #13;
   // Fim Pendência 26919

   // Tipo de Empréstimo
   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   '      AND A.IDTIPOEMPTMO            = ' + DBcboTipoEmptmo.LookupValue                                + #13;

   // Tipo de Contrato
   if DBcboTipoContr.LookupValue <> '' then sSQL := sSQL +
   '      AND A.IDTIPOCONTREMPTMO       = ' + DBcboTipoContr.LookupValue                              + #13;

   // Contrato
   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '      AND C.IDCONTRATOEMPTMO        = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)                     + #13;

   sSQL := sSQL +
   '      AND HME.HMETIPOMOV            = 3 '                                                            + #13 +
   '      AND HME.HMEORIGEM             <> 8 '                                                           + #13 +
   '      AND ITC.ITCTRATASALDODEV      = 1 '                                                            + #13 +
   '      AND ( (HME.FLGESTORNADO       = 0) OR (HME.FLGESTORNADO IS NULL) ) '                           + #13 +
   '      AND HME.HMEANOCOMPETENCIA     = ' + NumeroIngles(DBspnAno.Value)                               + #13 +
   '      AND HME.HMEMESCOMPETENCIA     = ' + IntToStr(cboMes.ItemIndex + 1)                             + #13 +
   '      AND A.IDTIPOCONTREMPTMO       = C.IDTIPOCONTREMPTMO '                                          + #13 +
   '      AND C.IDCONTRATOEMPTMO        = HME.IDCONTRATOEMPTMO '                                         + #13 +
   '      AND HME.IDITEMEMPTMO          = ITC.IDITEMEMPTMO '                                             + #13 +
   '      AND C.IDTIPOCONTREMPTMO       = ITC.IDTIPOCONTREMPTMO '                                        + #13 +
   '   GROUP BY '                                                                                        + #13 +
   '      A.IDTIPOCONTREMPTMO '                                                                          + #13 +
   '   ) QUANT_QUIT, '                                                                                   + #13 +
   '-- FIM QUANTIDADE DE QUITAÇÕES --------------------------------------------------------------- '     + #13 +


   '-- QUITAÇÃO POR MORTE ------------------------------------------------------------------------ '     + #13 +
   '   ( '                                                                                               + #13 +
   '   SELECT '                                                                                          + #13 +
   '      A.IDTIPOCONTREMPTMO, NVL(SUM(CON.HMEVLRPREVISTO), 0) AS QUIT_MORT, '                           + #13 +
   '      NVL(COUNT(CON.IDCONTRATOEMPTMO), 0) AS TOTALQUM '                                              + #13 +
   '   FROM '                                                                                            + #13 +
   '      TIPOCONTREMPTMO A, '                                                                           + #13 +
   '      ( '                                                                                            + #13 +
   //Wylliam Leite da Silva SOL 253185 PPM 771995 - Início
   '      SELECT '                                                                     + #13 +
   //Wylliam Leite da Silva SOL 253185 PPM 771995 - Fim
   '         TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO, '                               + #13 +
   '         TC.IDTIPOCONTREMPTMO, '                                                                     + #13 +

   '         DECODE(ITC.ITCTRATASALDODEV, 1, (HME.HMEVLRPREVISTO * (-1)), 2, HME.HMEVLRPREVISTO, 0) AS HMEVLRPREVISTO ' + #13 +

   '      FROM '                                                                                         + #13 +
   // Pendência 26919 - 14/11/2007
   //'         HISTMOVEMPTMO HME, CONTRATOEMPTMO C, '                                                      + #13 +
   '        CONTRATOEMPTMO C, HISTMOVEMPTMO HME '                                                        + #13 +
   '        left outer join MIGRACONTRATOEP MIG '                                                        + #13 +
   '        on (MIG.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO AND '                                        + #13 +
   '            MIG.DATAMIGRA        = F_MIGRAEP_DATA(HME.IDCONTRATOEMPTMO, HME.HMEDATAPREVISTA)), '     + #13 +
   // Fim Pendência 26919
   '         ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC '                                                    + #13 +
   '      WHERE '                                                                                        + #13 +
   '             C.FLGSITUACAO          <> ''C'' '                                                       + #13 +
   '         AND HME.HMETIPOMOV         = 3 '                                                            + #13 +
   '         AND HME.HMEORIGEM          = 8 '                                                            + #13 +
   '         AND ITC.ITCTRATASALDODEV   <> 0  '                                                          + #13 +
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
   '         AND HME.HMEANOCOMPETENCIA  = ' + NumeroIngles(DBspnAno.Value)                               + #13 +
   '         AND HME.HMEMESCOMPETENCIA  = ' + IntToStr(cboMes.ItemIndex + 1)                             + #13 +
   '         AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO IS NULL) ) '                           + #13 +
   '         AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO '                                           + #13 +
   '         AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO '                                         + #13 +
   '         AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO '                                        + #13 +
   '         AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO '                                             + #13 +
   '      ) CON '                                                                                        + #13 +
   '   WHERE '                                                                                           + #13 +
   '      A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO(+) '                                               + #13 +
   '   GROUP BY '                                                                                        + #13 +
   '      A.IDTIPOCONTREMPTMO '                                                                          + #13 +
   '   ) QUITMORT, '                                                                                     + #13 +
   '-- FIM QUITAÇÃO POR MORTE -------------------------------------------------------------------- '     + #13 +


   '-- QUANTIDADE DE QUITAÇÕES POR MORTE --------------------------------------------------------- '     + #13 +
   '   ( '                                                                                               + #13 +
   '   SELECT '                                                                                          + #13 +
   '      A.IDTIPOCONTREMPTMO, '                                                                         + #13 +
   '      COUNT(C.IDCONTRATOEMPTMO) AS TOTALQUM '                                                        + #13 +
   '   FROM '                                                                                            + #13 +
   // Pendência 26919 - 14/11/2007
   //'      HISTMOVEMPTMO   HME, '                                                                         + #13 +
   //'      CONTRATOEMPTMO  C, '                                                                           + #13 +
   '        CONTRATOEMPTMO C, HISTMOVEMPTMO HME '                                                        + #13 +
   '        left outer join MIGRACONTRATOEP MIG '                                                        + #13 +
   '        on (MIG.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO AND '                                        + #13 +
   '            MIG.DATAMIGRA        = F_MIGRAEP_DATA(HME.IDCONTRATOEMPTMO, HME.HMEDATAPREVISTA)), '     + #13 +
   // Fim Pendência 26919
   '      ITEMXTIPOCONTR  ITC, '                                                                         + #13 +
   '      TIPOCONTREMPTMO A '                                                                            + #13 +
   '   WHERE '                                                                                           + #13 +
   '          C.FLGSITUACAO             <> ''C'' '                                                       + #13 +
   // Pendência 26919 - 14/11/2007
   //'      AND C.IDPATRO                 IN (' + molListaPatro.PegaPatro + ') '                           + #13 +
   //'      AND C.IDPLANOPREV             IN (' + molListaPlano.PegaPlano + ') '                           + #13;
   '         AND NVL(MIG.IDPATROANT, C.IDPATRO) IN (' + molListaPatro.PegaPatro + ') '                   + #13 +
   '         AND NVL(MIG.IDPLANOCONTANT, C.IDPLANOORIGEM) IN (' + molListaPlano.PegaPlano + ') '         + #13;
   // Fim Pendência 26919

   // Tipo de Empréstimo
   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   '      AND A.IDTIPOEMPTMO            = ' + DBcboTipoEmptmo.LookupValue                                + #13;

   // Tipo de Contrato
   if DBcboTipoContr.LookupValue <> '' then sSQL := sSQL +
   '      AND A.IDTIPOCONTREMPTMO       = ' + DBcboTipoContr.LookupValue                              + #13;

   // Contrato
   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '      AND C.IDCONTRATOEMPTMO        = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)                     + #13;

   sSQL := sSQL +
   '      AND HME.HMETIPOMOV            = 3 '                                                            + #13 +
   '      AND HME.HMEORIGEM             = 8 '                                                            + #13 +
   '      AND ITC.ITCTRATASALDODEV      = 1 '                                                            + #13 +
   '      AND ( (HME.FLGESTORNADO       = 0) OR (HME.FLGESTORNADO IS NULL) ) '                           + #13 +
   '      AND HME.HMEANOCOMPETENCIA     = ' + NumeroIngles(DBspnAno.Value)                               + #13 +
   '      AND HME.HMEMESCOMPETENCIA     = ' + IntToStr(cboMes.ItemIndex + 1)                             + #13 +
   '      AND A.IDTIPOCONTREMPTMO       = C.IDTIPOCONTREMPTMO '                                          + #13 +
   '      AND C.IDCONTRATOEMPTMO        = HME.IDCONTRATOEMPTMO '                                         + #13 +
   '      AND HME.IDITEMEMPTMO          = ITC.IDITEMEMPTMO '                                             + #13 +
   '      AND C.IDTIPOCONTREMPTMO       = ITC.IDTIPOCONTREMPTMO '                                        + #13 +
   '   GROUP BY '                                                                                        + #13 +
   '      A.IDTIPOCONTREMPTMO '                                                                          + #13 +
   '   ) QUANT_MORT, '                                                                                   + #13 +
   '-- FIM QUANTIDADE DE QUITAÇÕES POR MORTE ----------------------------------------------------- '     + #13 +


   '-- SALDO ATUAL ------------------------------------------------------------------------------- '     + #13 +
   '   ( '                                                                                               + #13 +
   '   SELECT '                                                                                          + #13 +
   '      A.IDTIPOCONTREMPTMO, NVL(SUM(SLD.HMESALDODEV), 0) AS SALDODEV, '                               + #13 +
   '      NVL(COUNT(SLD.IDCONTRATOEMPTMO),0) AS TOTALSLDDEV '                                            + #13 +
   '   FROM '                                                                                            + #13 +
   '      TIPOCONTREMPTMO A, '                                                                           + #13 +
   '      ( '                                                                                            + #13 +
   '      SELECT '                                                                                       + #13 +
   '         TC.IDTIPOCONTREMPTMO, M.IDCONTRATOEMPTMO, '                                                 + #13 +
   '         NVL(SUM(H.HMESALDODEV),0) AS HMESALDODEV '                                                  + #13 +
   '      FROM '                                                                                         + #13 +
   '         TIPOCONTREMPTMO TC, HISTMOVEMPTMO H, CONTRATOEMPTMO C, '                                    + #13 +
   '         ( '                                                                                         + #13 +
   '         SELECT '                                                                                    + #13 +
   '            CON.IDCONTRATOEMPTMO, MAX(IDHISTMOVEMPTMO) AS IDHISTMOVEMPTMO '                          + #13 +
   '         FROM '                                                                                      + #13 +
   // Pendência 26919 - 14/11/2007
   //'            HISTMOVEMPTMO HME, CONTRATOEMPTMO CON, '                                                 + #13 +
   '        CONTRATOEMPTMO CON, HISTMOVEMPTMO HME '                                                      + #13 +
   '        left outer join MIGRACONTRATOEP MIG '                                                        + #13 +
   '        on (MIG.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO AND '                                        + #13 +
   '            MIG.DATAMIGRA        = F_MIGRAEP_DATA(HME.IDCONTRATOEMPTMO, HME.HMEDATAPREVISTA)), '     + #13 +
   // Fim Pendência 26919
   '            ITEMXTIPOCONTR ITC, ITEMEMPTMO ITE, TIPOCONTREMPTMO TCE '                                + #13 +
   '         WHERE '                                                                                     + #13 +
   '                CON.FLGSITUACAO          <> ''C'' '                                                  + #13 +
   '            AND ITC.ITCTRATASALDODEV     <> 0  '                                                     + #13 +
   // Pendência 26919 - 14/11/2007
   //'            AND CON.IDPATRO              IN (' + molListaPatro.PegaPatro + ') '                      + #13 +
   //'            AND CON.IDPLANOPREV          IN (' + molListaPlano.PegaPlano + ') '                      + #13;
   '         AND NVL(MIG.IDPATROANT, CON.IDPATRO) IN (' + molListaPatro.PegaPatro + ') '                 + #13 +
   '         AND NVL(MIG.IDPLANOCONTANT, CON.IDPLANOORIGEM) IN (' + molListaPlano.PegaPlano + ') '       + #13;
   // Fim Pendência 26919

   // Tipo de Empréstimo
   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   '            AND TCE.IDTIPOEMPTMO         = ' + DBcboTipoEmptmo.LookupValue                           + #13;

   // Tipo de Contrato
   if DBcboTipoContr.LookupValue <> '' then sSQL := sSQL +
   '            AND TCE.IDTIPOCONTREMPTMO    = ' + DBcboTipoContr.LookupValue                         + #13;

   // Contrato
   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '            AND CON.IDCONTRATOEMPTMO     = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)                + #13;

   sSQL := sSQL +
   '            AND ( HME.HMEDATAATUALIZA    = '                                                         + #13 +
   '                  ( '                                                                                + #13 +
   '                  SELECT '                                                                           + #13 +
   '                     MAX(H.HMEDATAATUALIZA) '                                                        + #13 +
   '                  FROM '                                                                             + #13 +
   '                     HISTMOVEMPTMO   H, '                                                            + #13 +
   '                     CONTRATOEMPTMO  C, '                                                            + #13 +
   '                     ITEMXTIPOCONTR  IT '                                                            + #13 +
   '                  WHERE '                                                                            + #13 +
   '                         C.IDCONTRATOEMPTMO    = CON.IDCONTRATOEMPTMO '                              + #13 +
   '                     AND H.HMEDATAATUALIZA    <= TO_DATE(' + sDataAtu + ', ''DD/MM/YYYY'') '         + #13 +
   '                     AND IT.ITCTRATASALDODEV  <> 0 '                                                 + #13 +
   '                     AND HME.HMEANOCOMPETENCIA = ' + NumeroIngles(DBspnAno.Value)                    + #13 +
   '                     AND HME.HMEMESCOMPETENCIA = ' + IntToStr(cboMes.ItemIndex + 1)                  + #13 +
   '                     AND ( H.FLGESTORNADO      = 0 OR H.FLGESTORNADO IS NULL ) '                     + #13 +
   '                     AND H.IDCONTRATOEMPTMO    = C.IDCONTRATOEMPTMO '                                + #13 +
   '                     AND C.IDTIPOCONTREMPTMO   = IT.IDTIPOCONTREMPTMO '                              + #13 +
   '                     AND H.IDITEMEMPTMO        = IT.IDITEMEMPTMO '                                   + #13 +
   '                  ) '                                                                                + #13 +
   '                ) '                                                                                  + #13 +
   '            AND ( (HME.FLGESTORNADO      = 0) OR (HME.FLGESTORNADO IS NULL) ) '                      + #13 +
   '            AND HME.HMEANOCOMPETENCIA    = ' + NumeroIngles(DBspnAno.Value)                          + #13 +
   '            AND HME.HMEMESCOMPETENCIA    = ' + IntToStr(cboMes.ItemIndex + 1)                        + #13 +
   '            AND ( HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO ) '                                  + #13 +
   '            AND ( CON.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPTMO ) '                                 + #13 +
   '            AND ( CON.IDTIPOCONTREMPTMO  = TCE.IDTIPOCONTREMPTMO ) '                                 + #13 +
   '            AND ( TCE.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPTMO ) '                                 + #13 +
   '            AND ( HME.IDITEMEMPTMO       = ITE.IDITEMEMPTMO ) '                                      + #13 +
   '            AND ( ITE.IDITEMEMPTMO       = ITC.IDITEMEMPTMO ) '                                      + #13 +
   '            AND ( HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO ) '                                      + #13 +
   '         GROUP BY '                                                                                  + #13 +
   '            CON.IDCONTRATOEMPTMO '                                                                   + #13 +
   '         ) M '                                                                                       + #13 +
   '      WHERE '                                                                                        + #13 +
   '             M.IDHISTMOVEMPTMO = H.IDHISTMOVEMPTMO '                                                 + #13 +
   '         AND M.IDCONTRATOEMPTMO = H.IDCONTRATOEMPTMO '                                               + #13 +
   '         AND H.IDCONTRATOEMPTMO = C.IDCONTRATOEMPTMO '                                               + #13 +
   '         AND C.IDTIPOCONTREMPTMO = TC.IDTIPOCONTREMPTMO '                                            + #13 +
   '      GROUP BY '                                                                                     + #13 +
   '            TC.IDTIPOCONTREMPTMO, M.IDCONTRATOEMPTMO '                                               + #13 +
   '      ) SLD '                                                                                        + #13 +
   '   WHERE '                                                                                           + #13 +
   '      A.IDTIPOCONTREMPTMO = SLD.IDTIPOCONTREMPTMO(+) '                                               + #13 +
   '   GROUP BY '                                                                                        + #13 +
   '      A.IDTIPOCONTREMPTMO '                                                                          + #13 +
   '   ) SALDOATU, '                                                                                     + #13 +
   '-- FIM SALDO ATUAL --------------------------------------------------------------------------- '     + #13 +


   '-- QUANT CONTRATOS NA COLUNA SALDO ATUAL ----------------------------------------------------- '     + #13 +
   '   ( '                                                                                               + #13 +
   '   SELECT '                                                                                          + #13 +
   '      CON.IDTIPOCONTREMPTMO, COUNT(CON.IDCONTRATOEMPTMO) AS TOTALSLDDEV '                            + #13 +
   '   FROM '                                                                                            + #13 +
   '      HISTMOVEMPTMO HME, CONTRATOEMPTMO CON, '                                                       + #13 +
   '      ( '                                                                                            + #13 +
   '      SELECT '                                                                                       + #13 +
   '         CON.IDCONTRATOEMPTMO, MAX(IDHISTMOVEMPTMO) AS IDHISTMOVEMPTMO '                             + #13 +
   '      FROM '                                                                                         + #13 +
   // Pendência 26919 - 14/11/2007
   //'         HISTMOVEMPTMO HME, CONTRATOEMPTMO CON, '                                                    + #13 +
   '        CONTRATOEMPTMO CON, HISTMOVEMPTMO HME '                                                      + #13 +
   '        left outer join MIGRACONTRATOEP MIG '                                                        + #13 +
   '        on (MIG.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO AND '                                        + #13 +
   '            MIG.DATAMIGRA        = F_MIGRAEP_DATA(HME.IDCONTRATOEMPTMO, HME.HMEDATAPREVISTA)), '     + #13 +
   // Fim Pendência 26919
   '         ITEMXTIPOCONTR ITC, ITEMEMPTMO ITE, TIPOCONTREMPTMO TCE '                                   + #13 +
   '      WHERE '                                                                                        + #13 +
   '             CON.FLGSITUACAO          <> ''C'' '                                                     + #13 +
   '         AND ITC.ITCTRATASALDODEV     <> 0 '                                                         + #13 +
   // Pendência 26919 - 14/11/2007
   //'         AND CON.IDPATRO              IN (' + molListaPatro.PegaPatro + ') '                         + #13 +
   //'         AND CON.IDPLANOPREV          IN (' + molListaPlano.PegaPlano + ') '                         + #13;
   '         AND NVL(MIG.IDPATROANT, CON.IDPATRO) IN (' + molListaPatro.PegaPatro + ') '                 + #13 +
   '         AND NVL(MIG.IDPLANOCONTANT, CON.IDPLANOORIGEM) IN (' + molListaPlano.PegaPlano + ') '       + #13;
   // Fim Pendência 26919

   // Tipo de Empréstimo
   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   '         AND TCE.IDTIPOEMPTMO         = ' + DBcboTipoEmptmo.LookupValue                              + #13;

   // Tipo de Contrato
   if DBcboTipoContr.LookupValue <> '' then sSQL := sSQL +
   '         AND TCE.IDTIPOCONTREMPTMO    = ' + DBcboTipoContr.LookupValue                            + #13;

   // Contrato
   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '         AND CON.IDCONTRATOEMPTMO     = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)                   + #13;

   sSQL := sSQL +
   '         AND ( HME.HMEDATAATUALIZA    = '                                                            + #13 +
   '               ( '                                                                                   + #13 +
   '               SELECT '                                                                              + #13 +
   '                  MAX(H.HMEDATAATUALIZA) '                                                           + #13 +
   '               FROM '                                                                                + #13 +
   '                  HISTMOVEMPTMO   H, '                                                               + #13 +
   '                  CONTRATOEMPTMO  C, '                                                               + #13 +
   '                  ITEMXTIPOCONTR  IT '                                                               + #13 +
   '               WHERE '                                                                               + #13 +
   '                      C.IDCONTRATOEMPTMO    = CON.IDCONTRATOEMPTMO '                                 + #13 +
   '                  AND H.HMEDATAATUALIZA    <= TO_DATE(' + sDataAtu + ', ''DD/MM/YYYY'') '            + #13 +
   '                  AND IT.ITCTRATASALDODEV  <> 0 '                                                    + #13 +
   '                  AND HME.HMEANOCOMPETENCIA = ' + NumeroIngles(DBspnAno.Value)                       + #13 +
   '                  AND HME.HMEMESCOMPETENCIA = ' + IntToStr(cboMes.ItemIndex + 1)                     + #13 +
   '                  AND ( H.FLGESTORNADO      = 0 OR H.FLGESTORNADO IS NULL ) '                        + #13 +
   '                  AND H.IDCONTRATOEMPTMO    = C.IDCONTRATOEMPTMO '                                   + #13 +
   '                  AND C.IDTIPOCONTREMPTMO   = IT.IDTIPOCONTREMPTMO '                                 + #13 +
   '                  AND H.IDITEMEMPTMO        = IT.IDITEMEMPTMO '                                      + #13 +
   '               ) '                                                                                   + #13 +
   '             ) '                                                                                     + #13 +
   '         AND ( HME.HMEANOCOMPETENCIA  = ' + NumeroIngles(DBspnAno.Value) + ' ) '                     + #13 +
   '         AND ( HME.HMEMESCOMPETENCIA  = ' + IntToStr(cboMes.ItemIndex + 1) + ' ) '                   + #13 +
   '         AND ( (HME.FLGESTORNADO      = 0) OR (HME.FLGESTORNADO IS NULL) ) '                         + #13 +
   '         AND ( HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO ) '                                     + #13 +
   '         AND ( CON.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPTMO ) '                                    + #13 +
   '         AND ( CON.IDTIPOCONTREMPTMO  = TCE.IDTIPOCONTREMPTMO ) '                                    + #13 +
   '         AND ( TCE.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPTMO ) '                                    + #13 +
   '         AND ( HME.IDITEMEMPTMO       = ITE.IDITEMEMPTMO ) '                                         + #13 +
   '         AND ( ITE.IDITEMEMPTMO       = ITC.IDITEMEMPTMO ) '                                         + #13 +
   '         AND ( HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO ) '                                         + #13 +
   '      GROUP BY '                                                                                     + #13 +
   '         CON.IDCONTRATOEMPTMO '                                                                      + #13 +
   '      ) MAX '                                                                                        + #13 +
   '   WHERE '                                                                                           + #13 +
   '          ( CON.FLGSITUACAO        <> ''C'' ) '                                                      + #13 +
   // Pendência 26919 - 14/11/2007
   //'      AND CON.IDPATRO              IN (' + molListaPatro.PegaPatro + ') '                            + #13 +
   //'      AND CON.IDPLANOPREV          IN (' + molListaPlano.PegaPlano + ') '                            + #13 +
   // Fim Pendência 26919
   '      AND ( HME.HMESALDODEV        > 0 ) '                                                           + #13 +
   '      AND ( CON.IDCONTRATOEMPTMO   = HME.IDCONTRATOEMPTMO ) '                                        + #13 +
   '      AND ( CON.IDCONTRATOEMPTMO   = MAX.IDCONTRATOEMPTMO ) '                                        + #13 +
   '      AND ( HME.IDHISTMOVEMPTMO    = MAX.IDHISTMOVEMPTMO ) '                                         + #13 +
   '   GROUP BY '                                                                                        + #13 +
   '      CON.IDTIPOCONTREMPTMO '                                                                        + #13 +
   '   ) QUANT_ATU '                                                                                     + #13 +
   '-- FIM QUANT CONTRATOS NA COLUNA SALDO ATUAL ------------------------------------------------- '     + #13 +


   'WHERE '                                                                                              + #13 +
   '       TEP.IDEMPRESAPROP      = ' + IntToStr(Sistema.idEmpresa)                                      + #13;

   // Tipo de Empréstimo
   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   '   AND TEP.IDTIPOEMPTMO       = ' + DBcboTipoEmptmo.LookupValue                                      + #13;

   // Tipo de Contrato
   if DBcboTipoContr.LookupValue <> '' then sSQL := sSQL +
   '   AND TCE.IDTIPOCONTREMPTMO  = ' + DBcboTipoContr.LookupValue                                    + #13;

   // Pendencia 23228
//   if molContratoEmptmo.IDContrato > 0 then
//   begin
//      sSQL := sSQL +
//      '   AND TCE.IDTIPOCONTREMPTMO  = SALDOANT.IDTIPOCONTREMPTMO(+) '                                      + #13 +
//      '   AND TCE.IDTIPOCONTREMPTMO  = QUANT_ANT.IDTIPOCONTREMPTMO(+) '                                     + #13;
//   end
//   else
//   begin
//      sSQL := sSQL +
//   '   AND TCE.IDTIPOCONTREMPTMO  = SALDOANT.IDTIPOCONTREMPTMO '                                         + #13 +
//   '   AND TCE.IDTIPOCONTREMPTMO  = QUANT_ANT.IDTIPOCONTREMPTMO '                                        + #13;
//   end;
   // Fim - Pendencia 23228

   sSQL := sSQL +

   // Pendencia 23228
   '   AND TCE.IDTIPOCONTREMPTMO  = SALDOANT.IDTIPOCONTREMPTMO(+) '                                      + #13 +
   '   AND TCE.IDTIPOCONTREMPTMO  = QUANT_ANT.IDTIPOCONTREMPTMO(+) '                                     + #13 +
   // Fim - Pendencia 23228

   '   AND TCE.IDTIPOCONTREMPTMO  = CONCESSOES.IDTIPOCONTREMPTMO(+) '                                    + #13 +
   '   AND TCE.IDTIPOCONTREMPTMO  = QUANT_CONC.IDTIPOCONTREMPTMO(+) '                                    + #13 +

//   '   AND TCE.IDTIPOCONTREMPTMO  = QUITAPARC.IDTIPOCONTREMPTMO(+) '                                   + #13 +
   '   AND TCE.IDTIPOCONTREMPTMO  = QUANT_QUITPARC.IDTIPOCONTREMPTMO(+) '                                + #13 +

   '   AND TCE.IDTIPOCONTREMPTMO  = PARCELAS.IDTIPOCONTREMPTMO(+) '                                      + #13 +
   '   AND TCE.IDTIPOCONTREMPTMO  = QUANT_PARC.IDTIPOCONTREMPTMO(+) '                                    + #13 +

   '   AND TCE.IDTIPOCONTREMPTMO  = ENCERRA.IDTIPOCONTREMPTMO(+) '                                       + #13 +

   '   AND TCE.IDTIPOCONTREMPTMO  = AMORT.IDTIPOCONTREMPTMO(+) '                                         + #13 +
   '   AND TCE.IDTIPOCONTREMPTMO  = QUANT_AMORT.IDTIPOCONTREMPTMO(+) '                                   + #13 +

   '   AND TCE.IDTIPOCONTREMPTMO  = QUITACAO.IDTIPOCONTREMPTMO(+) '                                      + #13 +
   '   AND TCE.IDTIPOCONTREMPTMO  = QUANT_QUIT.IDTIPOCONTREMPTMO(+) '                                    + #13 +

   '   AND TCE.IDTIPOCONTREMPTMO  = QUITMORT.IDTIPOCONTREMPTMO(+) '                                      + #13 +
   '   AND TCE.IDTIPOCONTREMPTMO  = QUANT_MORT.IDTIPOCONTREMPTMO(+) '                                    + #13 +

   '   AND TCE.IDTIPOCONTREMPTMO  = SALDOATU.IDTIPOCONTREMPTMO(+) '                                      + #13 +
   '   AND TCE.IDTIPOCONTREMPTMO  = QUANT_ATU.IDTIPOCONTREMPTMO(+) '                                     + #13 +

   '   AND TCE.IDTIPOEMPTMO       = TEP.IDTIPOEMPTMO '                                                   + #13 +

   'ORDER BY '                                                                                           + #13 +
   '   TEP.DESCTIPOEMPTMO, TCE.TCEDESCRICAO ';


   with dtmRelFechamentoCarteira.qryFechamentoCarteira do
   begin
      Close;
      SQL.Clear;
      SQL.Text := sSQL;
    //Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
    //Sql.SavetoFile(Sistema.TempDir + 'EP-RelFechamentoCarteiraSaldo.txt');
      Sql.SavetoFile(ftempregra + '\' + 'EP-RelFechamentoCarteiraSaldo.txt');
      Open;
   end;
end;



procedure TcfgRelFechamentoCarteira.FormShow(Sender: TObject);
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



procedure TcfgRelFechamentoCarteira.DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
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



procedure TcfgRelFechamentoCarteira.DBcboTipoEmptmoExit(Sender: TObject);
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



procedure TcfgRelFechamentoCarteira.molContratoEmptmobtnBuscaContratoClick(Sender: TObject);
begin
   inherited;
   molContratoEmptmo.btnBuscaContratoClick(Sender);
end;



procedure TcfgRelFechamentoCarteira.molContratoEmptmobtnLimpaContratoClick(Sender: TObject);
begin
   inherited;
   molContratoEmptmo.btnLimpaContratoClick(Sender);
end;



procedure TcfgRelFechamentoCarteira.molListaPatrobtnInvertePatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnInvertePatroClick(Sender);
end;



procedure TcfgRelFechamentoCarteira.molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnMarcaTodosPatroClick(Sender);
end;



procedure TcfgRelFechamentoCarteira.molListaPlanobtnInvertePlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnInvertePlanoClick(Sender);
end;



procedure TcfgRelFechamentoCarteira.molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnMarcaTodosPlanoClick(Sender);
end;



procedure TcfgRelFechamentoCarteira.FiltraRelatorioAtuDia;
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

   dtmRelFechamentoCarteira.qryFechamentoCarteira.Close;
   dtmRelFechamentoCarteira.qryFechamentoCarteira.Open;

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
                           ParamByName('PANO').AsInteger             := Trunc(DBspnAno.Value);
                           ParamByName('PMES').AsInteger             := cboMes.ItemIndex + 1;

                           Open;

                        end;

                        with qryQuant_Ant do
                        begin
                           LimpaParametros(qryQuant_Ant);
                           ParamByName('PIDCONTRATOEMPTMO').AsFloat  := qryContratoIDCONTRATOEMPTMO.AsFloat;
                           ParamByName('PHMEDATAINI').AsDateTime     := dDataAnt;
                           ParamByName('PANO').AsInteger             := Trunc(DBspnAno.Value);
                           ParamByName('PMES').AsInteger             := cboMes.ItemIndex + 1;

                           Open;

                        end;


                        with qrySaldoAtu do
                        begin
                           LimpaParametros(qrySaldoAtu);
                           ParamByName('PIDCONTRATOEMPTMO').AsFloat  := qryContratoIDCONTRATOEMPTMO.AsFloat;
                           ParamByName('PHMEDATAFIM').AsDateTime     := dDataAtu;
                           ParamByName('PANO').AsInteger             := Trunc(DBspnAno.Value);
                           ParamByName('PMES').AsInteger             := cboMes.ItemIndex + 1;

                           Open;
                        end;

                        with qryQuant_Atu do
                        begin
                           LimpaParametros(qryQuant_Atu);
                           ParamByName('PIDCONTRATOEMPTMO').AsFloat  := qryContratoIDCONTRATOEMPTMO.AsFloat;
                           ParamByName('PHMEDATAFIM').AsDateTime     := dDataAtu;
                           ParamByName('PANO').AsInteger             := Trunc(DBspnAno.Value);
                           ParamByName('PMES').AsInteger             := cboMes.ItemIndex + 1;

                           Open;
                        end;

                        with qryConcessoes do
                        begin
                           LimpaParametros(qryConcessoes);
                           ParamByName('PANO').AsInteger             := Trunc(DBspnAno.Value);
                           ParamByName('PMES').AsInteger             := cboMes.ItemIndex + 1;

                           Open;
                        end;

                        with qryQuant_Conc do
                        begin
                           LimpaParametros(qryQuant_Conc);
                           ParamByName('PANO').AsInteger             := Trunc(DBspnAno.Value);
                           ParamByName('PMES').AsInteger             := cboMes.ItemIndex + 1;

                           Open;
                        end;

                        with qryQuant_QuitParc do
                        begin
                           LimpaParametros(qryQuant_QuitParc);
                           ParamByName('PANO').AsInteger             := Trunc(DBspnAno.Value);
                           ParamByName('PMES').AsInteger             := cboMes.ItemIndex + 1;

                           Open;
                        end;

                        with qryParcelas do
                        begin
                           LimpaParametros(qryParcelas);
                           ParamByName('PANO').AsInteger             := Trunc(DBspnAno.Value);
                           ParamByName('PMES').AsInteger             := cboMes.ItemIndex + 1;

                           Open;
                        end;

                        with qryQuant_Parc do
                        begin
                           LimpaParametros(qryQuant_Parc);
                           ParamByName('PANO').AsInteger             := Trunc(DBspnAno.Value);
                           ParamByName('PMES').AsInteger             := cboMes.ItemIndex + 1;

                           Open;
                        end;

                        with qryEncerra do
                        begin
                           LimpaParametros(qryEncerra);
                           ParamByName('PANO').AsInteger             := Trunc(DBspnAno.Value);
                           ParamByName('PMES').AsInteger             := cboMes.ItemIndex + 1;

                           Open;
                        end;

                        with qryAmort do
                        begin
                           LimpaParametros(qryAmort);
                           ParamByName('PANO').AsInteger             := Trunc(DBspnAno.Value);
                           ParamByName('PMES').AsInteger             := cboMes.ItemIndex + 1;

                           Open;
                        end;

                        with qryQuant_Amort do
                        begin
                           LimpaParametros(qryQuant_Amort);
                           ParamByName('PANO').AsInteger             := Trunc(DBspnAno.Value);
                           ParamByName('PMES').AsInteger             := cboMes.ItemIndex + 1;

                           Open;
                        end;

                        with qryQuitacao do
                        begin
                           LimpaParametros(qryQuitacao);
                           ParamByName('PANO').AsInteger             := Trunc(DBspnAno.Value);
                           ParamByName('PMES').AsInteger             := cboMes.ItemIndex + 1;

                           Open;
                        end;

                        with qryQuant_Quit do
                        begin
                           LimpaParametros(qryQuant_Quit);
                           ParamByName('PANO').AsInteger             := Trunc(DBspnAno.Value);
                           ParamByName('PMES').AsInteger             := cboMes.ItemIndex + 1;

                           Open;
                        end;

                        with qryQuitMort do
                        begin
                           LimpaParametros(qryQuitMort);
                           ParamByName('PANO').AsInteger             := Trunc(DBspnAno.Value);
                           ParamByName('PMES').AsInteger             := cboMes.ItemIndex + 1;

                           Open;
                        end;

                        with qryQuant_Mort do
                        begin
                           LimpaParametros(qryQuant_Mort);
                           ParamByName('PANO').AsInteger             := Trunc(DBspnAno.Value);
                           ParamByName('PMES').AsInteger             := cboMes.ItemIndex + 1;

                           Open;
                        end;

                        bGrava      := ( qrySaldoAntSALDODEV.AsCurrency <> 0 )      or
                                       ( qrySaldoAtuSALDODEV.AsCurrency <> 0 )      or
                                       ( qryConcessoesCONCESSOES.AsCurrency <> 0 )  or
                                       ( qryParcelasPARCELAS.AsCurrency <> 0 )      or
                                       ( qryEncerraENCERRADOS.AsCurrency <> 0 )     or
                                       ( qryAmortAMORTIZACAO.AsCurrency <> 0 )      or
                                       ( qryQuitacaoQUITACAO.AsCurrency <> 0 )      or
                                       ( qryQuitMortQUIT_MORT.AsCurrency <> 0 );

                        // -------------------------------------------------------------------------

                        if bGrava then
                        begin
                           // ----------------------------------------------------------------------
                           with dtmRelFechamentoCarteira do
                           begin

                              if not qryFechamentoCarteira.Locate('DESCTIPOEMPTMO;TCEDESCRICAO',
                                                                  VarArrayOf([qryContratoDESCTIPOEMPTMO.AsString,qryContratoTCEDESCRICAO.AsString]),[]) then
                              begin
                                 qryFechamentoCarteira.Append;
                                 qryFechamentoCarteiraDESCTIPOEMPTMO.AsString      := qryContratoDESCTIPOEMPTMO.AsString;
                                 qryFechamentoCarteiraTCEDESCRICAO.AsString        := qryContratoTCEDESCRICAO.AsString;
                              end
                              else
                                 qryFechamentoCarteira.Edit;

                              qryFechamentoCarteiraSALDODEV.AsCurrency        := qryFechamentoCarteiraSALDODEV.AsCurrency        + qrySaldoAntSALDODEV.AsCurrency;
                              qryFechamentoCarteiraTOTALSLDDEV.AsInteger      := qryFechamentoCarteiraTOTALSLDDEV.AsInteger      + qryQuant_AntTOTALSLDDEV.AsInteger;
                              qryFechamentoCarteiraCONCESSOES.AsCurrency      := qryFechamentoCarteiraCONCESSOES.AsCurrency      + qryConcessoesCONCESSOES.AsCurrency;
                              qryFechamentoCarteiraTOTALCONCESSOES.AsInteger  := qryFechamentoCarteiraTOTALCONCESSOES.AsInteger  + qryQuant_ConcTOTALCONCESSOES.AsInteger;
                              qryFechamentoCarteiraPARCELAS.AsCurrency        := qryFechamentoCarteiraPARCELAS.AsCurrency        + qryParcelasPARCELAS.AsCurrency;
                              qryFechamentoCarteiraTOTALPARC.AsInteger        := qryFechamentoCarteiraTOTALPARC.AsInteger        + qryQuant_ParcTOTALPARC.AsInteger;
                              qryFechamentoCarteiraENCERRADOS.AsCurrency      := qryFechamentoCarteiraENCERRADOS.AsCurrency      + qryEncerraENCERRADOS.AsCurrency;
                              qryFechamentoCarteiraTOTAL_ENCERRA.AsInteger    := qryFechamentoCarteiraTOTAL_ENCERRA.AsInteger    + qryEncerraQUANTENCERRA.AsInteger;
                              qryFechamentoCarteiraAMORTIZACAO.AsCurrency     := qryFechamentoCarteiraAMORTIZACAO.AsCurrency     + qryAmortAMORTIZACAO.AsCurrency;
                              qryFechamentoCarteiraTOTALAMO.AsInteger         := qryFechamentoCarteiraTOTALAMO.AsInteger         + qryQuant_AmortTOTALAMO.AsInteger;
                              qryFechamentoCarteiraQUITACAO.AsCurrency        := qryFechamentoCarteiraQUITACAO.AsCurrency        + qryQuitacaoQUITACAO.AsCurrency;
                              qryFechamentoCarteiraTOTALQUI.AsInteger         := qryFechamentoCarteiraTOTALQUI.AsInteger         + qryQuant_QuitTOTALQUI.AsInteger;
                              qryFechamentoCarteiraQUIT_MORT.AsCurrency       := qryFechamentoCarteiraQUIT_MORT.AsCurrency       + qryQuitMortQUIT_MORT.AsCurrency;
                              qryFechamentoCarteiraTOTALQUM.AsInteger         := qryFechamentoCarteiraTOTALQUM.AsInteger         + qryQuant_MortTOTALQUM.AsInteger;
                              qryFechamentoCarteiraSALDOATU.AsCurrency        := qryFechamentoCarteiraSALDOATU.AsCurrency        + qrySaldoAtuSALDODEV.AsCurrency;
                              qryFechamentoCarteiraTOTALSLA.AsInteger         := qryFechamentoCarteiraTOTALSLA.AsInteger         + qryQuant_AtuTOTALSLDDEV.AsInteger;
                              qryFechamentoCarteiraTOTALQUIPARC.AsInteger     := qryFechamentoCarteiraTOTALQUIPARC.AsInteger     + qryQuant_QuitParcTOTQUITPARC.AsInteger;

                              qryFechamentoCarteira.Post;
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
