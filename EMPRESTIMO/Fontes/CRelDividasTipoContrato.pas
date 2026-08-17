unit CRelDividasTipoContrato;

// Alterações:
{--------------------------------------------------------------------------------------------------
Pendência   : SOL 253185  PPM 771995
Responsável : Wylliam Leite da Silva
Data        : 13/05/2015
Descrição   : Ajustar queries para adequação a segregação da HISTMOVEMPTMO
--------------------------------------------------------------------------------------------------
Pendência   : SOL 114575 Kintana 535771
Responsável : Jéssica Lana
Data        : 24/04/2009
Descrição   : Gravar arquivos com a query de entrada na pasta C:\PLANUS\TEMP.
----------------------------------------------------------------------------------------------------
Rotina    : MontaQuery
Data      : 16/06/2005
Autor     : André Pontes
Pendencia : 19175
Descrição : Exibição no relatório de label indicando se o filtro de itens de quitação foi utilizado
----------------------------------------------------------------------------------------------------
Rotina    : FiltraRelatorio
Data      : 13/06/2005
Autor     : André Pontes
Pendencia : 19175
Descrição : Filtro do relatório considerando, não considerando e considerando apenas itens de quitação
---------------------------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CRel, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr,
  TB97, ExtCtrls, mContratoEmptmo, Mask, wwdbedit, Wwdbspin, CheckLst,
  wwdblook, db, fcCombo, fcColorCombo, mInscricaoEmptmo, wwdbdatetimepicker,
  mListaPlano, mListaPatro, mListaPlanoContab, DBTables, Wwquery, fProgresso;

type
   TcfgRelDividasTipoContrato = class(TcfgRel)
      Label1: TLabel;
      Label2: TLabel;
      DBcboTipoEmptmo: TwwDBLookupCombo;
      DBcboTipoContrato: TwwDBLookupCombo;
      Panel1: TPanel;
      edtDataRef: TwwDBDateTimePicker;
      Label3: TLabel;
      chkParcelasAberto: TCheckBox;
      rdgOrdenar: TRadioGroup;
      GroupBox1: TGroupBox;
      chkCorLinha: TCheckBox;
      cboCorLinha: TfcColorCombo;
      chkLinhas: TCheckBox;
      chkSaldoZERO: TCheckBox;
      DBcboSitPart: TwwDBLookupCombo;
      Label4: TLabel;
      molListaPatro: TmolListaPatro;
      rdgQuitacao: TRadioGroup;
      qryContrato: TwwQuery;
      molListaPlano: TmolListaPlanoContab;
      qryContratoIDCONTRATOEMPTMO: TFloatField;
      qryContratoIDTIPOCONTREMPTMO: TFloatField;
      qryContratoNOME_BENEF: TStringField;
      qryContratoNOME_TITULAR: TStringField;
      qryContratoMATRICULA: TStringField;
      qryContratoTCEDESCRICAO: TStringField;
      qryContratoSIT_PART: TStringField;
      qryContratoVLRCONTRATO: TFloatField;
      qrySaldoDev: TwwQuery;
      qrySaldoDevIDCONTRATOEMPTMO: TFloatField;
      qrySaldoDevHMEDATAATUALIZA: TDateTimeField;
      qrySaldoDevHMESALDODEV: TFloatField;
      qrySaldoDevHMEPARCELA: TFloatField;
      qrySaldoDevHMENUMPARCELAS: TFloatField;
      qryParcDev: TwwQuery;
      qryParcPag: TwwQuery;
      qryParcela: TwwQuery;
      qryParcDevVLR_DEV: TFloatField;
      qryParcPagVLR_PAG: TFloatField;
      qryParcelaVALOR_DEVIDO: TFloatField;

      procedure FormShow(Sender: TObject);
      procedure DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure DBcboTipoEmptmoExit(Sender: TObject);
      procedure molListaPatrobtnInvertePatroClick(Sender: TObject);
      procedure molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
      procedure molListaPlanobtnInvertePlanoClick(Sender: TObject);
      procedure molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);


   private  // Private declarations

      procedure AbreQueries;

      procedure MontaQuery; override;
      procedure FiltraRelatorio;
      procedure FiltraRelatorioAtuDia;
      procedure MontaQueryParcela(sData : String);
      procedure MontaQueryParcDeve(sData : String);
      procedure MontaQueryParcPag(sData : String);


   public   // Public declarations

   end;



var
  cfgRelDividasTipoContrato: TcfgRelDividasTipoContrato;



implementation
{$R *.DFM}
uses
   DLookEmptmo,
   UDiasUteis,
   USistema,
   UfuncoesEmptmo,
   dEmptmo,
   dRelDividasTipoContrato,
   uMensErro;




procedure TcfgRelDividasTipoContrato.AbreQueries;
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




procedure TcfgRelDividasTipoContrato.FormShow(Sender: TObject);
begin
   inherited;

   // preenche a data de referência
   edtDataRef.Date := DiasUteis.UltDiaMes(DiasUteis.ExtraiAno(Sysdate), DiasUteis.ExtraiMes(Sysdate));

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



procedure TcfgRelDividasTipoContrato.DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
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

      DBcboTipoContrato.Enabled := True;
   end;
end;



procedure TcfgRelDividasTipoContrato.DBcboTipoEmptmoExit(Sender: TObject);
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

      DBcboTipoContrato.Enabled := True;
   end;
end;



procedure TcfgRelDividasTipoContrato.MontaQuery;
begin
   inherited;

   with dtmRelDividasTipoContrato do
   begin
      // preenche a label de data de referência
      if length(trim(edtDataRef.Text)) > 0 then sDataRef := FormatDateTime('DD/MM/YYYY', edtDataRef.Date);

      // ----------------------------------------------------------------------------------------------
      // André Pontes - 16/06/2005 - pendência 19175
      // Quitação
      case rdgQuitacao.ItemIndex of
         0: lblQuitacao.Caption := 'Considera Quitações';
         1: lblQuitacao.Caption := 'NÃO Considera Quitações';
         2: lblQuitacao.Caption := 'Considera APENAS Quitações';
      end;
      // FIM André Pontes - 16/06/2005 - pendência 19175
      // ----------------------------------------------------------------------------------------------

      // -------------------------------------------------------------------------------------------

      lblTipoEmptmo.Caption := ' < todos > ';
      if DBcboTipoEmptmo.LookupValue <> ''   then lblTipoEmptmo.Caption := DBcboTipoEmptmo.Text;

      lblTipoContr.Caption  := ' < todos > ';
      if DBcboTipoContrato.LookupValue <> ''    then lblTipoContr.Caption  := DBcboTipoContrato.Text;

      memPatro.RichText := molListaPatro.ListaPatro;
      memPlano.RichText := molListaPlano.ListaPlano;

      // -------------------------------------------------------------------------------------------






      bSeparador  := chkLinhas.Checked;

      // determina se as linhas do relatório serão impressas em cores alternadas, e qual cor usar
      bCorlinha   := chkCorLinha.Checked;
      CorLinha    := cboCorLinha.SelectedColor;

   end;

   ParametrosSistema;

   case dtmEmptmo.qryParamEmptmoFLGCALCDIA.AsInteger of
      0: FiltraRelatorio;
      1: FiltraRelatorioAtuDia;
   end;
end;



procedure TcfgRelDividasTipoContrato.FiltraRelatorio;
var
   sSQL  : string;
   sData : string;
begin
   sData := FormatDateTime('DD/MM/YYYY', edtDataRef.Date);

   sSQL :=
   //Wylliam Leite da Silva SOL 253185 PPM 771995 - Início
   'SELECT '                                                               + #13 +
   //Wylliam Leite da Silva SOL 253185 PPM 771995 - Fim
   '   CON.IDTIPOCONTREMPTMO, '                                                              + #13 +
   '   CON.IDCONTRATOEMPTMO, '                                                               + #13 +
   '   CON.VLRCONTRATO, '                                                                    + #13 +
   '   TCE.TCEDESCRICAO, '                                                                   + #13 +
   '   PTI.NOME AS NOME_TITULAR, '                                                           + #13 +
   '   PBF.NOME AS NOME_BENEF, '                                                             + #13 +
   '   SIT.DESCRICAO AS SIT_PART, '                                                          + #13 +
   '   ELP.MATRICULA, '                                                                      + #13 +
   '   SLD.HMEDATAATUALIZA, SLD.HMESALDODEV, SLD.HMEPARCELA, SLD.HMENUMPARCELAS, '           + #13 +
   '   PAR.VALOR_DEVIDO, (SLD.HMESALDODEV + PAR.VALOR_DEVIDO) AS TOTAL, '                    + #13 +
   '   PAR_PAG.VLR_PAG'                                                                      + #13 +

   'FROM '                                                                                   + #13 +
   '   PESSOA          PBF, '                                                                + #13 +
   '   PESSOA          PTI, '                                                                + #13 +
   '   CONTRATOEMPTMO  CON, '                                                                + #13 +
   '   ELEGPATRO       ELP, '                                                                + #13 +
   '   PARTPREVPLAN    PPP, '                                                                + #13 +
   '   TIPOCONTREMPTMO TCE, '                                                                + #13 +
   '   TIPOEMPTMO      TEP, '                                                                + #13 +
   '   PATRO           PTR, '                                                                + #13 +
   '   PLANPREV        PLP, '                                                                + #13 +
   '   SITPART         SIT, '                                                                + #13 +

   '   ( '                                                                                   + #13 +
   '   SELECT '                                                                              + #13 +
   '      CON.IDCONTRATOEMPTMO, '                                                            + #13 +
   '      HME.HMEDATAATUALIZA, HME.HMESALDODEV, HME.HMEPARCELA, HME.HMENUMPARCELAS '         + #13 +
   '   FROM '                                                                                + #13 +
   '      HISTMOVEMPTMO HME, CONTRATOEMPTMO CON, '                                           + #13 +
   '      ( '                                                                                + #13 +
   //Wylliam Leite da Silva SOL 253185 PPM 771995 - Início
   '      SELECT '                                                         + #13 +
   //Wylliam Leite da Silva SOL 253185 PPM 771995 - Fim
   '         CON.IDCONTRATOEMPTMO, MAX(IDHISTMOVEMPTMO) AS IDHISTMOVEMPTMO '                 + #13 +
   '      FROM '                                                                             + #13 +
   '         HISTMOVEMPTMO HME, CONTRATOEMPTMO CON, '                                        + #13 +
   '         ITEMXTIPOCONTR ITC, ITEMEMPTMO ITE, TIPOCONTREMPTMO TCE '                       + #13 +
   '      WHERE '                                                                            + #13 +
   '             ( ITC.ITCTRATASALDODEV   <> 0 ) '                                           + #13 +
   '         AND ( HME.HMEDATAATUALIZA    <= TO_DATE(''' + sData + ''', ''DD/MM/YYYY'') ) '  + #13 +
   '         AND ( (HME.FLGESTORNADO       IS NULL) OR (HME.FLGESTORNADO = 0) ) '            + #13 +
   '         AND ( CON.FLGSITUACAO        <> ''C'' ) '                                       + #13 +
   '         AND ( HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO ) '                         + #13 +
   '         AND ( CON.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPTMO ) '                        + #13 +
   '         AND ( CON.IDTIPOCONTREMPTMO  = TCE.IDTIPOCONTREMPTMO ) '                        + #13 +
   '         AND ( TCE.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPTMO ) '                        + #13 +
   '         AND ( HME.IDITEMEMPTMO       = ITE.IDITEMEMPTMO ) '                             + #13 +
   '         AND ( ITE.IDITEMEMPTMO       = ITC.IDITEMEMPTMO ) '                             + #13 +
   '         AND ( HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO ) '                             + #13 +
   '      GROUP BY '                                                                         + #13 +
   '         CON.IDCONTRATOEMPTMO '                                                          + #13 +
   '      ) MAX '                                                                            + #13 +
   '   WHERE '                                                                               + #13 +
   '          ( CON.FLGSITUACAO        <> ''C'' ) '                                          + #13 +
   '      AND ( CON.IDCONTRATOEMPTMO   = HME.IDCONTRATOEMPTMO ) '                            + #13 +
   '      AND ( CON.IDCONTRATOEMPTMO   = MAX.IDCONTRATOEMPTMO ) '                            + #13 +
   '      AND ( HME.IDHISTMOVEMPTMO    = MAX.IDHISTMOVEMPTMO ) '                             + #13 +
   '   ) SLD, '                                                                              + #13 +

   '   ( '                                                                                   + #13 +
   //Wylliam Leite da Silva - SOL: 253185 PPM: 771995 - Início
   '   SELECT '                                                                              + #13 +
   //Wylliam Leite da Silva - SOL: 253185 PPM: 771995 - Fim
   '      CON.IDCONTRATOEMPTMO, SUM(NVL(HME.HMEVLRPREVISTO, 0)) AS VALOR_DEVIDO '            + #13 +
   '   FROM '                                                                                + #13 +
   '      HISTMOVEMPTMO HME, CONTRATOEMPTMO CON '                                            + #13 +
   '   WHERE '                                                                               + #13 +
   '          HME.HMETIPOMOV         IN (1, 2, 3, 4, 6, 7) '                                 + #13;

   // ----------------------------------------------------------------------------------------------
   // André Pontes - 13/06/2005 - pendência 19175
   // Quitação
   case rdgQuitacao.ItemIndex of
      1: sSQL := sSQL + '      AND HME.HMETIPOMOV        <> 3 '                              + #13;
      2: sSQL := sSQL + '      AND HME.HMETIPOMOV         = 3 '                              + #13;
   end;
   // FIM André Pontes - 13/06/2005 - pendência 19175
   // ----------------------------------------------------------------------------------------------

   sSQL := sSQL +
   '      AND ( CON.FLGSITUACAO      <> ''C'' ) '                                            + #13 +
   '      AND HMEDATAPREVISTA        <= TO_DATE(' + QuotedStr(sData) + ', ''DD/MM/YYYY'') '  + #13 +
   '      AND ( (HME.HMEDATAEFETIVA  IS NULL) OR (HME.HMEDATAEFETIVA > TO_DATE(' + QuotedStr(sData) + ', ''DD/MM/YYYY'')) ) '   + #13 +
   '      AND ( (HME.HMEVLREFETIVO   IS NULL) OR (HME.HMEDATAEFETIVA > TO_DATE(' + QuotedStr(sData) + ', ''DD/MM/YYYY'')) ) '   + #13 +

   '      AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) ) '                      + #13 +
   '      AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO IS NULL) ) '                  + #13 +
   '      AND ( (HME.FLGQUITADO      IS NULL OR HME.FLGQUITADO = 0) OR ((HME.FLGQUITADO = 1) AND (HME.HMEDATAQUITABONO > TO_DATE(' + QuotedStr(sData) + ',''DD/MM/YYYY''))) ) ' + #13 +
   '      AND ( (HME.FLGABONADO      IS NULL OR HME.FLGABONADO = 0) OR ((HME.FLGABONADO = 1) AND (HME.HMEDATAQUITABONO > TO_DATE(' + QuotedStr(sData) + ',''DD/MM/YYYY''))) ) ' + #13 +

   '      AND ( CON.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO ) '                              + #13 +

   '   GROUP BY '                                                                            + #13 +
   '      CON.IDCONTRATOEMPTMO '                                                             + #13 +
   '   ) PAR, '                                                                              + #13 +

   '   ( '                                                                                   + #13 +
   //Wylliam Leite da Silva - SOL: 253185 PPM: 771995 - Início
   '   SELECT '                                           + #13 +
   //Wylliam Leite da Silva - SOL: 253185 PPM: 771995 - Fim
   '      CON.IDCONTRATOEMPTMO, SUM(NVL(HME.HMEVLRPREVISTO, 0)) AS VLR_DEV '                 + #13 +
   '   FROM '                                                                                + #13 +
   '      HISTMOVEMPTMO HME, CONTRATOEMPTMO CON '                                            + #13 +
   '   WHERE '                                                                               + #13 +
   '          HME.HMETIPOMOV         IN (1, 2, 3, 4, 6, 7) '                                 + #13;

   // ----------------------------------------------------------------------------------------------
   // André Pontes - 13/06/2005 - pendência 19175
   // Quitação
   case rdgQuitacao.ItemIndex of
      1: sSQL := sSQL + '      AND HME.HMETIPOMOV        <> 3 '                              + #13;
      2: sSQL := sSQL + '      AND HME.HMETIPOMOV         = 3 '                              + #13;
   end;
   // FIM André Pontes - 13/06/2005 - pendência 19175
   // ----------------------------------------------------------------------------------------------

   sSQL := sSQL +
   '      AND HME.HMESEQCOBRANCA     = 1 '                                                   + #13 +
   '      AND ( CON.FLGSITUACAO      <> ''C'' ) '                                            + #13 +
   '      AND HME.HMEDATAPREVISTA    <= TO_DATE(' + QuotedStr(sData) + ', ''DD/MM/YYYY'') '  + #13 +
   '      AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) ) '                      + #13 +
   '      AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO IS NULL) ) '                  + #13 +
   '      AND ( CON.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO ) '                              + #13 +
   '   GROUP BY '                                                                            + #13 +
   '      CON.IDCONTRATOEMPTMO '                                                             + #13 +
   '   ) PAR_DEV, '                                                                          + #13 +

   '   ( '                                                                                   + #13 +
   //Wylliam Leite da Silva - SOL: 253185 PPM: 771995 - Início
   '   SELECT '                                                                              + #13 +
   //Wylliam Leite da Silva - SOL: 253185 PPM: 771995 - Fim
   '      CON.IDCONTRATOEMPTMO, '                                                            + #13 +

   '      SUM(DECODE(FLGQUITADO, 1, NVL(HME.HMEVLRPREVISTO, 0), '                                     + #13 +
                                   'DECODE(FLGABONADO, 1, NVL(HME.HMEVLRPREVISTO, 0), '               + #13 +
                                                         'NVL(HME.HMEVLREFETIVO, 0)))) AS VLR_PAG '   + #13 +

   '   FROM '                                                                                + #13 +
   '      HISTMOVEMPTMO HME, CONTRATOEMPTMO CON '                                            + #13 +
   '   WHERE '                                                                               + #13 +
   '          HME.HMETIPOMOV         IN (1, 2, 3, 4, 6, 7) '                                 + #13;

   // ----------------------------------------------------------------------------------------------
   // André Pontes - 13/06/2005 - pendência 19175
   // Quitação
   case rdgQuitacao.ItemIndex of
      1: sSQL := sSQL + '      AND HME.HMETIPOMOV        <> 3 '                              + #13;
      2: sSQL := sSQL + '      AND HME.HMETIPOMOV         = 3 '                              + #13;
   end;
   // FIM André Pontes - 13/06/2005 - pendência 19175
   // ----------------------------------------------------------------------------------------------

   sSQL := sSQL +
   '      AND ( CON.FLGSITUACAO      <> ''C'' ) '                                            + #13 +
   '      AND HME.HMEDATAPREVISTA    <= TO_DATE(' + QuotedStr(sData) + ', ''DD/MM/YYYY'') '  + #13 +
   '      AND ( '                                                                            +
             '(HME.HMEDATAEFETIVA    <= TO_DATE(' + QuotedStr(sData) + ', ''DD/MM/YYYY'')) ' +
          'OR ( (HME.FLGQUITADO = 1) AND (HME.HMEDATAQUITABONO <= TO_DATE(' + QuotedStr(sData) + ',''DD/MM/YYYY'')) ) ' +
          'OR ( (HME.FLGABONADO = 1) AND (HME.HMEDATAQUITABONO <= TO_DATE(' + QuotedStr(sData) + ',''DD/MM/YYYY'')) ) ' +
             ') '                                                                            + #13 +
   '      AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) ) '                      + #13 +
   '      AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO IS NULL) ) '                  + #13 +

   '      AND ( CON.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO ) '                              + #13 +
   '   GROUP BY '                                                                            + #13 +
   '      CON.IDCONTRATOEMPTMO '                                                             + #13 +
   '   ) PAR_PAG '                                                                           + #13 +

   'WHERE '                                                                                  + #13 +

   // filtro por Empresa Proprietátia 
   '       TEP.IDEMPRESAPROP        = ' + IntToStr(Sistema.IDEmpresa)                        + #13 +

   // filtro por Patrocinadora
   '   AND PTR.IDPESSOA             IN (' + molListaPatro.PegaPatro + ') '                   + #13 +

   // filtro por Plano 
   '   AND PLP.IDPLANOPREV          IN (' + molListaPlano.PegaPlano + ') '                   + #13;

   // filtro por Tipo de Empréstimo 
   if DBcboTipoEmptmo.LookupValue <> '' then begin
      sSQL := sSQL +
   '   AND TCE.IDTIPOEMPTMO         = ' + DBcboTipoEmptmo.LookupValue                        + #13 +
   '   AND TEP.IDTIPOEMPTMO         = ' + DBcboTipoEmptmo.LookupValue                        + #13;
   end;

   // filtro por Tipo de Contrato
   if DBcboTipoContrato.LookupValue <> '' then begin
      sSQL := sSQL +
   '   AND CON.IDTIPOCONTREMPTMO    = ' + DBcboTipoContrato.LookupValue                      + #13 +
   '   AND TCE.IDTIPOCONTREMPTMO    = ' + DBcboTipoContrato.LookupValue                      + #13;
   end;

   // filtro por saldo devedor do contrato 
   if chkSaldoZERO.Checked then sSQL := sSQL +
   '   AND ( SLD.HMESALDODEV        = 0 ) '                                                  + #13;

   // filtro por SitPArt 
   if DBcboSitPart.LookupValue <> '' then sSQL := sSQL +
   '   AND SIT.IDSITPART            = ' + DBcboSitPart.LookupValue                           + #13;

   sSQL := sSQL +
   '   AND ( CON.FLGSITUACAO        <> ''C'' ) '                                             + #13 +
   '   AND ( CON.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO ) '                               + #13;

   // filtro por saldo parcelas vencidas em aberto
   if chkParcelasAberto.Checked then
   begin
      sSQL := sSQL +
   '   AND ( CON.IDCONTRATOEMPTMO   = PAR.IDCONTRATOEMPTMO ) '                               + #13;
   end
   else
   begin
      sSQL := sSQL +
   '   AND ( CON.IDCONTRATOEMPTMO   = PAR.IDCONTRATOEMPTMO(+) ) '                            + #13;
   end;

   sSQL := sSQL +
   '   AND ( CON.IDCONTRATOEMPTMO   = SLD.IDCONTRATOEMPTMO(+) ) '                            + #13 +
   '   AND ( CON.IDPESSOA           = PTI.IDPESSOA ) '                                       + #13 +
   '   AND ( CON.IDPESSOA           = ELP.IDPESSOA ) '                                       + #13 +
   '   AND ( CON.IDPATRO            = PTR.IDPESSOA ) '                                       + #13 +
   '   AND ( CON.IDBENEF            = PBF.IDPESSOA ) '                                       + #13 +
   '   AND ( CON.IDPESSOA           = PPP.IDPESSOA ) '                                       + #13 +
   '   AND ( CON.IDPATRO            = PPP.IDPESSJUR ) '                                      + #13 +
   '   AND ( ELP.IDPESSOA           = PPP.IDPESSOA ) '                                       + #13 +
   '   AND ( ELP.IDPESSJUR          = PPP.IDPESSJUR ) '                                      + #13 +
   '   AND ( PTR.IDPESSOA           = ELP.IDPESSJUR ) '                                      + #13 +
   '   AND ( CON.IDBENEF            = PBF.IDPESSOA ) '                                       + #13 +
   '   AND ( PTI.IDPESSOA           = ELP.IDPESSOA ) '                                       + #13 +
   '   AND ( PTI.IDPESSOA           = PPP.IDPESSOA ) '                                       + #13 +
   '   AND ( CON.IDPLANOPREV        = PLP.IDPLANOPREV ) '                                    + #13 +
   '   AND ( CON.IDTIPOCONTREMPTMO  = TCE.IDTIPOCONTREMPTMO ) '                              + #13 +
   '   AND ( TCE.IDTIPOEMPTMO       = TEP.IDTIPOEMPTMO ) '                                   + #13 +
   '   AND ( PPP.IDSITPART          = SIT.IDSITPART ) '                                      + #13 +

   '   AND PPP.FLGDESATIVADO        = 0 '                                                    + #13 +

   'ORDER BY '                                                                               + #13;

   case rdgOrdenar.ItemIndex of
      0: sSQL := sSQL + '   CON.IDTIPOCONTREMPTMO, CON.IDCONTRATOEMPTMO';
      1: sSQL := sSQL + '   PBF.NOME, CON.IDCONTRATOEMPTMO';
      2: sSQL := sSQL + '   SIT.DESCRICAO, PBF.NOME';
      3: sSQL := sSQL + '   ELP.MATRICULA, CON.IDCONTRATOEMPTMO';
   end;

   with dtmRelDividasTipoContrato.qryDividas do
   begin
      Close;
      SQL.Text := sSQL;
    //Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
    //SQL.SaveToFile(Sistema.TempDir + 'EP-RelDividasTipoContrato.txt');
      SQL.SaveToFile(ftempregra + '\' + 'EP-RelDividasTipoContrato.txt');
      Open;
   end;
end;



procedure TcfgRelDividasTipoContrato.molListaPatrobtnInvertePatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnInvertePatroClick(Sender);
end;



procedure TcfgRelDividasTipoContrato.molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnMarcaTodosPatroClick(Sender);
end;



procedure TcfgRelDividasTipoContrato.molListaPlanobtnInvertePlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnInvertePlanoClick(Sender);
end;



procedure TcfgRelDividasTipoContrato.molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnMarcaTodosPlanoClick(Sender);
end;



procedure TcfgRelDividasTipoContrato.FiltraRelatorioAtuDia;
var
   sSQL            : String;
   sData           : String;
   sAno            : String;
   sMes            : String;
   sTipoEmprestimo : String;
   iContador       : Integer;
   bPossuiItens    : Boolean;
begin

   sData := QuotedStr(FormatDateTime('DD/MM/YYYY', edtDataRef.Date));
   sAno  := FormatDateTime('YYYY', edtDataRef.Date);
   sMes  := FormatDateTime('MM', edtDataRef.Date);

   sSQL :=
   'SELECT'                                                                                                     + #13 +
   '  CON.IDCONTRATOEMPTMO,'                                                                                    + #13 +
   '  CON.IDTIPOCONTREMPTMO, '                                                                                  + #13 +
   '  MUT.NOME AS NOME_BENEF,'                                                                                  + #13 +
   '  PTI.NOME AS NOME_TITULAR, '                                                                               + #13 +
   '  DECODE(DEP.MATRICULA,NULL,ELP.MATRICULA,DEP.MATRICULA) AS MATRICULA,'                                     + #13 +
   '  TCE.TCEDESCRICAO,'                                                                                        + #13 +
   '  DECODE(CON.IDBENEF, CON.IDPESSOA, SIT.DESCRICAO, ''Pensionista'') AS SIT_PART,'                           + #13 +
   '  CON.VLRCONTRATO'                                                                                          + #13 +
   'FROM'                                                                                                       + #13 +
   '   PESSOA            MUT,'                                                                                  + #13 +
   '   PESSOA            PTI, '                                                                                 + #13 +
   '   CONTRATOEMPTMO    CON,'                                                                                  + #13 +
   '   DEPENTIT          DEP,'                                                                                  + #13 +
   '   ELEGPATRO         ELP,'                                                                                  + #13 +
   '   TIPOCONTREMPTMO   TCE,'                                                                                  + #13 +
   '   SITPART           SIT,'                                                                                  + #13 +
   '   PARTPREVPLAN      PPP,'                                                                                  + #13 +
   '   TIPOEMPTMO        TEP,'                                                                                  + #13 +
   '   VWMIGRACONTRATOEP MIG'                                                                                   + #13 +
   'WHERE'                                                                                                      + #13 +
   '       TEP.IDEMPRESAPROP     = ' + IntToStr(Sistema.IDEmpresa)                                              + #13 +
   '   AND CON.FLGSITUACAO       <> ''C'' '                                                                     + #13 +
   '   AND CON.IDBENEF           = MUT.IDPESSOA'                                                                + #13 +
   '   AND CON.IDPESSOA          = ELP.IDPESSOA'                                                                + #13 +
   '   AND CON.IDPATRO           = ELP.IDPESSJUR'                                                               + #13 +
   '   AND PTI.IDPESSOA          = ELP.IDPESSOA '                                                               + #13 +
   '   AND CON.IDBENEF           = DEP.IDPESSOA'                                                                + #13 +
   '   AND CON.IDPESSOA          = DEP.IDTITULAR'                                                               + #13 +
   '   AND CON.IDTIPOCONTREMPTMO = TCE.IDTIPOCONTREMPTMO'                                                       + #13 +
   '   AND TCE.IDTIPOEMPTMO      = TEP.IDTIPOEMPTMO'                                                            + #13 +
   '   AND PPP.IDSITPART         = SIT.IDSITPART'                                                               + #13 +
   '   AND CON.IDPESSOA          = PPP.IDPESSOA'                                                                + #13 +
   '   AND CON.IDPATRO           = PPP.IDPESSJUR'                                                               + #13 +
   '   AND PPP.FLGDESATIVADO     = 0'                                                                           + #13 +
   '   AND MIG.IDCONTRATOEMPTMO  = CON.IDCONTRATOEMPTMO'                                                        + #13 +
   '   AND MIG.DATAMIGRA         = (SELECT MAX(DATAMIGRA)'                                                      + #13 +
   '                                FROM   VWMIGRACONTRATOEP'                                                   + #13 +
   '                                WHERE  IDCONTRATOEMPTMO = CON.IDCONTRATOEMPTMO'                             + #13 +
   '                                AND    DATAMIGRA <= TO_DATE(' + sData + ', ''DD/MM/YYYY''))'                + #13 +
   '   AND CON.IDPATRO           IN (' + molListaPatro.PegaPatro + ')'                                          + #13 +
   '   AND MIG.IDPLANOCONTATU    IN (' + molListaPlano.PegaPlano + ')'                                          + #13;

   (* filtro por Tipo de Empréstimo *)
   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   '   AND CON.IDTIPOEMPTMO      = ' + DBcboTipoEmptmo.LookupValue                                              + #13;

   (* filtro por Tipo de Contrato *)
   if DBcboTipoContrato.LookupValue <> '' then sSQL := sSQL +
   '   AND CON.IDTIPOCONTREMPTMO = ' + DBcboTipoContrato.LookupValue                                            + #13;

   (* filtro por SitPArt *)
   if DBcboSitPart.LookupValue <> '' then sSQL := sSQL +
   '   AND SIT.IDSITPART         = ' + DBcboSitPart.LookupValue                                                 + #13;

   sSQL := sSQL +
   'ORDER BY'                                                                                                   + #13;

   case rdgOrdenar.ItemIndex of
      0: sSQL := sSQL + '   TCE.TCEDESCRICAO, CON.IDCONTRATOEMPTMO';
      1: sSQL := sSQL + '   TCE.TCEDESCRICAO, PBF.NOME, CON.IDCONTRATOEMPTMO';
      2: sSQL := sSQL + '   TCE.TCEDESCRICAO, SIT.DESCRICAO, PBF.NOME';
      3: sSQL := sSQL + '   TCE.TCEDESCRICAO, DECODE(DEP.MATRICULA,NULL,ELP.MATRICULA,DEP.MATRICULA), CON.IDCONTRATOEMPTMO';
   end;

   qryContrato.SQL.Clear;
   qryContrato.Sql.Text := sSQL;
   qryContrato.Open;

   iContador := 0;

   dtmRelDividasTipoContrato.qryDividas.Open;


   frmProgresso.MostraFormProgresso('Gerando dados para o relatório',True,True,True, iContador, qryContrato.RecordCount);
   while not qryContrato.Eof do
   begin

      sTipoEmprestimo := qryContratoTCEDESCRICAO.AsString;

      while (sTipoEmprestimo = qryContratoTCEDESCRICAO.AsString) and
            (not qryContrato.Eof) do
      begin

         Inc(iContador);

         if frmProgresso.Cancelou then
         begin
            Repaint;
            Application.ProcessMessages;

            // Verifica se abortou processo
            if MsgDlg('Deseja realmente interromper o relatório?', 'Empréstimo', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
            begin
               Repaint;
               frmProgresso.EscondeFormProgresso;

               Exit;
            end;
            Repaint;
         end;
         Repaint;

         frmProgresso.AndaFormProgresso(iContador);


         LimpaParametros(qrySaldoDev);
         qrySaldoDev.ParamByName('PIDCONTRATOEMPTMO').AsFloat := qryContratoIDCONTRATOEMPTMO.AsFloat;
         qrySaldoDev.ParamByName('PDATA').AsDateTime          := edtDataRef.Date;
         qrySaldoDev.ParamByName('PANO').AsInteger            := StrToInt(sAno);
         qrySaldoDev.ParamByName('PMES').AsInteger            := StrToInt(sMes);
         qrySaldoDev.ParamByName('PANOMES').AsString          := QuotedStr(sAno + sMes);
         qrySaldoDev.Open;

         MontaQueryParcDeve(sData);
         LimpaParametros(qryParcDev);
         qryParcDev.ParamByName('PIDCONTRATOEMPTMO').AsFloat := qryContratoIDCONTRATOEMPTMO.AsFloat;
         qryParcDev.Open;

         MontaQueryParcPag(sData);
         LimpaParametros(qryParcPag);
         qryParcPag.ParamByName('PIDCONTRATOEMPTMO').AsFloat := qryContratoIDCONTRATOEMPTMO.AsFloat;
         qryParcPag.Open;

         MontaQueryParcela(sData);
         LimpaParametros(qryParcela);
         qryParcela.ParamByName('PIDCONTRATOEMPTMO').AsFloat := qryContratoIDCONTRATOEMPTMO.AsFloat;
         qryParcela.Open;

         if  ( (qrySaldoDev.FieldByName('HMESALDODEV').AsCurrency > 0) or
               (qrySaldoDev.FieldByName('HMESALDODEV').AsCurrency + qryParcela.FieldByName('VALOR_DEVIDO').AsCurrency <> 0)
             ) then
         begin
            dtmRelDividasTipoContrato.qryDividas.Append;
            dtmRelDividasTipoContrato.qryDividasIDCONTRATOEMPTMO.AsFloat    := qryContratoIDCONTRATOEMPTMO.AsFloat;
            dtmRelDividasTipoContrato.qryDividasNOME_TITULAR.AsString       := qryContratoNOME_TITULAR.AsString;
            dtmRelDividasTipoContrato.qryDividasNOME_BENEF.AsString         := qryContratoNOME_BENEF.AsString;
            dtmRelDividasTipoContrato.qryDividasMATRICULA.AsString          := qryContratoMATRICULA.AsString;
            dtmRelDividasTipoContrato.qryDividasSIT_PART.AsString           := qryContratoSIT_PART.AsString;
            dtmRelDividasTipoContrato.qryDividasHMEDATAATUALIZA.AsDateTime  := qrySaldoDevHMEDATAATUALIZA.AsDateTime;
            dtmRelDividasTipoContrato.qryDividasHMESALDODEV.AsCurrency      := qrySaldoDevHMESALDODEV.AsCurrency;
            dtmRelDividasTipoContrato.qryDividasHMEPARCELA.AsInteger        := qrySaldoDevHMEPARCELA.AsInteger;
            dtmRelDividasTipoContrato.qryDividasHMENUMPARCELAS.AsInteger    := qrySaldoDevHMENUMPARCELAS.AsInteger;
            dtmRelDividasTipoContrato.qryDividasVALOR_DEVIDO.AsCurrency     := qryParcelaVALOR_DEVIDO.AsCurrency;
            dtmRelDividasTipoContrato.qryDividasTOTAL.AsCurrency            := qrySaldoDev.FieldByName('HMESALDODEV').AsCurrency + qryParcela.FieldByName('VALOR_DEVIDO').AsCurrency;
            dtmRelDividasTipoContrato.qryDividasIDTIPOCONTREMPTMO.AsInteger := qryContratoIDTIPOCONTREMPTMO.AsInteger;
            dtmRelDividasTipoContrato.qryDividasTCEDESCRICAO.AsString       := qryContratoTCEDESCRICAO.AsString;
            dtmRelDividasTipoContrato.qryDividasVLRCONTRATO.AsCurrency      := qryContratoVLRCONTRATO.AsCurrency;
            dtmRelDividasTipoContrato.qryDividasVLR_PAG.AsCurrency          := qryParcPagVLR_PAG.AsCurrency;
            dtmRelDividasTipoContrato.qryDividas.Post;
         end;

         qryContrato.Next;
      end;
   end;
   frmProgresso.EscondeFormProgresso;
end;



procedure TcfgRelDividasTipoContrato.MontaQueryParcDeve(sData : String);
var
   sSQL : String;
begin
   sSQL :=
   '   SELECT '                                                                              + #13 +
   '      SUM(NVL(HME.HMEVLRPREVISTO, 0)) AS VLR_DEV '                                       + #13 +
   '   FROM '                                                                                + #13 +
   '      HISTMOVEMPTMO HME'                                                                 + #13 +
   '   WHERE '                                                                               + #13 +
   '          HME.IDCONTRATOEMPTMO  = :PIDCONTRATOEMPTMO'                                    + #13;

   // ----------------------------------------------------------------------------------------------
   // André Pontes - 13/06/2005 - pendência 19175
   // Quitação
   case rdgQuitacao.ItemIndex of
      1: sSQL := sSQL + '      AND HME.HMETIPOMOV        <> 3 '                              + #13;
      2: sSQL := sSQL + '      AND HME.HMETIPOMOV         = 3 '                              + #13;
   end;
   // FIM André Pontes - 13/06/2005 - pendência 19175
   // ----------------------------------------------------------------------------------------------

   sSQL := sSQL +
   '      AND HME.HMETIPOMOV         IN (1, 2, 3, 4, 6, 7) '                                 + #13 +
   '      AND HME.HMESEQCOBRANCA     = 1 '                                                   + #13 +
   '      AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) ) '                      + #13 +
   '      AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO IS NULL) ) '                  + #13 +

   '      AND HME.HMEDATAPREVISTA    <= TO_DATE(' + sData + ', ''DD/MM/YYYY'') '             + #13;
   qryParcDev.Sql.Clear;
   qryParcDev.Sql.Text := sSQL;
end;



procedure TcfgRelDividasTipoContrato.MontaQueryParcPag(sData: String);
var
   sSQL : String;
begin
   sSQL :=
   '   SELECT '                                                                              + #13 +
   '      SUM(DECODE(FLGQUITADO, 1, NVL(HME.HMEVLRPREVISTO, 0), '                                     + #13 +
   '                                DECODE(FLGABONADO, 1, NVL(HME.HMEVLRPREVISTO, 0), '               + #13 +
   '                                                      NVL(HME.HMEVLREFETIVO, 0)))) AS VLR_PAG '   + #13 +

   '   FROM '                                                                                + #13 +
   '      HISTMOVEMPTMO HME'                                                                 + #13 +
   '   WHERE '                                                                               + #13 +
   '          HME.IDCONTRATOEMPTMO  = :PIDCONTRATOEMPTMO'                                    + #13;

   case rdgQuitacao.ItemIndex of
      1: sSQL := sSQL + '      AND HME.HMETIPOMOV        <> 3 '                              + #13;
      2: sSQL := sSQL + '      AND HME.HMETIPOMOV         = 3 '                              + #13;
   end;

   sSQL := sSQL +
   '      AND HME.HMETIPOMOV         IN (1, 2, 3, 4, 6, 7) '                                 + #13 +
   '      AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) ) '                      + #13 +
   '      AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO IS NULL) ) '                  + #13 +

   '      AND HME.HMEDATAPREVISTA    <= TO_DATE(' + sData + ', ''DD/MM/YYYY'') '             + #13 +

   '      AND ( '                                                                                              + #13 +
   '          (HME.HMEDATAEFETIVA    <= TO_DATE(' + sData + ', ''DD/MM/YYYY'')) '                              + #13 +
   '       OR ( (HME.FLGQUITADO = 1) AND (HME.HMEDATAQUITABONO <= TO_DATE(' + sData + ',''DD/MM/YYYY'')) ) '   + #13 +
   '       OR ( (HME.FLGABONADO = 1) AND (HME.HMEDATAQUITABONO <= TO_DATE(' + sData + ',''DD/MM/YYYY'')) ) '   + #13 +
   '          ) '                                                                                              + #13;

   qryParcPag.Sql.Clear;
   qryParcPag.Sql.Text := sSQL;
end;



procedure TcfgRelDividasTipoContrato.MontaQueryParcela(sData: String);
var
   sSQL : String;
begin
   sSQL :=
   '   SELECT                                    '                                           + #13 +
   '      SUM(NVL(HME.HMEVLRPREVISTO, 0)) AS VALOR_DEVIDO '                                  + #13 +
   '   FROM '                                                                                + #13 +
   '      HISTMOVEMPTMO HME '                                                                + #13 +
   '   WHERE '                                                                               + #13 +
   '          HME.HMETIPOMOV         IN (1, 2, 3, 4, 6, 7) '                                 + #13 +
   '      AND HME.IDCONTRATOEMPTMO   = :PIDCONTRATOEMPTMO'                                   + #13;

   // ----------------------------------------------------------------------------------------------
   // André Pontes - 13/06/2005 - pendência 19175
   // Quitação
   case rdgQuitacao.ItemIndex of
      1: sSQL := sSQL + '      AND HME.HMETIPOMOV        <> 3 '                              + #13;
      2: sSQL := sSQL + '      AND HME.HMETIPOMOV         = 3 '                              + #13;
   end;
   // FIM André Pontes - 13/06/2005 - pendência 19175
   // ----------------------------------------------------------------------------------------------

   sSQL := sSQL +
   '      AND HMEDATAPREVISTA        <= TO_DATE(' + sData + ', ''DD/MM/YYYY'') '                                     + #13 +
   '      AND ( (HME.HMEDATAEFETIVA  IS NULL) OR (HME.HMEDATAEFETIVA > TO_DATE(' + sData + ', ''DD/MM/YYYY'')) ) '   + #13 +
   '      AND ( (HME.HMEVLREFETIVO   IS NULL) OR (HME.HMEDATAEFETIVA > TO_DATE(' + sData + ', ''DD/MM/YYYY'')) ) '   + #13 +

   '      AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) ) '                      + #13 +
   '      AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO IS NULL) ) '                  + #13 +
   '      AND ( (HME.FLGQUITADO      IS NULL OR HME.FLGQUITADO = 0) OR ((HME.FLGQUITADO = 1) AND (HME.HMEDATAQUITABONO > TO_DATE(' + sData + ',''DD/MM/YYYY''))) ) ' + #13 +
   '      AND ( (HME.FLGABONADO      IS NULL OR HME.FLGABONADO = 0) OR ((HME.FLGABONADO = 1) AND (HME.HMEDATAQUITABONO > TO_DATE(' + sData + ',''DD/MM/YYYY''))) ) ' + #13;
   qryParcela.Sql.Clear;
   qryParcela.Sql.Text := sSQL;
end;



end.
