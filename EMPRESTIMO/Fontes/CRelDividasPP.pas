unit CRelDividasPP;

// Alterações:
{--------------------------------------------------------------------------------------------------
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
   TcfgRelDividasPP = class(TcfgRel)
      Label1: TLabel;
      Label2: TLabel;
      DBcboTipoEmptmo: TwwDBLookupCombo;
      DBcboTipoContrato: TwwDBLookupCombo;
      Panel1: TPanel;
      molContratoEmptmo: TmolContratoEmptmo;
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
      chkSaldoDevedor: TCheckBox;
      rdgDevolucao: TRadioGroup;
      molListaPlano: TmolListaPlanoContab;
      rdgQuitacao: TRadioGroup;
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
      qryLookTipoContrIDPLANOPREV: TFloatField;

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

      function  MontaSQLRelatorio: String;
      function  MontaSQLContrato: String;


   public   // Public declarations


   end;



var
  cfgRelDividasPP: TcfgRelDividasPP;



implementation
{$R *.DFM}
uses
   dLookEmptmo, UDiasUteis, USistema, uFuncoesEmptmo, dEmptmo, dRelDividasPP, uMensErro,
   uCalcEmptmo, fProgressoDuplo, uTypesEmptmo;



procedure TcfgRelDividasPP.AbreQueries;
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




procedure TcfgRelDividasPP.MontaQuery;
begin
   inherited;

   with dtmRelDividasPP do
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

      lblItensEmAberto.Visible   := chkParcelasAberto.Checked;
      lblCOMSaldoDevedor.Visible := chkSaldoDevedor.Checked;
      lblSEMSaldoDevedor.Visible := chkSaldoZERO.Checked;

      bSeparador  := chkLinhas.Checked;

      // determina se as linhas do relatório serão impressas em cores alternadas, e qual cor usar
      bCorlinha   := chkCorLinha.Checked;
      CorLinha    := cboCorLinha.SelectedColor;

      memPatro.RichText := molListaPatro.ListaPatro;
      memPlano.RichText := molListaPlano.ListaPlano;
   end;

   ParametrosSistema;

   if dtmEmptmo.qryParamEmptmoFLGCALCDIA.AsInteger = 1 then
   begin
      if MsgDlg('Contratos que não tiverem o saldo atualizado até ' + edtDataRef.Text +
                ' não serão exibidos.' + #13 + #13 + 'Deseja prosseguir?', 'Empréstimo',
                mtConfirmation, [mbYes, mbNo], 0) = mrNo then
      begin
         Repaint;
         Exit;
      end;
      Repaint;
   end;

   case dtmEmptmo.qryParamEmptmoFLGCALCDIA.AsInteger of
      0: FiltraRelatorio;
      1: FiltraRelatorioAtuDia;
   end;
end;



procedure TcfgRelDividasPP.FormShow(Sender: TObject);
begin
   inherited;

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

   rdgDevolucao.Visible    := (dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger <> 1);
end;



procedure TcfgRelDividasPP.DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
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



procedure TcfgRelDividasPP.DBcboTipoEmptmoExit(Sender: TObject);
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



procedure TcfgRelDividasPP.FiltraRelatorio;
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
   'SELECT '                                                                                          + #13 +
   '   PTR.NOME AS NOMEPATRO, PPC.NOME AS NOMEPLANO, '                                                + #13 +

   '   (PPC.NOME || '' - '' || PTR.NOME) AS NOMEPLANOPATRO, '                                         + #13 +

   '   TCE.TCEDESCRICAO, '                                                                            + #13 +
   '   CON.IDCONTRATOEMPTMO, '                                                                        + #13 +
   '   CON.VLRCONTRATO, '                                                                             + #13 +

   '   CON.TXJUROS, CON.VLRCONTRATO, CON.DATACREDITO, CON.NUMPARCELAS, '                              + #13 +

   '   PTI.NOME AS NOME_TITULAR, '                                                                    + #13 +
   '   PBF.NOME AS NOME_BENEF, '                                                                      + #13 +
   '   DECODE(CON.IDBENEF, CON.IDPESSOA, SIT.DESCRICAO, ''Pensionista'') AS SIT_PART, '               + #13 +
   '   DEP.MATRICULA AS MATRICULA, '                                                                  + #13 +
   '   ELP.MATRICULA AS MATRICULA_TIT, '                                                              + #13 +
   '   SLD.HMEDATAATUALIZA, SLD.HMESALDODEV, SLD.HMEPARCELA, SLD.HMENUMPARCELAS, '                    + #13 +
   '   (NVL(PAR_DEV.VLR_DEV, 0) - NVL(PAR_PAG.VLR_PAG, 0)) AS DEVE, '                                 + #13 +

   '   (NVL(SLD.HMESALDODEV, 0) + (NVL(PAR_DEV.VLR_DEV, 0) - NVL(PAR_PAG.VLR_PAG, 0))) AS TOTAL_DEV, '    + #13 +

   '   PAR_QUANT.QUANT_PARCELAS, PAR_ANT.HMEDATAPREVISTA AS PRIMEIRA_DATA, '                          + #13 +

   '   PAR_PAG.VLR_PAG '                                                                              + #13 +

   'FROM '                                                                                            + #13 +
   '   PESSOA            PBF, '                                                                       + #13 +
   '   PESSOA            PTI, '                                                                       + #13 +
   '   PESSOA            PTR, '                                                                       + #13 +
   '   PLANPREVCONTABIL  PPC, '                                                                       + #13 +
   '   CONTRATOEMPTMO    CON, '                                                                       + #13 +
   '   DEPENTIT          DEP, '                                                                       + #13 +
   '   ELEGPATRO         ELP, '                                                                       + #13 +
   '   PARTPREVPLAN      PPP, '                                                                       + #13 +
   '   TIPOCONTREMPTMO   TCE, '                                                                       + #13 +
   '   SITPART           SIT, '                                                                       + #13 +
   '   TIPOEMPTMO        TEP, '                                                                       + #13;

   if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then sSQL := sSQL +
   '   PLANPREVXCONTABIL PXC, '                                                                       + #13;

   // ----------------------------------------------------------------------------------------------
   // Saldo Devedor
   // ----------------------------------------------------------------------------------------------

   sSQL := sSQL +
   '   ( '                                                                                            + #13 +
   '   SELECT '                                                                                       + #13 +
   '      CON.IDCONTRATOEMPTMO, '                                                                     + #13 +
   '      HME.HMEDATAATUALIZA, HME.HMESALDODEV, HME.HMEPARCELA, HME.HMENUMPARCELAS '                  + #13 +
   '   FROM '                                                                                         + #13 +
   '      HISTMOVEMPTMO  HME, '                                                                       + #13 +
   '      CONTRATOEMPTMO CON, '                                                                       + #13 +
   '      ( '                                                                                         + #13 +
   '      SELECT '                                                                                    + #13 +
   '         CON.IDCONTRATOEMPTMO, MAX(IDHISTMOVEMPTMO) AS IDHISTMOVEMPTMO '                          + #13 +
   '      FROM '                                                                                      + #13 +
   '         HISTMOVEMPTMO HME, CONTRATOEMPTMO CON, '                                                 + #13 +
   '         ITEMXTIPOCONTR ITC, ITEMEMPTMO ITE, TIPOCONTREMPTMO TCE '                                + #13 +
   '      WHERE '                                                                                     + #13 +
   '             CON.FLGSITUACAO         <> ''C'' '                                                   + #13;

   // Tipo de Contrato
   if DBcboTipoContrato.LookupValue <> '' then sSQL := sSQL +
   '         AND CON.IDTIPOCONTREMPTMO    = ' + DBcboTipoContrato.LookupValue                         + #13;

   // filtro por Plano e Patrocinadora
   sSQL := sSQL +
   '         AND CON.IDPATRO              IN (' + molListaPatro.PegaPatro + ') '                      + #13;

   // filtro por Plano
   if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger <> 1 then sSQL := sSQL +
   '         AND CON.IDPLANOPREV          IN (' + molListaPlano.PegaPlano + ') '                      + #13;

   // filtro por Contrato
   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '         AND CON.IDCONTRATOEMPTMO     = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)       + #13;

   sSQL := sSQL +
   '         AND ITC.ITCTRATASALDODEV    <> 0 '                                                       + #13 +
   '         AND ( (HME.FLGESTORNADO      IS NULL) OR (HME.FLGESTORNADO = 0) ) '                      + #13 +
   '         AND ( HME.HMEDATAATUALIZA    <= '                                                        + #13 +
   '               ( '                                                                                + #13 +
   '               SELECT '                                                                           + #13 +
   '                  DECODE(MAX(H.HMEDATAATUALIZA), NULL, TO_DATE(' + sData + ', ''DD/MM/YYYY''), '  + #13 +
   '                                                       MAX(H.HMEDATAATUALIZA)) '                  + #13 +
   '               FROM '                                                                             + #13 +
   '                  HISTMOVEMPTMO   H, '                                                            + #13 +
   '                  CONTRATOEMPTMO  C, '                                                            + #13 +
   '                  ITEMXTIPOCONTR  IT '                                                            + #13 +
   '               WHERE '                                                                            + #13 +
   '                      C.IDCONTRATOEMPTMO    = CON.IDCONTRATOEMPTMO '                              + #13 +
   '                  AND H.HMEDATAATUALIZA    <= TO_DATE(' + sData + ', ''DD/MM/YYYY'') '            + #13 +
   '                  AND IT.ITCTRATASALDODEV  <> 0 '                                                 + #13 +
   '                  AND HME.HMEANOCOMPETENCIA = ' + sAno                                            + #13 +
   '                  AND HME.HMEMESCOMPETENCIA = ' + sMes                                            + #13 +
   '                  AND ( H.FLGESTORNADO      = 0 OR H.FLGESTORNADO IS NULL ) '                     + #13 +
   '                  AND H.IDCONTRATOEMPTMO    = C.IDCONTRATOEMPTMO '                                + #13 +
   '                  AND C.IDTIPOCONTREMPTMO   = IT.IDTIPOCONTREMPTMO '                              + #13 +
   '                  AND H.IDITEMEMPTMO        = IT.IDITEMEMPTMO '                                   + #13 +
   '               ) '                                                                                + #13 +
   '             ) '                                                                                  + #13 +

   '         AND ( (RTRIM(LTRIM(TO_CHAR(HME.HMEANOCOMPETENCIA, ''0000'')))) || (RTRIM(LTRIM(TO_CHAR(HME.HMEMESCOMPETENCIA, ''00'')))) ) <= ' + QuotedStr(sAno + sMes) + #13 +

   '         AND ( HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO ) '                                  + #13 +
   '         AND ( CON.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPTMO ) '                                 + #13 +
   '         AND ( CON.IDTIPOCONTREMPTMO  = TCE.IDTIPOCONTREMPTMO ) '                                 + #13 +
   '         AND ( TCE.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPTMO ) '                                 + #13 +
   '         AND ( HME.IDITEMEMPTMO       = ITE.IDITEMEMPTMO ) '                                      + #13 +
   '         AND ( ITE.IDITEMEMPTMO       = ITC.IDITEMEMPTMO ) '                                      + #13 +
   '         AND ( HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO ) '                                      + #13 +
   '      GROUP BY '                                                                                  + #13 +
   '         CON.IDCONTRATOEMPTMO '                                                                   + #13 +
   '      ) MAX '                                                                                     + #13 +
   '   WHERE '                                                                                        + #13 +
   '          ( CON.FLGSITUACAO        <> ''C'' ) '                                                   + #13 +
   '      AND ( CON.IDCONTRATOEMPTMO   = HME.IDCONTRATOEMPTMO ) '                                     + #13 +
   '      AND ( CON.IDCONTRATOEMPTMO   = MAX.IDCONTRATOEMPTMO ) '                                     + #13 +
   '      AND ( HME.IDHISTMOVEMPTMO    = MAX.IDHISTMOVEMPTMO ) '                                      + #13 +
   '   ) SLD, '                                                                                       + #13 +

   // ----------------------------------------------------------------------------------------------
   // FIM Saldo devedor
   // ----------------------------------------------------------------------------------------------



   // ----------------------------------------------------------------------------------------------
   // Valor total gerado
   // ----------------------------------------------------------------------------------------------

   '   ( '                                                                                            + #13 +
   '   SELECT '                                                                                       + #13 +
   '      CON.IDCONTRATOEMPTMO, SUM(NVL(HME.HMEVLRPREVISTO, 0)) AS VLR_DEV '                          + #13 +
   '   FROM '                                                                                         + #13 +
   '      HISTMOVEMPTMO HME, CONTRATOEMPTMO CON '                                                     + #13 +
   '   WHERE '                                                                                        + #13 +
   '          CON.FLGSITUACAO       <> ''C'' '                                                        + #13;

   // Tipo de Contrato
   if DBcboTipoContrato.LookupValue <> '' then sSQL := sSQL +
   '      AND CON.IDTIPOCONTREMPTMO  = ' + DBcboTipoContrato.LookupValue                              + #13;

   // filtro por Plano e Patrocinadora
   sSQL := sSQL +
   '      AND CON.IDPATRO            IN (' + molListaPatro.PegaPatro + ') '                           + #13;

   // filtro por Plano
   if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger <> 1 then sSQL := sSQL +
   '      AND CON.IDPLANOPREV        IN (' + molListaPlano.PegaPlano + ') '                           + #13;

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
   '      AND HME.HMETIPOMOV         IN (1, 2, 3, 4, 6, 7) '                                          + #13 +
   '      AND HME.HMESEQCOBRANCA     = 1 '                                                            + #13 +
   '      AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) ) '                               + #13 +
   '      AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO IS NULL) ) '                           + #13 +

   '      AND HME.HMEDATAPREVISTA    <= TO_DATE(' + sData + ', ''DD/MM/YYYY'') '                      + #13 +

   '      AND ( CON.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO ) '                                       + #13 +
   '   GROUP BY '                                                                                     + #13 +
   '      CON.IDCONTRATOEMPTMO '                                                                      + #13 +
   '   ) PAR_DEV, '                                                                                   + #13 +

   // ----------------------------------------------------------------------------------------------
   // FIM Valor total gerado
   // ----------------------------------------------------------------------------------------------



   // ----------------------------------------------------------------------------------------------
   // Valor total já pago
   // ----------------------------------------------------------------------------------------------

   '   ( '                                                                                            + #13 +
   '   SELECT '                                                                                       + #13 +
   '      CON.IDCONTRATOEMPTMO, '                                                                     + #13 +

   '      SUM(DECODE(FLGQUITADO, 1, NVL(HME.HMEVLRPREVISTO, 0), '                                     + #13 +
   '                                DECODE(FLGABONADO, 1, NVL(HME.HMEVLRPREVISTO, 0), '               + #13 +
   '                                                      NVL(HME.HMEVLREFETIVO, 0)))) AS VLR_PAG '   + #13 +

   '   FROM '                                                                                         + #13 +
   '      HISTMOVEMPTMO HME, CONTRATOEMPTMO CON '                                                     + #13 +
   '   WHERE '                                                                                        + #13 +
   '          CON.FLGSITUACAO       <> ''C'' '                                                        + #13;

   // Tipo de Contrato
   if DBcboTipoContrato.LookupValue <> '' then sSQL := sSQL +
   '      AND CON.IDTIPOCONTREMPTMO  = ' + DBcboTipoContrato.LookupValue                              + #13;

   // filtro por Plano e Patrocinadora
   sSQL := sSQL +
   '      AND CON.IDPATRO            IN (' + molListaPatro.PegaPatro + ') '                           + #13;

   // filtro por Plano
   if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger <> 1 then sSQL := sSQL +
   '      AND CON.IDPLANOPREV        IN (' + molListaPlano.PegaPlano + ') '                           + #13;

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
   '      AND HME.HMETIPOMOV         IN (1, 2, 3, 4, 6, 7) '                                          + #13 +
   '      AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) ) '                               + #13 +
   '      AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO IS NULL) ) '                           + #13 +

   '      AND HME.HMEDATAPREVISTA    <= TO_DATE(' + sData + ', ''DD/MM/YYYY'') '                      + #13 +

   '      AND ( '                                                                                              + #13 +
   '          (HME.HMEDATAEFETIVA    <= TO_DATE(' + sData + ', ''DD/MM/YYYY'')) '                              + #13 +
   '       OR ( (HME.FLGQUITADO = 1) AND (HME.HMEDATAQUITABONO <= TO_DATE(' + sData + ',''DD/MM/YYYY'')) ) '   + #13 +
   '       OR ( (HME.FLGABONADO = 1) AND (HME.HMEDATAQUITABONO <= TO_DATE(' + sData + ',''DD/MM/YYYY'')) ) '   + #13 +
   '          ) '                                                                                              + #13 +

   '      AND ( CON.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO ) '                                       + #13 +
   '   GROUP BY '                                                                                     + #13 +
   '      CON.IDCONTRATOEMPTMO '                                                                      + #13 +
   '   ) PAR_PAG, '                                                                                   + #13 +

   // ----------------------------------------------------------------------------------------------
   // FIM Valor total já pago
   // ----------------------------------------------------------------------------------------------



   // ----------------------------------------------------------------------------------------------
   // Quantidade de Parcelas em Aberto
   // ----------------------------------------------------------------------------------------------

   '   ( '                                                                                            + #13 +
   '   SELECT '                                                                                       + #13 +
   '      CON.IDCONTRATOEMPTMO, '                                                                     + #13 +
   '      COUNT(DISTINCT(HME.HMEPARCELA)) AS QUANT_PARCELAS '                                         + #13 +
   '   FROM '                                                                                         + #13 +
   '      HISTMOVEMPTMO HME, CONTRATOEMPTMO CON '                                                     + #13 +
   '   WHERE '                                                                                        + #13 +
   '          CON.FLGSITUACAO       <> ''C'' '                                                        + #13;

   // Tipo de Contrato
   if DBcboTipoContrato.LookupValue <> '' then sSQL := sSQL +
   '      AND CON.IDTIPOCONTREMPTMO  = ' + DBcboTipoContrato.LookupValue                              + #13;

   // filtro por Plano e Patrocinadora
   sSQL := sSQL +
   '      AND CON.IDPATRO            IN (' + molListaPatro.PegaPatro + ') '                           + #13;

   // filtro por Plano
   if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger <> 1 then sSQL := sSQL +
   '      AND CON.IDPLANOPREV        IN (' + molListaPlano.PegaPlano + ') '                           + #13;

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
   '      AND HME.HMETIPOMOV         IN (1, 2, 3, 4, 6, 7) '                                          + #13 +
   '      AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) ) '                               + #13 +
   '      AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO IS NULL) ) '                           + #13 +

   '      AND HME.HMEDATAPREVISTA    <= TO_DATE(' + sData + ', ''DD/MM/YYYY'') '                      + #13 +

   '      AND ( '                                                                                           + #13 +
   '          (HME.HMEDATAEFETIVA       > ' + OraData(edtDataRef.Date) + ') OR '                            + #13 +
   '          ( '                                                                                           + #13 +
   '          (HME.HMEDATAEFETIVA       IS NULL) AND '                                                      + #13 +
   '          (NVL(HME.FLGQUITADO, 0)   = 0) AND '                                                          + #13 +
   '          (NVL(HME.FLGABONADO, 0)   = 0) '                                                              + #13 +
   '          ) OR '                                                                                        + #13 +
   '          ( (HME.FLGQUITADO = 1) AND (HME.HMEDATAQUITABONO > ' + OraData(edtDataRef.Date) + ') ) OR '   + #13 +
   '          ( (HME.FLGABONADO = 1) AND (HME.HMEDATAQUITABONO > ' + OraData(edtDataRef.Date) + ') ) '      + #13 +
   '          ) '                                                                                           + #13 +

   '      AND ( CON.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO ) '                                       + #13 +

   '   GROUP BY '                                                                                     + #13 +
   '      CON.IDCONTRATOEMPTMO '                                                                      + #13 +
   '   ) PAR_QUANT, '                                                                                 + #13 +

   // ----------------------------------------------------------------------------------------------
   // FIM Quantidade de Parcelas em Aberto
   // ----------------------------------------------------------------------------------------------



   // ----------------------------------------------------------------------------------------------
   // Parcela mais antiga em Aberto
   // ----------------------------------------------------------------------------------------------

   '   ( '                                                                                            + #13 +
   '   SELECT '                                                                                       + #13 +
   '      CON.IDCONTRATOEMPTMO, '                                                                     + #13 +
   '      MIN(HME.HMEDATAPREVISTA) AS HMEDATAPREVISTA '                                               + #13 +
   '   FROM '                                                                                         + #13 +
   '      HISTMOVEMPTMO HME, CONTRATOEMPTMO CON '                                                     + #13 +
   '   WHERE '                                                                                        + #13 +
   '          CON.FLGSITUACAO       <> ''C'' '                                                        + #13;

   // Tipo de Contrato
   if DBcboTipoContrato.LookupValue <> '' then sSQL := sSQL +
   '      AND CON.IDTIPOCONTREMPTMO  = ' + DBcboTipoContrato.LookupValue                              + #13;

   // filtro por Plano e Patrocinadora
   sSQL := sSQL +
   '      AND CON.IDPATRO            IN (' + molListaPatro.PegaPatro + ') '                           + #13;

   // filtro por Plano
   if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger <> 1 then sSQL := sSQL +
   '      AND CON.IDPLANOPREV        IN (' + molListaPlano.PegaPlano + ') '                           + #13;

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
   '      AND HME.HMETIPOMOV         IN (1, 2, 3, 4, 6, 7) '                                          + #13 +
   '      AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) ) '                               + #13 +
   '      AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO IS NULL) ) '                           + #13 +

   '      AND HME.HMEDATAPREVISTA    <= TO_DATE(' + sData + ', ''DD/MM/YYYY'') '                      + #13 +

   '      AND ( '                                                                                           + #13 +
   '          (HME.HMEDATAEFETIVA       > ' + OraData(edtDataRef.Date) + ') OR '                            + #13 +
   '          ( '                                                                                           + #13 +
   '          (HME.HMEDATAEFETIVA       IS NULL) AND '                                                      + #13 +
   '          (NVL(HME.FLGQUITADO, 0)   = 0) AND '                                                          + #13 +
   '          (NVL(HME.FLGABONADO, 0)   = 0) '                                                              + #13 +
   '          ) OR '                                                                                        + #13 +
   '          ( (HME.FLGQUITADO = 1) AND (HME.HMEDATAQUITABONO > ' + OraData(edtDataRef.Date) + ') ) OR '   + #13 +
   '          ( (HME.FLGABONADO = 1) AND (HME.HMEDATAQUITABONO > ' + OraData(edtDataRef.Date) + ') ) '      + #13 +
   '          ) '                                                                                           + #13 +

   '      AND ( CON.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO ) '                                       + #13 +

   '   GROUP BY '                                                                                     + #13 +
   '      CON.IDCONTRATOEMPTMO '                                                                      + #13 +
   '   ) PAR_ANT '                                                                                    + #13 +

   // ----------------------------------------------------------------------------------------------
   // FIM Parcela mais antiga em Aberto
   // ----------------------------------------------------------------------------------------------


   'WHERE '                                                                                           + #13 +

   // filtro por Empresa Proprietátia
   '       TEP.IDEMPRESAPROP        = ' + IntToStr(Sistema.IDEmpresa)                                 + #13 +

   // filtro por Patrocinadora
   '   AND CON.IDPATRO              IN (' + molListaPatro.PegaPatro + ') '                            + #13;

   // filtro por Plano
   if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then sSQL := sSQL +
   '  AND PXC.IDPLANOPREV           IN (' + molListaPlano.PegaPlano + ') '                            + #13
   else sSQL := sSQL +
   '  AND CON.IDPLANOPREV           IN (' + molListaPlano.PegaPlano + ') '                            + #13;

   // filtro por Contrato
   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '   AND CON.IDCONTRATOEMPTMO     = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)             + #13;

   // filtro por Tipo de Empréstimo
   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   '   AND TCE.IDTIPOEMPTMO         = ' + DBcboTipoEmptmo.LookupValue                                 + #13 +
   '   AND TEP.IDTIPOEMPTMO         = ' + DBcboTipoEmptmo.LookupValue                                 + #13;

   // filtro por Tipo de Contrato
   if DBcboTipoContrato.LookupValue <> '' then sSQL := sSQL +
   '   AND CON.IDTIPOCONTREMPTMO    = ' + DBcboTipoContrato.LookupValue                               + #13 +
   '   AND TCE.IDTIPOCONTREMPTMO    = ' + DBcboTipoContrato.LookupValue                               + #13;

   // ----------------------------------------------------------------------------------------------

   // filtro por saldo devedor do contrato
   if chkSaldoZERO.Checked then
   begin
      sSQL := sSQL +
   '   AND ( SLD.HMESALDODEV        = 0 ) '                                                                 + #13;
   end
   else if not(chkSaldoZERO.Checked) and (rdgDevolucao.ItemIndex = 0) then
   begin
      sSQL := sSQL +
   '   AND ( (SLD.HMESALDODEV       > 0) OR ((NVL(PAR_DEV.VLR_DEV, 0) - NVL(PAR_PAG.VLR_PAG, 0)) <> 0) ) '  + #13;
   end
   else if not(chkSaldoZERO.Checked) and (rdgDevolucao.ItemIndex = 1) then
   begin
      sSQL := sSQL +
   '   AND ( (SLD.HMESALDODEV       > 0) OR ((NVL(PAR_DEV.VLR_DEV, 0) - NVL(PAR_PAG.VLR_PAG, 0)) > 0) ) '   + #13;
   end;

   // ----------------------------------------------------------------------------------------------

   // ainda filtro por saldo devedor do contrato
   if chkSaldoDevedor.Checked then sSQL := sSQL +
   '   AND ( SLD.HMESALDODEV        > 0 ) '                                                           + #13;

   // filtro por SitPart
   if DBcboSitPart.LookupValue <> '' then sSQL := sSQL +
   '   AND SIT.IDSITPART            = ' + DBcboSitPart.LookupValue                                    + #13;

   sSQL := sSQL +
   '   AND ( CON.FLGSITUACAO        <> ''C'' ) '                                                      + #13;

   // filtro por saldo parcelas vencidas em aberto
   if (chkParcelasAberto.Checked) and (rdgDevolucao.ItemIndex = 0) then sSQL := sSQL +
   '   AND ( ((NVL(PAR_DEV.VLR_DEV, 0) - NVL(PAR_PAG.VLR_PAG, 0)) <> 0) ) '                           + #13

   else if (chkParcelasAberto.Checked) and (rdgDevolucao.ItemIndex = 1) then sSQL := sSQL +
   '   AND ( ((NVL(PAR_DEV.VLR_DEV, 0) - NVL(PAR_PAG.VLR_PAG, 0)) > 0) ) '                            + #13;

   // ----------------------------------------------------------------------------------------------
   //
   // ----------------------------------------------------------------------------------------------

   if chkParcelasAberto.Checked then
   begin
      sSQL := sSQL +
   '   AND EXISTS '                                                                                   + #13 +
   '       ( '                                                                                        + #13 +
   '       SELECT '                                                                                   + #13 +
   '          HE.HMEDATAPREVISTA '                                                                    + #13 +
   '       FROM '                                                                                     + #13 +
   '          HISTMOVEMPTMO HE '                                                                      + #13 +
   '       WHERE '                                                                                    + #13 +
   '              HE.HMETIPOMOV        IN (1, 2, 3, 4, 6, 7) '                                        + #13 +
   '          AND ( HE.HMECENTRALIZA   = 1 OR HE.HMEDESTACADO = 1 ) '                                 + #13 +
   '          AND ( HE.FLGESTORNADO    = 0 OR HE.FLGESTORNADO IS NULL ) '                             + #13;

   // filtro por Contrato
   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '          AND HE.IDCONTRATOEMPTMO   = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)         + #13;

   sSQL := sSQL +
   '          AND HE.HMEDATAPREVISTA    <= TO_DATE(' + sData + ', ''DD/MM/YYYY'') '                   + #13 +

   '          AND ( (HE.HMEDATAEFETIVA  IS NULL) OR (HE.HMEDATAEFETIVA > TO_DATE(' + sData + ', ''DD/MM/YYYY'')) ) '                                                 + #13 +
   '          AND ( (HE.HMEVLREFETIVO   IS NULL) OR (HE.HMEDATAEFETIVA > TO_DATE(' + sData + ', ''DD/MM/YYYY'')) ) '                                                 + #13 +

   '          AND ( (HE.FLGQUITADO      IS NULL OR HE.FLGQUITADO = 0) OR ((HE.FLGQUITADO = 1) AND (HE.HMEDATAQUITABONO > TO_DATE(' + sData + ',''DD/MM/YYYY''))) ) ' + #13 +
   '          AND ( (HE.FLGABONADO      IS NULL OR HE.FLGABONADO = 0) OR ((HE.FLGABONADO = 1) AND (HE.HMEDATAQUITABONO > TO_DATE(' + sData + ',''DD/MM/YYYY''))) ) ' + #13 +

   '          AND HE.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO '                                      + #13 +
   '       ) '                                                                                        + #13;
   end;

   // ----------------------------------------------------------------------------------------------
   //
   // ----------------------------------------------------------------------------------------------

   if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then sSQL := sSQL +
   '   AND CON.IDPLANOORIGEM            = PXC.IDPLANPREVC '                                           + #13 +
   '   AND PXC.IDPLANOPREV              = PPC.IDPLANOPREV '                                           + #13
   else sSQL := sSQL +
   '   AND CON.IDPLANOPREV              = PPC.IDPLANOPREV '                                           + #13;

   sSQL := sSQL +
   '   AND ( CON.IDCONTRATOEMPTMO   = SLD.IDCONTRATOEMPTMO ) '                                        + #13 +
   '   AND ( CON.IDCONTRATOEMPTMO   = PAR_DEV.IDCONTRATOEMPTMO(+) ) '                                 + #13 +
   '   AND ( CON.IDCONTRATOEMPTMO   = PAR_PAG.IDCONTRATOEMPTMO(+) ) '                                 + #13 +
   '   AND ( CON.IDCONTRATOEMPTMO   = PAR_QUANT.IDCONTRATOEMPTMO ) '                                  + #13 +
   '   AND ( CON.IDCONTRATOEMPTMO   = PAR_ANT.IDCONTRATOEMPTMO(+) ) '                                 + #13 +

   '   AND ( CON.IDPESSOA           = PTI.IDPESSOA ) '                                                + #13 +
   '   AND ( CON.IDPESSOA           = ELP.IDPESSOA ) '                                                + #13 +
   '   AND ( CON.IDPATRO            = PTR.IDPESSOA ) '                                                + #13 +
   '   AND ( CON.IDBENEF            = PBF.IDPESSOA ) '                                                + #13 +
   '   AND ( CON.IDPESSOA           = PPP.IDPESSOA ) '                                                + #13 +
   '   AND ( CON.IDPATRO            = PPP.IDPESSJUR ) '                                               + #13 +
   '   AND ( ELP.IDPESSOA           = PPP.IDPESSOA ) '                                                + #13 +
   '   AND ( ELP.IDPESSJUR          = PPP.IDPESSJUR ) '                                               + #13 +
   '   AND ( PTR.IDPESSOA           = ELP.IDPESSJUR ) '                                               + #13 +
   '   AND ( CON.IDBENEF            = PBF.IDPESSOA ) '                                                + #13 +
   '   AND ( PTI.IDPESSOA           = ELP.IDPESSOA ) '                                                + #13 +
   '   AND ( PTI.IDPESSOA           = PPP.IDPESSOA ) '                                                + #13 +
   '   AND ( CON.IDTIPOCONTREMPTMO  = TCE.IDTIPOCONTREMPTMO ) '                                       + #13 +
   '   AND ( TCE.IDTIPOEMPTMO       = TEP.IDTIPOEMPTMO ) '                                            + #13 +
   '   AND ( ELP.IDPESSOA           = DEP.IDTITULAR ) '                                               + #13 +
   '   AND ( CON.IDBENEF            = DEP.IDPESSOA ) '                                                + #13 +
   '   AND ( CON.IDPESSOA           = DEP.IDTITULAR ) '                                               + #13 +
   '   AND ( PPP.IDSITPART          = SIT.IDSITPART ) '                                               + #13 +

   '   AND PPP.FLGDESATIVADO        = 0 '                                                             + #13 +

   'ORDER BY '                                                                                        + #13 +
   '   PPC.NOME, PTR.NOME, TCE.TCEDESCRICAO, '                                                        + #13;

   case rdgOrdenar.ItemIndex of
      0: sSQL := sSQL + '   CON.IDCONTRATOEMPTMO';
      1: sSQL := sSQL + '   PBF.NOME, CON.IDCONTRATOEMPTMO';
      3: sSQL := sSQL + '   ELP.MATRICULA, CON.IDCONTRATOEMPTMO';
   end;

   with dtmRelDividasPP.qryDividasPP do
   begin
      Close;
      SQL.Text := sSQL;
    //Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
    //SQL.SaveToFile(Sistema.TempDir + 'EP-RelDividasPP.txt');
      SQL.SaveToFile(ftempregra + '\' + 'EP-RelDividasPP.txt');
      Open;
   end;
end;



procedure TcfgRelDividasPP.FiltraRelatorioAtuDia;
var
   iPatro         : Integer;
   iPlano         : Integer;
   iTipoContr     : Integer;

   iContadorCima  : Integer;
   iContadorBaixo : Integer;

   iContadorPlano : Integer;
   iContadorPatro : Integer;

   iQuantTipoContr: Integer;
   iTotalPxPxTC   : Integer;

   bGrava         : Boolean;

   rSaldoDev      : TSaldoDevAnt;

   fSaldoDev      : Currency;
   fVlrAberto     : Currency;
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

   // ----------------------------------------------------------------------------------------------

   dtmRelDividasPP.qryDividasPP.Close;
   dtmRelDividasPP.qryDividasPP.Open;

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

                     if (DBcboTipoContrato.LookupValue <> '') and
                        (qryLookTipoContrIDTIPOCONTREMPTMO.AsInteger <> StrToInt(DBcboTipoContrato.LookupValue)) then
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

                        if DBcboTipoContrato.LookupValue <> '' then
                           ParamByName('PIDTIPOCONTRFILTRO').AsInteger  := StrToInt(DBcboTipoContrato.LookupValue);

                        if molContratoEmptmo.IDContrato > 0 then
                           ParamByName('PIDCONTRATOEMPTMO').AsFloat     := molContratoEmptmo.IDContrato;

                        ParamByName('PORDEM').AsInteger                 := rdgOrdenar.ItemIndex;

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

                        // Valor em Aberto ---------------------------------------------------------
                        with qryVlrDevido do
                        begin
                           LimpaParametros(qryVlrDevido);
                           ParamByName('PIDCONTRATOEMPTMO').AsFloat     := qryContratoIDCONTRATOEMPTMO.AsFloat;
                           ParamByName('PHMEDATAPREVISTA').AsDateTime   := edtDataRef.Date;

                           case rdgQuitacao.ItemIndex of
                              1: ParamByName('PNAOQUITACAO').AsInteger  := 1;
                              2: ParamByName('PQUITACAO').AsInteger     := 1;
                           end;

                           Open;
                        end;

                        with qryVlrPago do
                        begin
                           LimpaParametros(qryVlrPago);

                           ParamByName('PIDCONTRATOEMPTMO').AsFloat     := qryContratoIDCONTRATOEMPTMO.AsFloat;
                           ParamByName('PHMEDATAPREVISTA').AsDateTime   := edtDataRef.Date;

                           case rdgQuitacao.ItemIndex of
                              1: ParamByName('PNAOQUITACAO').AsInteger  := 1;
                              2: ParamByName('PQUITACAO').AsInteger     := 1;
                           end;

                           Open;
                        end;

                        fVlrAberto  := qryVlrDevidoVLR_DEV.AsFloat - qryVlrPagoVLR_PAG.AsFloat;

                        if (fVlrAberto = 0) and (chkParcelasAberto.Checked) then
                        begin
                           qryContrato.Next;
                           inc(iContadorBaixo);
                           frmProgressoDuplo.AndaFormProgressoDuplo(iContadorCima, iContadorBaixo);
                           Continue;
                        end;
                        // -------------------------------------------------------------------------

                        // Saldo Devedor -----------------------------------------------------------
                        rSaldoDev   := CalcEmptmo.SaldoDevAnt(qryContratoIDCONTRATOEMPTMO.AsFloat,
                                                              edtDataRef.Date,
                                                              -1,
                                                              -1,
                                                              False
                                                             );
                        // -------------------------------------------------------------------------

                        // Quant de Parcelas -------------------------------------------------------
                        with qryQuantParcelas do
                        begin
                           LimpaParametros(qryQuantParcelas);

                           ParamByName('PIDCONTRATOEMPTMO').AsFloat     := qryContratoIDCONTRATOEMPTMO.AsFloat;
                           ParamByName('PHMEDATAPREVISTA').AsDateTime   := edtDataRef.Date;

                           case rdgQuitacao.ItemIndex of
                              1: ParamByName('PNAOQUITACAO').AsInteger  := 1;
                              2: ParamByName('PQUITACAO').AsInteger     := 1;
                           end;

                           Open;
                        end;
                        // -------------------------------------------------------------------------

                        // Primeira Data -----------------------------------------------------------
                        with qryPrimeiraInadimplencia do
                        begin
                           LimpaParametros(qryPrimeiraInadimplencia);

                           ParamByName('PIDCONTRATOEMPTMO').AsFloat     := qryContratoIDCONTRATOEMPTMO.AsFloat;
                           ParamByName('PHMEDATAPREVISTA').AsDateTime   := edtDataRef.Date;

                           case rdgQuitacao.ItemIndex of
                              1: ParamByName('PNAOQUITACAO').AsInteger  := 1;
                              2: ParamByName('PQUITACAO').AsInteger     := 1;
                           end;

                           Open;
                        end;
                        // -------------------------------------------------------------------------

                        bGrava := True;

                        bGrava := ((rSaldoDev.fSaldoDevAnt <> 0) or (fVlrAberto <> 0));

                        if chkParcelasAberto.Checked  then bGrava := not(fVlrAberto = 0);
                        if chkSaldoDevedor.Checked    then bGrava := (rSaldoDev.fSaldoDevAnt > 0);
                        if chkSaldoZERO.Checked       then bGrava := (rSaldoDev.fSaldoDevAnt = 0);

                        if bGrava then
                        begin
                           dtmRelDividasPP.qryDividasPP.Insert;

                           dtmRelDividasPP.qryDividasPPIDCONTRATOEMPTMO.AsFloat  := qryContratoIDCONTRATOEMPTMO.AsFloat;
                           dtmRelDividasPP.qryDividasPPNOME_BENEF.AsString       := qryContratoNOME.AsString;
                           dtmRelDividasPP.qryDividasPPSIT_PART.AsString         := qryContratoSIT_PART.AsString;
                           dtmRelDividasPP.qryDividasPPMATRICULA.AsString        := qryContratoMATRICULA.AsString;
                           dtmRelDividasPP.qryDividasPPHMESALDODEV.AsCurrency    := rSaldoDev.fSaldoDevAnt;
                           dtmRelDividasPP.qryDividasPPTCEDESCRICAO.AsString     := qryContratoTCEDESCRICAO.AsString;
                           dtmRelDividasPP.qryDividasPPDEVE.AsCurrency           := fVlrAberto;
                           dtmRelDividasPP.qryDividasPPTOTAL_DEV.AsCurrency      := rSaldoDev.fSaldoDevAnt + fVlrAberto;
                           dtmRelDividasPP.qryDividasPPNOMEPLANO.AsString        := qryContratoNOMEPLANO.AsString;
                           dtmRelDividasPP.qryDividasPPNOMEPATRO.AsString        := qryContratoNOMEPATRO.AsString;

                           dtmRelDividasPP.qryDividasPPNOMEPLANOPATRO.AsString   := qryContratoNOMEPLANOPATRO.AsString;

                           dtmRelDividasPP.qryDividasPPQUANT_PARCELAS.AsInteger  := qryQuantParcelasQUANT_PARCELAS.AsInteger;

                           if qryQuantParcelasQUANT_PARCELAS.AsInteger > 0 then
                              dtmRelDividasPP.qryDividasPPPRIMEIRA_DATA.AsDateTime  := qryPrimeiraInadimplenciaHMEDATAPREVISTA.AsDateTime;

                           dtmRelDividasPP.qryDividasPPTXJUROS.AsCurrency        := qryContratoTXJUROS.AsCurrency;
                           dtmRelDividasPP.qryDividasPPVLRCONTRATO.AsCurrency    := qryContratoVLRCONTRATO.AsCurrency;
                           dtmRelDividasPP.qryDividasPPDATACREDITO.AsDateTime    := qryContratoDATACREDITO.AsDateTime;
                           dtmRelDividasPP.qryDividasPPNUMPARCELAS.AsInteger     := qryContratoNUMPARCELAS.AsInteger;

                           dtmRelDividasPP.qryDividasPP.Post;
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



procedure TcfgRelDividasPP.molListaPatrobtnInvertePatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnInvertePatroClick(Sender);
end;



procedure TcfgRelDividasPP.molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnMarcaTodosPatroClick(Sender);
end;



procedure TcfgRelDividasPP.molListaPlanobtnInvertePlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnInvertePlanoClick(Sender);
end;



procedure TcfgRelDividasPP.molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnMarcaTodosPlanoClick(Sender);
end;



function  TcfgRelDividasPP.MontaSQLRelatorio: String;
var
   sSQL : String;
begin
   sSQL :=
   'SELECT '                                                                                          + #13 +
   '   300000009999                                                   AS IDCONTRATOEMPTMO, '          + #13 +
   '   ''123456789012345678901234567890123456789012345678901234567890'' AS NOMEPLANO, '               + #13 +
   '   ''123456789012345678901234567890123456789012345678901234567890'' AS NOMEPATRO, '               + #13 +

   '   ''123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890'' AS NOMEPLANOPATRO, ' + #13 +

   '   ''123456789012345678901234567890123456789012345678901234567890'' AS NOME_TITULAR, '            + #13 +
   '   ''FRANCISCA CIRLEANDRA FERREIRA DE ANDRADE'' AS NOME_BENEF, '                                  + #13 +
   '   ''CANCELADO POR RESGATE DE CONTRIBUIÇÔES'' AS SIT_PART, '                                      + #13 +
   '   ''9999999-9'' AS MATRICULA, '                                                                  + #13 +
   '   ''123456789012345678901234567890123456789012345678901234567890'' AS MATRICULA_TIT, '           + #13 +

   '   10.71                                                          AS TXJUROS, '                   + #13 +
   '   99999.99                                                       AS VLRCONTRATO, '               + #13 +
   '   TO_DATE(''31/12/2002'', ''DD/MM/YYYY'')                            AS DATACREDITO, '           + #13 +
   '   0                                                              AS NUMPARCELAS, '               + #13 +

   '   0                                                              AS QUANT_PARCELAS, '            + #13 +
   '   TO_DATE(''31/12/2002'', ''DD/MM/YYYY'')                            AS PRIMEIRA_DATA, '         + #13 +

   '   TO_DATE(''31/12/2002'', ''DD/MM/YYYY'')                            AS HMEDATAATUALIZA, '       + #13 +

   '   99999.99                                                       AS HMESALDODEV, '               + #13 +
   '   0                                                              AS HMEPARCELA, '                + #13 +
   '   0                                                              AS HMENUMPARCELAS, '            + #13 +

   '   ''123456789012345678901234567890123456789012345678901234567890'' AS TCEDESCRICAO, '            + #13 +
   ' '                                                                                                + #13 +
   '   99999.99                                                       AS DEVE, '                      + #13 +
   '   99999.99                                                       AS TOTAL_DEV '                  + #13 +

   'FROM '                                                                                            + #13 +
   '   DUAL '                                                                                         + #13 +

   'WHERE '                                                                                           + #13 +
   '   1 = 2 '                                                                                        + #13 +

   'ORDER BY '                                                                                        + #13 +
   '   PPC.NOME, PTR.NOME, TCE.TCEDESCRICAO, '                                                        + #13;

   case rdgOrdenar.ItemIndex of
      0: sSQL := sSQL + '   IDCONTRATOEMPTMO';
      1: sSQL := sSQL + '   NOME_BENEF, IDCONTRATOEMPTMO';
      2: sSQL := sSQL + '   MATRICULA, IDCONTRATOEMPTMO';
   end;
end;




function  TcfgRelDividasPP.MontaSQLContrato: String;
var
   sSQL : String;
begin
   sSQL :=
   'SELECT '                                                                                    + #13 +
   '   PPC.NOME AS NOMEPLANO, '                                                                 + #13 +
   '   PTR.NOME AS NOMEPATRO, '                                                                 + #13 +

   '   (PPC.NOME || '' - '' || PTR.NOME) AS NOMEPLANOPATRO, '                                   + #13 +

   '   TCE.TCEDESCRICAO, '                                                                      + #13 +

   '   CON.IDCONTRATOEMPTMO, '                                                                  + #13 +
   '   DEP.MATRICULA, '                                                                         + #13 +
   '   MUT.NOME, '                                                                              + #13 +

   '   CON.TXJUROS, '                                                                           + #13 +
   '   CON.VLRCONTRATO, '                                                                       + #13 +
   '   CON.DATACREDITO, '                                                                       + #13 +
   '   CON.NUMPARCELAS, '                                                                       + #13 +

   '   DECODE(CON.IDBENEF, CON.IDPESSOA, SIT.DESCRICAO, ''PENSIONISTA'') AS SIT_PART '          + #13 +

   'FROM '                                                                                      + #13 +
   '   PESSOA            MUT, '                                                                 + #13 +
   '   PESSOA            PTR, '                                                                 + #13 +
   '   DEPENTIT          DEP, '                                                                 + #13 +
   '   PARTPREVPLAN      PPP, '                                                                 + #13 +
   '   SITPART           SIT, '                                                                 + #13 +
   '   TIPOCONTREMPTMO   TCE, '                                                                 + #13 +
   '   TIPOEMPTMO        TEP, '                                                                 + #13 +
   '   PLANPREVXCONTABIL PXC, '                                                                 + #13 +
   '   PLANPREVCONTABIL  PPC, '                                                                 + #13 +
   '   CONTRATOEMPTMO    CON '                                                                  + #13 +

   'WHERE '                                                                                     + #13 +
   '       TEP.IDEMPRESAPROP         =:PIDEMPRESAPROP '                                         + #13 +
   '   AND CON.IDPATRO               =:PIDPATRO '                                               + #13 +
   '   AND PXC.IDPLANOPREV           =:IDPLANOPREV '                                            + #13 +
   '   AND CON.FLGSITUACAO           <> ''C'' '                                                 + #13 +
   '   AND PPP.FLGDESATIVADO         = 0 '                                                      + #13 +
   '   AND TCE.IDTIPOCONTREMPTMO     =:PIDTIPOCONTREMPTMO '                                     + #13 +

   '   AND (:PIDTIPOCONTRFILTRO      IS NULL OR TCE.IDTIPOCONTREMPTMO =:PIDTIPOCONTRFILTRO) '   + #13 +
   '   AND (:PIDCONTRATOEMPTMO       IS NULL OR CON.IDCONTRATOEMPTMO  =:PIDCONTRATOEMPTMO) '    + #13 +

   '   AND (:PIDSITPART              IS NULL OR SIT.IDSITPART =:PIDSITPART) '                   + #13;

   if not(chkParcelasAberto.Checked) then sSQL := sSQL +
   '   AND '                                                                                    + #13 +
   '   EXISTS ( '                                                                               + #13 +
   //Wylliam Leite da Silva - SOL 253185 PPM 771995 - Início
   '          SELECT 1 '                          + #13 +
   //Wylliam Leite da Silva - SOL 253185 PPM 771995 - Fim
   '          FROM '                                                                            + #13 +
   '             HISTMOVEMPTMO HME '                                                            + #13 +
   '          WHERE '                                                                           + #13 +
   '                 HME.HMEDATAPREVISTA      <=:PHMEDATA '                                     + #13 +
   '             AND NVL(HME.FLGESTORNADO, 0)  = 0 '                                            + #13 +
   '             AND HME.IDCONTRATOEMPTMO      = CON.IDCONTRATOEMPTMO '                         + #13 +
   '          ) '                                                                               + #13;

   sSQL := sSQL +
   '   AND '                                                                                    + #13 +
   '   ( '                                                                                      + #13 +
   '   EXISTS ( '                                                                               + #13 +
   //Wylliam Leite da Silva - SOL 253185 PPM 771995 - Início
   '          SELECT 1 '                           + #13 +
   //Wylliam Leite da Silva - SOL 253185 PPM 771995 - Fim
   '          FROM '                                                                            + #13 +
   '             HISTMOVEMPTMO HME '                                                            + #13 +
   '          WHERE '                                                                           + #13 +
   '                 (HME.HMECENTRALIZA        = 1 OR HME.HMEDESTACADO = 1) '                   + #13 +
   '             AND HME.HMETIPOMOV           IN (1, 2, 3, 4, 6, 7) '                           + #13 +
   '             AND HME.HMEDATAPREVISTA      <=:PHMEDATA '                                     + #13 +
   '             AND HME.HMEDATAEFETIVA        >:PHMEDATA '                                     + #13 +
   '             AND NVL(HME.FLGESTORNADO, 0)  = 0 '                                            + #13 +
   '             AND HME.IDCONTRATOEMPTMO      = CON.IDCONTRATOEMPTMO '                         + #13 +
   '          ) '                                                                               + #13 +
   '   OR '                                                                                     + #13 +
   '   EXISTS ( '                                                                               + #13 +
   '          SELECT 1 '                                                                        + #13 +
   '          FROM '                                                                            + #13 +
   '             HISTMOVEMPTMO HME '                                                            + #13 +
   '          WHERE '                                                                           + #13 +
   '                 (HME.HMECENTRALIZA        = 1 OR HME.HMEDESTACADO = 1) '                   + #13 +
   '             AND HME.HMETIPOMOV           IN (1, 2, 3, 4, 6, 7) '                           + #13 +
   '             AND HME.HMEDATAPREVISTA      <=:PHMEDATA '                                     + #13 +
   '             AND ( '                                                                        + #13 +
   '                 HME.HMEDATAEFETIVA IS NULL OR '                                            + #13 +
   '                 HME.HMEVLREFETIVO IS NULL OR '                                             + #13 +
   '                 HME.FLGBAIXADO            = 0 '                                            + #13 +
   '                 ) '                                                                        + #13 +
   '             AND NVL(HME.FLGESTORNADO, 0)  = 0 '                                            + #13 +
   '             AND HME.IDCONTRATOEMPTMO      = CON.IDCONTRATOEMPTMO '                         + #13 +
   '          ) '                                                                               + #13 +
   '   ) '                                                                                      + #13 +

   '   AND CON.IDPLANOORIGEM         = PXC.IDPLANPREVC '                                        + #13 +
   '   AND PXC.IDPLANOPREV           = PPC.IDPLANOPREV '                                        + #13 +
   '   AND CON.IDPATRO               = PTR.IDPESSOA '                                           + #13 +
   '   AND CON.IDBENEF               = MUT.IDPESSOA '                                           + #13 +
   '   AND CON.IDBENEF               = DEP.IDPESSOA '                                           + #13 +
   '   AND CON.IDPESSOA              = DEP.IDTITULAR '                                          + #13 +

   '   AND CON.IDPESSOA              = PPP.IDPESSOA '                                           + #13 +
   '   AND PPP.IDSITPART             = SIT.IDSITPART '                                          + #13 +

   '   AND CON.IDTIPOCONTREMPTMO     = TCE.IDTIPOCONTREMPTMO '                                  + #13 +
   '   AND TCE.IDTIPOEMPTMO          = TEP.IDTIPOEMPTMO '                                       + #13 +

   'ORDER BY '                                                                                  + #13 +
   '   DECODE(NVL(:PORDEM, 0), 0, CON.IDCONTRATOEMPTMO), '                                      + #13 +
   '   DECODE(NVL(:PORDEM, 0), 1, MUT.NOME), '                                                  + #13 +
   '   DECODE(NVL(:PORDEM, 0), 2, DEP.MATRICULA), '                                             + #13 +
   '   CON.IDCONTRATOEMPTMO ';

   Result := sSQL;
end;



end.
