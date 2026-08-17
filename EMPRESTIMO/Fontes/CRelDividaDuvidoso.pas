unit CRelDividaDuvidoso;

// Alterações:
{ --------------------------------------------------------------------------------------------------
Rotina    :
Data      :
Autor     :
Pendencia :
Descrição :
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
   mListaPlano, mListaPatro;

type
   TcfgRelDividaDuvidoso = class(TcfgRel)
      Label1: TLabel;
      Label2: TLabel;
      DBcboTipoEmptmo: TwwDBLookupCombo;
      DBcboTipoContrato: TwwDBLookupCombo;
      Panel1: TPanel;
      molContratoEmptmo: TmolContratoEmptmo;
      edtDataRef: TwwDBDateTimePicker;
      Label3: TLabel;
      rdgOrdenar: TRadioGroup;
      GroupBox1: TGroupBox;
      chkCorLinha: TCheckBox;
      cboCorLinha: TfcColorCombo;
      chkLinhas: TCheckBox;
      DBcboSitPart: TwwDBLookupCombo;
      Label4: TLabel;
      molListaPatro: TmolListaPatro;
      molListaPlano: TmolListaPlano;
      chkReserva: TCheckBox;

      procedure FormShow(Sender: TObject);
      procedure DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure DBcboTipoEmptmoExit(Sender: TObject);
      procedure molListaPatrobtnInvertePatroClick(Sender: TObject);
      procedure molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
      procedure molListaPlanobtnInvertePlanoClick(Sender: TObject);
      procedure molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);


   private { Private declarations }

      procedure AbreQueries;

      procedure MontaQuery; override;
      procedure FiltraRelatorio;
      procedure CalculaValores;

  public { Public declarations }

  end;



var
  cfgRelDividaDuvidoso: TcfgRelDividaDuvidoso;



implementation
{$R *.DFM}
uses
   dLookEmptmo, uDiasUteis, uSistema, uFuncoesEmptmo, uCalcEmptmo, dEmptmo, uMensErro,
   dRelDividaDuvidoso, FProgresso, uTypesEmptmo;



procedure TcfgRelDividaDuvidoso.AbreQueries;
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




procedure TcfgRelDividaDuvidoso.MontaQuery;
begin
   inherited;

   with dtmRelDividaDuvidoso do
   begin
      // preenche a label de data de referência
      if length(trim(edtDataRef.Text)) > 0 then sDataRef := FormatDateTime('DD/MM/YYYY', edtDataRef.Date);


      // -------------------------------------------------------------------------------------------

      //Pendência 23439 - 02/10/2006 - Alberto
      if lblTipoEmptmo <> nil then begin
      lblTipoEmptmo.Caption := ' < todos > ';
      if DBcboTipoEmptmo.LookupValue <> ''   then lblTipoEmptmo.Caption := DBcboTipoEmptmo.Text;
      end;

      if lblTipoContr <> nil then begin
      lblTipoContr.Caption  := ' < todos > ';
      if DBcboTipoContrato.LookupValue <> ''    then lblTipoContr.Caption  := DBcboTipoContrato.Text;
      end;

      if memPatro <> nil then
      memPatro.RichText := molListaPatro.ListaPatro;

      if memPlano <> nil then
      memPlano.RichText := molListaPlano.ListaPlano;
      //Fim Pendência 23439

      // -------------------------------------------------------------------------------------------


      bSeparador  := chkLinhas.Checked;

      // determina se as linhas do relatório serão impressas em cores alternadas, e qual cor usar
      bCorlinha   := chkCorLinha.Checked;
      CorLinha    := cboCorLinha.SelectedColor;
   end;

   FiltraRelatorio;
end;



procedure TcfgRelDividaDuvidoso.FormShow(Sender: TObject);
begin
   inherited;

   (* limpa a seleção de Contrato *)
   molContratoEmptmo.btnLimpaContrato.Click;

   (* preenche a data de referência *)
   edtDataRef.Date := DiasUteis.UltDiaMes(DiasUteis.ExtraiAno(Sysdate), DiasUteis.ExtraiMes(Sysdate));

   AbreQueries;

   (* Preenche a listbox de patrocinadoras... *)
   molListaPatro.PreenchePatro;
   (* ...e marca todas por default *)
   molListaPatrobtnMarcaTodosPatroClick(self);

   (* Preenche a listbox de Planos... *)
   molListaPlano.PreenchePlano;
   (* ...e marca todos por default *)
   molListaPlanobtnMarcaTodosPlanoClick(self);
end;



procedure TcfgRelDividaDuvidoso.DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
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



procedure TcfgRelDividaDuvidoso.DBcboTipoEmptmoExit(Sender: TObject);
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



procedure TcfgRelDividaDuvidoso.FiltraRelatorio;
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
   '   CON.IDCONTRATOEMPTMO, CON.DATACREDITO, '                                                    + #13 +
   '   CON.IDBENEF, CON.IDPESSOA, '                                                                + #13 +
   '   CON.IDPATRO, CON.IDPLANOPREV, '                                                             + #13 +
   '   PTI.NOME AS NOME_TITULAR, '                                                                 + #13 +
   '   PBF.NOME AS NOME_BENEF, '                                                                   + #13 +
   '   SIT.DESCRICAO AS SIT_PART, '                                                                + #13 +
   '   DEP.MATRICULA AS MATRICULA, '                                                               + #13 +
   '   ELP.MATRICULA AS MATRICULA_TIT, '                                                           + #13 +

   '   TO_DATE(''31/12/2002'', ''DD/MM/YYYY'') AS HMEDATAATUALIZA, '                               + #13 +
   '   0                                   AS HMESALDODEV, '                                       + #13 +
   '   0                                   AS HMEPARCELA, '                                        + #13 +
   '   0                                   AS HMENUMPARCELAS, '                                    + #13 +
   '   0                                   AS TOTAL, '                                             + #13 +

   '   TCE.TCEDESCRICAO, TCE.IDREGRARESERVA, '                                                     + #13 +

   '   0 AS PERCENT, '                                                                             + #13 +
   '   0 AS PROVISAO, '                                                                            + #13 +
   '   ''                 '' AS FAIXA, '                                                           + #13 +
   '   0 AS RESERVA, '                                                                             + #13 +

   '   PRI.DATA_PRIM_DIVIDA, '                                                                     + #13 +
   '   (TO_DATE(' + sData + ', ''DD/MM/YYYY'') - PRI.DATA_PRIM_DIVIDA) AS DIAS_DIVIDA, '           + #13 +

   '   (NVL(PAR_DEV.VLR_DEV, 0) - NVL(PAR_PAG.VLR_PAG, 0)) AS VALOR_DEVIDO '                       + #13 +

   'FROM '                                                                                         + #13 +
   '   PESSOA          PBF, '                                                                      + #13 +
   '   PESSOA          PTI, '                                                                      + #13 +
   '   CONTRATOEMPTMO  CON, '                                                                      + #13 +
   '   DEPENTIT        DEP, '                                                                      + #13 +
   '   ELEGPATRO       ELP, '                                                                      + #13 +
   '   PARTPREVPLAN    PPP, '                                                                      + #13 +
   '   TIPOCONTREMPTMO TCE, '                                                                      + #13 +
   '   TIPOEMPTMO      TEP, '                                                                      + #13 +
   '   PATRO           PTR, '                                                                      + #13 +
   '   PLANPREV        PLP, '                                                                      + #13 +
   '   SITPART         SIT, '                                                                      + #13 +

   '   ( '                                                                                         + #13 +
   '   SELECT '                                                                                    + #13 +
   '      CON.IDCONTRATOEMPTMO, MIN(HME.HMEDATAPREVISTA) AS DATA_PRIM_DIVIDA '                     + #13 +
   '   FROM '                                                                                      + #13 +
   '      HISTMOVEMPTMO HME, CONTRATOEMPTMO CON '                                                  + #13 +
   '   WHERE '                                                                                     + #13 +
   '          CON.FLGSITUACAO        <> ''C'' '                                                    + #13;

   // Tipo de Contrato
   if DBcboTipoContrato.LookupValue <> '' then sSQL := sSQL +
   '      AND CON.IDTIPOCONTREMPTMO    = ' + DBcboTipoContrato.LookupValue                         + #13;

   // filtro por Plano e Patrocinadora
   sSql := sSql +
   '      AND CON.IDPATRO              IN (' + molListaPatro.PegaPatro + ') '                      + #13 +
   '      AND CON.IDPLANOPREV          IN (' + molListaPlano.PegaPlano + ') '                      + #13;

   // filtro por Contrato
   if molContratoEmptmo.IDContrato > 0 then sSql := sSql +
   '      AND CON.IDCONTRATOEMPTMO     = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)                + #13;

   sSql := sSql +
   '      AND HMETIPOMOV             IN (1, 2, 3, 4, 6, 7) '                                       + #13 +
   '      AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) ) '                            + #13 +
   '      AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO IS NULL) ) '                        + #13 +
   '      AND ( ((HME.FLGQUITADO     IS NULL) OR (HME.FLGQUITADO = 0)) OR ((HME.FLGQUITADO IS NOT NULL) AND (HME.HMEDATAQUITABONO > TO_DATE(' + sData + ', ''DD/MM/YYYY'')) )) '  + #13 +
   '      AND ( ((HME.FLGABONADO     IS NULL) OR (HME.FLGABONADO = 0)) OR ((HME.FLGABONADO IS NOT NULL) AND (HME.HMEDATAQUITABONO > TO_DATE(' + sData + ', ''DD/MM/YYYY'')) )) '  + #13 +

   '      AND ( HME.HMEDATAPREVISTA  <= TO_DATE(' + sData + ', ''DD/MM/YYYY'') ) '                 + #13 +

   '      AND ( (HME.HMEDATAEFETIVA  IS NULL AND NVL(HME.FLGQUITADO,0) = 0 AND NVL(HME.FLGABONADO,0) = 0) OR (HME.HMEDATAEFETIVA > TO_DATE(' + sData + ', ''DD/MM/YYYY'')) ) ' + #13 +
   '      AND ( (HME.HMEVLREFETIVO   IS NULL) OR (HME.HMEDATAEFETIVA > TO_DATE(' + sData + ', ''DD/MM/YYYY'')) ) ' + #13 +

   '      AND ( CON.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO ) '                                    + #13 +
   '   GROUP BY '                                                                                  + #13 +
   '      CON.IDCONTRATOEMPTMO '                                                                   + #13 +
   '   ) PRI, '                                                                                    + #13 +

   '   ( '                                                                                         + #13 +
   '   SELECT '                                                                                    + #13 +
   '      CON.IDCONTRATOEMPTMO, SUM(NVL(HME.HMEVLRPREVISTO, 0)) AS VLR_DEV '                       + #13 +
   '   FROM '                                                                                      + #13 +
   '      HISTMOVEMPTMO HME, CONTRATOEMPTMO CON '                                                  + #13 +
   '   WHERE '                                                                                     + #13 +
   '          CON.FLGSITUACAO        <> ''C'' '                                                    + #13;

   // Tipo de Contrato
   if DBcboTipoContrato.LookupValue <> '' then sSQL := sSQL +
   '      AND CON.IDTIPOCONTREMPTMO  = ' + DBcboTipoContrato.LookupValue                           + #13;

   // filtro por Plano e Patrocinadora
   sSql := sSql +
   '      AND CON.IDPATRO            IN (' + molListaPatro.PegaPatro + ') '                        + #13 +
   '      AND CON.IDPLANOPREV        IN (' + molListaPlano.PegaPlano + ') '                        + #13;

   // filtro por Contrato
   if molContratoEmptmo.IDContrato > 0 then sSql := sSql +
   '      AND CON.IDCONTRATOEMPTMO   = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)                  + #13;

   sSql := sSql +
   '      AND HMETIPOMOV             IN (1, 2, 3, 4, 6, 7) '                                       + #13 +
   '      AND HME.HMESEQCOBRANCA     = 1 '                                                         + #13 +
   '      AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) ) '                            + #13 +
   '      AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO IS NULL) ) '                        + #13 +

   '      AND HME.HMEDATAPREVISTA    <= TO_DATE(' + sData + ', ''DD/MM/YYYY'') '                   + #13 +

   '      AND ( CON.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO ) '                                    + #13 +
   '   GROUP BY '                                                                                  + #13 +
   '      CON.IDCONTRATOEMPTMO '                                                                   + #13 +
   '   ) PAR_DEV, '                                                                                + #13 +

   '   ( '                                                                                         + #13 +
   '   SELECT '                                                                                    + #13 +
   '      CON.IDCONTRATOEMPTMO, '                                                                  + #13 +

   '      SUM(DECODE(FLGQUITADO, 1, NVL(HME.HMEVLRPREVISTO, 0), '                                  + #13 +
   '                                DECODE(FLGABONADO, 1, NVL(HME.HMEVLRPREVISTO, 0), '            + #13 +
   '                                                      NVL(HME.HMEVLREFETIVO, 0)))) AS VLR_PAG' + #13 +

   '   FROM '                                                                                      + #13 +
   '      HISTMOVEMPTMO HME, CONTRATOEMPTMO CON '                                                  + #13 +
   '   WHERE '                                                                                     + #13 +
   '          CON.FLGSITUACAO        <> ''C'' '                                                    + #13;

   // Tipo de Contrato
   if DBcboTipoContrato.LookupValue <> '' then sSQL := sSQL +
   '      AND CON.IDTIPOCONTREMPTMO    = ' + DBcboTipoContrato.LookupValue                         + #13;

   // filtro por Plano e Patrocinadora
   sSql := sSql +
   '      AND CON.IDPATRO              IN (' + molListaPatro.PegaPatro + ') '                      + #13 +
   '      AND CON.IDPLANOPREV          IN (' + molListaPlano.PegaPlano + ') '                      + #13;

   // filtro por Contrato
   if molContratoEmptmo.IDContrato > 0 then sSql := sSql +
   '      AND CON.IDCONTRATOEMPTMO     = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)                + #13;

   sSql := sSql +
   '      AND HMETIPOMOV             IN (1, 2, 3, 4, 6, 7) '                                       + #13 +
   '      AND ( HME.HMECENTRALIZA    = 1 OR HME.HMEDESTACADO = 1 ) '                               + #13 +
   '      AND ( HME.FLGESTORNADO     = 0 OR HME.FLGESTORNADO IS NULL ) '                           + #13 +

   '      AND HME.HMEDATAPREVISTA    <= TO_DATE(' + sData + ', ''DD/MM/YYYY'') '                   + #13 +
   '      AND ( '                                                                                                 + #13 +
   '          (HME.HMEDATAEFETIVA    <= TO_DATE(' + sData + ', ''DD/MM/YYYY'')) '                                 + #13 +
   '          OR ( (HME.FLGQUITADO = 1) AND (HME.HMEDATAQUITABONO <= TO_DATE(' + sData + ',''DD/MM/YYYY'')) ) '   + #13 +
   '          OR ( (HME.FLGABONADO = 1) AND (HME.HMEDATAQUITABONO <= TO_DATE(' + sData + ',''DD/MM/YYYY'')) ) '   + #13 +
   '          ) '                                                                                                 + #13 +

   '      AND ( CON.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO ) '                                    + #13 +
   '   GROUP BY '                                                                                  + #13 +
   '      CON.IDCONTRATOEMPTMO '                                                                   + #13 +
   '   ) PAR_PAG '                                                                                 + #13 +

   'WHERE '                                                                                        + #13 +

   // filtro por Empresa Proprietátia
   '       TEP.IDEMPRESAPROP        = ' + IntToStr(Sistema.IDEmpresa)                              + #13 +

   // filtro por Patrocinadora
   '   AND PTR.IDPESSOA             IN (' + molListaPatro.PegaPatro + ') '                         + #13 +

   // filtro por Plano
   '   AND PLP.IDPLANOPREV          IN (' + molListaPlano.PegaPlano + ') '                         + #13;

   // filtro por Contrato
   if molContratoEmptmo.IDContrato > 0 then sSql := sSql +
   '   AND CON.IDCONTRATOEMPTMO     = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)                   + #13;

   // filtro por Tipo de Empréstimo
   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   '   AND TCE.IDTIPOEMPTMO         = ' + DBcboTipoEmptmo.LookupValue                              + #13 +
   '   AND TEP.IDTIPOEMPTMO         = ' + DBcboTipoEmptmo.LookupValue                              + #13;

   // filtro por Tipo de Contrato
   if DBcboTipoContrato.LookupValue <> '' then sSQL := sSQL +
   '   AND CON.IDTIPOCONTREMPTMO    = ' + DBcboTipoContrato.LookupValue                            + #13 +
   '   AND TCE.IDTIPOCONTREMPTMO    = ' + DBcboTipoContrato.LookupValue                            + #13;

   // filtro por SitPArt
   if DBcboSitPart.LookupValue <> '' then sSQL := sSQL +
   '   AND SIT.IDSITPART            = ' + DBcboSitPart.LookupValue                                 + #13;

   sSQL := sSQL +
   '   AND ( CON.FLGSITUACAO        <> ''C'' ) '                                                   + #13 +
   '   AND ( (NVL(PAR_DEV.VLR_DEV, 0) - NVL(PAR_PAG.VLR_PAG, 0))  > 0 ) '                          + #13 +
   '   AND ( (TO_DATE(' + sData + ', ''DD/MM/YYYY'') - PRI.DATA_PRIM_DIVIDA) > 60 ) '              + #13 +

   '   AND ( CON.IDCONTRATOEMPTMO   = PRI.IDCONTRATOEMPTMO ) '                                     + #13 +
   '   AND ( CON.IDCONTRATOEMPTMO   = PAR_DEV.IDCONTRATOEMPTMO(+) ) '                              + #13 +
   '   AND ( CON.IDCONTRATOEMPTMO   = PAR_PAG.IDCONTRATOEMPTMO(+) ) '                              + #13 +

   '   AND ( CON.IDPESSOA           = PTI.IDPESSOA ) '                                             + #13 +
   '   AND ( CON.IDPESSOA           = ELP.IDPESSOA ) '                                             + #13 +
   '   AND ( CON.IDPATRO            = PTR.IDPESSOA ) '                                             + #13 +
   '   AND ( CON.IDBENEF            = PBF.IDPESSOA ) '                                             + #13 +
   '   AND ( CON.IDPESSOA           = PPP.IDPESSOA ) '                                             + #13 +
   '   AND ( CON.IDPATRO            = PPP.IDPESSJUR ) '                                            + #13 +
   '   AND ( ELP.IDPESSOA           = PPP.IDPESSOA ) '                                             + #13 +
   '   AND ( ELP.IDPESSJUR          = PPP.IDPESSJUR ) '                                            + #13 +
   '   AND ( PTR.IDPESSOA           = ELP.IDPESSJUR ) '                                            + #13 +
   '   AND ( CON.IDBENEF            = PBF.IDPESSOA ) '                                             + #13 +
   '   AND ( PTI.IDPESSOA           = ELP.IDPESSOA ) '                                             + #13 +
   '   AND ( PTI.IDPESSOA           = PPP.IDPESSOA ) '                                             + #13 +
   '   AND ( CON.IDPLANOPREV        = PLP.IDPLANOPREV ) '                                          + #13 +
   '   AND ( CON.IDTIPOCONTREMPTMO  = TCE.IDTIPOCONTREMPTMO ) '                                    + #13 +
   '   AND ( TCE.IDTIPOEMPTMO       = TEP.IDTIPOEMPTMO ) '                                         + #13 +
   '   AND ( ELP.IDPESSOA           = DEP.IDTITULAR ) '                                            + #13 +
   '   AND ( CON.IDBENEF            = DEP.IDPESSOA ) '                                             + #13 +
   '   AND ( CON.IDPESSOA           = DEP.IDTITULAR ) '                                            + #13 +
   '   AND ( PPP.IDSITPART          = SIT.IDSITPART ) '                                            + #13 +
   '   AND PPP.FLGDESATIVADO        = 0 '                                                          + #13 +


   'ORDER BY '                                                                                     + #13;

   case rdgOrdenar.ItemIndex of
      0: sSQL := sSQL + '   (TO_DATE(' + sData + ', ''DD/MM/YYYY'') - PRI.DATA_PRIM_DIVIDA), CON.IDCONTRATOEMPTMO';
      1: sSQL := sSQL + '   (TO_DATE(' + sData + ', ''DD/MM/YYYY'') - PRI.DATA_PRIM_DIVIDA), PBF.NOME, CON.IDCONTRATOEMPTMO';
   end;

   with dtmRelDividaDuvidoso.qryDividaDuvidoso do
   begin
      Close;
      SQL.Text := sSQL;
      Open;
   end;

   CalculaValores;
end;



procedure TcfgRelDividaDuvidoso.CalculaValores;
var
   sFaixa          : String;
   iRegistro       : Integer;
   iRegistros      : Integer;
   fPercent        : Currency;
   fProvisao       : Currency;
   fReserva        : Currency;
   dDataAtualiza   : TDateTime;
   fHMESaldoDev    : Currency;
   iHMEParcela     : Integer;
   iHMENumParcelas : Integer;
   fTotal          : Currency;
   rSaldoDevAnt    : TSaldoDevAnt;

begin
   try
      with dtmRelDividaDuvidoso.qryDividaDuvidoso do
      begin
         iRegistros  := dtmRelDividaDuvidoso.qryDividaDuvidoso.RecordCount;
         iRegistro   := 0;

         First;

         frmProgresso.MostraFormProgresso('Calculando Provisões...',
                                          False,
                                          False,
                                          True,
                                          iRegistro,
                                          iRegistros,
                                         );

         // preenchimento do percentual de provisão, valor de provisão e, futuramente,
         // da reserva de poupança
         while not(EOF) do
         begin
            if ( (FieldByName('DIAS_DIVIDA').AsInteger > 60) and (FieldByName('DIAS_DIVIDA').AsInteger <= 120) ) then
            begin
               fPercent := 25;
               sFaixa   := 'de  61 a 120 dias';
            end
            else if ( (FieldByName('DIAS_DIVIDA').AsInteger > 120) and (FieldByName('DIAS_DIVIDA').AsInteger <= 240) ) then
            begin
               fPercent := 50;
               sFaixa   := 'de 121 a 240 dias';
            end
            else if ( (FieldByName('DIAS_DIVIDA').AsInteger > 240) and (FieldByName('DIAS_DIVIDA').AsInteger <= 360) ) then
            begin
               fPercent := 75;
               sFaixa   := 'de 241 a 360 dias';
            end
            else if (FieldByName('DIAS_DIVIDA').AsInteger > 360) then
            begin
               fPercent := 100;
               sFaixa   := 'acima de 360 dias';
            end;

            rSaldoDevAnt  := CalcEmptmo.SaldoDevAnt(FieldByName('IDCONTRATOEMPTMO').AsFloat,
                                                    edtDataRef.Date,
                                                    0,
                                                    0,
                                                    False
                                                   );

            dDataAtualiza   := rSaldoDevAnt.dDataAtuAnt;
            fHMESaldoDev    := rSaldoDevAnt.fSaldoDevAnt;
            iHMEParcela     := rSaldoDevAnt.iParcelaAnt;
            iHMENumParcelas := rSaldoDevAnt.iParcRestaAnt;

            fTotal          := fHMESaldoDev + FieldByName('VALOR_DEVIDO').AsCurrency;

            // grava a provisao
            fProvisao   := fTotal * fPercent / 100;

            // cálculo da Reserva de Poupança ------------------------------------------------------
            if chkReserva.Checked then
            begin
               fReserva := CalcEmptmo.BuscaReserva(FieldByName('IDBENEF').AsInteger,
                                                   FieldByName('IDPATRO').AsInteger,
                                                   FieldByName('IDPLANOPREV').AsInteger,
                                                   FieldByName('IDREGRARESERVA').AsInteger,
                                                   Sysdate,
                                                   False);
            end
            else
            begin
               fReserva := 0;
            end;
            // -------------------------------------------------------------------------------------


            Edit;

            FieldByName('HMEPARCELA').AsInteger       := iHMEParcela;
            FieldByName('HMENUMPARCELAS').AsInteger   := iHMENumParcelas;
            FieldByName('HMESALDODEV').AsCurrency     := fHMESaldoDev;
            FieldByName('TOTAL').AsCurrency           := fTotal;
            FieldByName('HMEDATAATUALIZA').AsDateTime := dDataAtualiza;


            FieldByName('PERCENT').AsCurrency   := fPercent;
            FieldByName('PROVISAO').AsCurrency  := fProvisao;
            FieldByName('FAIXA').AsString       := sFaixa;

            if chkReserva.Checked then FieldByName('RESERVA').AsCurrency := fReserva;

            dtmRelDividaDuvidoso.qryDividaDuvidoso.Post;

            inc(iRegistro);

            frmProgresso.AndaFormProgresso(iRegistro);

            dtmRelDividaDuvidoso.qryDividaDuvidoso.Next;
         end;
      end;

   finally
      frmProgresso.EscondeFormProgresso;
   end;
end;



procedure TcfgRelDividaDuvidoso.molListaPatrobtnInvertePatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnInvertePatroClick(Sender);
end;



procedure TcfgRelDividaDuvidoso.molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnMarcaTodosPatroClick(Sender);
end;



procedure TcfgRelDividaDuvidoso.molListaPlanobtnInvertePlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnInvertePlanoClick(Sender);
end;



procedure TcfgRelDividaDuvidoso.molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnMarcaTodosPlanoClick(Sender);
end;



end.
