unit CRelItensEnvioAnalContrato;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CRel, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr,
  TB97, ExtCtrls, mContratoEmptmo, Mask, wwdbedit, Wwdbspin, CheckLst,
  wwdblook, db, fcCombo, fcColorCombo, DBTables, Wwquery,

  uTypesEmptmo, mMutuario, mListaPlano, mListaPatro;

type
   TcfgRelItensEnvioAnalContrato = class(TcfgRel)
      DBcboTipoContrato: TwwDBLookupCombo;
      Label2: TLabel;
      Panel1: TPanel;
      Label15: TLabel;
      DBspnAno: TwwDBSpinEdit;
      cboMes: TComboBox;
      GroupBox1: TGroupBox;
      chkFinanceiro: TCheckBox;
      chkFolhaPatro: TCheckBox;
      chkFolhaBenef: TCheckBox;
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

      procedure FormShow(Sender: TObject);
      procedure DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure molMutuario1btnBuscaPartClick(Sender: TObject);
      procedure molMutuariobtnLimpaPartClick(Sender: TObject);
      procedure molListaPatrobtnInvertePatroClick(Sender: TObject);
      procedure molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
      procedure molListaPlanobtnInvertePlanoClick(Sender: TObject);
      procedure molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);


   private { Private declarations }

      procedure AbreQueries;

      procedure MontaQuery; override;
      procedure FiltraRelatorio;

  public { Public declarations }

  end;



var
  cfgRelItensEnvioAnalContrato: TcfgRelItensEnvioAnalContrato;



implementation
{$R *.DFM}
uses
   DLookEmptmo,
   UDiasUteis,
   USistema,
   UfuncoesEmptmo,
   FProgresso,     (* FrmProgresso *)
   uMensErro, dRelItensEnvioAnal;




procedure TcfgRelItensEnvioAnalContrato.AbreQueries;
begin
   with dtmLookEmptmo.qryLookTipoEmptmo do begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoEmptmo);
      ParamByName('PIDEMPRESAPROP').AsInteger := Sistema.IDEmpresa;
      Open;
   end;

   // Tipo de Contrato
   LimpaParametros(dtmLookEmptmo.qryLookPlanPrev);
   dtmLookEmptmo.qryLookPlanPrev.Open;
end;




procedure TcfgRelItensEnvioAnalContrato.MontaQuery;
begin
   inherited;

   with dtmRelItensEnvioAnal do begin

      sMesCobranca   := cboMes.Text + ' / ' + DBspnAno.Text;
      bCorLinha      := chkCorLinha.Checked;
      CorLinha       := cboCorLinha.SelectedColor;

   end;

   FiltraRelatorio;
end;



procedure TcfgRelItensEnvioAnalContrato.FiltraRelatorio;
var
   sSQL           : String;
   sAno, sMes     : String;
   sOrdenacao     : String;
begin
   sAno  := FormatFloat('0000', DBspnAno.Value);
   sMes  := FormatFloat('00', cboMes.ItemIndex + 1);

   case rdgOrdenar.ItemIndex of
      0 : sOrdenacao := '   PTR.NOME, CON.IDCONTRATOEMPTMO';
      1 : sOrdenacao := '   PTR.NOME, CON.MATRICULA, CON.IDCONTRATOEMPTMO';
      2 : sOrdenacao := '   PTR.NOME, CON.NOME, CON.IDCONTRATOEMPTMO';
   end;

   sSQL :=
   'SELECT '                                                                                 + #13 +
   '   CON.IDCONTRATOEMPTMO, '                                                               + #13 +

   '   CON.IDPATRO, PTR.NOME AS PATRO, '                                                     + #13 +
   '   CON.IDPLANOPREV, PLP.NOME AS PLANO, '                                                 + #13 +

   '   CON.NOME, CON.MATRICULA, CON.TCEDESCRICAO, '                                          + #13 +

   '   NVL(HBP.VLRPREVISTO, 0) AS VLR_PREV_BENEF, '                                          + #13 +
   '   NVL(HBE.VLREFETIVO, 0)  AS VLR_EFET_BENEF, '                                          + #13 +
   '   NVL(HPP.VLRPREVISTO, 0) AS VLR_PREV_PATRO, '                                          + #13 +
   '   NVL(HPE.VLREFETIVO, 0)  AS VLR_EFET_PATRO, '                                          + #13 +
   '   NVL(HFP.VLRPREVISTO, 0) AS VLR_PREV_FIN, '                                            + #13 +
   '   NVL(HFE.VLREFETIVO, 0)  AS VLR_EFET_FIN '                                             + #13 +

   'FROM '                                                                                   + #13 +
   '   PESSOA       PTR, '                                                                   + #13 +
   '   VWCONTRATOEP CON, '                                                                   + #13 +
   '   PLANPREV     PLP, '                                                                   + #13 +

   // ----------------------------------------------------------------------------------------------
   //    Folha de Benefícios - Valor Previsto
   // ----------------------------------------------------------------------------------------------

   '   ( '                                                                                   + #13 +
   '   SELECT '                                                                              + #13 +
   '      HME.IDCONTRATOEMPTMO, '                                                            + #13 +
   '      SUM(HME.HMEVLRPREVISTO) AS VLRPREVISTO, SUM(HME.HMEVLREFETIVO) AS VLREFETIVO '     + #13 +
   '   FROM '                                                                                + #13 +
   '      VW_MOVEP HME '                                                                     + #13 +
   '   WHERE '                                                                               + #13 +
   '          HME.HMEFORMACOBRANCA = ''F'' '                                                 + #13 +
   '      AND HME.HMETIPOFOLHA     = ''B'' '                                                 + #13;

   if chkQuitaAmortiza.Checked then begin
      sSQL := sSQL +
   '      AND HME.EVENTO           IN (1, 4) '                                               + #13;
   end else begin
      sSQL := sSQL +
   '      AND HME.EVENTO           IN (1, 2, 3, 4) '                                         + #13;
   end;

   sSQL := sSQL +
   '      AND HME.FLGENVIO         IS NULL '                                                 + #13 +
   '      AND ( (HME.FLGESTORNADO  IS NULL) OR (HME.FLGESTORNADO = 0) ) '                    + #13 +
   '      AND ( (HME.FLGQUITADO    IS NULL) OR (HME.FLGQUITADO   = 0) ) '                    + #13 +
   '      AND ( (HME.FLGABONADO    IS NULL) OR (HME.FLGABONADO   = 0) ) '                    + #13 +
   '      AND HME.HMEANOCOBRANCA   = ' + sAno                                                + #13 +
   '      AND HME.HMEMESCOBRANCA   = ' + sMes                                                + #13 +
   '      AND (HME.HMECENTRALIZA   = 1 OR HME.HMEDESTACADO = 1) '                            + #13 +
   '   GROUP BY '                                                                            + #13 +
   '      HME.IDCONTRATOEMPTMO '                                                             + #13;

   // ----------------------------------------------------------------------------------------------
   if ( chkValorDiverg.Checked or chkValorZero.Checked or chkValorNAOZero.Checked) then begin

      sSQL := sSQL +
   '   HAVING '                                                                              + #13;

      if chkValorZero.Checked then sSQL := sSQL +
   '      NVL(SUM(HME.HMEVLREFETIVO), 0)  = 0 '                                              + #13;

      if chkValorDiverg.Checked then begin
         if chkValorZero.Checked then sSQL := sSQL + '      AND '                            + #13;

         sSQL := sSQL +
   '      NVL(SUM(HME.HMEVLREFETIVO), 0)  <> NVL(SUM(HME.HMEVLRPREVISTO), 0) '               + #13;

      end;

      if chkValorNAOZero.Checked then begin
         if ( chkValorZero.Checked or chkValorDiverg.Checked ) then sSQL := sSQL + '      AND '    + #13;

         sSQL := sSQL +
   '      NVL(SUM(HME.HMEVLREFETIVO), 0)  > 0 '                                              + #13;

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
   '      SUM(HME.HMEVLRPREVISTO) AS VLRPREVISTO, SUM(HME.HMEVLREFETIVO) AS VLREFETIVO '     + #13 +
   '   FROM '                                                                                + #13 +
   '      VW_MOVEP HME '                                                                     + #13 +
   '   WHERE '                                                                               + #13 +
   '          HME.HMEFORMACOBRANCA = ''F'' '                                                 + #13 +
   '      AND HME.HMETIPOFOLHA     = ''B'' '                                                 + #13;

   if chkQuitaAmortiza.Checked then begin
      sSQL := sSQL +
   '      AND HME.EVENTO           IN (1, 4) '                                               + #13;
   end else begin
      sSQL := sSQL +
   '      AND HME.EVENTO           IN (1, 2, 3, 4) '                                         + #13;
   end;

   sSQL := sSQL +
   '      AND ( (HME.FLGESTORNADO  IS NULL) OR (HME.FLGESTORNADO = 0) ) '                    + #13 +
   '      AND ( (HME.FLGQUITADO    IS NULL) OR (HME.FLGQUITADO   = 0) ) '                    + #13 +
   '      AND ( (HME.FLGABONADO    IS NULL) OR (HME.FLGABONADO   = 0) ) '                    + #13 +
   '      AND HME.HMEANOCOBRANCA   = ' + sAno                                                + #13 +
   '      AND HME.HMEMESCOBRANCA   = ' + sMes                                                + #13 +
   '      AND (HME.HMECENTRALIZA   = 1 OR HME.HMEDESTACADO = 1) '                            + #13 +
   '   GROUP BY '                                                                            + #13 +
   '      HME.IDCONTRATOEMPTMO '                                                             + #13;

   // ----------------------------------------------------------------------------------------------
   if ( chkValorDiverg.Checked or chkValorZero.Checked or chkValorNAOZero.Checked) then begin

      sSQL := sSQL +
   '   HAVING '                                                                              + #13;

      if chkValorZero.Checked then sSQL := sSQL +
   '      NVL(SUM(HME.HMEVLREFETIVO), 0)  = 0 '                                              + #13;

      if chkValorDiverg.Checked then begin
         if chkValorZero.Checked then sSQL := sSQL + '      AND '                            + #13;

         sSQL := sSQL +
   '      NVL(SUM(HME.HMEVLREFETIVO), 0)  <> NVL(SUM(HME.HMEVLRPREVISTO), 0) '               + #13;

      end;

      if chkValorNAOZero.Checked then begin
         if ( chkValorZero.Checked or chkValorDiverg.Checked ) then sSQL := sSQL + '      AND '    + #13;

         sSQL := sSQL +
   '      NVL(SUM(HME.HMEVLREFETIVO), 0)  > 0 '                                              + #13;

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
   '      SUM(HME.HMEVLRPREVISTO) AS VLRPREVISTO, SUM(HME.HMEVLREFETIVO) AS VLREFETIVO '     + #13 +
   '   FROM '                                                                                + #13 +
   '      VW_MOVEP HME '                                                                     + #13 +
   '   WHERE '                                                                               + #13 +
   '          HME.HMEFORMACOBRANCA = ''F'' '                                                 + #13 +
   '      AND HME.HMETIPOFOLHA     = ''P'' '                                                 + #13;

   if chkQuitaAmortiza.Checked then begin
      sSQL := sSQL +
   '      AND HME.EVENTO           IN (1, 4) '                                               + #13;
   end else begin
      sSQL := sSQL +
   '      AND HME.EVENTO           IN (1, 2, 3, 4) '                                         + #13;
   end;

   sSQL := sSQL +
   '      AND HME.FLGENVIO         IS NULL '                                                 + #13 +
   '      AND ( (HME.FLGESTORNADO  IS NULL) OR (HME.FLGESTORNADO = 0) ) '                    + #13 +
   '      AND ( (HME.FLGQUITADO    IS NULL) OR (HME.FLGQUITADO   = 0) ) '                    + #13 +
   '      AND ( (HME.FLGABONADO    IS NULL) OR (HME.FLGABONADO   = 0) ) '                    + #13 +
   '      AND HME.HMEANOCOBRANCA   = ' + sAno                                                + #13 +
   '      AND HME.HMEMESCOBRANCA   = ' + sMes                                                + #13 +
   '      AND (HME.HMECENTRALIZA   = 1 OR HME.HMEDESTACADO = 1) '                            + #13 +
   '   GROUP BY '                                                                            + #13 +
   '      HME.IDCONTRATOEMPTMO '                                                             + #13;

   // ----------------------------------------------------------------------------------------------
   if ( chkValorDiverg.Checked or chkValorZero.Checked or chkValorNAOZero.Checked) then begin

      sSQL := sSQL +
   '   HAVING '                                                                              + #13;

      if chkValorZero.Checked then sSQL := sSQL +
   '      NVL(SUM(HME.HMEVLREFETIVO), 0)  = 0 '                                              + #13;

      if chkValorDiverg.Checked then begin
         if chkValorZero.Checked then sSQL := sSQL + '      AND '                            + #13;

         sSQL := sSQL +
   '      NVL(SUM(HME.HMEVLREFETIVO), 0)  <> NVL(SUM(HME.HMEVLRPREVISTO), 0) '               + #13;

      end;

      if chkValorNAOZero.Checked then begin
         if ( chkValorZero.Checked or chkValorDiverg.Checked ) then sSQL := sSQL + '      AND '    + #13;

         sSQL := sSQL +
   '      NVL(SUM(HME.HMEVLREFETIVO), 0)  > 0 '                                              + #13;

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
   '      SUM(HME.HMEVLRPREVISTO) AS VLRPREVISTO, SUM(HME.HMEVLREFETIVO) AS VLREFETIVO '     + #13 +
   '   FROM '                                                                                + #13 +
   '      VW_MOVEP HME '                                                                     + #13 +
   '   WHERE '                                                                               + #13 +
   '          HME.HMEFORMACOBRANCA = ''F'' '                                                 + #13 +
   '      AND HME.HMETIPOFOLHA     = ''P'' '                                                 + #13;

   if chkQuitaAmortiza.Checked then begin
      sSQL := sSQL +
   '      AND HME.EVENTO           IN (1, 4) '                                               + #13;
   end else begin
      sSQL := sSQL +
   '      AND HME.EVENTO           IN (1, 2, 3, 4) '                                         + #13;
   end;

   sSQL := sSQL +
   '      AND ( (HME.FLGESTORNADO  IS NULL) OR (HME.FLGESTORNADO = 0) ) '                    + #13 +
   '      AND ( (HME.FLGQUITADO    IS NULL) OR (HME.FLGQUITADO   = 0) ) '                    + #13 +
   '      AND ( (HME.FLGABONADO    IS NULL) OR (HME.FLGABONADO   = 0) ) '                    + #13 +
   '      AND HME.HMEANOCOBRANCA   = ' + sAno                                                + #13 +
   '      AND HME.HMEMESCOBRANCA   = ' + sMes                                                + #13 +
   '      AND (HME.HMECENTRALIZA   = 1 OR HME.HMEDESTACADO = 1) '                            + #13 +
   '   GROUP BY '                                                                            + #13 +
   '      HME.IDCONTRATOEMPTMO '                                                             + #13;

   // ----------------------------------------------------------------------------------------------
   if ( chkValorDiverg.Checked or chkValorZero.Checked or chkValorNAOZero.Checked) then begin

      sSQL := sSQL +
   '   HAVING '                                                                              + #13;

      if chkValorZero.Checked then sSQL := sSQL +
   '      NVL(SUM(HME.HMEVLREFETIVO), 0)  = 0 '                                              + #13;

      if chkValorDiverg.Checked then begin
         if chkValorZero.Checked then sSQL := sSQL + '      AND '                            + #13;

         sSQL := sSQL +
   '      NVL(SUM(HME.HMEVLREFETIVO), 0)  <> NVL(SUM(HME.HMEVLRPREVISTO), 0) '               + #13;

      end;

      if chkValorNAOZero.Checked then begin
         if ( chkValorZero.Checked or chkValorDiverg.Checked ) then sSQL := sSQL + '      AND '    + #13;

         sSQL := sSQL +
   '      NVL(SUM(HME.HMEVLREFETIVO), 0)  > 0 '                                              + #13;

      end;
   end;
   // ----------------------------------------------------------------------------------------------

   sSQL := sSQL +
   '   ) HPE, '                                                                              + #13 +

   // ----------------------------------------------------------------------------------------------
   // FIM Folha da Partocinadora - Valor Efetivo
   // ----------------------------------------------------------------------------------------------

   // ----------------------------------------------------------------------------------------------
   //    Financeiro - Valor Previsto
   // ----------------------------------------------------------------------------------------------

   '   ( '                                                                                   + #13 +
   '   SELECT '                                                                              + #13 +
   '      HME.IDCONTRATOEMPTMO, '                                                            + #13 +
   '      SUM(HME.HMEVLRPREVISTO) AS VLRPREVISTO, SUM(HME.HMEVLREFETIVO) AS VLREFETIVO '     + #13 +
   '   FROM '                                                                                + #13 +
   '      VW_MOVEP HME '                                                                     + #13 +
   '   WHERE '                                                                               + #13 +
   '          HME.HMEFORMACOBRANCA = ''C'' '                                                 + #13;

   if chkQuitaAmortiza.Checked then begin
      sSQL := sSQL +
   '      AND HME.EVENTO           IN (1, 4) '                                               + #13;
   end else begin
      sSQL := sSQL +
   '      AND HME.EVENTO           IN (1, 2, 3, 4) '                                         + #13;
   end;

   sSQL := sSQL +
   '      AND HME.FLGENVIO         IS NULL '                                                 + #13 +
   '      AND ( (HME.FLGESTORNADO  IS NULL) OR (HME.FLGESTORNADO = 0) ) '                    + #13 +
   '      AND ( (HME.FLGQUITADO    IS NULL) OR (HME.FLGQUITADO   = 0) ) '                    + #13 +
   '      AND ( (HME.FLGABONADO    IS NULL) OR (HME.FLGABONADO   = 0) ) '                    + #13 +
   '      AND HME.HMEANOCOBRANCA   = ' + sAno                                                + #13 +
   '      AND HME.HMEMESCOBRANCA   = ' + sMes                                                + #13 +
   '      AND (HME.HMECENTRALIZA   = 1 OR HME.HMEDESTACADO = 1) '                            + #13 +
   '   GROUP BY '                                                                            + #13 +
   '      HME.IDCONTRATOEMPTMO '                                                             + #13;

   // ----------------------------------------------------------------------------------------------
   if ( chkValorDiverg.Checked or chkValorZero.Checked or chkValorNAOZero.Checked) then begin

      sSQL := sSQL +
   '   HAVING '                                                                              + #13;

      if chkValorZero.Checked then sSQL := sSQL +
   '      NVL(SUM(HME.HMEVLREFETIVO), 0)  = 0 '                                              + #13;

      if chkValorDiverg.Checked then begin
         if chkValorZero.Checked then sSQL := sSQL + '      AND '                            + #13;

         sSQL := sSQL +
   '      NVL(SUM(HME.HMEVLREFETIVO), 0)  <> NVL(SUM(HME.HMEVLRPREVISTO), 0) '               + #13;

      end;

      if chkValorNAOZero.Checked then begin
         if ( chkValorZero.Checked or chkValorDiverg.Checked ) then sSQL := sSQL + '      AND '    + #13;

         sSQL := sSQL +
   '      NVL(SUM(HME.HMEVLREFETIVO), 0)  > 0 '                                              + #13;

      end;
   end;
   // ----------------------------------------------------------------------------------------------

   sSQL := sSQL +
   '   ) HFP, '                                                                              + #13 +

   // ----------------------------------------------------------------------------------------------
   // FIM Financeiro - Valor Previsto
   // ----------------------------------------------------------------------------------------------

   // ----------------------------------------------------------------------------------------------
   //    Financeiro - Valor Efetivo
   // ----------------------------------------------------------------------------------------------

   '   ( '                                                                                   + #13 +
   '   SELECT '                                                                              + #13 +
   '      HME.IDCONTRATOEMPTMO, '                                                            + #13 +
   '      SUM(HME.HMEVLRPREVISTO) AS VLRPREVISTO, SUM(HME.HMEVLREFETIVO) AS VLREFETIVO '     + #13 +
   '   FROM '                                                                                + #13 +
   '      VW_MOVEP HME '                                                                     + #13 +
   '   WHERE '                                                                               + #13 +
   '          HME.HMEFORMACOBRANCA = ''C'' '                                                 + #13;

   if chkQuitaAmortiza.Checked then begin
      sSQL := sSQL +
   '      AND HME.EVENTO           IN (1, 4) '                                               + #13;
   end else begin
      sSQL := sSQL +
   '      AND HME.EVENTO           IN (1, 2, 3, 4) '                                         + #13;
   end;

   sSQL := sSQL +
   '      AND ( (HME.FLGESTORNADO  IS NULL) OR (HME.FLGESTORNADO = 0) ) '                    + #13 +
   '      AND ( (HME.FLGQUITADO    IS NULL) OR (HME.FLGQUITADO   = 0) ) '                    + #13 +
   '      AND ( (HME.FLGABONADO    IS NULL) OR (HME.FLGABONADO   = 0) ) '                    + #13 +
   '      AND HME.HMEANOCOBRANCA   = ' + sAno                                                + #13 +
   '      AND HME.HMEMESCOBRANCA   = ' + sMes                                                + #13 +
   '      AND (HME.HMECENTRALIZA   = 1 OR HME.HMEDESTACADO = 1) '                            + #13 +
   '   GROUP BY '                                                                            + #13 +
   '      HME.IDCONTRATOEMPTMO '                                                             + #13;

   // ----------------------------------------------------------------------------------------------
   if ( chkValorDiverg.Checked or chkValorZero.Checked or chkValorNAOZero.Checked) then begin

      sSQL := sSQL +
   '   HAVING '                                                                              + #13;

      if chkValorZero.Checked then sSQL := sSQL +
   '      NVL(SUM(HME.HMEVLREFETIVO), 0)  = 0 '                                              + #13;

      if chkValorDiverg.Checked then begin
         if chkValorZero.Checked then sSQL := sSQL + '      AND '                            + #13;

         sSQL := sSQL +
   '      NVL(SUM(HME.HMEVLREFETIVO), 0)  <> NVL(SUM(HME.HMEVLRPREVISTO), 0) '               + #13;

      end;

      if chkValorNAOZero.Checked then begin
         if ( chkValorZero.Checked or chkValorDiverg.Checked ) then sSQL := sSQL + '      AND '    + #13;

         sSQL := sSQL +
   '      NVL(SUM(HME.HMEVLREFETIVO), 0)  > 0 '                                              + #13;

      end;
   end;
   // ----------------------------------------------------------------------------------------------

   sSQL := sSQL +
   '   ) HFE '                                                                               + #13 +

   // ----------------------------------------------------------------------------------------------
   // FIM Financeiro - Valor Efetivo
   // ----------------------------------------------------------------------------------------------

   'WHERE '                                                                                  + #13 +

   (* filtro por Empresa Proprietátia *)
   '       CON.IDEMPRESAPROP        = ' + IntToStr(Sistema.IDEmpresa)                        + #13 +

   (* filtro por Patrocinadora *)
   '   AND CON.IDPATRO              IN (' + molListaPatro.PegaPatro + ') '                   + #13 +

   (* filtro por Plano *)
   '   AND CON.IDPLANOPREV          IN (' + molListaPlano.PegaPlano + ') '                   + #13;

   (* filtro por Contrato *)
   if molMutuario.iParticipante > 0 then begin
      sSql := sSql +
   '   AND CON.IDBENEF              = ' + IntToStr(molMutuario.iParticipante)                + #13;
   end;

   (* filtro por Tipo de Empréstimo *)
   if DBcboTipoEmptmo.LookupValue <> '' then begin
      sSQL := sSQL +
   '   AND CON.IDTIPOEMPTMO         = ' + DBcboTipoEmptmo.LookupValue                        + #13;
   end;

   (* filtro por Tipo de Contrato *)
   if DBcboTipoContrato.LookupValue <> '' then begin
      sSQL := sSQL +
   '   AND CON.IDTIPOCONTREMPTMO    = ' + DBcboTipoContrato.LookupValue                      + #13;
   end;

   // ----------------------------------------------------------------------------------------------
   if ( chkFinanceiro.Checked or chkFolhaPatro.Checked or chkFolhaBenef.Checked ) then begin

      sSQL := sSQL + '   AND ( ';

      if chkFinanceiro.Checked then sSQL := sSQL +
         '((HFP.VLRPREVISTO <> 0) OR (HFE.VLREFETIVO <> 0))';

      if chkFolhaPatro.Checked then begin
         if chkFinanceiro.Checked then sSQL := sSQL + ' OR ';

         sSQL := sSQL +
         '((HPP.VLRPREVISTO <> 0) OR (HPE.VLREFETIVO <> 0))';
      end;

      if chkFolhaBenef.Checked then begin
         if ( chkFinanceiro.Checked or chkFolhaPatro.Checked ) then sSQL := sSQL + ' OR ';

      sSQL := sSQL +
         '((HBP.VLRPREVISTO <> 0) OR (HBE.VLREFETIVO <> 0))';
      end;

      sSQL := sSQL + ' ) ' + #13;
   end;
   // ----------------------------------------------------------------------------------------------

   sSQL := sSQL +
   '   AND CON.IDPATRO          = PTR.IDPESSOA '                                             + #13 +
   '   AND CON.IDPLANOPREV      = PLP.IDPLANOPREV '                                          + #13 +
   '   AND CON.IDCONTRATOEMPTMO = HBP.IDCONTRATOEMPTMO(+) '                                  + #13 +
   '   AND CON.IDCONTRATOEMPTMO = HBE.IDCONTRATOEMPTMO(+) '                                  + #13 +
   '   AND CON.IDCONTRATOEMPTMO = HPP.IDCONTRATOEMPTMO(+) '                                  + #13 +
   '   AND CON.IDCONTRATOEMPTMO = HPE.IDCONTRATOEMPTMO(+) '                                  + #13 +
   '   AND CON.IDCONTRATOEMPTMO = HFP.IDCONTRATOEMPTMO(+) '                                  + #13 +
   '   AND CON.IDCONTRATOEMPTMO = HFE.IDCONTRATOEMPTMO(+) '                                  + #13 +

   'ORDER BY ' + #13 + sOrdenacao;

   with dtmRelItensEnvioAnal.qryItensEnvioAnal do begin
      Close;
      SQL.Clear;
      SQL.Text := sSQL;
      Open;
   end;
end;



procedure TcfgRelItensEnvioAnalContrato.FormShow(Sender: TObject);
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



procedure TcfgRelItensEnvioAnalContrato.DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;

   // seleciona apenas os Tipos de Contrato do Tipo de Empréstimo selecionado
   with dtmLookEmptmo.qryLookTipoContrato do begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoContrato);

      if DBcboTipoEmptmo.LookupValue <> '' then begin
         ParamByName('PIDTIPOEMPTMO').AsInteger    := StrToInt(DBcboTipoEmptmo.LookupValue);
         ParamByName('PIDEMPRESAPROP').AsInteger   := Sistema.IDEmpresa;
      end;

      Open;

      DBcboTipoContrato.Enabled := True;
   end;
end;



procedure TcfgRelItensEnvioAnalContrato.molMutuario1btnBuscaPartClick(Sender: TObject);
begin
   inherited;
   molMutuario.btnBuscaPartClick(Sender);
end;



procedure TcfgRelItensEnvioAnalContrato.molMutuariobtnLimpaPartClick(Sender: TObject);
begin
   inherited;
   molMutuario.btnLimpaPartClick(Sender);
end;



procedure TcfgRelItensEnvioAnalContrato.molListaPatrobtnInvertePatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnInvertePatroClick(Sender);
end;



procedure TcfgRelItensEnvioAnalContrato.molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnMarcaTodosPatroClick(Sender);
end;



procedure TcfgRelItensEnvioAnalContrato.molListaPlanobtnInvertePlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnInvertePlanoClick(Sender);
end;



procedure TcfgRelItensEnvioAnalContrato.molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnMarcaTodosPlanoClick(Sender);
end;



end.
