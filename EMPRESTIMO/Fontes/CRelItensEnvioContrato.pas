{---------------------------Alteração-------------------------------------------
Pendência   : SOL 114575 KINTANA 535771
Responsável : Jéssica Lana
Data        : 24/04/2009
Descrição   : Gravar arquivos com a query de entrada na pasta C:\PLANUS\TEMP.
-------------------------------------------------------------------------------}
unit CRelItensEnvioContrato;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   CRel, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr,
   TB97, ExtCtrls, mContratoEmptmo, Mask, wwdbedit, Wwdbspin, CheckLst,
   wwdblook, db, fcCombo, fcColorCombo, DBTables, Wwquery,

   uTypesEmptmo, mMutuario, mListaPlano, mListaPatro;

type
   TcfgRelItensEnvioContrato = class(TcfgRel)
      DBcboTipoContrato: TwwDBLookupCombo;
      Label2: TLabel;
      Panel1: TPanel;
      Label15: TLabel;
      DBspnAno: TwwDBSpinEdit;
      cboMes: TComboBox;
      Label1: TLabel;
      DBcboTipoEmptmo: TwwDBLookupCombo;
      GroupBox2: TGroupBox;
      chkCorLinha: TCheckBox;
      cboCorLinha: TfcColorCombo;
      chkLinhas: TCheckBox;
      rdgOrdenar: TRadioGroup;
      chkValorZero: TCheckBox;
      chkValorDiverg: TCheckBox;
      molMutuario: TmolMutuario;
      chkValorNAOZero: TCheckBox;
      molListaPatro: TmolListaPatro;
      molListaPlano: TmolListaPlano;
      chkQuitaAmortiza: TCheckBox;
      chkSintetico: TCheckBox;
      GroupBox1: TGroupBox;
      chkFolhaPatro: TCheckBox;
      chkFolhaBenef: TCheckBox;
      Label4: TLabel;
      DBcboSitPart: TwwDBLookupCombo;
      CheckBox1: TCheckBox;

      procedure FormShow(Sender: TObject);
      procedure DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure molMutuario1btnBuscaPartClick(Sender: TObject);
      procedure molMutuariobtnLimpaPartClick(Sender: TObject);
      procedure molListaPatrobtnInvertePatroClick(Sender: TObject);
      procedure molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
      procedure molListaPlanobtnInvertePlanoClick(Sender: TObject);
      procedure molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
      procedure DBcboTipoEmptmoExit(Sender: TObject);


   private { Private declarations }

      procedure AbreQueries;

      procedure MontaQuery; override;
      procedure FiltraRelatorio;

  public { Public declarations }

  end;



var
  cfgRelItensEnvioContrato: TcfgRelItensEnvioContrato;



implementation
{$R *.DFM}
uses
   DLookEmptmo,
   UDiasUteis,
   USistema,
   UfuncoesEmptmo,
   FProgresso,
   uMensErro,
   dRelItensEnvioContrato;




procedure TcfgRelItensEnvioContrato.AbreQueries;
begin
   with dtmLookEmptmo.qryLookTipoEmptmo do
   begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoEmptmo);
      ParamByName('PIDEMPRESAPROP').AsInteger := Sistema.IDEmpresa;
      Open;
   end;

   // Tipo de Contrato
   LimpaParametros(dtmLookEmptmo.qryLookPlanPrev);
   dtmLookEmptmo.qryLookPlanPrev.Open;

   // SitPart
   LimpaParametros(dtmLookEmptmo.qryLookSitPart);
   dtmLookEmptmo.qryLookSitPart.Open;
end;




procedure TcfgRelItensEnvioContrato.MontaQuery;
begin
   inherited;

   with dtmRelItensEnvioContrato do
   begin
      sMesCobranca   := cboMes.Text + ' / ' + DBspnAno.Text;
      bCorLinha      := chkCorLinha.Checked;
      CorLinha       := cboCorLinha.SelectedColor;

      // Início Pendência 21063 - Marcos Ventura Topini
      // -------------------------------------------------------------------------------------------

        lblTipoEmptmo.Caption := ' < todos > ';
        if DBcboTipoEmptmo.LookupValue <> ''   then lblTipoEmptmo.Caption := DBcboTipoEmptmo.Text;

        lblTipoContr.Caption  := ' < todos > ';
        if DBcboTipoContrato.LookupValue <> '' then lblTipoContr.Caption  := DBcboTipoContrato.Text;

        memPatro.RichText := molListaPatro.ListaPatro;
        memPlano.RichText := molListaPlano.ListaPlano;

      // -------------------------------------------------------------------------------------------
      // Fim Pendência 21063

      dtmRelItensEnviolContrato_lblSitPart.Caption := '< Todas >';
      if DBcboSitPart.LookupValue <> '' then
      begin
         dtmRelItensEnviolContrato_lblSitPart.Caption := DBcboSitPart.Text;
      end;
   end;

   FiltraRelatorio;
end;


procedure TcfgRelItensEnvioContrato.FiltraRelatorio;
var
   sSQL           : String;
   sAno, sMes     : String;
   sOrdenacao     : String;
begin
   sAno  := FormatFloat('0000', DBspnAno.Value);
   sMes  := FormatFloat('00', cboMes.ItemIndex + 1);

   case rdgOrdenar.ItemIndex of
      0 : sOrdenacao := '   PTR.NOME, CON.IDCONTRATOEMPTMO';
      1 : sOrdenacao := '   PTR.NOME, NVL(DEP.MATRICULA, ELP.MATRICULA), CON.IDCONTRATOEMPTMO';
      2 : sOrdenacao := '   PTR.NOME, MUT.NOME, CON.IDCONTRATOEMPTMO';
   end;

   sSQL :=
   'SELECT '                                                                                 + #13 +
   '   CON.IDCONTRATOEMPTMO, '                                                               + #13 +

   '   CON.IDPATRO, PTR.NOME AS PATRO, '                                                     + #13 +
   '   CON.IDPLANOPREV, PLP.NOME AS PLANO, '                                                 + #13 +

   '   MUT.NOME, '                                                                           + #13 +
   '   NVL(DEP.MATRICULA, ELP.MATRICULA) AS MATRICULA, '                                     + #13 +
   '   TCE.TCEDESCRICAO, '                                                                   + #13 +

   '   NVL(HBP.VLRPREVISTO, 0) AS VLR_PREV_BENEF, '                                          + #13 +
   '   NVL(HBE.VLREFETIVO, 0)  AS VLR_EFET_BENEF, '                                          + #13 +
   '   NVL(HPP.VLRPREVISTO, 0) AS VLR_PREV_PATRO, '                                          + #13 +
   '   NVL(HPE.VLREFETIVO, 0)  AS VLR_EFET_PATRO  '                                          + #13 +

   'FROM '                                                                                   + #13 +
   '   PESSOA          PTR, '                                                                + #13 +
   '   PESSOA          MUT, '                                                                + #13 +
   '   TIPOCONTREMPTMO TCE, '                                                                + #13 +
   '   TIPOEMPTMO      TEP, '                                                                + #13 +
   '   CONTRATOEMPTMO  CON, '                                                                + #13 +
   '   DEPENTIT        DEP, '                                                                + #13 +
   '   ELEGPATRO       ELP, '                                                                + #13 +
   '   PLANPREV        PLP, '                                                                + #13 +
   //Pendência 27333 - 30/01/2008
   '   PARTPREVPLAN    PPP, '                                                                + #13 +
   //Fim Pendência 27333

   // ----------------------------------------------------------------------------------------------
   //    Folha de Benefícios - Valor Previsto
   // ----------------------------------------------------------------------------------------------

   '   ( '                                                                                   + #13 +
   '   SELECT '                                                                              + #13 +
   '      HME.IDCONTRATOEMPTMO, '                                                            + #13 +
   '      SUM(ABS(NVL(HME.HMEVLRPREVISTO, 0))) AS VLRPREVISTO, '                             + #13 +
   '      SUM(ABS(NVL(HME.HMEVLREFETIVO, 0))) AS VLREFETIVO '                                + #13 +
   '   FROM '                                                                                + #13 +
   '      HISTMOVEMPTMO HME, '                                                               + #13 +

   // Pendência 23260 - 28/12/2006 - Marcos Topini
   '      VWMIGRACONTRATOEP MIG '                                                            + #13 +

   '   WHERE '                                                                               + #13 +
   '          HME.HMEFORMACOBRANCA = ''F'' '                                                 + #13 +
   '      AND HME.HMETIPOFOLHA     = ''B'' '                                                 + #13 +

   //     filtro por Patrocinadora
   '      AND MIG.IDPATROATU           IN (' + molListaPatro.PegaPatro + ') '                + #13 +
   //     filtro por Plano
   '      AND MIG.IDPLANOCONTATU       IN (' + molListaPlano.PegaPlano + ') '                + #13;

   if chkQuitaAmortiza.Checked then
   begin
      sSQL := sSQL +
   '      AND HME.HMETIPOMOV       IN (0, 1, 4, 6, 7) '                                      + #13;
   end
   else
   begin
      sSQL := sSQL +
   '      AND HME.HMETIPOMOV       IN (0, 1, 2, 3, 4, 6, 7) '                                + #13;
   end;

   sSQL := sSQL +
   '      AND HME.FLGENVIO         IS NULL '                                                 + #13 +
   '      AND ( (HME.FLGESTORNADO  IS NULL) OR (HME.FLGESTORNADO = 0) ) '                    + #13 +
   '      AND HME.HMEANOCOBRANCA   = ' + sAno                                                + #13 +
   '      AND HME.HMEMESCOBRANCA   = ' + sMes                                                + #13 +
   // Pendência 23260 - 28/12/2006 - Marcos Topini
   '      AND MIG.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO '                                  + #13 +
   '      AND MIG.DATAMIGRA        = (SELECT MAX(DATAMIGRA) '                                + #13 +
   '                                    FROM VWMIGRACONTRATOEP '                             + #13 +
   '                                   WHERE IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO '       + #13 +
   '                                     AND DATAMIGRA       <= HME.HMEDATAPREVISTA) '       + #13 +
   // Fim Pendência 23260
   '      AND (HME.HMECENTRALIZA   = 1 OR HME.HMEDESTACADO = 1) '                            + #13 +

   '   GROUP BY '                                                                            + #13 +
   '      HME.IDCONTRATOEMPTMO '                                                             + #13;

   // ----------------------------------------------------------------------------------------------
   if ( chkValorDiverg.Checked or chkValorZero.Checked or chkValorNAOZero.Checked) then
   begin
      sSQL := sSQL +
   '   HAVING '                                                                              + #13;

      if chkValorZero.Checked then sSQL := sSQL +
   '      SUM(NVL(HME.HMEVLREFETIVO, 0)) = 0 '                                               + #13;

      if chkValorDiverg.Checked then
      begin
         if chkValorZero.Checked then sSQL := sSQL + '      AND '                            + #13;
         sSQL := sSQL +
   '      SUM(NVL(HME.HMEVLREFETIVO, 0)) <> NVL(SUM(HME.HMEVLRPREVISTO), 0) '                + #13;
      end;

      if chkValorNAOZero.Checked then
      begin
         if ( chkValorZero.Checked or chkValorDiverg.Checked ) then sSQL := sSQL + '      AND '    + #13;
         sSQL := sSQL +
   '      SUM(NVL(HME.HMEVLREFETIVO, 0)) <> 0 '                                              + #13;
      end;
   end;
   // ----------------------------------------------------------------------------------------------

   sSQL := sSQL +
   '   ) HBP, '                                                                              + #13 +

   // ----------------------------------------------------------------------------------------------
   // FIM Folha de Benefícios - Valor Previsto
   // ----------------------------------------------------------------------------------------------

   // ----------------------------------------------------------------------------------------------
   //    Folha de Benefícios - Valor Efetivo
   // ----------------------------------------------------------------------------------------------

   '   ( '                                                                                   + #13 +
   '   SELECT '                                                                              + #13 +
   '      HME.IDCONTRATOEMPTMO, '                                                            + #13 +
   '      SUM(ABS(NVL(HME.HMEVLRPREVISTO, 0))) AS VLRPREVISTO, '                             + #13 +
   '      SUM(ABS(NVL(HME.HMEVLREFETIVO, 0))) AS VLREFETIVO '                                + #13 +
   '   FROM '                                                                                + #13 +
   '      HISTMOVEMPTMO HME, '                                                               + #13 +

   // Pendência 23260 - 28/12/2006 - Marcos Topini
   '      VWMIGRACONTRATOEP MIG '                                                            + #13 +

   '   WHERE '                                                                               + #13 +
   '          HME.HMEFORMACOBRANCA = ''F'' '                                                 + #13 +
   '      AND HME.HMETIPOFOLHA     = ''B'' '                                                 + #13 +

   //     filtro por Patrocinadora
   '      AND MIG.IDPATROATU           IN (' + molListaPatro.PegaPatro + ') '                + #13 +

   //     filtro por Plano
   '      AND MIG.IDPLANOCONTATU       IN (' + molListaPlano.PegaPlano + ') '                + #13;

   if chkQuitaAmortiza.Checked then
   begin
      sSQL := sSQL +
   '      AND HME.HMETIPOMOV       IN (0, 1, 4, 6, 7) '                                      + #13;
   end
   else
   begin
      sSQL := sSQL +
   '      AND HME.HMETIPOMOV       IN (0, 1, 2, 3, 4, 6, 7) '                                + #13;
   end;

   sSQL := sSQL +
   '      AND ( (HME.FLGESTORNADO  IS NULL) OR (HME.FLGESTORNADO = 0) ) '                    + #13 +
   '      AND ( (HME.FLGQUITADO    IS NULL) OR (HME.FLGQUITADO   = 0) ) '                    + #13 +
   '      AND ( (HME.FLGABONADO    IS NULL) OR (HME.FLGABONADO   = 0) ) '                    + #13 +
   '      AND HME.HMEANOCOBRANCA   = ' + sAno                                                + #13 +
   '      AND HME.HMEMESCOBRANCA   = ' + sMes                                                + #13 +
   '      AND (HME.HMECENTRALIZA   = 1 OR HME.HMEDESTACADO = 1) '                            + #13 +

   // Pendência 23260 - 28/12/2006 - Marcos Topini
   '      AND MIG.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO '                                  + #13 +
   '      AND MIG.DATAMIGRA        = (SELECT MAX(DATAMIGRA) '                                + #13 +
   '                                    FROM VWMIGRACONTRATOEP '                             + #13 +
   '                                   WHERE IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO '       + #13 +
   '                                     AND DATAMIGRA       <= HME.HMEDATAPREVISTA) '       + #13 +
   // Fim Pendência 23260

   '   GROUP BY '                                                                            + #13 +
   '      HME.IDCONTRATOEMPTMO '                                                             + #13;

   // ----------------------------------------------------------------------------------------------
   if ( chkValorDiverg.Checked or chkValorZero.Checked or chkValorNAOZero.Checked) then
   begin
      sSQL := sSQL +
   '   HAVING '                                                                              + #13;

      if chkValorZero.Checked then sSQL := sSQL +
   '      SUM(NVL(HME.HMEVLREFETIVO, 0)) = 0 '                                               + #13;

      if chkValorDiverg.Checked then
      begin
         if chkValorZero.Checked then sSQL := sSQL + '      AND '                            + #13;
         sSQL := sSQL +
   '      SUM(NVL(HME.HMEVLREFETIVO, 0)) <> NVL(SUM(HME.HMEVLRPREVISTO), 0) '                + #13;
      end;

      if chkValorNAOZero.Checked then
      begin
         if ( chkValorZero.Checked or chkValorDiverg.Checked ) then sSQL := sSQL + '      AND '    + #13;
         sSQL := sSQL +
   '      SUM(NVL(HME.HMEVLREFETIVO, 0)) <> 0 '                                              + #13;
      end;
   end;
   // ----------------------------------------------------------------------------------------------

   sSQL := sSQL +
   '   ) HBE, '                                                                              + #13 +

   // ----------------------------------------------------------------------------------------------
   // FIM Folha de Benefícios - Valor Efetivo
   // ----------------------------------------------------------------------------------------------

   // ----------------------------------------------------------------------------------------------
   //    Folha da Partocinadora - Valor Previsto
   // ----------------------------------------------------------------------------------------------

   '   ( '                                                                                   + #13 +
   '   SELECT '                                                                              + #13 +
   '      HME.IDCONTRATOEMPTMO, '                                                            + #13 +
   '      SUM(ABS(NVL(HME.HMEVLRPREVISTO, 0))) AS VLRPREVISTO, '                             + #13 +
   '      SUM(ABS(NVL(HME.HMEVLREFETIVO, 0))) AS VLREFETIVO '                                + #13 +
   '   FROM '                                                                                + #13 +
   '      HISTMOVEMPTMO HME, '                                                               + #13 +

   // Pendência 23260 - 28/12/2006 - Marcos Topini
   '      VWMIGRACONTRATOEP MIG '                                                            + #13 +

   '   WHERE '                                                                               + #13 +
   '          HME.HMEFORMACOBRANCA = ''F'' '                                                 + #13 +
   '      AND HME.HMETIPOFOLHA     = ''P'' '                                                 + #13 +

   //     filtro por Patrocinadora
   '      AND MIG.IDPATROATU           IN (' + molListaPatro.PegaPatro + ') '                + #13 +
   //     filtro por Plano
   '      AND MIG.IDPLANOCONTATU       IN (' + molListaPlano.PegaPlano + ') '                + #13;

   if chkQuitaAmortiza.Checked then
   begin
      sSQL := sSQL +
   '      AND HME.HMETIPOMOV       IN (0, 1, 4, 6, 7) '                                      + #13;
   end
   else
   begin
      sSQL := sSQL +
   '      AND HME.HMETIPOMOV       IN (0, 1, 2, 3, 4, 6, 7) '                                + #13;
   end;

   sSQL := sSQL +
   '      AND HME.FLGENVIO         IS NULL '                                                 + #13 +
   '      AND ( (HME.FLGESTORNADO  IS NULL) OR (HME.FLGESTORNADO = 0) ) '                    + #13 +
   '      AND HME.HMEANOCOBRANCA   = ' + sAno                                                + #13 +
   '      AND HME.HMEMESCOBRANCA   = ' + sMes                                                + #13 +
   '      AND (HME.HMECENTRALIZA   = 1 OR HME.HMEDESTACADO = 1) '                            + #13 +

   // Pendência 23260 - 28/12/2006 - Marcos Topini
   '      AND MIG.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO '                                  + #13 +
   '      AND MIG.DATAMIGRA        = (SELECT MAX(DATAMIGRA) '                                + #13 +
   '                                    FROM VWMIGRACONTRATOEP '                             + #13 +
   '                                   WHERE IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO '       + #13 +
   '                                     AND DATAMIGRA       <= HME.HMEDATAPREVISTA) '       + #13 +
   // Pendência 23260

   '   GROUP BY '                                                                            + #13 +
   '      HME.IDCONTRATOEMPTMO '                                                             + #13;

   // ----------------------------------------------------------------------------------------------
   if ( chkValorDiverg.Checked or chkValorZero.Checked or chkValorNAOZero.Checked) then
   begin
      sSQL := sSQL +
   '   HAVING '                                                                              + #13;

      if chkValorZero.Checked then sSQL := sSQL +
   '      SUM(NVL(HME.HMEVLREFETIVO, 0)) = 0 '                                               + #13;

      if chkValorDiverg.Checked then
      begin
         if chkValorZero.Checked then sSQL := sSQL + '      AND '                            + #13;
         sSQL := sSQL +
   '      SUM(NVL(HME.HMEVLREFETIVO, 0)) <> NVL(SUM(HME.HMEVLRPREVISTO), 0) '                + #13;
      end;

      if chkValorNAOZero.Checked then
      begin
         if ( chkValorZero.Checked or chkValorDiverg.Checked ) then sSQL := sSQL + '      AND '    + #13;
         sSQL := sSQL +
   '      SUM(NVL(HME.HMEVLREFETIVO, 0)) <> 0 '                                              + #13;
      end;
   end;
   // ----------------------------------------------------------------------------------------------

   sSQL := sSQL +
   '   ) HPP, '                                                                              + #13 +

   // ----------------------------------------------------------------------------------------------
   // FIM Folha da Partocinadora - Valor Previsto
   // ----------------------------------------------------------------------------------------------

   // ----------------------------------------------------------------------------------------------
   //    Folha da Partocinadora - Valor Efetivo
   // ----------------------------------------------------------------------------------------------

   '   ( '                                                                                   + #13 +
   '   SELECT '                                                                              + #13 +
   '      HME.IDCONTRATOEMPTMO, '                                                            + #13 +
   '      SUM(ABS(NVL(HME.HMEVLRPREVISTO, 0))) AS VLRPREVISTO, '                             + #13 +
   '      SUM(ABS(NVL(HME.HMEVLREFETIVO, 0))) AS VLREFETIVO '                                + #13 +
   '   FROM '                                                                                + #13 +
   '      HISTMOVEMPTMO HME, '                                                               + #13 +

   // Pendência 23260 - 28/12/2006 - Marcos Topini
   '      VWMIGRACONTRATOEP MIG '                                                            + #13 +

   '   WHERE '                                                                               + #13 +
   '          HME.HMEFORMACOBRANCA = ''F'' '                                                 + #13 +
   '      AND HME.HMETIPOFOLHA     = ''P'' '                                                 + #13 +

   //     filtro por Patrocinadora
   '      AND MIG.IDPATROATU           IN (' + molListaPatro.PegaPatro + ') '                + #13 +
   //     filtro por Plano
   '      AND MIG.IDPLANOCONTATU       IN (' + molListaPlano.PegaPlano + ') '                + #13;

   if chkQuitaAmortiza.Checked then
   begin
      sSQL := sSQL +
   '      AND HME.HMETIPOMOV       IN (0, 1, 4, 6, 7) '                                      + #13;
   end
   else
   begin
      sSQL := sSQL +
   '      AND HME.HMETIPOMOV       IN (0, 1, 2, 3, 4, 6, 7) '                                + #13;
   end;

   sSQL := sSQL +
   '      AND ( (HME.FLGESTORNADO  IS NULL) OR (HME.FLGESTORNADO = 0) ) '                    + #13 +
   '      AND ( (HME.FLGQUITADO    IS NULL) OR (HME.FLGQUITADO   = 0) ) '                    + #13 +
   '      AND ( (HME.FLGABONADO    IS NULL) OR (HME.FLGABONADO   = 0) ) '                    + #13 +
   '      AND HME.HMEANOCOBRANCA   = ' + sAno                                                + #13 +
   '      AND HME.HMEMESCOBRANCA   = ' + sMes                                                + #13 +
   '      AND (HME.HMECENTRALIZA   = 1 OR HME.HMEDESTACADO = 1) '                            + #13 +

   // Pendência 23260 - 28/12/2006 - Marcos Topini
   '      AND MIG.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO  '                                 + #13 +
   '      AND MIG.DATAMIGRA        = (SELECT MAX(DATAMIGRA) '                                + #13 +
   '                                    FROM VWMIGRACONTRATOEP '                             + #13 +
   '                                   WHERE IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO  '      + #13 +
   '                                     AND DATAMIGRA       <= HME.HMEDATAPREVISTA) '       + #13 +

   '   GROUP BY '                                                                            + #13 +
   '      HME.IDCONTRATOEMPTMO '                                                             + #13;

   // ----------------------------------------------------------------------------------------------
   if ( chkValorDiverg.Checked or chkValorZero.Checked or chkValorNAOZero.Checked) then
   begin
      sSQL := sSQL +
   '   HAVING '                                                                              + #13;

      if chkValorZero.Checked then sSQL := sSQL +
   '      SUM(NVL(HME.HMEVLREFETIVO, 0)) = 0 '                                               + #13;

      if chkValorDiverg.Checked then
      begin
         if chkValorZero.Checked then sSQL := sSQL + '      AND '                            + #13;
         sSQL := sSQL +
   '      SUM(NVL(HME.HMEVLREFETIVO, 0)) <> NVL(SUM(HME.HMEVLRPREVISTO), 0) '                + #13;
      end;

      if chkValorNAOZero.Checked then
      begin
         if ( chkValorZero.Checked or chkValorDiverg.Checked ) then sSQL := sSQL + '      AND '    + #13;
         sSQL := sSQL +
   '      SUM(NVL(HME.HMEVLREFETIVO, 0)) <> 0 '                                              + #13;
      end;
   end;
   // ----------------------------------------------------------------------------------------------

   sSQL := sSQL +
   '   ) HPE '                                                                               + #13 +

   // ----------------------------------------------------------------------------------------------
   // FIM Folha da Partocinadora - Valor Efetivo
   // ----------------------------------------------------------------------------------------------
   'WHERE '                                                                                  + #13 +

   // filtro por Empresa Proprietátia
   '       TEP.IDEMPRESAPROP        = ' + IntToStr(Sistema.IDEmpresa)                        + #13;

   // filtro por Contrato
   if molMutuario.IDBenef > 0 then sSql := sSql +
   '   AND CON.IDPESSOA             = ' + IntToStr(molMutuario.IDTitular)                    + #13 +
   '   AND CON.IDBENEF              = ' + IntToStr(molMutuario.IDBenef)                      + #13;

   // filtro por Tipo de Empréstimo
   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   '   AND TCE.IDTIPOEMPTMO         = ' + DBcboTipoEmptmo.LookupValue                        + #13;

   // filtro por Tipo de Contrato
   if DBcboTipoContrato.LookupValue <> '' then sSQL := sSQL +
   '   AND CON.IDTIPOCONTREMPTMO    = ' + DBcboTipoContrato.LookupValue                      + #13;

   // filtro por SitPart
   if DBcboSitPart.LookupValue <> '' then sSQL := sSQL +
   //Pendência 27333 - 30/01/2008
   //'   AND CON.IDSITPART            = ' + DBcboSitPart.LookupValue                           + #13;
   '   AND PPP.IDSITPART            = ' + DBcboSitPart.LookupValue                           + #13;
   //Fim Pendência 27333 - 30/01/2008

   // ----------------------------------------------------------------------------------------------
   if ( chkFolhaPatro.Checked or chkFolhaBenef.Checked ) then
   begin
      sSQL := sSQL + '   AND ( ';

      if chkFolhaPatro.Checked then sSQL := sSQL +
         '((HPP.VLRPREVISTO <> 0) OR (HPE.VLREFETIVO <> 0))';

      if chkFolhaBenef.Checked then
      begin
         if ( (*chkFinanceiro.Checked or*) chkFolhaPatro.Checked ) then sSQL := sSQL + ' OR ';
      sSQL := sSQL +
         '((HBP.VLRPREVISTO <> 0) OR (HBE.VLREFETIVO <> 0))';
      end;

      sSQL := sSQL + ' ) ' + #13;
   end;
   // ----------------------------------------------------------------------------------------------

   sSQL := sSQL +
   '   AND CON.IDPATRO          = PTR.IDPESSOA '                                             + #13 +
   '   AND CON.IDPLANOPREV      = PLP.IDPLANOPREV '                                          + #13 +
   '   AND CON.IDPESSOA         = DEP.IDTITULAR '                                            + #13 +
   '   AND CON.IDBENEF          = DEP.IDPESSOA '                                             + #13 +
   '   AND CON.IDPESSOA         = ELP.IDPESSOA '                                             + #13 +
   '   AND CON.IDPATRO          = ELP.IDPESSJUR '                                            + #13 +
   '   AND CON.IDBENEF          = MUT.IDPESSOA '                                             + #13 +
   //Pendência 27333 - 30/01/2008
   '   AND CON.IDPESSOA          = PPP.IDPESSOA '                                            + #13 +
   '   AND CON.IDPATRO           = PPP.IDPESSJUR '                                           + #13 +
   '   AND CON.IDPLANOPREV       = PPP.IDPLANOPREV '                                         + #13 +
   //Fim Pendência 27333
   '   AND CON.IDTIPOCONTREMPTMO = TCE.IDTIPOCONTREMPTMO '                                   + #13 +
   '   AND TCE.IDTIPOEMPTMO     = TEP.IDTIPOEMPTMO '                                         + #13 +
   '   AND CON.IDCONTRATOEMPTMO = HBP.IDCONTRATOEMPTMO(+) '                                  + #13 +
   '   AND CON.IDCONTRATOEMPTMO = HBE.IDCONTRATOEMPTMO(+) '                                  + #13 +
   '   AND CON.IDCONTRATOEMPTMO = HPP.IDCONTRATOEMPTMO(+) '                                  + #13 +
   '   AND CON.IDCONTRATOEMPTMO = HPE.IDCONTRATOEMPTMO(+) '                                  + #13 +

   'ORDER BY ' + #13 + sOrdenacao;

   with dtmRelItensEnvioContrato.qryItensEnvioContrato do
   begin
      Close;
      SQL.Clear;
      SQL.Text := sSQL;
    //Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
    //SQL.SaveToFile(Sistema.TempDir + 'EP-RelItensEnvRecebFolhaContrato.txt');
      SQL.SaveToFile(ftempregra + '\' + 'EP-RelItensEnvRecebFolhaContrato.txt');
      Open;
   end;
end;



procedure TcfgRelItensEnvioContrato.FormShow(Sender: TObject);
begin
   inherited;

   molMutuario.btnLimpaPartClick(self);

   (* preenche a data de lançamento e o ano de referência/competência *)
   cboMes.ItemIndex        := DiasUteis.ExtraiMes(Date) - 1;
   DBspnAno.Value          := DiasUteis.ExtraiAno(Date);

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



procedure TcfgRelItensEnvioContrato.DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
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



procedure TcfgRelItensEnvioContrato.molMutuario1btnBuscaPartClick(Sender: TObject);
begin
   inherited;
   molMutuario.btnBuscaPartClick(Sender);
end;



procedure TcfgRelItensEnvioContrato.molMutuariobtnLimpaPartClick(Sender: TObject);
begin
   inherited;
   molMutuario.btnLimpaPartClick(Sender);
end;



procedure TcfgRelItensEnvioContrato.molListaPatrobtnInvertePatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnInvertePatroClick(Sender);
end;



procedure TcfgRelItensEnvioContrato.molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnMarcaTodosPatroClick(Sender);
end;



procedure TcfgRelItensEnvioContrato.molListaPlanobtnInvertePlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnInvertePlanoClick(Sender);
end;



procedure TcfgRelItensEnvioContrato.molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnMarcaTodosPlanoClick(Sender);
end;



procedure TcfgRelItensEnvioContrato.DBcboTipoEmptmoExit(Sender: TObject);
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



end.
