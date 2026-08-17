{  --------------------------------------------------------------------------------------------------
Pendência   : SOL 253185  PPM 771995
Responsável : Wylliam Leite da Silva
Data        : 13/05/2015
Descrição   : Ajustar queries para adequação a segregação da HISTMOVEMPTMO
---------------------------Alteração-------------------------------------------
Pendência   : SOL 114575 Kintana 535771
Responsável : Jéssica Lana
Data        : 24/04/2009
Descrição   : Gravar arquivos com a query de entrada na pasta C:\PLANUS\TEMP.
-------------------------------------------------------------------------------}
unit CRelConferePlanilha;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   CRel, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr,
   TB97, ExtCtrls, mContratoEmptmo, Mask, wwdbedit, Wwdbspin, CheckLst,
   wwdblook, db, fcCombo, fcColorCombo, mInscricaoEmptmo, wwdbdatetimepicker,
   mListaPlano, mListaPatro, CMProcuraMask, CMDateTimePicker,
  mListaPlanoContab;

type
   TcfgRelConferePlanilha = class(TcfgRel)
      GroupBox1: TGroupBox;
      chkCorLinha: TCheckBox;
      cboCorLinha: TfcColorCombo;
      chkLinhas: TCheckBox;
      grpPeriodo: TGroupBox;
      Label1: TLabel;
      Label2: TLabel;
      edtDataIni: TCMDateTimePicker;
      edtDataFim: TCMDateTimePicker;
      chkDiverg: TCheckBox;

      procedure FormShow(Sender: TObject);


   private  // Private declarations

      procedure MontaQuery; override;
      procedure FiltraRelatorio;

      function VerificaPreenchimento: Boolean;


   public   // Public declarations

   end;



var
  cfgRelConferePlanilha: TcfgRelConferePlanilha;



implementation
{$R *.DFM}
uses
   DLookEmptmo, UDiasUteis, USistema, uFuncoesEmptmo, dEmptmo, 
   uMensErro, uVerificaPreenchimento, uIntegraBack, dRelConferePlanilha;



function TcfgRelConferePlanilha.VerificaPreenchimento: Boolean;
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



procedure TcfgRelConferePlanilha.FormShow(Sender: TObject);
begin
   inherited;

   ParametrosSistema;

   edtDataIni.Date := Date;
   edtDataFim.Date := Date;
end;



procedure TcfgRelConferePlanilha.MontaQuery;
begin
   inherited;

   with dtmRelConferePlanilha do
   begin
      dtmRelConferePlanilha_lblDataIni.Caption        := edtDataIni.Text;
      dtmRelConferePlanilha_lblDataFim.Caption        := edtDataFim.Text;
      dtmRelConferePlanilha_lblDiverg.Visible         := chkDiverg.Checked;

      bSeparador  := chkLinhas.Checked;
      bCorlinha   := chkCorLinha.Checked;
      CorLinha    := cboCorLinha.SelectedColor;
   end;

   FiltraRelatorio;
end;



procedure TcfgRelConferePlanilha.FiltraRelatorio;
var
   sSQL : String;
begin
   sSQL :=
   'SELECT '                                                                                       + #13 +
   '   PLN.PLNCODIGO, PLN.PLNPLANIL, PLN.PLNDATDIA, '                                              + #13 +
   '   NVL(EMP.VLR_EP, 0) AS VLR_EP, '                                                             + #13 +
   '   NVL(LAC.CONTABDEB, 0) AS CONTABDEB, NVL(LAC.CONTABCRED, 0) AS CONTABCRED, '                 + #13 +
   '   (NVL(EMP.VLR_EP, 0) - NVL(LAC.CONTABDEB, 0)) AS DIFERENCA '                                 + #13 +
   'FROM '                                                                                         + #13 +
   '   PLANILHA PLN, '                                                                             + #13 +

   '   ( '                                                                                         + #13 +
   //Wylliam Leite da Silva SOL 253185 PPM 771995 - Início
   '   SELECT ' + #13 +
   //Wylliam Leite da Silva SOL 253185 PPM 771995 - Fim
   '      PLN.PLNCODIGO, '                                                                         + #13 +
   '      SUM(ABS(NVL(HME.HMEVLRPREVISTO, 0))) AS VLR_EP '                                         + #13 +
   '   FROM '                                                                                      + #13 +
   '      HISTMOVEMPTMO    HME, '                                                                  + #13 +
   '      PLANILHA         PLN '                                                                   + #13 +
   '   WHERE '                                                                                     + #13 +
   '          PLN.PLNDATDIA     >= ' + OraData(edtDataIni.Date)                                    + #13 +
   '      AND PLN.PLNDATDIA     <= ' + OraData(edtDataFim.Date)                                    + #13 +
   '      AND PLN.IDMODULO       = 15 '                                                            + #13 +
   '      AND HME.HMECENTRALIZA  = 0 '                                                             + #13 +
   '      AND PLN.PLNCODIGO      = HME.PLNCODIGO '                                                 + #13 +
   '   GROUP BY '                                                                                  + #13 +
   '      PLN.PLNCODIGO '                                                                          + #13 +

   '   UNION '                                                                                     + #13 +

   //Wylliam Leite da Silva SOL 253185 PPM 771995 - Início
   '   SELECT ' + #13 +
   //Wylliam Leite da Silva SOL 253185 PPM 771995 - Fim
   '      PLN.PLNCODIGO, '                                                                         + #13 +
   '      SUM(ABS(NVL(HME.HMEVLRPREVISTO, 0))) AS VLR_EP '                                         + #13 +
   '   FROM '                                                                                      + #13 +
   '      HISTMOVEMPTMO    HME, '                                                                  + #13 +
   '      PLANILHA         PLN '                                                                   + #13 +
   '   WHERE '                                                                                     + #13 +
   '          PLN.PLNDATDIA     >= ' + OraData(edtDataIni.Date)                                    + #13 +
   '      AND PLN.PLNDATDIA     <= ' + OraData(edtDataFim.Date)                                    + #13 +
   '      AND PLN.IDMODULO       = 15 '                                                            + #13 +
   '      AND HME.HMECENTRALIZA  = 0 '                                                             + #13 +
   '      AND PLN.PLNCODIGO      = HME.PLNCODIGOESTORNO '                                          + #13 +
   '   GROUP BY '                                                                                  + #13 +
   '      PLN.PLNCODIGO, HME.PLNCODIGOESTORNO '                                                    + #13 +
   '   ) EMP, '                                                                                    + #13 +

   '   ( '                                                                                         + #13 +
   //Wylliam Leite da Silva - SOL: 253185 PPM: 771995 - Início
   '   SELECT '                                                                                    + #13 +
   //Wylliam Leite da Silva - SOL: 253185 PPM: 771995 - Fim
   '      PLN.PLNCODIGO, '                                                                         + #13 +
   '      SUM(DECODE(LAC.LACDEBCRE, ''D'', LAC.LACVALOR, 0)) AS CONTABDEB, '                       + #13 +
   '      SUM(DECODE(LAC.LACDEBCRE, ''C'', LAC.LACVALOR, 0)) AS CONTABCRED '                       + #13 +
   '   FROM '                                                                                      + #13 +
   '      LANCAMENTO       LAC, '                                                                  + #13 +
   '      PLANILHA         PLN '                                                                   + #13 +
   '   WHERE '                                                                                     + #13 +
   '          PLN.PLNDATDIA     >= ' + OraData(edtDataIni.Date)                                    + #13 +
   '      AND PLN.PLNDATDIA     <= ' + OraData(edtDataFim.Date)                                    + #13 +
   '      AND PLN.IDMODULO       = 15 '                                                            + #13 +
   '      AND PLN.PLNCODIGO      = LAC.PLNCODIGO(+) '                                              + #13 +
   '      AND PLN.PLNCODIGO      = LAC.PLNCODIGO '                                                 + #13 +
   '   GROUP BY '                                                                                  + #13 +
   '      PLN.PLNCODIGO '                                                                          + #13 +
   '   ) LAC '                                                                                     + #13 +

   'WHERE '                                                                                        + #13 +
   '       PLN.IDMODULO          = 15 '                                                            + #13 +
   '   AND PLN.PLNDATDIA        >= ' + OraData(edtDataIni.Date)                                    + #13 +
   '   AND PLN.PLNDATDIA        <= ' + OraData(edtDataFim.Date)                                    + #13 +
   '   AND PLN.PLNCODIGO         = LAC.PLNCODIGO(+) '                                              + #13 +
   '   AND PLN.PLNCODIGO         = EMP.PLNCODIGO(+) '                                              + #13 +

   '   AND ( '                                                                                     + #13 +
   '       NVL(EMP.VLR_EP, 0) <> 0 OR '                                                            + #13 +
   '       NVL(LAC.CONTABDEB, 0) <> 0 OR '                                                         + #13 +
   '       NVL(LAC.CONTABCRED, 0) <> 0 '                                                           + #13 +
   '       ) '                                                                                     + #13;

   if chkDiverg.Checked then sSQL := sSQL +
   '   AND ( '                                                                                     + #13 +
   '          (   NVL(LAC.CONTABDEB, 0) <> NVL(LAC.CONTABCRED, 0)   ) OR '                         + #13 +
   '          (   NVL(LAC.CONTABDEB, 0) <> NVL(EMP.VLR_EP, 0)   ) '                                + #13 +
   '       ) '                                                                                     + #13;

   sSQL := sSQL +
   'ORDER BY '                                                                                     + #13 +
   '   PLN.PLNDATDIA, PLN.PLNCODIGO '                                                              + #13;

   with dtmRelConferePlanilha.qryConferePlanilha do
   begin
      Close;
      SQL.Text := sSQL;
    //Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
    //SQL.SaveToFile(Sistema.TempDir + 'EP-RelConferePlanilha.txt');
      SQL.SaveToFile(ftempregra + '\' + 'EP-RelConferePlanilha.txt');
      Open;
   end;
end;



end.
