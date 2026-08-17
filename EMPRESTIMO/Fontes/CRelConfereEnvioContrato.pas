unit CRelConfereEnvioContrato;

// Alterações:
{ --------------------------------------------------------------------------------------------------
Rotina    :
Data      :
Pendência :
Autor     :
Descrição :
----------------------------------------------------------------------------------------------------
Rotina    : FiltraRelatorio
Data      : 04/11/2002
Pendência :
Autor     : André Pontes
Descrição : Opção de comparação independente por tipo de folha (Benefícios / Patrocinadora)
---------------------------------------------------------------------------------------------------}

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   CRel, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr,
   TB97, ExtCtrls, mListaPlano, mListaPatro, fcCombo, fcColorCombo,
   mMutuario, Mask, wwdbedit, Wwdbspin, wwdblook, Db, DBTables, Wwquery,
   mContratoEmptmo;

type
   TcfgRelConfereEnvioContrato = class(TcfgRel)
      Label2: TLabel;
      Label1: TLabel;
      DBcboTipoContrato: TwwDBLookupCombo;
      Panel1: TPanel;
      Label15: TLabel;
      DBspnAno: TwwDBSpinEdit;
      cboMes: TComboBox;
      DBcboTipoEmptmo: TwwDBLookupCombo;
      GroupBox2: TGroupBox;
      chkCorLinha: TCheckBox;
      cboCorLinha: TfcColorCombo;
      chkLinhas: TCheckBox;
      rdgOrdenar: TRadioGroup;
      molListaPatro: TmolListaPatro;
      molListaPlano: TmolListaPlano;
      Label4: TLabel;
      DBcboSitPart: TwwDBLookupCombo;
      molContratoEmptmo: TmolContratoEmptmo;
      GroupBox1: TGroupBox;
      chkVlrEnviado: TCheckBox;
      chkVlrRecebido: TCheckBox;
      chkQuitaAmortiza: TCheckBox;
      GroupBox3: TGroupBox;
      chkFolhaPatro: TCheckBox;
      chkFolhaBenef: TCheckBox;

      procedure FormShow(Sender: TObject);
      procedure molListaPatrobtnInvertePatroClick(Sender: TObject);
      procedure molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
      procedure molListaPlanobtnInvertePlanoClick(Sender: TObject);
      procedure molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
      procedure DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure DBcboTipoEmptmoExit(Sender: TObject);
      procedure molContratoEmptmobtnBuscaContratoClick(Sender: TObject);
      procedure molContratoEmptmobtnLimpaContratoClick(Sender: TObject);


   private { Private declarations }

      procedure AbreQueries;

      procedure MontaQuery; override;
      procedure FiltraRelatorio;


   public { Public declarations }

   end;



var
  cfgRelConfereEnvioContrato: TcfgRelConfereEnvioContrato;



implementation
{$R *.DFM}
uses
   DLookEmptmo,
   UDiasUteis,
   USistema,
   uFuncoesEmptmo,
   dEmptmo,
   uMensErro,
   dRelConfereEnvioContrato;




procedure TcfgRelConfereEnvioContrato.AbreQueries;
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



procedure TcfgRelConfereEnvioContrato.MontaQuery;
begin
   inherited;

   with dtmRelConfereEnvioContrato do
   begin
      // preenche a label do mês de cobrança
      rptConfereEnvioContrato_lblMesCobranca.Caption   := FormatFloat('00', cboMes.ItemIndex + 1) + '/' +
                                                          FormatFloat('0000', DBspnAno.Value);

      bSeparador  := chkLinhas.Checked;

      // determina se as linhas do relatório serão impressas em cores alternadas, e qual cor usar
      bCorlinha   := chkCorLinha.Checked;
      CorLinha    := cboCorLinha.SelectedColor;

      // Início Pendência 21063 - Marcos Ventura Topini
      // -------------------------------------------------------------------------------------------

      lblTipoEmptmo.Caption := ' < todos > ';
      if DBcboTipoEmptmo.LookupValue <> ''   then lblTipoEmptmo.Caption   := DBcboTipoEmptmo.Text;

      lblTipoContr.Caption  := ' < todos > ';
      if DBcboTipoContrato.LookupValue <> '' then lblTipoContr.Caption := DBcboTipoContrato.Text;

      memPatro.RichText := molListaPatro.ListaPatro;
      memPlano.RichText := molListaPlano.ListaPlano;

      // -------------------------------------------------------------------------------------------
      // Fim Pendência 21063

   end;

   FiltraRelatorio;
end;



procedure TcfgRelConfereEnvioContrato.FiltraRelatorio;
var
   sSQL           : String;
   sAno, sMes     : String;
   sAnoMes        : String;
   sOrdenacao     : String;
begin
   sAno     := FormatFloat('0000', DBspnAno.Value);
   sMes     := FormatFloat('00', cboMes.ItemIndex + 1);
   sAnoMes  := FormatFloat('0000', DBspnAno.Value) + '/' + FormatFloat('00', cboMes.ItemIndex + 1);

   sSQL :=
   'SELECT '                                                                  + #13 +
   '   CON.IDCONTRATOEMPTMO, '                                                + #13 +
   '   CON.IDPATRO, PTR.NOME     AS PATRO, '                                  + #13 +
   '   CON.IDPLANOPREV, PLP.NOME AS PLANO, '                                  + #13 +
   '   MUT.NOME, DEP.MATRICULA, TCE.TCEDESCRICAO, '                           + #13 +
   '   NVL(HBP.VLRPREVISTO,0) AS VLR_PREVISTO_BENEF, '                        + #13 +
   '   NVL(HBE.VLREFETIVO, 0) AS VLR_EFETIVO_BENEF, '                         + #13 +
   '   NVL(HPP.VLRPREVISTO,0) AS VLR_PREVISTO_PATRO, '                        + #13 +
   '   NVL(HPE.VLREFETIVO, 0) AS VLR_EFETIVO_PATRO, '                         + #13 +
   '   NVL(HMT.VLRPREVISTO,0) AS VLR_PREVISTO_TMP, '                          + #13 +
   '   NVL(HMT.VLREFETIVO, 0) AS VLR_VLREFETIVO_TMP, '                        + #13 +
   '   ( NVL(HMT.VLRPREVISTO,0) - (NVL(HBP.VLRPREVISTO, 0) + NVL(HPP.VLRPREVISTO, 0)) ) AS VLR_PREVISTO_DIF, ' + #13 +
   '   ( NVL(HMT.VLREFETIVO, 0) - (NVL(HBE.VLREFETIVO, 0)  + NVL(HPE.VLREFETIVO, 0)) )  AS VLR_EFETIVO_DIF '   + #13 +

   'FROM '                                                                    + #13 +
   '   PESSOA       PTR, '                                                    + #13 +

   ' --VWCONTRATOEP CON, '                                                    + #13 +
   '  CONTRATOEMPTMO  CON, '                                                  + #13 +
   '  PESSOA          MUT, '                                                  + #13 +
   '  TIPOEMPTMO      TEP, '                                                  + #13 +
   '  TIPOCONTREMPTMO TCE, '                                                  + #13 +
   '  DEPENTIT        DEP, '                                                  + #13 +
   '  PLANPREV        PLP, '                                                  + #13 +

   '   ( '                                                                    + #13 +
   '   SELECT '                                                               + #13 +
   '      HME.IDCONTRATOEMPTMO, '                                             + #13 +
   '      SUM(ABS(NVL(HME.HMEVLRPREVISTO, 0))) AS VLRPREVISTO '               + #13 +
   '   FROM '                                                                 + #13 +
   '      HISTMOVEMPTMO HME, VWMIGRACONTRATOEP MIG '                          + #13 +
   '   WHERE '                                                                + #13 +
   '          HME.HMEFORMACOBRANCA = ''F'' '                                  + #13 +
   '      AND HME.HMETIPOFOLHA     = ''B'' '                                  + #13;

   // filtro por Contrato
   if molContratoEmptmo.IDContrato > 0 then sSql := sSql +
   '      AND HME.IDCONTRATOEMPTMO = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)                    + #13;

   // filtro de quitação / amortização
   if chkQuitaAmortiza.Checked then
   begin
      sSql := sSql +
   '      AND HME.HMETIPOMOV       IN (0, 1, 4, 6, 7) '                       + #13;
   end
   else
   begin
      sSql := sSql +
   '      AND HME.HMETIPOMOV       IN (0, 1, 2, 3, 4, 6, 7) '                 + #13;
   end;

   sSql := sSql +
   '      AND HME.FLGENVIO         IS NULL '                                  + #13 +
   '      AND ( (HME.FLGESTORNADO  IS NULL) OR (HME.FLGESTORNADO = 0) ) '     + #13 +
   '      AND ( (HME.FLGQUITADO    IS NULL) OR (HME.FLGQUITADO = 0) ) '       + #13 +
   '      AND ( (HME.FLGABONADO    IS NULL) OR (HME.FLGABONADO = 0) ) '       + #13 +
   '      AND HME.HMEANOCOBRANCA   = ' + sAno                                 + #13 +
   '      AND HME.HMEMESCOBRANCA   = ' + sMes                                 + #13 +
   '      AND (HME.HMECENTRALIZA   = 1 OR HME.HMEDESTACADO = 1) '             + #13 +
   // Pendência 23260 - Marcos Topini em 30/11/2006
          (* filtro por Patrocinadora *)
   '      AND MIG.IDPATROATU           IN (' + molListaPatro.PegaPatro + ')           ' + #13 +
          (* filtro por Plano *)
   '      AND MIG.IDPLANOCONTATU       IN (' + molListaPlano.PegaPlano + ')           ' + #13 +
   '      AND MIG.IDCONTRATOEMPTMO  = HME.IDCONTRATOEMPTMO                            ' + #13 +
   '      AND MIG.DATAMIGRA         = (SELECT MAX(DATAMIGRA)                          ' + #13 +
   '                                     FROM VWMIGRACONTRATOEP                       ' + #13 +
   '                                    WHERE IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO ' + #13 +
   '                                      AND DATAMIGRA       <= HME.HMEDATAPREVISTA) ' + #13 +
   // Fim Pendência 23260
   '   GROUP BY '                                                             + #13 +
   '      HME.IDCONTRATOEMPTMO '                                              + #13 +
   '   ) HBP, '                                                               + #13 +
   ' '                                                                        + #13 +

   '   ( '                                                                    + #13 +
   '   SELECT '                                                               + #13 +
   '      HME.IDCONTRATOEMPTMO, '                                             + #13 +
   '      SUM(ABS(NVL(HME.HMEVLREFETIVO, 0))) AS VLREFETIVO '                 + #13 +
   '   FROM '                                                                 + #13 +
   '      HISTMOVEMPTMO HME, VWMIGRACONTRATOEP MIG '                          + #13 +
   '   WHERE '                                                                + #13 +
   '          HME.HMEFORMACOBRANCA = ''F'' '                                  + #13 +
   '      AND HME.HMETIPOFOLHA     = ''B'' '                                  + #13;

   // filtro por Contrato
   if molContratoEmptmo.IDContrato > 0 then sSql := sSql +
   '      AND HME.IDCONTRATOEMPTMO = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)                    + #13;

   // filtro de quitação / amortização
   if chkQuitaAmortiza.Checked then
   begin
      sSql := sSql +
   '      AND HME.HMETIPOMOV       IN (0, 1, 4, 6, 7) '                       + #13;
   end
   else
   begin
      sSql := sSql +
   '      AND HME.HMETIPOMOV       IN (0, 1, 2, 3, 4, 6, 7) '                 + #13;
   end;

   sSql := sSql +
   '      AND ( (HME.FLGESTORNADO  IS NULL) OR (HME.FLGESTORNADO = 0) ) '     + #13 +
   '      AND ( (HME.FLGQUITADO    IS NULL) OR (HME.FLGQUITADO = 0) ) '       + #13 +
   '      AND ( (HME.FLGABONADO    IS NULL) OR (HME.FLGABONADO = 0) ) '       + #13 +
   '      AND HME.HMEANOCOBRANCA   = ' + sAno                                 + #13 +
   '      AND HME.HMEMESCOBRANCA   = ' + sMes                                 + #13 +
   '      AND (HME.HMECENTRALIZA   = 1 OR HME.HMEDESTACADO = 1) '             + #13 +
   // Pendência 23260 - Marcos Topini em 30/11/2006
          (* filtro por Patrocinadora *)
   '      AND MIG.IDPATROATU           IN (' + molListaPatro.PegaPatro + ')           ' + #13 +
          (* filtro por Plano *)
   '      AND MIG.IDPLANOCONTATU       IN (' + molListaPlano.PegaPlano + ')           ' + #13 +
   '      AND MIG.IDCONTRATOEMPTMO  = HME.IDCONTRATOEMPTMO                            ' + #13 +
   '      AND MIG.DATAMIGRA         = (SELECT MAX(DATAMIGRA)                          ' + #13 +
   '                                     FROM VWMIGRACONTRATOEP                       ' + #13 +
   '                                    WHERE IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO ' + #13 +
   '                                      AND DATAMIGRA       <= HME.HMEDATAPREVISTA) ' + #13 +
   // Fim Pendência 23260
   '   GROUP BY '                                                             + #13 +
   '      HME.IDCONTRATOEMPTMO '                                              + #13 +
   '   ) HBE, '                                                               + #13 +

   '   ( '                                                                    + #13 +
   '   SELECT '                                                               + #13 +
   '      HME.IDCONTRATOEMPTMO, '                                             + #13 +
   '      SUM(ABS(NVL(HME.HMEVLRPREVISTO, 0))) AS VLRPREVISTO '               + #13 +
   '   FROM '                                                                 + #13 +
   '      HISTMOVEMPTMO HME, VWMIGRACONTRATOEP MIG '                          + #13 +
   '   WHERE '                                                                + #13 +
   '          HME.HMEFORMACOBRANCA = ''F'' '                                  + #13 +
   '      AND HME.HMETIPOFOLHA     = ''P'' '                                  + #13;

   // filtro por Contrato
   if molContratoEmptmo.IDContrato > 0 then sSql := sSql +
   '      AND HME.IDCONTRATOEMPTMO = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)                    + #13;

   // filtro de quitação / amortização
   if chkQuitaAmortiza.Checked then
   begin
      sSql := sSql +
   '      AND HME.HMETIPOMOV       IN (0, 1, 4, 6, 7) '                       + #13;
   end
   else
   begin
      sSql := sSql +
   '      AND HME.HMETIPOMOV       IN (0, 1, 2, 3, 4, 6, 7) '                 + #13;
   end;

   sSql := sSql +
   '      AND HME.FLGENVIO         IS NULL '                                  + #13 +
   '      AND ( (HME.FLGESTORNADO  IS NULL) OR (HME.FLGESTORNADO = 0) ) '     + #13 +
   '      AND ( (HME.FLGQUITADO    IS NULL) OR (HME.FLGQUITADO = 0) ) '       + #13 +
   '      AND ( (HME.FLGABONADO    IS NULL) OR (HME.FLGABONADO = 0) ) '       + #13 +
   '      AND HME.HMEANOCOBRANCA   = ' + sAno                                 + #13 +
   '      AND HME.HMEMESCOBRANCA   = ' + sMes                                 + #13 +
   '      AND (HME.HMECENTRALIZA   = 1 OR HME.HMEDESTACADO = 1) '             + #13 +
   // Pendência 23260 - Marcos Topini em 30/11/2006
          (* filtro por Patrocinadora *)
   '      AND MIG.IDPATROATU           IN (' + molListaPatro.PegaPatro + ')           ' + #13 +
          (* filtro por Plano *)
   '      AND MIG.IDPLANOCONTATU       IN (' + molListaPlano.PegaPlano + ')           ' + #13 +
   '      AND MIG.IDCONTRATOEMPTMO  = HME.IDCONTRATOEMPTMO                            ' + #13 +
   '      AND MIG.DATAMIGRA         = (SELECT MAX(DATAMIGRA)                          ' + #13 +
   '                                     FROM VWMIGRACONTRATOEP                       ' + #13 +
   '                                    WHERE IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO ' + #13 +
   '                                      AND DATAMIGRA       <= HME.HMEDATAPREVISTA) ' + #13 +
   // Fim Pendência 23260
   '   GROUP BY '                                                             + #13 +
   '      HME.IDCONTRATOEMPTMO '                                              + #13 +
   '   ) HPP, '                                                               + #13 +

   '   ( '                                                                    + #13 +
   '   SELECT '                                                               + #13 +
   '      HME.IDCONTRATOEMPTMO, '                                             + #13 +
   '      SUM(ABS(NVL(HME.HMEVLREFETIVO, 0))) AS VLREFETIVO '                 + #13 +
   '   FROM '                                                                 + #13 +
   '      HISTMOVEMPTMO HME, VWMIGRACONTRATOEP MIG '                          + #13 +
   '   WHERE '                                                                + #13 +
   '          HME.HMEFORMACOBRANCA = ''F'' '                                  + #13 +
   '      AND HME.HMETIPOFOLHA     = ''P'' '                                  + #13;

   // filtro por Contrato
   if molContratoEmptmo.IDContrato > 0 then sSql := sSql +
   '      AND HME.IDCONTRATOEMPTMO = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)                    + #13;

   // filtro de quitação / amortização
   if chkQuitaAmortiza.Checked then
   begin
      sSql := sSql +
   '      AND HME.HMETIPOMOV       IN (0, 1, 4, 6, 7) '                       + #13;
   end
   else
   begin
      sSql := sSql +
   '      AND HME.HMETIPOMOV       IN (0, 1, 2, 3, 4, 6, 7) '                 + #13;
   end;

   sSql := sSql +
   '      AND ( (HME.FLGESTORNADO  IS NULL) OR (HME.FLGESTORNADO = 0) ) '     + #13 +
   '      AND ( (HME.FLGQUITADO    IS NULL) OR (HME.FLGQUITADO = 0) ) '       + #13 +
   '      AND ( (HME.FLGABONADO    IS NULL) OR (HME.FLGABONADO = 0) ) '       + #13 +
   '      AND HME.HMEANOCOBRANCA   = ' + sAno                                 + #13 +
   '      AND HME.HMEMESCOBRANCA   = ' + sMes                                 + #13 +
   '      AND (HME.HMECENTRALIZA   = 1 OR HME.HMEDESTACADO = 1) '             + #13 +
   // Pendência 23260 - Marcos Topini em 30/11/2006
          (* filtro por Patrocinadora *)
   '      AND MIG.IDPATROATU           IN (' + molListaPatro.PegaPatro + ')           ' + #13 +
          (* filtro por Plano *)
   '      AND MIG.IDPLANOCONTATU       IN (' + molListaPlano.PegaPlano + ')           ' + #13 +
   '      AND MIG.IDCONTRATOEMPTMO  = HME.IDCONTRATOEMPTMO                            ' + #13 +
   '      AND MIG.DATAMIGRA         = (SELECT MAX(DATAMIGRA)                          ' + #13 +
   '                                     FROM VWMIGRACONTRATOEP                       ' + #13 +
   '                                    WHERE IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO ' + #13 +
   '                                      AND DATAMIGRA       <= HME.HMEDATAPREVISTA) ' + #13 +
   // Fim Pendência 23260

   '   GROUP BY '                                                             + #13 +
   '      HME.IDCONTRATOEMPTMO '                                              + #13 +
   '   ) HPE, '                                                               + #13 +

   '   ( '                                                                    + #13 +
   '   SELECT '                                                               + #13 +
   '      TMP.IDDESCONTO                   AS IDCONTRATOEMPTMO, '             + #13 +
   '      SUM(NVL(TMP.VALOR, 0))           AS VLRPREVISTO, '                  + #13 +
   '      SUM(NVL(TMP.VALORRECEBIDO, 0))   AS VLREFETIVO '                    + #13 +
   '   FROM '                                                                 + #13 +
   '      TMPDESC TMP '                                                       + #13 +
   '   WHERE '                                                                + #13 +
   '          TMP.IDMODULO     IN (15, 32) '                                  + #13 +
   '      AND TMP.IDDESCONTO   IS NOT NULL '                                  + #13;

   // filtro por Contrato
   if molContratoEmptmo.IDContrato > 0 then sSql := sSql +
   '      AND TMP.IDDESCONTO   = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)   + #13;

   // filtro por Tipo de Folha
   if ( (chkFolhaPatro.Checked) xor (chkFolhaBenef.Checked) ) then
   begin
      if chkFolhaPatro.Checked then sSql := sSql +
   '      AND TMP.FLGDESCFOLHA = ''P'''                                       + #13;

      if chkFolhaBenef.Checked then sSql := sSql +
   '      AND TMP.FLGDESCFOLHA = ''B'''                                       + #13;
   end;

   sSql := sSql +
   '      AND TMP.MESCOBRANCA  = ' + QuotedStr(sAnoMes)                       + #13 +
   '   GROUP BY '                                                             + #13 +
   '      TMP.IDDESCONTO '                                                    + #13 +
   '   ) HMT '                                                                + #13 +

   'WHERE '                                                                   + #13 +

   (* filtro por Empresa Proprietátia *)
   '  TEP.IDEMPRESAPROP       = ' + IntToStr(Sistema.IDEmpresa)               + #13;

   // filtro por Contrato
   if molContratoEmptmo.IDContrato > 0 then sSql := sSql +
   '   AND CON.IDCONTRATOEMPTMO     = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)    + #13;

   (* filtro por Tipo de Empréstimo *)
   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   //Pendência 27205 - 09/01/2007
   //'   AND CON.IDTIPOEMPTMO         = ' + DBcboTipoEmptmo.LookupValue                        + #13;
   '   AND TEP.IDTIPOEMPTMO         = ' + DBcboTipoEmptmo.LookupValue                        + #13;
   //Fim Pendência 27205

   // filtro por Tipo de Contrato
   if DBcboTipoContrato.LookupValue <> '' then sSQL := sSQL +
   '   AND CON.IDTIPOCONTREMPTMO    = ' + DBcboTipoContrato.LookupValue                      + #13;

   // filtro por tipo de divergência ---------------------------------------------------------------
   if ( (chkVlrRecebido.Checked) and (chkVlrEnviado.Checked) ) then
   begin
      if ( (chkFolhaPatro.Checked) and (chkFolhaBenef.Checked) ) then
      begin
         sSQL := sSQL +
   '   AND ( ((NVL(HBE.VLREFETIVO, 0) + NVL(HPE.VLREFETIVO, 0)) <> NVL(HMT.VLREFETIVO, 0)) OR '    +
         '   ((NVL(HBP.VLRPREVISTO, 0) + NVL(HPP.VLRPREVISTO, 0)) <> NVL(HMT.VLRPREVISTO, 0)) ) '  + #13;
      end
      else
      begin
         // só patro
         if ( chkFolhaPatro.Checked ) then sSQL := sSQL +
   '   AND ( (NVL(HPE.VLREFETIVO, 0) <> NVL(HMT.VLREFETIVO, 0)) OR '    +
         '   (NVL(HPP.VLRPREVISTO, 0) <> NVL(HMT.VLRPREVISTO, 0)) ) '  + #13;

         // só benefícios
         if ( chkFolhaBenef.Checked ) then sSQL := sSQL +
   '   AND ( (NVL(HBE.VLREFETIVO, 0) <> NVL(HMT.VLREFETIVO, 0)) OR '    +
         '   (NVL(HBP.VLRPREVISTO, 0) <> NVL(HMT.VLRPREVISTO, 0)) ) '  + #13;
      end;
   end
   else
   begin
      // só valor enviado
      if chkVlrEnviado.Checked then
      begin
         if ( (chkFolhaPatro.Checked) and (chkFolhaBenef.Checked) ) then
         begin
            sSQL := sSQL +
      '   AND ( (NVL(HBP.VLRPREVISTO, 0) + NVL(HPP.VLRPREVISTO, 0)) <> NVL(HMT.VLRPREVISTO, 0) ) ' + #13;
         end
         else
         begin
            if ( chkFolhaPatro.Checked ) then sSQL := sSQL +
      '   AND ( NVL(HPP.VLRPREVISTO, 0) <> NVL(HMT.VLRPREVISTO, 0) ) ' + #13;

            if ( chkFolhaBenef.Checked ) then sSQL := sSQL +
      '   AND ( NVL(HBP.VLRPREVISTO, 0) <> NVL(HMT.VLRPREVISTO, 0) ) ' + #13;

         end; // if ( (chkFolhaPatro.Checked) and (chkFolhaBenef.Checked) )
      end;

      // só valor recebido
      if chkVlrRecebido.Checked then
      begin
         if ( (chkFolhaPatro.Checked) and (chkFolhaBenef.Checked) ) then
         begin
            sSQL := sSQL +
      '   AND ( (NVL(HBE.VLREFETIVO, 0) + NVL(HPE.VLREFETIVO, 0)) <> NVL(HMT.VLREFETIVO, 0) ) '    + #13;
         end
         else
         begin
            if ( chkFolhaPatro.Checked ) then sSQL := sSQL +
      '   AND ( NVL(HPE.VLREFETIVO, 0) <> NVL(HMT.VLREFETIVO, 0) ) '    + #13;

            if ( chkFolhaBenef.Checked ) then sSQL := sSQL +
      '   AND ( NVL(HBE.VLREFETIVO, 0) <> NVL(HMT.VLREFETIVO, 0) ) '    + #13;
         end;
      end;
   end;

   // ----------------------------------------------------------------------------------------------
   sSQL := sSQL +

   '   AND CON.IDPATRO           = PTR.IDPESSOA '                             + #13 +
   '   AND CON.IDPLANOPREV       = PLP.IDPLANOPREV '                          + #13 +
   '   AND CON.IDCONTRATOEMPTMO  = HBP.IDCONTRATOEMPTMO(+) '                  + #13 +
   '   AND CON.IDCONTRATOEMPTMO  = HBE.IDCONTRATOEMPTMO(+) '                  + #13 +
   '   AND CON.IDCONTRATOEMPTMO  = HPP.IDCONTRATOEMPTMO(+) '                  + #13 +
   '   AND CON.IDCONTRATOEMPTMO  = HPE.IDCONTRATOEMPTMO(+) '                  + #13 +
   '   AND CON.IDCONTRATOEMPTMO  = HMT.IDCONTRATOEMPTMO(+) '                  + #13 +
   '   AND CON.IDBENEF           = MUT.IDPESSOA           '                   + #13 +
   '   AND TCE.IDTIPOEMPTMO      = TEP.IDTIPOEMPTMO       '                   + #13 +
   '   AND CON.IDTIPOCONTREMPTMO = TCE.IDTIPOCONTREMPTMO  '                   + #13 +
   '   AND CON.IDBENEF           = DEP.IDPESSOA           '                   + #13 +

   'ORDER BY '                                                                + #13 +
   '   PTR.NOME, MUT.NOME '                                                   + #13;

   with dtmRelConfereEnvioContrato.qryConfereEnvioContrato do
   begin
      Close;
      SQL.Text := sSQL;
      Open;
   end;
end;



procedure TcfgRelConfereEnvioContrato.FormShow(Sender: TObject);
begin
   inherited;

   // limpa a seleção de Contrato
   molContratoEmptmo.btnLimpaContrato.Click;

   // preenche o mês de cobrança
   cboMes.ItemIndex := DiasUteis.ExtraiMes(SysDate) - 1;
   DBspnAno.Value   := DiasUteis.ExtraiAno(SysDate);

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



procedure TcfgRelConfereEnvioContrato.molListaPatrobtnInvertePatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnInvertePatroClick(Sender);
end;



procedure TcfgRelConfereEnvioContrato.molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnMarcaTodosPatroClick(Sender);
end;



procedure TcfgRelConfereEnvioContrato.molListaPlanobtnInvertePlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnInvertePlanoClick(Sender);
end;



procedure TcfgRelConfereEnvioContrato.molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnMarcaTodosPlanoClick(Sender);
end;



procedure TcfgRelConfereEnvioContrato.DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
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



procedure TcfgRelConfereEnvioContrato.DBcboTipoEmptmoExit(Sender: TObject);
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



procedure TcfgRelConfereEnvioContrato.molContratoEmptmobtnBuscaContratoClick(Sender: TObject);
begin
   inherited;
   molContratoEmptmo.btnBuscaContratoClick(Sender);
end;



procedure TcfgRelConfereEnvioContrato.molContratoEmptmobtnLimpaContratoClick(Sender: TObject);
begin
   inherited;
   molContratoEmptmo.btnLimpaContratoClick(Sender);
end;



end.
