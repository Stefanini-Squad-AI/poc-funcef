{---------------------------Alteração-------------------------------------------
Pendência   : SOL 114575 Kintana 535771
Responsável : Jéssica Lana
Data        : 24/04/2009
Descrição   : Gravar arquivos com a query de entrada na pasta C:\PLANUS\TEMP.
-------------------------------------------------------------------------------}
unit CRelConciliaContabPPPeriodo;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   CRel, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr,
   TB97, ExtCtrls, mContratoEmptmo, Mask, wwdbedit, Wwdbspin, CheckLst,
   wwdblook, db, fcCombo, fcColorCombo, mInscricaoEmptmo, wwdbdatetimepicker,
   mListaPlano, mListaPatro, CMProcuraMask, CMDateTimePicker,
   mListaPlanoContab;

type
   TcfgRelConciliaContabPPPeriodo = class(TcfgRel)
      GroupBox1: TGroupBox;
      chkCorLinha: TCheckBox;
      cboCorLinha: TfcColorCombo;
      chkLinhas: TCheckBox;
      molListaPatro: TmolListaPatro;
      grpPeriodo: TGroupBox;
      Label1: TLabel;
      Label2: TLabel;
      edtDataIni: TCMDateTimePicker;
      edtDataFim: TCMDateTimePicker;
      edtContaContabil: TMaskEdit;
      Label6: TLabel;
      Label3: TLabel;
      chkDiverg: TCheckBox;
      chkContaEP: TCheckBox;
      chkOrigemEP: TCheckBox;
      molListaPlano: TmolListaPlanoContab;
      Label7: TLabel;
      cboEvento: TComboBox;
      btnLimpaEvento: TBitBtn;
      edtPlnCodigo: TEdit;
      Label4: TLabel;

      procedure FormShow(Sender: TObject);

      procedure molListaPatrobtnInvertePatroClick(Sender: TObject);
      procedure molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
      procedure molListaPlanobtnInvertePlanoClick(Sender: TObject);
      procedure molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
      procedure chkOrigemEPClick(Sender: TObject);
      procedure edtPlnCodigoKeyPress(Sender: TObject; var Key: Char);
      procedure edtPlnCodigoExit(Sender: TObject);


   private { Private declarations }

      procedure MontaQuery; override;
      procedure FiltraRelatorio;

      function VerificaPreenchimento: Boolean;


   public { Public declarations }

   end;



var
  cfgRelConciliaContabPPPeriodo: TcfgRelConciliaContabPPPeriodo;



implementation
{$R *.DFM}
uses
   DLookEmptmo, UDiasUteis, USistema, uFuncoesEmptmo, dEmptmo,
   uMensErro, uVerificaPreenchimento, uIntegraBack, uModulo, dRelConciliaContabPPPeriodo;



function TcfgRelConciliaContabPPPeriodo.VerificaPreenchimento: Boolean;
begin
   Result := False;

   try
      if length(trim(edtDataIni.Text)) = 0 then
         raise EValidacao.CreateVal('É necessário indicar a Data Inicial!', edtDataIni);

      if length(trim(edtDataFim.Text)) = 0 then
         raise EValidacao.CreateVal('É necessário indicar a Data Final!', edtDataFim);

   except
      on ev : EValidacao do
      begin
         Screen.Cursor := crDefault;
         if ev.Show then MsgDlg(ev.message, 'Empréstimo', mtWarning, [mbOk], 0);
         Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;
   end;

   Result := True;
end;



procedure TcfgRelConciliaContabPPPeriodo.FormShow(Sender: TObject);
begin
   inherited;

   ParametrosSistema;

   edtContaContabil.EditMask := IntegraBack.MascaraPlano + ';0';

   edtDataIni.Date := Date;
   edtDataFim.Date := Date;

   // Preenche a listbox de patrocinadoras...
   molListaPatro.PreenchePatro;
   // ...e marca todas por default
   molListaPatrobtnMarcaTodosPatroClick(self);

   // Preenche a listbox de Planos...
   molListaPlano.PreenchePlano;
   // ...e marca todos por default
   molListaPlanobtnMarcaTodosPlanoClick(self);
end;



procedure TcfgRelConciliaContabPPPeriodo.MontaQuery;
begin
   inherited;

   with dtmRelConciliaContabPPPeriodo do
   begin
      if length(trim(edtPlnCodigo.Text)) = 0 then
      begin
         rptConciliaContabPPlblDataIni.Caption  := edtDataIni.Text;
         rptConciliaContabPPlblDataFim.Caption  := edtDataFim.Text;
      end
      else
      begin
         rptConciliaContabPPlblDataIni.Caption  := ' - ';
         rptConciliaContabPPlblDataIni.Caption  := ' - ';
      end;

      lblPlnCodigo.Caption := ' - ';
      if length(trim(edtPlnCodigo.Text)) > 0 then lblPlnCodigo.Caption  := edtPlnCodigo.Text;

      lblContaContabil.Caption := ' - ';
      if edtContaContabil.GetTextLen > 0 then lblContaContabil.Caption  := edtContaContabil.EditText;

      lblContaDiverg.Visible  := chkDiverg.Checked;
      lblContaEP.Visible      := chkContaEP.Checked;
      lblLancamentoEP.Visible := chkOrigemEP.Checked;

      bSeparador  := chkLinhas.Checked;

      // determina se as linhas do relatório serão impressas em cores alternadas, e qual cor usar
      bCorlinha   := chkCorLinha.Checked;
      CorLinha    := cboCorLinha.SelectedColor;

      memPatro.RichText := molListaPatro.ListaPatro;
      memPlano.RichText := molListaPlano.ListaPlano;
   end;

   FiltraRelatorio;
end;



procedure TcfgRelConciliaContabPPPeriodo.FiltraRelatorio;
var
   sSQL     : String;
   sDataIni : String;
   sDataFim : String;
begin
   sDataIni := QuotedStr(edtDataIni.Text);
   sDataFim := QuotedStr(edtDataFim.Text);

   sSQL :=
   'SELECT '                                                                                       + #13 +
   '   RTRIM(MOV.CONTACONTABIL) AS CONTACONTABIL, '                                                + #13 +
   '   PLA.PLANOME, MOD.NOMEMODULO, '                                                              + #13 +
   '   MOV.NOMEPLANO, MOV.NOMEPATRO, '                                                             + #13 +
   '   SUM(MOV.EPDEB)      AS EPDEB, '                                                             + #13 +
   '   SUM(MOV.EPCRED)     AS EPCRED, '                                                            + #13 +
   '   SUM(MOV.CONTABDEB)  AS CONTABDEB, '                                                         + #13 +
   '   SUM(MOV.CONTABCRED) AS CONTABCRED, '                                                        + #13 +
   '   ABS(SUM(MOV.EPDEB) - SUM(MOV.CONTABDEB))    AS DIFDEB, '                                    + #13 +
   '   ABS(SUM(MOV.EPCRED) - SUM(MOV.CONTABCRED))  AS DIFCRED '                                    + #13 +
   'FROM '                                                                                         + #13 +
   '   ( '                                                                                         + #13 +

   '   SELECT '                                                                                    + #13 +
   '      RTRIM(HME.CCDEBFINAN) AS CONTACONTABIL, '                                                + #13 +
   '      15 AS IDMODULO, '                                                                        + #13 +
   '      PPC.NOME AS NOMEPLANO, '                                                                 + #13 +
   '      PTR.NOME AS NOMEPATRO, '                                                                 + #13 +
   '      SUM(DECODE(SIGN(HME.HMEVLRPREVISTO), -1, 0, ABS(HME.HMEVLRPREVISTO))) AS EPDEB, '        + #13 +
   '      SUM(DECODE(SIGN(HME.HMEVLRPREVISTO), -1, ABS(HME.HMEVLRPREVISTO), 0)) AS EPCRED, '       + #13 +
   '      0.00 AS CONTABDEB, '                                                                     + #13 +
   '      0.00 AS CONTABCRED '                                                                     + #13 +
   '   FROM '                                                                                      + #13 +
   '      HISTMOVEMPTMO     HME, '                                                                 + #13 +
   '      CONTRATOEMPTMO    CON, '                                                                 + #13 +
   '      PLANPREVCONTABIL  PPC, '                                                                 + #13;

   if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then sSQL := sSQL +
   '      VWMIGRACONTRATOEP MIG, '                                                                 + #13;

   sSQL := sSQL +
   '      PESSOA            PTR '                                                                  + #13 +
   '   WHERE '                                                                                     + #13 +

   '          HME.PLNCODIGO          IS NOT NULL '                                                 + #13 +
   '      AND HME.CCDEBFINAN         IS NOT NULL '                                                 + #13 +
   '      AND CON.IDPATRO            IN (' + molListaPatro.PegaPatro + ') '                        + #13;

   if length(trim(edtPlnCodigo.Text)) = 0 then sSQL := sSQL +
   '      AND HME.HMEDATAPREVISTA   >= ' + OraData(edtDataIni.Date)                                + #13 +
   '      AND HME.HMEDATAPREVISTA   <= ' + OraData(edtDataFim.Date)                                + #13;

   if length(trim(edtPlnCodigo.Text)) > 0 then sSQL := sSQL +
   '      AND HME.PLNCODIGO          = ' + edtPlnCodigo.Text                                       + #13;

   // filtro por Plano
   if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
   begin
      sSQL := sSQL +
     '      AND MIG.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO'                                     + #13 +
     '      AND MIG.DATAMIGRA          = (SELECT MAX(DATAMIGRA) FROM VWMIGRACONTRATOEP'            + #13 +
     '                                    WHERE IDCONTRATOEMPTMO = CON.IDCONTRATOEMPTMO'           + #13 +
     '                                    AND   DATAMIGRA <= HME.HMEDATAPREVISTA)'                 + #13 +
     '      AND MIG.IDPLANOCONTATU     IN (' + molListaPlano.PegaPlano + ') '                      + #13;
   end
   else sSQL := sSQL +
   '      AND CON.IDPLANOPREV        IN (' + molListaPlano.PegaPlano + ') '                        + #13;

   if length(trim(edtContaContabil.Text)) > 0 then sSQL := sSQL +
   '      AND RTRIM(HME.CCDEBFINAN)  LIKE ' + QuotedStr(trim(edtContaContabil.Text) + '%')         + #13;

   sSQL := sSQL +
   '      AND HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO '                                      + #13 +
   '      AND CON.IDPATRO            = PTR.IDPESSOA '                                              + #13;

   if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then sSQL := sSQL +
     '      AND MIG.IDPLANOCONTATU     = PPC.IDPLANOPREV'                                          + #13
   else sSQL := sSQL +
   '      AND CON.IDPLANOORIGEM      = PPC.IDPLANOPREV '                                           + #13;

   // filtro por Evento
   if cboEvento.ItemIndex > -1 then sSQL := sSQL +
   '      AND HME.HMETIPOMOV         = ' + IntToStr(cboEvento.ItemIndex)                            + #13;

   sSQL := sSQL +
   '   GROUP BY '                                                                                  + #13 +
   '      HME.CCDEBFINAN, PPC.NOME, PTR.NOME '                                                     + #13 +

   '   UNION '                                                                                     + #13 +

   '   SELECT '                                                                                    + #13 +
   '      RTRIM(HME.CCDEBFINAN) AS CONTACONTABIL, '                                                + #13 +
   '      15 AS IDMODULO, '                                                                        + #13 +
   '      PPC.NOME AS NOMEPLANO, '                                                                 + #13 +
   '      PTR.NOME AS NOMEPATRO, '                                                                 + #13 +
   '      SUM(DECODE(SIGN(HME.HMEVLRPREVISTO), -1, ABS(HME.HMEVLRPREVISTO), 0)) AS EPDEB, '        + #13 +
   '      SUM(DECODE(SIGN(HME.HMEVLRPREVISTO), -1, 0, ABS(HME.HMEVLRPREVISTO))) AS EPCRED, '       + #13 +
   '      0.00 AS CONTABDEB, '                                                                     + #13 +
   '      0.00 AS CONTABCRED '                                                                     + #13 +
   '   FROM '                                                                                      + #13 +
   '      HISTMOVEMPTMO     HME, '                                                                 + #13 +
   '      CONTRATOEMPTMO    CON, '                                                                 + #13 +
   '      PLANPREVCONTABIL  PPC, '                                                                 + #13;

   if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then sSQL := sSQL +
   '      VWMIGRACONTRATOEP MIG, '                                                                 + #13;

   sSQL := sSQL +
   '      PESSOA            PTR '                                                                  + #13 +
   '   WHERE '                                                                                     + #13 +

   '          HME.PLNCODIGOESTORNO   IS NOT NULL '                                                 + #13 +
   '      AND HME.CCDEBFINAN         IS NOT NULL '                                                 + #13 +
   '      AND CON.IDPATRO            IN (' + molListaPatro.PegaPatro + ') '                        + #13;

   if length(trim(edtPlnCodigo.Text)) = 0 then sSQL := sSQL +
   '      AND HME.HMEDATAESTORNO    >= ' + OraData(edtDataIni.Date)                                + #13 +
   '      AND HME.HMEDATAESTORNO    <= ' + OraData(edtDataFim.Date)                                + #13;

   if length(trim(edtPlnCodigo.Text)) > 0 then sSQL := sSQL +
   '      AND HME.PLNCODIGOESTORNO   = ' + edtPlnCodigo.Text                                       + #13;

   // filtro por Plano
   if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
   begin
      sSQL := sSQL +
     '      AND MIG.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO'                                     + #13 +
     '      AND MIG.DATAMIGRA          = (SELECT MAX(DATAMIGRA) FROM VWMIGRACONTRATOEP'            + #13 +
     '                                    WHERE IDCONTRATOEMPTMO = CON.IDCONTRATOEMPTMO'           + #13 +
     '                                    AND   DATAMIGRA <= HME.HMEDATAPREVISTA)'                 + #13 +
     '      AND MIG.IDPLANOCONTATU     IN (' + molListaPlano.PegaPlano + ') '                      + #13;
   end
   else sSQL := sSQL +
   '      AND CON.IDPLANOPREV        IN (' + molListaPlano.PegaPlano + ') '                        + #13;

   if length(trim(edtContaContabil.Text)) > 0 then sSQL := sSQL +
   '      AND RTRIM(HME.CCDEBFINAN)  LIKE ' + QuotedStr(trim(edtContaContabil.Text) + '%')         + #13;

   sSQL := sSQL +
   '      AND HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO '                                      + #13 +
   '      AND CON.IDPATRO            = PTR.IDPESSOA '                                              + #13;

   if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then sSQL := sSQL +
     '      AND MIG.IDPLANOCONTATU     = PPC.IDPLANOPREV'                                          + #13
   else sSQL := sSQL +
   '      AND CON.IDPLANOORIGEM      = PPC.IDPLANOPREV '                                           + #13;

   // filtro por Evento
   if cboEvento.ItemIndex > -1 then sSQL := sSQL +
   '      AND HME.HMETIPOMOV         = ' + IntToStr(cboEvento.ItemIndex)                            + #13;

   sSQL := sSQL +
   '   GROUP BY '                                                                                  + #13 +
   '      HME.CCDEBFINAN, PPC.NOME, PTR.NOME '                                                     + #13 +

   '   UNION '                                                                                     + #13 +

   '   SELECT '                                                                                    + #13 +
   '      RTRIM(HME.CCDEBFINAN) AS CONTACONTABIL, '                                                + #13 +
   '      15 AS IDMODULO, '                                                                        + #13 +
   '      PPC.NOME AS NOMEPLANO, '                                                                 + #13 +
   '      PTR.NOME AS NOMEPATRO, '                                                                 + #13 +
   '      SUM(DECODE(SIGN(HME.HMEVLRPREVISTO), -1, ABS(HME.HMEVLRPREVISTO), 0)) AS EPDEB, '        + #13 +
   '      SUM(DECODE(SIGN(HME.HMEVLRPREVISTO), -1, 0, ABS(HME.HMEVLRPREVISTO))) AS EPCRED, '       + #13 +
   '      0.00 AS CONTABDEB, '                                                                     + #13 +
   '      0.00 AS CONTABCRED '                                                                     + #13 +
   '   FROM '                                                                                      + #13 +
   '      HISTMOVEMPTMO     HME, '                                                                 + #13 +
   '      CONTRATOEMPTMO    CON, '                                                                 + #13 +
   '      PLANPREVCONTABIL  PPC, '                                                                 + #13;

   if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then sSQL := sSQL +
   '      VWMIGRACONTRATOEP MIG, '                                                                 + #13;

   sSQL := sSQL +
   '      PESSOA            PTR '                                                                  + #13 +
   '   WHERE '                                                                                     + #13 +

   '          HME.PLNCODIGOESTORNO   IS NOT NULL '                                                 + #13 +
   '      AND HME.CCDEBFINAN         IS NOT NULL '                                                 + #13 +
   '      AND CON.IDPATRO            IN (' + molListaPatro.PegaPatro + ') '                        + #13;

   if length(trim(edtPlnCodigo.Text)) = 0 then sSQL := sSQL +
   '      AND HME.HMEDATAQUITABONO  >= ' + OraData(edtDataIni.Date)                                + #13 +
   '      AND HME.HMEDATAQUITABONO  <= ' + OraData(edtDataFim.Date)                                + #13;

   if length(trim(edtPlnCodigo.Text)) > 0 then sSQL := sSQL +
   '      AND HME.PLNCODIGOESTORNO   = ' + edtPlnCodigo.Text                                       + #13;

   // filtro por Plano
   if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
   begin
      sSQL := sSQL +
     '      AND MIG.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO'                                     + #13 +
     '      AND MIG.DATAMIGRA          = (SELECT MAX(DATAMIGRA) FROM VWMIGRACONTRATOEP'            + #13 +
     '                                    WHERE IDCONTRATOEMPTMO = CON.IDCONTRATOEMPTMO'           + #13 +
     '                                    AND   DATAMIGRA <= HME.HMEDATAPREVISTA)'                 + #13 +
     '      AND MIG.IDPLANOCONTATU     IN (' + molListaPlano.PegaPlano + ') '                      + #13;
   end
   else sSQL := sSQL +
   '      AND CON.IDPLANOPREV        IN (' + molListaPlano.PegaPlano + ') '                        + #13;

   if length(trim(edtContaContabil.Text)) > 0 then sSQL := sSQL +
   '      AND RTRIM(HME.CCDEBFINAN)  LIKE ' + QuotedStr(trim(edtContaContabil.Text) + '%')         + #13;

   sSQL := sSQL +
   '      AND HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO '                                      + #13 +
   '      AND CON.IDPATRO            = PTR.IDPESSOA '                                              + #13;

   if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then sSQL := sSQL +
     '      AND MIG.IDPLANOCONTATU     = PPC.IDPLANOPREV'                                          + #13
   else sSQL := sSQL +
   '      AND CON.IDPLANOORIGEM      = PPC.IDPLANOPREV '                                           + #13;

   // filtro por Evento
   if cboEvento.ItemIndex > -1 then sSQL := sSQL +
   '      AND HME.HMETIPOMOV         = ' + IntToStr(cboEvento.ItemIndex)                            + #13;

   sSQL := sSQL +
   '   GROUP BY '                                                                                  + #13 +
   '      HME.CCDEBFINAN, PPC.NOME, PTR.NOME '                                                     + #13 +

   '   UNION '                                                                                     + #13 +

   '   SELECT '                                                                                    + #13 +
   '      RTRIM(HME.CCCREDFINAN) AS CONTACONTABIL, '                                               + #13 +
   '      15 AS IDMODULO, '                                                                        + #13 +
   '      PPC.NOME AS NOMEPLANO, '                                                                 + #13 +
   '      PTR.NOME AS NOMEPATRO, '                                                                 + #13 +
   '      SUM(DECODE(SIGN(HME.HMEVLRPREVISTO), -1, ABS(HME.HMEVLRPREVISTO), 0)) AS EPDEB, '        + #13 +
   '      SUM(DECODE(SIGN(HME.HMEVLRPREVISTO), -1, 0, ABS(HME.HMEVLRPREVISTO))) AS EPCRED, '       + #13 +
   '      0.00 AS CONTABDEB, '                                                                     + #13 +
   '      0.00 AS CONTABCRED '                                                                     + #13 +
   '   FROM '                                                                                      + #13 +
   '      HISTMOVEMPTMO     HME, '                                                                 + #13 +
   '      CONTRATOEMPTMO    CON, '                                                                 + #13 +
   '      PLANPREVCONTABIL  PPC, '                                                                 + #13;

   if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then sSQL := sSQL +
   '      VWMIGRACONTRATOEP MIG, '                                                                 + #13;

   sSQL := sSQL +
   '      PESSOA            PTR '                                                                  + #13 +
   '   WHERE '                                                                                     + #13 +
   '          HME.PLNCODIGO          IS NOT NULL '                                                 + #13 +
   '      AND HME.CCCREDFINAN        IS NOT NULL '                                                 + #13 +
   '      AND CON.IDPATRO            IN (' + molListaPatro.PegaPatro + ') '                        + #13;

   if length(trim(edtPlnCodigo.Text)) = 0 then sSQL := sSQL +
   '      AND HME.HMEDATAPREVISTA   >= ' + OraData(edtDataIni.Date)                                + #13 +
   '      AND HME.HMEDATAPREVISTA   <= ' + OraData(edtDataFim.Date)                                + #13;

   if length(trim(edtPlnCodigo.Text)) > 0 then sSQL := sSQL +
   '      AND HME.PLNCODIGO          = ' + edtPlnCodigo.Text                                       + #13;

   // filtro por Plano
   if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
   begin
      sSQL := sSQL +
     '      AND MIG.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO'                                     + #13 +
     '      AND MIG.DATAMIGRA          = (SELECT MAX(DATAMIGRA) FROM VWMIGRACONTRATOEP'            + #13 +
     '                                    WHERE IDCONTRATOEMPTMO = CON.IDCONTRATOEMPTMO'           + #13 +
     '                                    AND   DATAMIGRA <= HME.HMEDATAPREVISTA)'                 + #13 +
     '      AND MIG.IDPLANOCONTATU     IN (' + molListaPlano.PegaPlano + ') '                      + #13;
   end
   else sSQL := sSQL +
   '      AND CON.IDPLANOPREV        IN (' + molListaPlano.PegaPlano + ') '                        + #13;

   if length(trim(edtContaContabil.Text)) > 0 then sSQL := sSQL +
   '      AND RTRIM(HME.CCCREDFINAN) LIKE ' + QuotedStr(trim(edtContaContabil.Text) + '%')         + #13;

   sSQL := sSQL +
   '      AND HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO '                                      + #13 +
   '      AND CON.IDPATRO            = PTR.IDPESSOA '                                              + #13;

   if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then sSQL := sSQL +
     '      AND MIG.IDPLANOCONTATU     = PPC.IDPLANOPREV'                                          + #13
   else sSQL := sSQL +
   '      AND CON.IDPLANOORIGEM      = PPC.IDPLANOPREV '                                           + #13;

   // filtro por Evento
   if cboEvento.ItemIndex > -1 then sSQL := sSQL +
   '      AND HME.HMETIPOMOV         = ' + IntToStr(cboEvento.ItemIndex)                            + #13;

   sSQL := sSQL +
   '   GROUP BY '                                                                                  + #13 +
   '      HME.CCCREDFINAN, PPC.NOME, PTR.NOME '                                                    + #13 +

   '   UNION '                                                                                     + #13 +

   '   SELECT '                                                                                    + #13 +
   '      RTRIM(HME.CCCREDFINAN) AS CONTACONTABIL, '                                               + #13 +
   '      15 AS IDMODULO, '                                                                        + #13 +
   '      PPC.NOME AS NOMEPLANO, '                                                                 + #13 +
   '      PTR.NOME AS NOMEPATRO, '                                                                 + #13 +
   '      SUM(DECODE(SIGN(HME.HMEVLRPREVISTO), -1, 0, ABS(HME.HMEVLRPREVISTO))) AS EPDEB, '        + #13 +
   '      SUM(DECODE(SIGN(HME.HMEVLRPREVISTO), -1, ABS(HME.HMEVLRPREVISTO), 0)) AS EPCRED, '       + #13 +
   '      0.00 AS CONTABDEB, '                                                                     + #13 +
   '      0.00 AS CONTABCRED '                                                                     + #13 +
   '   FROM '                                                                                      + #13 +
   '      HISTMOVEMPTMO     HME, '                                                                 + #13 +
   '      CONTRATOEMPTMO    CON, '                                                                 + #13 +
   '      PLANPREVCONTABIL  PPC, '                                                                 + #13;

   if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then sSQL := sSQL +
   '      VWMIGRACONTRATOEP MIG, '                                                                 + #13;

   sSQL := sSQL +
   '      PESSOA            PTR '                                                                  + #13 +
   '   WHERE '                                                                                     + #13 +

   '          HME.PLNCODIGOESTORNO   IS NOT NULL '                                                 + #13 +
   '      AND HME.CCCREDFINAN        IS NOT NULL '                                                 + #13 +
   '      AND CON.IDPATRO            IN (' + molListaPatro.PegaPatro + ') '                        + #13;

   if length(trim(edtPlnCodigo.Text)) = 0 then sSQL := sSQL +
   '      AND HME.HMEDATAESTORNO    >= ' + OraData(edtDataIni.Date)                                + #13 +
   '      AND HME.HMEDATAESTORNO    <= ' + OraData(edtDataFim.Date)                                + #13;

   if length(trim(edtPlnCodigo.Text)) > 0 then sSQL := sSQL +
   '      AND HME.PLNCODIGOESTORNO   = ' + edtPlnCodigo.Text                                       + #13;

   // filtro por Plano
   if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
   begin
      sSQL := sSQL +
     '      AND MIG.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO'                                     + #13 +
     '      AND MIG.DATAMIGRA          = (SELECT MAX(DATAMIGRA) FROM VWMIGRACONTRATOEP'            + #13 +
     '                                    WHERE IDCONTRATOEMPTMO = CON.IDCONTRATOEMPTMO'           + #13 +
     '                                    AND   DATAMIGRA <= HME.HMEDATAPREVISTA)'                 + #13 +
     '      AND MIG.IDPLANOCONTATU     IN (' + molListaPlano.PegaPlano + ') '                      + #13;
   end
   else sSQL := sSQL +
   '      AND CON.IDPLANOPREV        IN (' + molListaPlano.PegaPlano + ') '                        + #13;

   if length(trim(edtContaContabil.Text)) > 0 then sSQL := sSQL +
   '      AND RTRIM(HME.CCCREDFINAN) LIKE ' + QuotedStr(trim(edtContaContabil.Text) + '%')         + #13;

   sSQL := sSQL +
   '      AND HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO '                                      + #13 +
   '      AND CON.IDPATRO            = PTR.IDPESSOA '                                              + #13;

   if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then sSQL := sSQL +
     '      AND MIG.IDPLANOCONTATU     = PPC.IDPLANOPREV'                                          + #13
   else sSQL := sSQL +
   '      AND CON.IDPLANOORIGEM      = PPC.IDPLANOPREV '                                           + #13;

   // filtro por Evento
   if cboEvento.ItemIndex > -1 then sSQL := sSQL +
   '      AND HME.HMETIPOMOV         = ' + IntToStr(cboEvento.ItemIndex)                            + #13;

   sSQL := sSQL +
   '   GROUP BY '                                                                                  + #13 +
   '      HME.CCCREDFINAN, PPC.NOME, PTR.NOME '                                                    + #13 +

   '   UNION '                                                                                     + #13 +

   '   SELECT '                                                                                    + #13 +
   '      RTRIM(HME.CCCREDFINAN) AS CONTACONTABIL, '                                               + #13 +
   '      15 AS IDMODULO, '                                                                        + #13 +
   '      PPC.NOME AS NOMEPLANO, '                                                                 + #13 +
   '      PTR.NOME AS NOMEPATRO, '                                                                 + #13 +
   '      SUM(DECODE(SIGN(HME.HMEVLRPREVISTO), -1, 0, ABS(HME.HMEVLRPREVISTO))) AS EPDEB, '        + #13 +
   '      SUM(DECODE(SIGN(HME.HMEVLRPREVISTO), -1, ABS(HME.HMEVLRPREVISTO), 0)) AS EPCRED, '       + #13 +
   '      0.00 AS CONTABDEB, '                                                                     + #13 +
   '      0.00 AS CONTABCRED '                                                                     + #13 +
   '   FROM '                                                                                      + #13 +
   '      HISTMOVEMPTMO     HME, '                                                                 + #13 +
   '      CONTRATOEMPTMO    CON, '                                                                 + #13 +
   '      PLANPREVCONTABIL  PPC, '                                                                 + #13;

   if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then sSQL := sSQL +
   '      VWMIGRACONTRATOEP MIG, '                                                                 + #13;

   sSQL := sSQL +
   '      PESSOA            PTR '                                                                  + #13 +
   '   WHERE '                                                                                     + #13 +

   '          HME.PLNCODIGOESTORNO   IS NOT NULL '                                                 + #13 +
   '      AND HME.CCCREDFINAN        IS NOT NULL '                                                 + #13 +
   '      AND CON.IDPATRO            IN (' + molListaPatro.PegaPatro + ') '                        + #13;

   if length(trim(edtPlnCodigo.Text)) = 0 then sSQL := sSQL +
   '      AND HME.HMEDATAQUITABONO  >= ' + OraData(edtDataIni.Date)                                + #13 +
   '      AND HME.HMEDATAQUITABONO  <= ' + OraData(edtDataFim.Date)                                + #13;

   if length(trim(edtPlnCodigo.Text)) > 0 then sSQL := sSQL +
   '      AND HME.PLNCODIGOESTORNO   = ' + edtPlnCodigo.Text                                       + #13;

   // filtro por Plano
   if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
   begin
      sSQL := sSQL +
     '      AND MIG.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO'                                     + #13 +
     '      AND MIG.DATAMIGRA          = (SELECT MAX(DATAMIGRA) FROM VWMIGRACONTRATOEP'            + #13 +
     '                                    WHERE IDCONTRATOEMPTMO = CON.IDCONTRATOEMPTMO'           + #13 +
     '                                    AND   DATAMIGRA <= HME.HMEDATAPREVISTA)'                 + #13 +
     '      AND MIG.IDPLANOCONTATU     IN (' + molListaPlano.PegaPlano + ') '                      + #13;
   end
   else sSQL := sSQL +
   '      AND CON.IDPLANOPREV        IN (' + molListaPlano.PegaPlano + ') '                        + #13;

   if length(trim(edtContaContabil.Text)) > 0 then sSQL := sSQL +
   '      AND RTRIM(HME.CCCREDFINAN) LIKE ' + QuotedStr(trim(edtContaContabil.Text) + '%')         + #13;

   sSQL := sSQL +
   '      AND HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO '                                      + #13 +
   '      AND CON.IDPATRO            = PTR.IDPESSOA '                                              + #13;

   if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then sSQL := sSQL +
     '      AND MIG.IDPLANOCONTATU     = PPC.IDPLANOPREV'                                          + #13
   else sSQL := sSQL +
   '      AND CON.IDPLANOORIGEM      = PPC.IDPLANOPREV '                                           + #13;

   // filtro por Evento
   if cboEvento.ItemIndex > -1 then sSQL := sSQL +
   '      AND HME.HMETIPOMOV         = ' + IntToStr(cboEvento.ItemIndex)                            + #13;

   sSQL := sSQL +
   '   GROUP BY '                                                                                  + #13 +
   '      HME.CCCREDFINAN, PPC.NOME, PTR.NOME '                                                    + #13 +

   '   UNION '                                                                                     + #13 +

   '   SELECT '                                                                                    + #13 +
   '      RTRIM(LAC.PLACONTA) AS CONTACONTABIL, '                                                   + #13 +
   '      LAC.IDMODULO, '                                                                          + #13 +
   '      PPC.NOME AS NOMEPLANO, '                                                                 + #13 +
   '      PTR.NOME AS NOMEPATRO, '                                                                 + #13 +
   '      0.00 AS EPDEB, '                                                                         + #13 +
   '      0.00 AS EPCRED, '                                                                        + #13 +
   '      SUM(DECODE(LAC.LACDEBCRE, ''D'', LAC.LACVALOR, 0)) AS CONTABDEB, '                       + #13 +
   '      SUM(DECODE(LAC.LACDEBCRE, ''C'', LAC.LACVALOR, 0)) AS CONTABCRED '                       + #13 +
   '   FROM '                                                                                      + #13 +
   '      LANCAMENTO       LAC, '                                                                  + #13 +
   '      PLANILHA         PLN, '                                                                  + #13 +
   '      PLANPREVCONTABIL PPC, '                                                                  + #13 +
   '      PESSOA           PTR '                                                                   + #13 +

   '   WHERE '                                                                                     + #13 +
   '          LAC.PLACONTA         LIKE ' + QuotedStr(trim(edtContaContabil.Text) + '%')           + #13 +
   '      AND LAC.IDPLANOPREV      IN (' + molListaPlano.PegaPlano + ') '                          + #13 +
   '      AND LAC.IDPATRO          IN (' + molListaPatro.PegaPatro + ') '                          + #13;

   if length(trim(edtPlnCodigo.Text)) = 0 then sSQL := sSQL +
   '      AND PLN.PLNDATDIA       >= ' + OraData(edtDataIni.Date)                                  + #13 +
   '      AND PLN.PLNDATDIA       <= ' + OraData(edtDataFim.Date)                                  + #13;

   if length(trim(edtPlnCodigo.Text)) > 0 then sSQL := sSQL +
   '      AND PLN.PLNCODIGO        = ' + edtPlnCodigo.Text                                         + #13;

   if chkOrigemEP.Checked then sSQL := sSQL +
   '      AND LAC.IDMODULO         = ' + IntToStr(Sistema.IDModulo)                                + #13;

   sSQL := sSQL +
   '      AND PLN.PLNCODIGO        = LAC.PLNCODIGO '                                               + #13 +
   '      AND LAC.IDPLANOPREV      = PPC.IDPLANOPREV '                                             + #13 +
   '      AND LAC.IDPATRO          = PTR.IDPESSOA '                                                + #13;

   if (chkContaEP.Checked) and (edtContaContabil.GetTextLen = 0) then sSQL := sSQL +
   '      AND EXISTS '                                                                             + #13 +
   '          ( '                                                                                  + #13 +
   '          SELECT 1 FROM LANCAMENTO LAN '                                                       + #13 +
   '          WHERE '                                                                              + #13 +
   '                 LAN.IDMODULO  = 15 '                                                          + #13 +
   '             AND LAN.PLACONTA  = LAC.PLACONTA '                                                + #13 +
   '             AND LAN.PLANO     = LAC.PLANO '                                                   + #13 +
   '          ) '                                                                                  + #13;

   sSQL := sSQL +
   '   GROUP BY '                                                                                  + #13 +
   '     LAC.PLACONTA, PPC.NOME, PTR.NOME, LAC.IDMODULO '                                          + #13 +
   '   ) MOV, '                                                                                    + #13 +

   '   MODULO     MOD, '                                                                           + #13 +
   '   PLANOCONTA PLA  '                                                                           + #13 +

   'WHERE '                                                                                        + #13 +
   '       RPAD(MOV.CONTACONTABIL, 18) = PLA.PLACONTA '                                            + #13 +
   '   AND MOV.IDMODULO                = MOD.IDMODULO '                                            + #13 +
   '   AND PLA.PLANO                   = ' + IntToStr(Modulo.iPlano)                               + #13 +

   'GROUP BY '                                                                                                 + #13 +
   '   MOV.CONTACONTABIL, MOV.NOMEPLANO, MOV.NOMEPATRO, PLA.PLANOME, MOV.IDMODULO, MOD.NOMEMODULO '+ #13;

   if chkDiverg.Checked then sSQL := sSQL +
   'HAVING '                                                                                       + #13 +
   '   ((SUM(MOV.EPDEB) - SUM(MOV.CONTABDEB)) <> 0) OR '                                           +
   '   ((SUM(MOV.EPCRED) - SUM(MOV.CONTABCRED)) <> 0) '                                            + #13;

   sSQL := sSQL +
   'ORDER BY '                                                                                     + #13 +
   '   MOV.NOMEPLANO, MOV.NOMEPATRO, MOV.CONTACONTABIL, MOD.NOMEMODULO ';

   with dtmRelConciliaContabPPPeriodo.qryConciliaContabPPPeriodo do
   begin
      Close;
      SQL.Text := sSQL;
    //Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
    //SQL.SaveToFile(Sistema.TempDir + 'EP-RelConciliaContabPPPeriodo.txt');
      SQL.SaveToFile(ftempregra + '\' + 'EP-RelConciliaContabPPPeriodo.txt');
      Open;
   end;
end;



procedure TcfgRelConciliaContabPPPeriodo.molListaPatrobtnInvertePatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnInvertePatroClick(Sender);
end;



procedure TcfgRelConciliaContabPPPeriodo.molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnMarcaTodosPatroClick(Sender);
end;



procedure TcfgRelConciliaContabPPPeriodo.molListaPlanobtnInvertePlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnInvertePlanoClick(Sender);
end;



procedure TcfgRelConciliaContabPPPeriodo.molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnMarcaTodosPlanoClick(Sender);
end;



procedure TcfgRelConciliaContabPPPeriodo.chkOrigemEPClick(Sender: TObject);
begin
   inherited;

   if not(chkOrigemEP.Checked) then cboEvento.ItemIndex := -1;

   cboEvento.Enabled := chkOrigemEP.Checked;
end;



procedure TcfgRelConciliaContabPPPeriodo.edtPlnCodigoKeyPress(Sender: TObject; var Key: Char);
begin
   inherited;
   if IsCharAlpha(Key) then Key := #0;
end;



procedure TcfgRelConciliaContabPPPeriodo.edtPlnCodigoExit(Sender: TObject);
var
   iPlanilha : Integer;
begin
   inherited;

   if length(trim(edtPlnCodigo.Text)) > 0 then
   begin
      try
         iPlanilha := StrToInt(edtPlnCodigo.Text);
      except
         MsgDlg('É necessário indicar um valor numérico e inteiro para o código da Planilha!', 'Empréstimo', mtWarning, [mbOk], 0);
         Repaint;

         edtPlnCodigo.SetFocus;
         Exit;
      end;

      edtDataIni.Color := clBtnFace;
      edtDataFim.Color := clBtnFace;
   end
   else
   begin
      edtDataIni.Color := clWindow;
      edtDataFim.Color := clWindow;
   end;
end;



end.
