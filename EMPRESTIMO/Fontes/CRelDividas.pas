unit CRelDividas;

// Alterações:
{ --------------------------------------------------------------------------------------------------
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
   mListaPlano, mListaPatro, mListaPlanoContab, DBTables, Wwquery;

type                                      
   TcfgRelDividas = class(TcfgRel)
      Label1: TLabel;
      Label2: TLabel;
      DBcboTipoEmptmo: TwwDBLookupCombo;
      DBcboTipoContr: TwwDBLookupCombo;
      Panel1: TPanel;
      molContratoEmptmo: TmolContratoEmptmo;
      edtDataRef: TwwDBDateTimePicker;
      Label3: TLabel;
      chkItemAberto: TCheckBox;
      rdgOrdenar: TRadioGroup;
      GroupBox1: TGroupBox;
      chkCorLinha: TCheckBox;
      cboCorLinha: TfcColorCombo;
      chkLinhas: TCheckBox;
      chkSaldoZERO: TCheckBox;
      DBcboSitPart: TwwDBLookupCombo;
      Label4: TLabel;
      molListaPatro: TmolListaPatro;
      chkSaldoDevedor: TCheckBox;
      rdgDevolucao: TRadioGroup;
      rdgQuitacao: TRadioGroup;
      chkValorDevido: TCheckBox;
      qryContrato: TwwQuery;
      molListaPlano: TmolListaPlanoContab;
      qrySaldoDev: TwwQuery;
      qryParcDev: TwwQuery;
      qryParcDevIDCONTRATOEMPTMO: TFloatField;
      qryParcDevVLR_DEV: TFloatField;
      qrySaldoDevIDCONTRATOEMPTMO: TFloatField;
      qrySaldoDevHMEDATAATUALIZA: TDateTimeField;
      qrySaldoDevHMESALDODEV: TFloatField;
      qrySaldoDevHMEPARCELA: TFloatField;
      qrySaldoDevHMENUMPARCELAS: TFloatField;
      qryParcPag: TwwQuery;
      qryParcPagIDCONTRATOEMPTMO: TFloatField;
      qryParcPagVLR_PAG: TFloatField;
      qryContratoIDCONTRATOEMPTMO: TFloatField;
      qryContratoVLRCONTRATO: TFloatField;
      qryContratoNOME_TITULAR: TStringField;
      qryContratoNOME_BENEF: TStringField;
      qryContratoSIT_PART: TStringField;
      qryContratoMATRICULA: TStringField;
      qryContratoMATRICULA_TIT: TStringField;
      qryContratoTCEDESCRICAO: TStringField;

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
      procedure MontaQueryParcPag(sData : String);


   public   // Public declarations


   end;



var
  cfgRelDividas: TcfgRelDividas;



implementation
{$R *.DFM}
uses
   DLookEmptmo, UDiasUteis, USistema, UfuncoesEmptmo, dEmptmo, fProgressoDuplo, dRelDividas, uMensErro;



procedure TcfgRelDividas.AbreQueries;
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




procedure TcfgRelDividas.MontaQuery;
begin
   inherited;

   with dtmRelDividas do
   begin
      // preenche a label de data de referência
      if length(trim(edtDataRef.Text)) > 0 then sDataRef := FormatDateTime('DD/MM/YYYY', edtDataRef.Date);

      lblItemAberto.Visible   := chkItemAberto.Checked;
      lblValorDevido.Visible  := chkValorDevido.Checked;
      lblSaldoDevedor.Visible := chkSaldoDevedor.Checked;
      lblSaldoZERO.Visible    := chkSaldoZERO.Checked;

      // ----------------------------------------------------------------------------------------------
      // André Pontes - 16/06/2005 - pendência 19175
      // Quitação
      case rdgQuitacao.ItemIndex of
         0: lblQuitacao.Caption := 'Considera Quitações';
         1: lblQuitacao.Caption := 'NÃO Considera Quitações';
         2: lblQuitacao.Caption := 'Considera APENAS Quitações';
      end;
      // FIM André Pontes - 16/06/2005 - pendência 19175

      lblDevolucao.Visible := rdgDevolucao.ItemIndex = 0;

      // ----------------------------------------------------------------------------------------------

      bSeparador  := chkLinhas.Checked;

      // determina se as linhas do relatório serão impressas em cores alternadas, e qual cor usar
      bCorlinha   := chkCorLinha.Checked;
      CorLinha    := cboCorLinha.SelectedColor;

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



procedure TcfgRelDividas.FormShow(Sender: TObject);
begin
   inherited;

   // limpa a seleção de Contrato
   molContratoEmptmo.btnLimpaContrato.Click;

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



procedure TcfgRelDividas.DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
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



procedure TcfgRelDividas.DBcboTipoEmptmoExit(Sender: TObject);
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



procedure TcfgRelDividas.FiltraRelatorio;
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
   'SELECT '                                                                                 + #13 +
   '   CON.IDCONTRATOEMPTMO, '                                                               + #13 +
   '   CON.VLRCONTRATO, '                                                                    + #13 +
   '   PTI.NOME AS NOME_TITULAR, '                                                           + #13 +
   '   PBF.NOME AS NOME_BENEF, '                                                             + #13 +
   '   DECODE(CON.IDBENEF, CON.IDPESSOA, SIT.DESCRICAO, ''Pensionista'') AS SIT_PART, '      + #13 +
   '   DEP.MATRICULA AS MATRICULA, '                                                         + #13 +
   '   ELP.MATRICULA AS MATRICULA_TIT, '                                                     + #13 +
   '   SLD.HMEDATAATUALIZA, SLD.HMESALDODEV, SLD.HMEPARCELA, SLD.HMENUMPARCELAS, '           + #13 +
   '   TCE.TCEDESCRICAO, '                                                                   + #13 +
   '   (NVL(PAR_DEV.VLR_DEV, 0) - NVL(PAR_PAG.VLR_PAG, 0)) AS DEVE, '                        + #13 +
   '   (NVL(SLD.HMESALDODEV, 0) + (NVL(PAR_DEV.VLR_DEV, 0) - NVL(PAR_PAG.VLR_PAG, 0))) AS TOTAL_DEV, '    + #13 +
   '   PAR_PAG.VLR_PAG                                                                  '    + #13 +

   'FROM '                                                                                   + #13 +
   '   PESSOA          PBF, '                                                                + #13 +
   '   PESSOA          PTI, '                                                                + #13 +
   '   CONTRATOEMPTMO  CON, '                                                                + #13 +
   '   DEPENTIT        DEP, '                                                                + #13 +
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
   '      SELECT '                                                                           + #13 +
   '         CON.IDCONTRATOEMPTMO, MAX(IDHISTMOVEMPTMO) AS IDHISTMOVEMPTMO '                 + #13 +
   '      FROM '                                                                             + #13 +
   '         HISTMOVEMPTMO HME, CONTRATOEMPTMO CON, '                                        + #13 +
   '         ITEMXTIPOCONTR ITC, ITEMEMPTMO ITE, TIPOCONTREMPTMO TCE '                       + #13 +
   '      WHERE '                                                                            + #13 +
   '             CON.FLGSITUACAO         <> ''C'' '                                          + #13;

   // Tipo de Contrato
   if DBcboTipoContr.LookupValue <> '' then sSQL := sSQL +
   '         AND CON.IDTIPOCONTREMPTMO    = ' + DBcboTipoContr.LookupValue                + #13;

   // filtro por Plano e Patrocinadora
   sSQL := sSQL +
   '         AND CON.IDPATRO              IN (' + molListaPatro.PegaPatro + ') '             + #13 +
   '         AND CON.IDPLANOPREV          IN (' + molListaPlano.PegaPlano + ') '             + #13;

   // filtro por Contrato
   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '         AND CON.IDCONTRATOEMPTMO     = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)       + #13;

   sSQL := sSQL +
   '         AND ITC.ITCTRATASALDODEV    <> 0 '                                              + #13 +
   '         AND ( (HME.FLGESTORNADO      IS NULL) OR (HME.FLGESTORNADO = 0) ) '             + #13 +
   '         AND ( HME.HMEDATAATUALIZA    <= '                                               + #13 +
   '               ( '                                                                       + #13 +
   '               SELECT '                                                                  + #13 +
   '                  DECODE(MAX(H.HMEDATAATUALIZA), NULL, TO_DATE(' + sData + ', ''DD/MM/YYYY''), '  + #13 +
   '                                                       MAX(H.HMEDATAATUALIZA)) '                  + #13 +
   '               FROM '                                                                    + #13 +
   '                  HISTMOVEMPTMO   H, '                                                   + #13 +
   '                  CONTRATOEMPTMO  C, '                                                   + #13 +
   '                  ITEMXTIPOCONTR  IT '                                                   + #13 +
   '               WHERE '                                                                   + #13 +
   '                      C.IDCONTRATOEMPTMO    = CON.IDCONTRATOEMPTMO '                     + #13 +
   '                  AND H.HMEDATAATUALIZA    <= TO_DATE(' + sData + ', ''DD/MM/YYYY'') '   + #13 +
   '                  AND IT.ITCTRATASALDODEV  <> 0 '                                        + #13 +
   '                  AND HME.HMEANOCOMPETENCIA = ' + sAno                                   + #13 +
   '                  AND HME.HMEMESCOMPETENCIA = ' + sMes                                   + #13 +
   '                  AND ( H.FLGESTORNADO      = 0 OR H.FLGESTORNADO IS NULL ) '            + #13 +
   '                  AND H.IDCONTRATOEMPTMO    = C.IDCONTRATOEMPTMO '                       + #13 +
   '                  AND C.IDTIPOCONTREMPTMO   = IT.IDTIPOCONTREMPTMO '                     + #13 +
   '                  AND H.IDITEMEMPTMO        = IT.IDITEMEMPTMO '                          + #13 +
   '               ) '                                                                       + #13 +
   '             ) '                                                                         + #13 +

   '         AND ( (RTRIM(LTRIM(TO_CHAR(HME.HMEANOCOMPETENCIA, ''0000'')))) || (RTRIM(LTRIM(TO_CHAR(HME.HMEMESCOMPETENCIA, ''00'')))) ) <= ' + QuotedStr(sAno + sMes) + #13 +

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
   '   SELECT '                                                                              + #13 +
   '      CON.IDCONTRATOEMPTMO, SUM(NVL(HME.HMEVLRPREVISTO, 0)) AS VLR_DEV '                 + #13 +
   '   FROM '                                                                                + #13 +
   '      HISTMOVEMPTMO HME, CONTRATOEMPTMO CON '                                            + #13 +
   '   WHERE '                                                                               + #13 +
   '          CON.FLGSITUACAO       <> ''C'' '                                               + #13;

   // Tipo de Contrato
   if DBcboTipoContr.LookupValue <> '' then sSQL := sSQL +
   '      AND CON.IDTIPOCONTREMPTMO  = ' + DBcboTipoContr.LookupValue                     + #13;

   // filtro por Plano e Patrocinadora
   sSQL := sSQL +
   '      AND CON.IDPATRO            IN (' + molListaPatro.PegaPatro + ') '                  + #13 +
   '      AND CON.IDPLANOPREV        IN (' + molListaPlano.PegaPlano + ') '                  + #13;

   // filtro por Contrato
   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '      AND CON.IDCONTRATOEMPTMO   = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)   + #13;

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

   '      AND HME.HMEDATAPREVISTA    <= TO_DATE(' + sData + ', ''DD/MM/YYYY'') '             + #13 +

   '      AND ( CON.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO ) '                              + #13 +
   '   GROUP BY '                                                                            + #13 +
   '      CON.IDCONTRATOEMPTMO '                                                             + #13 +
   '   ) PAR_DEV, '                                                                          + #13 +

   '   ( '                                                                                   + #13 +
   '   SELECT '                                                                              + #13 +
   '      CON.IDCONTRATOEMPTMO, '                                                            + #13 +

   '      SUM(DECODE(FLGQUITADO, 1, NVL(HME.HMEVLRPREVISTO, 0), '                                     + #13 +
   '                                DECODE(FLGABONADO, 1, NVL(HME.HMEVLRPREVISTO, 0), '               + #13 +
   '                                                      NVL(HME.HMEVLREFETIVO, 0)))) AS VLR_PAG '   + #13 +

   '   FROM '                                                                                + #13 +
   '      HISTMOVEMPTMO HME, CONTRATOEMPTMO CON '                                            + #13 +
   '   WHERE '                                                                               + #13 +
   '          CON.FLGSITUACAO       <> ''C'' '                                               + #13;

   // Tipo de Contrato
   if DBcboTipoContr.LookupValue <> '' then sSQL := sSQL +
   '      AND CON.IDTIPOCONTREMPTMO  = ' + DBcboTipoContr.LookupValue                     + #13;

   // filtro por Plano e Patrocinadora
   sSQL := sSQL +
   '      AND CON.IDPATRO            IN (' + molListaPatro.PegaPatro + ') '                  + #13 +
   '      AND CON.IDPLANOPREV        IN (' + molListaPlano.PegaPlano + ') '                  + #13;

   // filtro por Contrato
   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '      AND CON.IDCONTRATOEMPTMO   = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)            + #13;

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
   '      CON.IDCONTRATOEMPTMO '                                                             + #13 +
   '   ) PAR_PAG '                                                                           + #13 +

   'WHERE '                                                                                  + #13 +

   // filtro por Empresa Proprietátia
   '       TEP.IDEMPRESAPROP        = ' + IntToStr(Sistema.IDEmpresa)                        + #13 +

   // filtro por Patrocinadora
   '   AND PTR.IDPESSOA             IN (' + molListaPatro.PegaPatro + ') '                   + #13 +

   // filtro por Plano
   '   AND PLP.IDPLANOPREV          IN (' + molListaPlano.PegaPlano + ') '                   + #13;

   // filtro por Contrato
   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '   AND CON.IDCONTRATOEMPTMO     = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)             + #13;

   // filtro por Tipo de Empréstimo
   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   '   AND TCE.IDTIPOEMPTMO         = ' + DBcboTipoEmptmo.LookupValue                        + #13 +
   '   AND TEP.IDTIPOEMPTMO         = ' + DBcboTipoEmptmo.LookupValue                        + #13;

   // filtro por Tipo de Contrato 
   if DBcboTipoContr.LookupValue <> '' then sSQL := sSQL +
   '   AND CON.IDTIPOCONTREMPTMO    = ' + DBcboTipoContr.LookupValue                      + #13 +
   '   AND TCE.IDTIPOCONTREMPTMO    = ' + DBcboTipoContr.LookupValue                      + #13;

   // filtro por saldo devedor do contrato
   if chkSaldoZERO.Checked then
   begin
      sSQL := sSQL +
   '   AND ( SLD.HMESALDODEV        = 0 ) '                                                  + #13;
   end
   else if not(chkSaldoZERO.Checked) and (rdgDevolucao.ItemIndex = 0) then
   begin
      sSQL := sSQL +
   '   AND ( (SLD.HMESALDODEV       > 0) OR ((NVL(PAR_DEV.VLR_DEV, 0) - NVL(PAR_PAG.VLR_PAG, 0)) <> 0) ) '  + #13;
   end
   else if not(chkSaldoZERO.Checked) and (rdgDevolucao.ItemIndex = 1) then
   begin
      sSQL := sSQL +
   '   AND ( (SLD.HMESALDODEV       > 0) OR ((NVL(PAR_DEV.VLR_DEV, 0) - NVL(PAR_PAG.VLR_PAG, 0)) > 0) ) '  + #13;
   end;

   // filtro por SitPart
   if DBcboSitPart.LookupValue <> '' then sSQL := sSQL +
   '   AND SIT.IDSITPART            = ' + DBcboSitPart.LookupValue                           + #13;

   sSQL := sSQL +
   '   AND ( CON.FLGSITUACAO        <> ''C'' ) '                                             + #13;

   // filtro por saldo parcelas vencidas em aberto
   if (chkValorDevido.Checked) and (rdgDevolucao.ItemIndex = 0) then sSQL := sSQL +
   '   AND ( ((NVL(PAR_DEV.VLR_DEV, 0) - NVL(PAR_PAG.VLR_PAG, 0)) <> 0) ) '                  + #13

   else if (chkValorDevido.Checked) and (rdgDevolucao.ItemIndex = 1) then sSQL := sSQL +
   '   AND ( ((NVL(PAR_DEV.VLR_DEV, 0) - NVL(PAR_PAG.VLR_PAG, 0)) > 0) ) '                  + #13;

   if chkItemAberto.Checked then
   begin
      sSQL := sSQL +
   '   AND EXISTS '                                                                          + #13 +
   '       ( '                                                                               + #13 +
   '       SELECT '                                                                          + #13 +
   '          HE.HMEDATAPREVISTA '                                                           + #13 +
   '       FROM '                                                                            + #13 +
   '          HISTMOVEMPTMO HE '                                                             + #13 +
   '       WHERE '                                                                           + #13 +
   '              HE.HMETIPOMOV           IN (1, 2, 3, 4, 6, 7) '                            + #13 +
   '          AND ( HE.HMECENTRALIZA      = 1 OR HE.HMEDESTACADO = 1 ) '                     + #13 +
   '          AND NVL(HE.FLGESTORNADO, 0) = 0 '                                              + #13;

   // filtro por Contrato
   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '          AND HE.IDCONTRATOEMPTMO   = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)         + #13;

   sSQL := sSQL +
   '          AND HE.HMEDATAPREVISTA    <= TO_DATE(' + sData + ', ''DD/MM/YYYY'') '          + #13 +

   '          AND ( (HE.HMEDATAEFETIVA  IS NULL) OR (HE.HMEDATAEFETIVA > TO_DATE(' + sData + ', ''DD/MM/YYYY'')) ) '                                                 + #13 +
   '          AND ( (HE.HMEVLREFETIVO   IS NULL) OR (HE.HMEDATAEFETIVA > TO_DATE(' + sData + ', ''DD/MM/YYYY'')) ) '                                                 + #13 +

   '          AND ( (HE.FLGQUITADO      IS NULL OR HE.FLGQUITADO = 0) OR ((HE.FLGQUITADO = 1) AND (HE.HMEDATAQUITABONO > TO_DATE(' + sData + ',''DD/MM/YYYY''))) ) ' + #13 +
   '          AND ( (HE.FLGABONADO      IS NULL OR HE.FLGABONADO = 0) OR ((HE.FLGABONADO = 1) AND (HE.HMEDATAQUITABONO > TO_DATE(' + sData + ',''DD/MM/YYYY''))) ) ' + #13 +

   '          AND HE.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO '                             + #13 +
   '       ) '                                                                               + #13;
   end;

   sSQL := sSQL +
   '   AND ( CON.IDCONTRATOEMPTMO   = SLD.IDCONTRATOEMPTMO ) '                               + #13 +
   '   AND ( CON.IDCONTRATOEMPTMO   = PAR_DEV.IDCONTRATOEMPTMO(+) ) '                        + #13 +
   '   AND ( CON.IDCONTRATOEMPTMO   = PAR_PAG.IDCONTRATOEMPTMO(+) ) '                        + #13 +
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
   '   AND ( ELP.IDPESSOA           = DEP.IDTITULAR ) '                                      + #13 +
   '   AND ( CON.IDBENEF            = DEP.IDPESSOA ) '                                       + #13 +
   '   AND ( CON.IDPESSOA           = DEP.IDTITULAR ) '                                      + #13 +
   '   AND ( PPP.IDSITPART          = SIT.IDSITPART ) '                                      + #13 +
   '   AND PPP.FLGDESATIVADO        = 0 '                                                    + #13 +

   'ORDER BY '                                                                               + #13;

   case rdgOrdenar.ItemIndex of
      0: sSQL := sSQL + '   TCE.IDTIPOCONTREMPTMO, CON.IDCONTRATOEMPTMO';
      1: sSQL := sSQL + '   TCE.IDTIPOCONTREMPTMO, PBF.NOME, CON.IDCONTRATOEMPTMO';
      2: sSQL := sSQL + '   TCE.IDTIPOCONTREMPTMO, SIT.DESCRICAO, PBF.NOME';
      3: sSQL := sSQL + '   TCE.IDTIPOCONTREMPTMO, ELP.MATRICULA, CON.IDCONTRATOEMPTMO';
   end;

   with dtmRelDividas.qryDividas do
   begin
      Close;
      SQL.Text := sSQL;

    //Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
    //SQL.SaveToFile(Sistema.TempDir + 'EP-RelDividas.txt');
      SQL.SaveToFile(ftempregra + '\' + 'EP-RelDividas.txt');
      Open;
   end;
end;



procedure TcfgRelDividas.molListaPatrobtnInvertePatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnInvertePatroClick(Sender);
end;



procedure TcfgRelDividas.molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnMarcaTodosPatroClick(Sender);
end;



procedure TcfgRelDividas.molListaPlanobtnInvertePlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnInvertePlanoClick(Sender);
end;



procedure TcfgRelDividas.molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnMarcaTodosPlanoClick(Sender);
end;



procedure TcfgRelDividas.FiltraRelatorioAtuDia;
var
   sSQL           : String;
   sData          : String;
   sAno           : String;
   sMes           : String;
   sTipoContrato  : String;
   iContadorCima  : Integer;
   iContadorBaixo : Integer;

begin
   sData := QuotedStr(FormatDateTime('DD/MM/YYYY', edtDataRef.Date));
   sAno  := FormatDateTime('YYYY', edtDataRef.Date);
   sMes  := FormatDateTime('MM', edtDataRef.Date);

   sSQL :=

   'SELECT'                                                                                                     + #13 +
   '   CON.IDCONTRATOEMPTMO,'                                                                                   + #13 +
   '   CON.VLRCONTRATO,'                                                                                        + #13 +
   '   PTI.NOME AS NOME_TITULAR,'                                                                               + #13 +
   '   PBF.NOME AS NOME_BENEF,'                                                                                 + #13 +
   '   DECODE(CON.IDBENEF, CON.IDPESSOA, SIT.DESCRICAO, ''Pensionista'') AS SIT_PART,'                          + #13 +
   '   DEP.MATRICULA AS MATRICULA,'                                                                             + #13 +
   '   ELP.MATRICULA AS MATRICULA_TIT,'                                                                         + #13 +
   '   TCE.TCEDESCRICAO'                                                                                        + #13 +
   'FROM'                                                                                                       + #13 +
   '   PESSOA          PBF,'                                                                                    + #13 +
   '   PESSOA          PTI,'                                                                                    + #13 +
   '   CONTRATOEMPTMO  CON,'                                                                                    + #13 +
   '   DEPENTIT        DEP,'                                                                                    + #13 +
   '   ELEGPATRO       ELP,'                                                                                    + #13 +
   '   PARTPREVPLAN    PPP,'                                                                                    + #13 +
   '   TIPOCONTREMPTMO TCE,'                                                                                    + #13 +
   '   TIPOEMPTMO      TEP,'                                                                                    + #13 +
   '   VWMIGRACONTRATOEP MIG,'                                                                                  + #13 +
   '   SITPART         SIT'                                                                                     + #13 +
   'WHERE'                                                                                                      + #13 +
   '       TEP.IDEMPRESAPROP      = ' + IntToStr(Sistema.IdEmpresa)                                             + #13 +
   '   AND CON.FLGSITUACAO        <> ''C'''                                                                     + #13 +
   '   AND PTI.IDPESSOA           = CON.IDPESSOA'                                                               + #13 +
   '   AND PBF.IDPESSOA           = CON.IDBENEF'                                                                + #13 +

   '   AND ELP.IDPESSJUR          = CON.IDPATRO'                                                                + #13 +
   '   AND ELP.IDPESSOA           = CON.IDPESSOA'                                                               + #13 +
   
   '   AND DEP.IDTITULAR          = CON.IDPESSOA'                                                               + #13 +
   '   AND DEP.IDPESSOA           = CON.IDBENEF'                                                                + #13 +

   '   AND PPP.IDPESSJUR          = CON.IDPATRO'                                                                + #13 +
   '   AND PPP.IDPESSOA           = CON.IDPESSOA'                                                               + #13 +
   '   AND PPP.FLGDESATIVADO      = 0'                                                                          + #13 +

   '   AND SIT.IDSITPART          = PPP.IDSITPART'                                                              + #13 +

   '   AND TCE.IDTIPOCONTREMPTMO  = CON.IDTIPOCONTREMPTMO'                                                      + #13 +
   '   AND TEP.IDTIPOEMPTMO       = TCE.IDTIPOEMPTMO'                                                           + #13 +

   '   AND MIG.IDCONTRATOEMPTMO      = CON.IDCONTRATOEMPTMO'                                                    + #13 +
   '   AND MIG.DATAMIGRA             = (SELECT MAX(DATAMIGRA)'                                                  + #13 +
   '                                    FROM   VWMIGRACONTRATOEP'                                               + #13 +
   '                                    WHERE  IDCONTRATOEMPTMO = CON.IDCONTRATOEMPTMO'                         + #13 +
   '                                    AND    DATAMIGRA <= TO_DATE(' + sData + ', ''DD/MM/YYYY''))'            + #13 +
   '   AND CON.IDPATRO              IN (' + molListaPatro.PegaPatro + ') '                                      + #13 +
   '   AND MIG.IDPLANOCONTATU       IN (' + molListaPlano.PegaPlano + ') '                                      + #13;

   // Tipo de Contrato
   if DBcboTipoContr.LookupValue <> '' then sSQL := sSQL +
   '   AND CON.IDTIPOCONTREMPTMO    = ' + DBcboTipoContr.LookupValue                                            + #13;

   // filtro por Contrato
   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '   AND CON.IDCONTRATOEMPTMO     = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)                       + #13;

   sSQL := sSQL +
   'ORDER BY'                                                                                                   + #13;

   case rdgOrdenar.ItemIndex of
      0: sSQL := sSQL + '   TCE.IDTIPOCONTREMPTMO, CON.IDCONTRATOEMPTMO';
      1: sSQL := sSQL + '   TCE.IDTIPOCONTREMPTMO, PBF.NOME, CON.IDCONTRATOEMPTMO';
      2: sSQL := sSQL + '   TCE.IDTIPOCONTREMPTMO, SIT.DESCRICAO, PBF.NOME';
      3: sSQL := sSQL + '   TCE.IDTIPOCONTREMPTMO, ELP.MATRICULA, CON.IDCONTRATOEMPTMO';
   end;
   
   dtmRelDividas.qryDividas.Open;

   qryContrato.SQL.Clear;
   qryContrato.Sql.Text := sSQL;
   qryContrato.Open;

   iContadorCima  := 0;
   iContadorBaixo := 0;

   while not qryContrato.eof do
   begin
      sTipoContrato  := qryContrato.fieldByName('TCEDESCRICAO').AsString;
      inc(iContadorCima);

      while (not qryContrato.Eof) and
            (sTipoContrato = qryContrato.fieldByName('TCEDESCRICAO').AsString)  do
      begin
      
         qryContrato.Next;
      end;
   end;

   qryContrato.First;

   frmProgressoDuplo.MostraFormProgressoDuplo('Processando Tipo de Contrato...',          // Legenda de cima
                                              'Processando Contratos...',                 // Legenda de Baixo
                                              0,                                          // Mínimo de cima
                                              0,                                          // Mínimo de baixo
                                              iContadorCima,                              // Máximo de cima
                                              0,                                          // Máximo de baixo
                                              True,                                       // Botão visível
                                              True                                        // Botão habilitado
                                             );

   iContadorCima  := 0;
   iContadorBaixo := 0;

   while not qryContrato.Eof do
   begin

      sTipoContrato  := qryContrato.fieldByName('TCEDESCRICAO').AsString;
      iContadorBaixo := 0;

      Inc(iContadorCima);

      while (not qryContrato.Eof) and
            (sTipoContrato = qryContrato.fieldByName('TCEDESCRICAO').AsString)  do
      begin

         inc(iContadorBaixo);

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
         frmProgressoDuplo.AndaFormProgressoDuplo(iContadorCima, iContadorBaixo);

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
            dtmRelDividas.qryDividas.Append;
            dtmRelDividas.qryDividasIDCONTRATOEMPTMO.AsFloat    := qryContratoIDCONTRATOEMPTMO.AsFloat;
            dtmRelDividas.qryDividasNOME_TITULAR.AsString       := qryContratoNOME_TITULAR.AsString;
            dtmRelDividas.qryDividasNOME_BENEF.AsString         := qryContratoNOME_BENEF.AsString;
            dtmRelDividas.qryDividasSIT_PART.AsString           := qryContratoSIT_PART.AsString;
            dtmRelDividas.qryDividasMATRICULA.AsString          := qryContratoMATRICULA.AsString;
            dtmRelDividas.qryDividasMATRICULA_TIT.AsString      := qryContratoMATRICULA_TIT.AsString;
            dtmRelDividas.qryDividasTCEDESCRICAO.AsString       := qryContratoTCEDESCRICAO.AsString;
            dtmRelDividas.qryDividasHMEDATAATUALIZA.AsDateTime  := qrySaldoDevHMEDATAATUALIZA.AsDateTime;
            dtmRelDividas.qryDividasHMESALDODEV.AsCurrency      := qrySaldoDevHMESALDODEV.AsCurrency;
            dtmRelDividas.qryDividasHMEPARCELA.AsInteger        := qrySaldoDevHMEPARCELA.AsInteger;
            dtmRelDividas.qryDividasHMENUMPARCELAS.AsInteger    := qrySaldoDevHMENUMPARCELAS.AsInteger;
            dtmRelDividas.qryDividasDEVE.AsCurrency             := qryParcDev.FieldByName('VLR_DEV').AsCurrency - qryParcPag.FieldByName('VLR_PAG').AsCurrency;
            dtmRelDividas.qryDividasTOTAL_DEV.AsCurrency        := qrySaldoDevHMESALDODEV.AsCurrency + (qryParcDev.FieldByName('VLR_DEV').AsCurrency - qryParcPag.FieldByName('VLR_PAG').AsCurrency);
            dtmRelDividas.qryDividas.Post;
         end;

         qryContrato.Next;
      end;
   end;

   frmProgressoDuplo.EscondeFormProgressoDuplo;

end;



procedure TcfgRelDividas.MontaQueryParcDeve(sData : String);
var
   sSQL : String;
begin
   sSQL :=
   '   SELECT '                                                                              + #13 +
   '      CON.IDCONTRATOEMPTMO, SUM(NVL(HME.HMEVLRPREVISTO, 0)) AS VLR_DEV '                 + #13 +
   '   FROM '                                                                                + #13 +
   '      HISTMOVEMPTMO HME, CONTRATOEMPTMO CON '                                            + #13 +
   '   WHERE '                                                                               + #13 +
   '          CON.IDCONTRATOEMPTMO  = :PIDCONTRATOEMPTMO'                                    + #13;

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

   '      AND HME.HMEDATAPREVISTA    <= TO_DATE(' + sData + ', ''DD/MM/YYYY'') '             + #13 +

   '      AND ( CON.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO ) '                              + #13 +
   '   GROUP BY '                                                                            + #13 +
   '      CON.IDCONTRATOEMPTMO '                                                             + #13;

   qryParcDev.Sql.Clear;
   qryParcDev.Sql.Text := sSQL;
end;


procedure TcfgRelDividas.MontaQueryParcPag(sData: String);
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
   '          CON.IDCONTRATOEMPTMO  = :PIDCONTRATOEMPTMO'                                    + #13;

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
   '          ) '                                                                                              + #13 +

   '      AND ( CON.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO ) '                              + #13 +
   '   GROUP BY '                                                                            + #13 +
   '      CON.IDCONTRATOEMPTMO '                                                             + #13;

   qryParcPag.Sql.Clear;
   qryParcPag.Sql.Text := sSQL;
end;



end.
