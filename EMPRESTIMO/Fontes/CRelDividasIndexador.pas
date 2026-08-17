unit CRelDividasIndexador;

// Alterações:
{ --------------------------------------------------------------------------------------------------
Rotina    :
Data      :
Autor     :
Pendencia :
Descrição :
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
----------------------------------------------------------------------------------------------------
Rotina    : FiltraRelatorio
Data      : 28/11/2003
Autor     : André Pontes
Pendencia :
Descrição : Na concatenação de Ano e Mês de competência foi incluído o TO_CHAR:
            AND ( (RTRIM(LTRIM(TO_CHAR(HME.HMEANOCOMPETENCIA, ''0000'')))) ||
                  (RTRIM(LTRIM(TO_CHAR(HME.HMEMESCOMPETENCIA, ''00'')))) ) <= ' + ...
---------------------------------------------------------------------------------------------------}

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   CRel, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr,
   TB97, ExtCtrls, mContratoEmptmo, Mask, wwdbedit, Wwdbspin, CheckLst,
   wwdblook, db, fcCombo, fcColorCombo, mInscricaoEmptmo, wwdbdatetimepicker,
   mListaPlano, mListaPatro, mListaPlanoContab, DBTables, Wwquery, fProgresso;

type
   TcfgRelDividasIndexador = class(TcfgRel)
      Label1: TLabel;
      Label2: TLabel;
      DBcboTipoEmptmo: TwwDBLookupCombo;
      DBcboTipoContrato: TwwDBLookupCombo;
      Panel1: TPanel;
      edtDataRef: TwwDBDateTimePicker;
      Label3: TLabel;
      GroupBox1: TGroupBox;
      chkCorLinha: TCheckBox;
      cboCorLinha: TfcColorCombo;
      chkLinhas: TCheckBox;
      molListaPatro: TmolListaPatro;
      qryContrato: TwwQuery;
      molListaPlano: TmolListaPlanoContab;
      qryContratoIDCONTRATOEMPTMO: TFloatField;
      qryContratoVLRCONTRATO: TFloatField;
      qryContratoIDTIPOEMPTMO: TFloatField;
      qryContratoDESCTIPOEMPTMO: TStringField;
      qryContratoMOECODIGO: TFloatField;
      qryContratoMOESIGLA: TStringField;
      qryContratoMOEDESC: TStringField;
      qrySaldoDev: TwwQuery;
      qrySaldoDevIDCONTRATOEMPTMO: TFloatField;
      qrySaldoDevHMEDATAATUALIZA: TDateTimeField;
      qrySaldoDevHMESALDODEV: TFloatField;
      qrySaldoDevHMEPARCELA: TFloatField;
      qrySaldoDevHMENUMPARCELAS: TFloatField;
      qryParcDev: TwwQuery;
      qryParcDevIDCONTRATOEMPTMO: TFloatField;
      qryParcDevVLR_DEV: TFloatField;
      qryParcPag: TwwQuery;
      qryParcPagIDCONTRATOEMPTMO: TFloatField;
      qryParcPagVLR_PAG: TFloatField;

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

      procedure MontaQueryParcDeve(sData : String);
      procedure MontaQueryParcPag(sData: String);

   public   // Public declarations


   end;



var
  cfgRelDividasIndexador: TcfgRelDividasIndexador;



implementation
{$R *.DFM}
uses
   DLookEmptmo,
   UDiasUteis,
   USistema,
   UfuncoesEmptmo,
   dEmptmo,
   dRelDividasTipoContrato,
   uMensErro, dRelDividasIndexador;




procedure TcfgRelDividasIndexador.AbreQueries;
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




procedure TcfgRelDividasIndexador.FormShow(Sender: TObject);
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



procedure TcfgRelDividasIndexador.DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
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



procedure TcfgRelDividasIndexador.DBcboTipoEmptmoExit(Sender: TObject);
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



procedure TcfgRelDividasIndexador.MontaQuery;
begin
   inherited;

   with dtmRelDividasIndexador do
   begin
      // preenche a label de data de referência
      if length(trim(edtDataRef.Text)) > 0 then sDataRef := FormatDateTime('DD/MM/YYYY', edtDataRef.Date);

       // -------------------------------------------------------------------------------------------

      lblTipoEmptmo.Caption := ' < todos > ';
      if DBcboTipoEmptmo.LookupValue <> ''   then lblTipoEmptmo.Caption := DBcboTipoEmptmo.Text;

      lblTipoContr.Caption  := ' < todos > ';
      if DBcboTipoContrato.LookupValue <> ''    then lblTipoContr.Caption  := DBcboTipoContrato.Text;

      memPatro.RichText := molListaPatro.ListaPatro;
      memPlano.RichText := molListaPlano.ListaPlano;

      // -------------------------------------------------------------------------------------------

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



procedure TcfgRelDividasIndexador.FiltraRelatorio;
var
   sSQL  : String;
   sMes  : String;
   sAno  : String;
   sData : String;
begin
   sData := QuotedStr(FormatDateTime('DD/MM/YYYY', edtDataRef.Date));
   sAno  := FormatDateTime('YYYY', edtDataRef.Date);
   sMes  := FormatDateTime('MM', edtDataRef.Date);

   sSQL :=
   'SELECT '                                                                                       + #13 +
   '   CON.IDCONTRATOEMPTMO, '                                                                     + #13 +
   '   CON.VLRCONTRATO, '                                                                          + #13 +

   '   CON.IDTIPOEMPTMO, CON.DESCTIPOEMPTMO, '                                                     + #13 +
   '   CON.MOECODIGO, '                                                                            + #13 +

   '   MOE.MOESIGLA, MOE.MOEDESC, '                                                                + #13 +

   '   SLD.HMESALDODEV, '                                                                          + #13 +

   '   (NVL(PAR_DEV.VLR_DEV, 0) - NVL(PAR_PAG.VLR_PAG, 0)) AS VALOR_DEVIDO, '                      + #13 +
   '   (NVL(SLD.HMESALDODEV, 0) + (NVL(PAR_DEV.VLR_DEV, 0) - NVL(PAR_PAG.VLR_PAG, 0))) AS TOTAL, ' + #13 +
   '   PAR_PAG.VLR_PAG '                                                                           + #13 +

   'FROM '                                                                                         + #13 +
   '   VWCONTRATOEP  CON, '                                                                        + #13 +
   '   MOEDA         MOE, '                                                                        + #13 +

   '   ( '                                                                                         + #13 +
   '   SELECT '                                                                                    + #13 +
   '      CON.IDCONTRATOEMPTMO, '                                                                  + #13 +
   '      HME.HMESALDODEV '                                                                        + #13 +
   '   FROM '                                                                                      + #13 +
   '      HISTMOVEMPTMO HME, CONTRATOEMPTMO CON, '                                                 + #13 +
   '      ( '                                                                                      + #13 +
   '      SELECT '                                                                                 + #13 +
   '         CON.IDCONTRATOEMPTMO, MAX(IDHISTMOVEMPTMO) AS IDHISTMOVEMPTMO '                       + #13 +
   '      FROM '                                                                                   + #13 +
   '         HISTMOVEMPTMO HME, CONTRATOEMPTMO CON, '                                              + #13 +
   '         ITEMXTIPOCONTR ITC, ITEMEMPTMO ITE, TIPOCONTREMPTMO TCE '                             + #13 +
   '      WHERE '                                                                                  + #13 +
   '             CON.FLGSITUACAO         <> ''C'' '                                                + #13;

   // Tipo de Contrato
   if DBcboTipoContrato.LookupValue <> '' then sSQL := sSQL +
   '         AND CON.IDTIPOCONTREMPTMO    = ' + DBcboTipoContrato.LookupValue                      + #13;

   // filtro por Plano e Patrocinadora
   sSQL := sSQL +
   '         AND CON.IDPATRO              IN (' + molListaPatro.PegaPatro + ') '                   + #13 +
   '         AND CON.IDPLANOPREV          IN (' + molListaPlano.PegaPlano + ') '                   + #13;

   sSQL := sSQL +
   '         AND ITC.ITCTRATASALDODEV    <> 0 '                                                    + #13 +
   '         AND ( (HME.FLGESTORNADO      IS NULL) OR (HME.FLGESTORNADO = 0) ) '                   + #13 +
   '         AND ( HME.HMEDATAATUALIZA    <= '                                                     + #13 +
   '               ( '                                                                             + #13 +
   '               SELECT '                                                                        + #13 +
   '                  DECODE(MAX(H.HMEDATAATUALIZA), NULL, TO_DATE(' + sData + ', ''DD/MM/YYYY''), '     + #13 +
   '                                                       MAX(H.HMEDATAATUALIZA)) '                     + #13 +
   '               FROM '                                                                          + #13 +
   '                  HISTMOVEMPTMO   H, '                                                         + #13 +
   '                  CONTRATOEMPTMO  C, '                                                         + #13 +
   '                  ITEMXTIPOCONTR  IT '                                                         + #13 +
   '               WHERE '                                                                         + #13 +
   '                      C.IDCONTRATOEMPTMO    = CON.IDCONTRATOEMPTMO '                           + #13 +
   '                  AND H.HMEDATAATUALIZA    <= TO_DATE(' + sData + ', ''DD/MM/YYYY'') '         + #13 +
   '                  AND IT.ITCTRATASALDODEV  <> 0 '                                              + #13 +
   '                  AND HME.HMEANOCOMPETENCIA = ' + sAno                                         + #13 +
   '                  AND HME.HMEMESCOMPETENCIA = ' + sMes                                         + #13 +
   '                  AND ( H.FLGESTORNADO      = 0 OR H.FLGESTORNADO IS NULL ) '                  + #13 +
   '                  AND H.IDCONTRATOEMPTMO    = C.IDCONTRATOEMPTMO '                             + #13 +
   '                  AND C.IDTIPOCONTREMPTMO   = IT.IDTIPOCONTREMPTMO '                           + #13 +
   '                  AND H.IDITEMEMPTMO        = IT.IDITEMEMPTMO '                                + #13 +
   '               ) '                                                                             + #13 +
   '             ) '                                                                               + #13 +

   '         AND ( (RTRIM(LTRIM(TO_CHAR(HME.HMEANOCOMPETENCIA, ''0000'')))) || (RTRIM(LTRIM(TO_CHAR(HME.HMEMESCOMPETENCIA, ''00'')))) ) <= ' + QuotedStr(sAno + sMes) + #13 +

   '         AND ( HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO ) '                               + #13 +
   '         AND ( CON.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPTMO ) '                              + #13 +
   '         AND ( CON.IDTIPOCONTREMPTMO  = TCE.IDTIPOCONTREMPTMO ) '                              + #13 +
   '         AND ( TCE.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPTMO ) '                              + #13 +
   '         AND ( HME.IDITEMEMPTMO       = ITE.IDITEMEMPTMO ) '                                   + #13 +
   '         AND ( ITE.IDITEMEMPTMO       = ITC.IDITEMEMPTMO ) '                                   + #13 +
   '         AND ( HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO ) '                                   + #13 +
   '      GROUP BY '                                                                               + #13 +
   '         CON.IDCONTRATOEMPTMO '                                                                + #13 +
   '      ) MAX '                                                                                  + #13 +
   '   WHERE '                                                                                     + #13 +
   '          CON.FLGSITUACAO         <> ''C'' '                                                   + #13;

   // Tipo de Contrato
   if DBcboTipoContrato.LookupValue <> '' then sSQL := sSQL +
   '      AND CON.IDTIPOCONTREMPTMO    = ' + DBcboTipoContrato.LookupValue                         + #13;

   // filtro por Plano e Patrocinadora
   sSQL := sSQL +
   '      AND CON.IDPATRO              IN (' + molListaPatro.PegaPatro + ') '                      + #13 +
   '      AND CON.IDPLANOPREV          IN (' + molListaPlano.PegaPlano + ') '                      + #13;

   sSQL := sSQL +
   '      AND ( CON.IDCONTRATOEMPTMO   = HME.IDCONTRATOEMPTMO ) '                                  + #13 +
   '      AND ( CON.IDCONTRATOEMPTMO   = MAX.IDCONTRATOEMPTMO ) '                                  + #13 +
   '      AND ( HME.IDHISTMOVEMPTMO    = MAX.IDHISTMOVEMPTMO ) '                                   + #13 +
   '   ) SLD, '                                                                                    + #13 +

   '   ( '                                                                                         + #13 +
   '   SELECT '                                                                                    + #13 +
   '      CON.IDCONTRATOEMPTMO, SUM(NVL(HME.HMEVLRPREVISTO, 0)) AS VLR_DEV '                       + #13 +
   '   FROM '                                                                                      + #13 +
   '      HISTMOVEMPTMO HME, CONTRATOEMPTMO CON '                                                  + #13 +
   '   WHERE '                                                                                     + #13 +
   '          CON.FLGSITUACAO        <> ''C'' '                                                    + #13;

   // Tipo de Contrato
   if DBcboTipoContrato.LookupValue <> '' then sSQL := sSQL +
   '      AND CON.IDTIPOCONTREMPTMO    = ' + DBcboTipoContrato.LookupValue                         + #13;

   // filtro por Plano e Patrocinadora
   sSQL := sSQL +
   '      AND CON.IDPATRO              IN (' + molListaPatro.PegaPatro + ') '                      + #13 +
   '      AND CON.IDPLANOPREV          IN (' + molListaPlano.PegaPlano + ') '                      + #13;

   sSQL := sSQL +
   '      AND HMETIPOMOV             IN (1, 2, 3, 4, 6, 7) '                                       + #13 +
   '      AND HME.HMESEQCOBRANCA     = 1 '                                                         + #13 +
   '      AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) ) '                            + #13 +
   '      AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO IS NULL) ) '                        + #13 +
   '      AND ( HME.HMEDATAPREVISTA  <= TO_DATE(' + sData + ', ''DD/MM/YYYY'') ) '                 + #13 +
   '      AND ( CON.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO ) '                                    + #13 +
   '   GROUP BY '                                                                                  + #13 +
   '      CON.IDCONTRATOEMPTMO '                                                                   + #13 +
   '   ) PAR_DEV, '                                                                                + #13 +

   '   ( '                                                                                         + #13 +
   '   SELECT '                                                                                    + #13 +
   '      CON.IDCONTRATOEMPTMO, '                                                                  + #13 +

   '      SUM(DECODE(FLGQUITADO, 1, NVL(HME.HMEVLRPREVISTO, 0), '                                     + #13 +
                                   'DECODE(FLGABONADO, 1, NVL(HME.HMEVLRPREVISTO, 0), '               + #13 +
                                                         'NVL(HME.HMEVLREFETIVO, 0)))) AS VLR_PAG '   + #13 +

   '   FROM '                                                                                      + #13 +
   '      HISTMOVEMPTMO HME, CONTRATOEMPTMO CON '                                                  + #13 +
   '   WHERE '                                                                                     + #13 +
   '          CON.FLGSITUACAO        <> ''C'' '                                                    + #13;

   // Tipo de Contrato
   if DBcboTipoContrato.LookupValue <> '' then sSQL := sSQL +
   '      AND CON.IDTIPOCONTREMPTMO  = ' + DBcboTipoContrato.LookupValue                           + #13;

   // filtro por Plano e Patrocinadora
   sSQL := sSQL +
   '      AND CON.IDPATRO            IN (' + molListaPatro.PegaPatro + ') '                        + #13 +
   '      AND CON.IDPLANOPREV        IN (' + molListaPlano.PegaPlano + ') '                        + #13;

   sSQL := sSQL +
   '      AND HME.HMETIPOMOV         IN (1, 2, 3, 4, 6, 7) '                                       + #13 +
   '      AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) ) '                            + #13 +
   '      AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO IS NULL) ) '                        + #13 +

   '      AND HME.HMEDATAPREVISTA    <= TO_DATE(' + sData + ', ''DD/MM/YYYY'') '                   + #13 +

   '      AND ( '                                                                                              + #13 +
   '          (HME.HMEDATAEFETIVA    <= TO_DATE(' + sData + ', ''DD/MM/YYYY'')) '                              + #13 +
   '       OR ( (HME.FLGQUITADO = 1) AND (HME.HMEDATAQUITABONO <= TO_DATE(' + sData + ',''DD/MM/YYYY'')) ) '   + #13 +
   '       OR ( (HME.FLGABONADO = 1) AND (HME.HMEDATAQUITABONO <= TO_DATE(' + sData + ',''DD/MM/YYYY'')) ) '   + #13 +
   '          ) '                                                                                              + #13 +

   '      AND ( CON.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO ) '                                    + #13 +
   '   GROUP BY '                                                                                  + #13 +
   '      CON.IDCONTRATOEMPTMO '                                                                   + #13 +
   '   ) PAR_PAG '                                                                                 + #13 +

   'WHERE '                                                                                        + #13 +

   // filtro por Empresa Proprietátia
   '       CON.IDEMPRESAPROP        = ' + IntToStr(Sistema.IDEmpresa)                              + #13 +

   // filtro por Patrocinadora
   '   AND CON.IDPATRO              IN (' + molListaPatro.PegaPatro + ') '                         + #13 +

   // filtro por Plano
   '   AND CON.IDPLANOPREV          IN (' + molListaPlano.PegaPlano + ') '                         + #13;

   // filtro por Tipo de Empréstimo
   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   '   AND CON.IDTIPOEMPTMO         = ' + DBcboTipoEmptmo.LookupValue                              + #13;

   // filtro por Tipo de Contrato
   if DBcboTipoContrato.LookupValue <> '' then sSQL := sSQL +
   '   AND CON.IDTIPOCONTREMPTMO    = ' + DBcboTipoContrato.LookupValue                            + #13;

   sSQL := sSQL +
   '   AND ( CON.FLGSITUACAO        <> ''C'' ) '                                                   + #13;

   sSQL := sSQL +
   '   AND EXISTS '                                                                                + #13 +
   '       ( '                                                                                     + #13 +
   '       SELECT '                                                                                + #13 +
   '          HE.HMEDATAPREVISTA '                                                                 + #13 +
   '       FROM '                                                                                  + #13 +
   '          HISTMOVEMPTMO HE '                                                                   + #13 +
   '       WHERE '                                                                                 + #13 +
   '              HE.HMETIPOMOV        IN (1, 2, 3, 4, 6, 7) '                                     + #13 +
   '          AND ( HE.HMECENTRALIZA   = 1 OR HE.HMEDESTACADO = 1 ) '                              + #13 +
   '          AND ( HE.FLGESTORNADO    = 0 OR HE.FLGESTORNADO IS NULL ) '                          + #13 +
   '          AND HE.HMEDATAPREVISTA    <= TO_DATE(' + sData + ', ''DD/MM/YYYY'') '                + #13 +

   '          AND ( (HE.HMEDATAEFETIVA  IS NULL) OR (HE.HMEDATAEFETIVA > TO_DATE(' + sData + ', ''DD/MM/YYYY'')) ) '                                                 + #13 +
   '          AND ( (HE.HMEVLREFETIVO   IS NULL) OR (HE.HMEDATAEFETIVA > TO_DATE(' + sData + ', ''DD/MM/YYYY'')) ) '                                                 + #13 +

   '          AND ( (HE.FLGQUITADO      IS NULL OR HE.FLGQUITADO = 0) OR ((HE.FLGQUITADO = 1) AND (HE.HMEDATAQUITABONO > TO_DATE(' + sData + ',''DD/MM/YYYY''))) ) ' + #13 +
   '          AND ( (HE.FLGABONADO      IS NULL OR HE.FLGABONADO = 0) OR ((HE.FLGABONADO = 1) AND (HE.HMEDATAQUITABONO > TO_DATE(' + sData + ',''DD/MM/YYYY''))) ) ' + #13 +

   '          AND HE.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO '                                   + #13 +
   '       ) '                                                                                     + #13 +

   '   AND ( CON.IDCONTRATOEMPTMO   = SLD.IDCONTRATOEMPTMO ) '                                     + #13 +
   '   AND ( CON.IDCONTRATOEMPTMO   = PAR_DEV.IDCONTRATOEMPTMO(+) ) '                              + #13 +
   '   AND ( CON.IDCONTRATOEMPTMO   = PAR_PAG.IDCONTRATOEMPTMO(+) ) '                              + #13 +
   '   AND ( CON.MOECODIGO          = MOE.MOECODIGO ) '                                            + #13 +

   'ORDER BY '                                                                                     + #13 +
   '   CON.DESCTIPOEMPTMO, MOE.MOESIGLA ';

   with dtmRelDividasIndexador.qryDividas do
   begin
      Close;
      SQL.Text := sSQL;
      Open;
   end;
end;



procedure TcfgRelDividasIndexador.molListaPatrobtnInvertePatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnInvertePatroClick(Sender);
end;



procedure TcfgRelDividasIndexador.molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnMarcaTodosPatroClick(Sender);
end;



procedure TcfgRelDividasIndexador.molListaPlanobtnInvertePlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnInvertePlanoClick(Sender);
end;



procedure TcfgRelDividasIndexador.molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnMarcaTodosPlanoClick(Sender);
end;



procedure TcfgRelDividasIndexador.FiltraRelatorioAtuDia;
var
   sSQL            : String;
   sData           : String;
   sAno            : String;
   sMes            : String;
   sTipoEmprestimo : String;
   iContador       : Integer;
begin
   sData := QuotedStr(FormatDateTime('DD/MM/YYYY', edtDataRef.Date));
   sAno  := FormatDateTime('YYYY', edtDataRef.Date);
   sMes  := FormatDateTime('MM', edtDataRef.Date);

   sSQL :=
   'SELECT'                                                                                                     + #13 +
   '   CON.IDCONTRATOEMPTMO, '                                                                                  + #13 +
   '   CON.VLRCONTRATO, '                                                                                       + #13 +

   '   TEP.IDTIPOEMPTMO, TEP.DESCTIPOEMPTMO, '                                                                  + #13 +
   '   CON.MOECODIGO, '                                                                                         + #13 +

   '   MOE.MOESIGLA, MOE.MOEDESC  '                                                                             + #13 +
   'FROM'                                                                                                       + #13 +
   '   MOEDA         MOE, '                                                                                     + #13 +
   '   CONTRATOEMPTMO  CON,'                                                                                    + #13 +
   '   TIPOCONTREMPTMO TCE,'                                                                                    + #13 +
   '   TIPOEMPTMO      TEP,'                                                                                    + #13 +
   '   VWMIGRACONTRATOEP MIG'                                                                                   + #13 +
   'WHERE'                                                                                                      + #13 +
   '       TEP.IDEMPRESAPROP      = ' + IntToStr(Sistema.IdEmpresa)                                             + #13 +
   '   AND CON.FLGSITUACAO        <> ''C'''                                                                     + #13 +
   '   AND CON.MOECODIGO          = MOE.MOECODIGO '                                                             + #13 +
   '   AND TCE.IDTIPOCONTREMPTMO  = CON.IDTIPOCONTREMPTMO'                                                      + #13 +
   '   AND TEP.IDTIPOEMPTMO       = TCE.IDTIPOEMPTMO'                                                           + #13 +
   '   AND MIG.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO'                                                       + #13 +
   '   AND MIG.DATAMIGRA          = (SELECT MAX(DATAMIGRA)'                                                     + #13 +
   '                                 FROM   VWMIGRACONTRATOEP'                                                  + #13 +
   '                                 WHERE  IDCONTRATOEMPTMO = CON.IDCONTRATOEMPTMO'                            + #13 +
   '                                 AND    DATAMIGRA <= TO_DATE(' + sData + ', ''DD/MM/YYYY''))'               + #13 +
   '   AND CON.IDPATRO            IN (' + molListaPatro.PegaPatro + ') '                                        + #13 +
   '   AND MIG.IDPLANOCONTATU     IN (' + molListaPlano.PegaPlano + ') '                                        + #13;

   // Tipo de Contrato
   if DBcboTipoContrato.LookupValue <> '' then sSQL := sSQL +
   '   AND CON.IDTIPOCONTREMPTMO    = ' + DBcboTipoContrato.LookupValue                                         + #13;

   sSQL := sSQL +
   'ORDER BY '                                                                                                  + #13 +
   '   TEP.DESCTIPOEMPTMO, MOE.MOESIGLA ';

   qryContrato.SQL.Clear;
   qryContrato.Sql.Text := sSQL;
   qryContrato.Open;

   iContador := 0;

   dtmRelDividasIndexador.qryDividas.Open;

   frmProgresso.MostraFormProgresso('Gerando informações para o relatório',true,True,True,0, qryContrato.RecordCount);

   while not qryContrato.eof do
   begin

      sTipoEmprestimo := qryContratoDESCTIPOEMPTMO.AsString;

      while (sTipoEmprestimo = qryContratoDESCTIPOEMPTMO.AsString) and
            (not qryContrato.eof) do
      begin

         Inc(iContador);
         frmProgresso.AndaFormProgresso(iContador);

         if frmProgresso.Cancelou then
         begin
            Repaint;
            Application.ProcessMessages;

            // Verifica se abortou processo
            if MsgDlg('Deseja realmente interromper o relatório?', 'Empréstimo', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
            begin
               frmProgresso.EscondeFormProgresso;
               Repaint;

               Exit;
            end;
            Repaint;
         end;
         Repaint;

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

         if  ( (qrySaldoDev.FieldByName('HMESALDODEV').AsCurrency > 0) or
               ((qryParcDev.FieldByName('VLR_DEV').AsCurrency - qryParcPag.FieldByName('VLR_PAG').AsCurrency) <> 0)
             ) then
         begin

             dtmRelDividasIndexador.qryDividas.Append;
             dtmRelDividasIndexador.qryDividasIDCONTRATOEMPTMO.AsFloat := qryContratoIDCONTRATOEMPTMO.AsFloat;
             dtmRelDividasIndexador.qryDividasIDTIPOEMPTMO.AsInteger   := qryContratoIDTIPOEMPTMO.AsInteger;
             dtmRelDividasIndexador.qryDividasDESCTIPOEMPTMO.AsString  := qryContratoDESCTIPOEMPTMO.AsString;
             dtmRelDividasIndexador.qryDividasMOECODIGO.AsInteger      := qryContratoMOECODIGO.AsInteger;
             dtmRelDividasIndexador.qryDividasMOESIGLA.AsString        := qryContratoMOESIGLA.AsString;
             dtmRelDividasIndexador.qryDividasMOEDESC.AsString         := qryContratoMOEDESC.AsString;
             dtmRelDividasIndexador.qryDividasHMESALDODEV.AsCurrency   := qrySaldoDev.FieldByName('HMESALDODEV').AsCurrency;
             dtmRelDividasIndexador.qryDividasVALOR_DEVIDO.AsCurrency  := qryParcDev.FieldByName('VLR_DEV').AsCurrency - qryParcPag.FieldByName('VLR_PAG').AsCurrency;
             dtmRelDividasIndexador.qryDividasTOTAL.AsCurrency         := qrySaldoDevHMESALDODEV.AsCurrency + (qryParcDev.FieldByName('VLR_DEV').AsCurrency - qryParcPag.FieldByName('VLR_PAG').AsCurrency);
             dtmRelDividasIndexador.qryDividas.Post;
         end;

         qryContrato.Next;
      end;

   end;

   frmProgresso.EscondeFormProgresso;
end;



procedure TcfgRelDividasIndexador.MontaQueryParcDeve(sData : String);
var
   sSQL : String;
begin
   sSQL :=
   '   SELECT '                                                                              + #13 +
   '      CON.IDCONTRATOEMPTMO, SUM(NVL(HME.HMEVLRPREVISTO, 0)) AS VLR_DEV '                 + #13 +
   '   FROM '                                                                                + #13 +
   '      HISTMOVEMPTMO HME, CONTRATOEMPTMO CON '                                            + #13 +
   '   WHERE '                                                                               + #13 +
   '          CON.IDTIPOCONTREMPTMO  = :PIDCONTRATOEMPTMO'                                   + #13 +
   '      AND HME.HMETIPOMOV         IN (1, 2, 3, 4, 6, 7) '                                 + #13 +
   '      AND HME.HMESEQCOBRANCA     = 1 '                                                   + #13 +
   '      AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) ) '                      + #13 +
   '      AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO IS NULL) ) '                  + #13 +

   '      AND HME.HMEDATAPREVISTA    <= TO_DATE(' + sData + ', ''DD/MM/YYYY'') '             + #13 +

   '      AND ( CON.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO ) '                              + #13 +
   '   GROUP BY '                                                                            + #13 +
   '      CON.IDCONTRATOEMPTMO '                                                             + #13;

   qryParcDev.Sql.Clear;
   qryParcDev.Sql.Text := sSQL;
end;



procedure TcfgRelDividasIndexador.MontaQueryParcPag(sData: String);
var
   sSQL : String;
begin
   sSQL :=
   '   SELECT '                                                                              + #13 +
   '      CON.IDCONTRATOEMPTMO, '                                                            + #13 +

   '      SUM(DECODE(FLGQUITADO, 1, NVL(HME.HMEVLRPREVISTO, 0), '                                     + #13 +
   '                                DECODE(FLGABONADO, 1, NVL(HME.HMEVLRPREVISTO, 0), '               + #13 +
   '                                                      NVL(HME.HMEVLREFETIVO, 0)))) AS VLR_PAG '   + #13 +

   '   FROM '                                                                                + #13 +
   '      HISTMOVEMPTMO HME, CONTRATOEMPTMO CON '                                            + #13 +
   '   WHERE '                                                                               + #13 +
   '          CON.IDTIPOCONTREMPTMO  = :PIDCONTRATOEMPTMO'                                   + #13 +
   '      AND HME.HMETIPOMOV         IN (1, 2, 3, 4, 6, 7) '                                 + #13 +
   '      AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) ) '                      + #13 +
   '      AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO IS NULL) ) '                  + #13 +

   '      AND HME.HMEDATAPREVISTA    <= TO_DATE(' + sData + ', ''DD/MM/YYYY'') '             + #13 +

   '      AND ( '                                                                                              + #13 +
   '          (HME.HMEDATAEFETIVA    <= TO_DATE(' + sData + ', ''DD/MM/YYYY'')) '                              + #13 +
   '       OR ( (HME.FLGQUITADO = 1) AND (HME.HMEDATAQUITABONO <= TO_DATE(' + sData + ',''DD/MM/YYYY'')) ) '   + #13 +
   '       OR ( (HME.FLGABONADO = 1) AND (HME.HMEDATAQUITABONO <= TO_DATE(' + sData + ',''DD/MM/YYYY'')) ) '   + #13 +
   '          ) '                                                                                              + #13 +

   '      AND ( CON.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO ) '                              + #13 +
   '   GROUP BY '                                                                            + #13 +
   '      CON.IDCONTRATOEMPTMO '                                                             + #13;

   qryParcPag.Sql.Clear;
   qryParcPag.Sql.Text := sSQL;
end;



end.
