{---------------------------Alteração-------------------------------------------
Pendência   : SOL 114575 KINTANA 535771
Responsável : Jéssica Lana
Data        : 24/04/2009
Descrição   : Gravar arquivos com a query de entrada na pasta C:\PLANUS\TEMP.
-------------------------------------------------------------------------------}
unit cRelItensEnvioSintCAPCAR;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   CRel, fcCombo, fcColorCombo, StdCtrls, Mask, wwdbedit, Wwdbspin,
   wwdblook, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97,
   ExtCtrls, Db, DBTables, Wwquery, mContratoEmptmo, wwdbdatetimepicker,
   mListaPlano, mListaPatro, mListaPlanoContab;

type
   TcfgRelItensEnvioSintCAPCAR = class(TcfgRel)
      GroupBox1: TGroupBox;
      chkCorLinha: TCheckBox;
      cboCorLinha: TfcColorCombo;
      chkLinhas: TCheckBox;
      Label1: TLabel;
      Label2: TLabel;
      DBcboTipoEmptmo: TwwDBLookupCombo;
      DBcboTipoContrato: TwwDBLookupCombo;
      qryAux: TwwQuery;
      molContratoEmptmo: TmolContratoEmptmo;
      rdgPositivoNegativo: TRadioGroup;
      Label5: TLabel;
      Label6: TLabel;
      Label7: TLabel;
      qryAuxDESCTIPOEMPTMO: TStringField;
      qryAuxTCEDESCRICAO: TStringField;
      qryAuxIDITEMEMPTMO: TFloatField;
      qryAuxITEDESCRICAO: TStringField;
      qryAuxTIPO: TStringField;
      qryAuxVLR_DOC: TFloatField;
      qryAuxVLR_REC: TFloatField;
      qryAuxNOME: TStringField;
      qryAuxVLR_ENV: TFloatField;
      molListaPatro: TmolListaPatro;
      Panel1: TPanel;
      Label15: TLabel;
      DBspnAno: TwwDBSpinEdit;
      cboMes: TComboBox;
      chkFiltroCobranca: TCheckBox;
      GroupBox4: TGroupBox;
      Label3: TLabel;
      edtDataVenctoIni: TwwDBDateTimePicker;
      edtDataVenctoFim: TwwDBDateTimePicker;
      GroupBox3: TGroupBox;
      Label4: TLabel;
      edtDataEfetivaIni: TwwDBDateTimePicker;
      edtDataEfetivaFim: TwwDBDateTimePicker;
    molListaPlano: TmolListaPlanoContab;

      procedure FormShow(Sender: TObject);
      procedure DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure DBcboTipoEmptmoExit(Sender: TObject);
      procedure molContratoEmptmobtnBuscaContratoClick(Sender: TObject);
      procedure molContratoEmptmobtnLimpaContratoClick(Sender: TObject);
      procedure bbtnConfirmarClick(Sender: TObject);
      procedure molListaPatrobtnInvertePatroClick(Sender: TObject);
      procedure molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
      procedure molListaPlanobtnInvertePlanoClick(Sender: TObject);
      procedure molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);


   private  // Private declarations

      procedure AbreQueries;

      procedure MontaQuery; override;
      procedure FiltraRelatorio;

      function  MontaQueryAux: String;

      function VerificaPreenchimento: Boolean;


   public   // Public declarations


   end;



var
  cfgRelItensEnvioSintCAPCAR: TcfgRelItensEnvioSintCAPCAR;



implementation
{$R *.DFM}
uses
   DLookEmptmo,
   uDiasUteis,
   uMensErro,                 (* MsgDlg *)
   uSistema,
   uVerificaPreenchimento,
   uFuncoesEmptmo,
   dRelItensEnvioSintCAPCAR;




function TcfgRelItensEnvioSintCAPCAR.VerificaPreenchimento: Boolean;
begin
   Result := False;

   try
      if not(chkFiltroCobranca.Checked) and not( (length(trim(edtDataVenctoIni.Text)) > 0) or
                                                 (length(trim(edtDataVenctoFim.Text)) > 0) or
                                                 (length(trim(edtDataEfetivaIni.Text)) > 0) or
                                                 (length(trim(edtDataEfetivaFim.Text)) > 0) ) then
      begin
         raise EValidacao.CreateVal('É necessário indicar pelo menos um tipo de filtro!', chkFiltroCobranca);
      end;

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



procedure TcfgRelItensEnvioSintCAPCAR.AbreQueries;
begin
   // Tipo de Empréstimo
   with dtmLookEmptmo.qryLookTipoEmptmo do
   begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoEmptmo);
      ParamByName('PIDEMPRESAPROP').AsInteger := Sistema.IDEmpresa;
      Open;
   end;

   // Tipo de Contrato
   LimpaParametros(dtmLookEmptmo.qryLookPlanPrev);
   dtmLookEmptmo.qryLookPlanPrev.Open;
end;



procedure TcfgRelItensEnvioSintCAPCAR.MontaQuery;
begin
   inherited;

   with dtmRelItensEnvioSintCAPCAR do
   begin
      lblMesCobranca.Caption        := '';

      if chkFiltroCobranca.Checked then
      begin
         lblMesCobranca.Caption     := cboMes.Text + ' / ' + DBspnAno.Text;
      end;

      lblDataVenctoIni.Caption      := edtDataVenctoIni.Text;
      lblDataVenctoFim.Caption      := edtDataVenctoFim.Text;
      lblDataEfetivaIni.Caption     := edtDataEfetivaIni.Text;
      lblDataEfetivaFim.Caption     := edtDataEfetivaFim.Text;

      lblPositivoNegativo.Visible   := rdgPositivoNegativo.ItemIndex = 1;

      bSeparador                    := chkLinhas.Checked;
      bCorlinha                     := chkCorLinha.Checked;
      CorLinha                      := cboCorLinha.SelectedColor;


      // Início Pendência 21063 - Marcos Ventura Topini
      // -------------------------------------------------------------------------------------------

        lblTipoEmptmo.Caption := ' < todos > ';
        if DBcboTipoEmptmo.LookupValue <> ''   then lblTipoEmptmo.Caption := DBcboTipoEmptmo.Text;

        lblTipoContr.Caption  := ' < todos > ';
        if DBcboTipoContrato.LookupValue <> ''    then lblTipoContr.Caption  := DBcboTipoContrato.Text;

        memPatro.RichText := molListaPatro.ListaPatro;
        memPlano.RichText := molListaPlano.ListaPlano;

      // -------------------------------------------------------------------------------------------
      // Fim Pendência 21063


   end;

   FiltraRelatorio;
end;



function  TcfgRelItensEnvioSintCAPCAR.MontaQueryAux: String;
var
   sSQL : String;
   sABS : String;
begin
   sABS := 'NULL';
   if rdgPositivoNegativo.ItemIndex = 1 then sABS := '1';

   sSQL :=
   'SELECT '                                                                                       + #13 +
   '   TEP.DESCTIPOEMPTMO, '                                                                       + #13 +
   '   TCE.TCEDESCRICAO, '                                                                         + #13 +
   '   ITE.IDITEMEMPTMO, '                                                                         + #13 +
   '   ITE.ITEDESCRICAO, '                                                                         + #13 +
   '   FCT.TIPO, '                                                                                 + #13 +

   '   NVL(FCT.HMEVLRPREVISTO, 0) AS VLR_ENV, '                                                    + #13 +
   '   NVL(FCT.HMEVLRPREVISTODOC, 0) AS VLR_DOC, '                                                 + #13 +
   '   NVL(FCT.HMEVLREFETIVO, 0)  AS VLR_REC, '                                                    + #13 +

   '   PES.NOME '                                                                                  + #13 +

   'FROM '                                                                                         + #13 +
   '   PESSOA            PES, '                                                                    + #13 +
   '   CONTRATOEMPTMO    CON, '                                                                    + #13 +
   '   ITEMEMPTMO        ITE, '                                                                    + #13 +
   '   TIPOCONTREMPTMO   TCE, '                                                                    + #13 +
   '   TIPOEMPTMO        TEP, '                                                                    + #13 +
   //Pendência 26919 - 14/11/2007
   //'   HISTMOVEMPTMO     HME, '                                                                    + #13 +
   //'   VWMIGRACONTRATOEP MIG, '                                                                    + #13 +
   //Fim Pendência 26919
   '   ( '                                                                                         + #13 +
   '   SELECT '                                                                                    + #13 +
   '      ''P'' AS TIPO, '                                                                         + #13 +
   '      IDHISTMOVEMPTMO, '                                                                       + #13 +

   '      DECODE(CODDOCUMENTO, '                                                                   + #13 +
   '             NULL, 0, '                                                                        + #13 +
   '             DECODE(FLGENVIO, '                                                                + #13 +
   '                    NULL, DECODE(NVL(' + sABS + ', 0), '                                       + #13 +
   '                                 1, ABS(NVL(HMEVLRPREVISTO, 0)), '                             + #13 +
   '                                 NVL(HMEVLRPREVISTO, 0)), '                                    + #13 +
   '                    0) '                                                                       + #13 +
   '            ) AS HMEVLRPREVISTODOC, '                                                          + #13 +

   '      DECODE(CODDOCUMENTO, '                                                                   + #13 +
   '             NULL, DECODE(FLGENVIO, '                                                          + #13 +
   '                          NULL, DECODE(NVL(' + sABS + ', 0), '                                 + #13 +
   '                                       1, ABS(NVL(HMEVLRPREVISTO, 0)), '                       + #13 +
   '                                       NVL(HMEVLRPREVISTO, 0)), '                              + #13 +
   '                          0), '                                                                + #13 +
   '             0) AS HMEVLRPREVISTO, '                                                           + #13 +

   '      DECODE(NVL(' + sABS + ', 0), '                                                           + #13 +
   '             1, ABS(NVL(HMEVLREFETIVO, 0)), '                                                  + #13 +
   '             NVL(HMEVLREFETIVO, 0) ) AS HMEVLREFETIVO '                                        + #13 +
   '   FROM '                                                                                      + #13 +
   '      HISTMOVEMPTMO '                                                                          + #13 +
   '   WHERE '                                                                                     + #13 +

   '          HMEFORMACOBRANCA      = ''C'' '                                                      + #13 +
   '      AND HMERECPAG             = ''P'' '                                                      + #13 +
   '      AND (HMECENTRALIZA        = 1 OR HMEDESTACADO = 1) '                                     + #13 +
   '      AND NVL(FLGESTORNADO, 0)  = 0 '                                                          + #13;

   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '      AND IDCONTRATOEMPTMO      = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)          + #13;

   if chkFiltroCobranca.Checked then sSQL := sSQL +
   '      AND HMEANOCOBRANCA        = ' + FormatFloat('0000', DBspnAno.Value)                      + #13 +
   '      AND HMEMESCOBRANCA        = ' + FormatFloat(  '00', cboMes.ItemIndex + 1)                + #13;

   if length(trim(edtDataVenctoIni.Text)) > 0 then sSQL := sSQL +
   '   AND HMEDATAVENCTO           >= ' + OraData(edtDataVenctoIni.Date)                           + #13;

   if length(trim(edtDataVenctoFim.Text)) > 0 then sSQL := sSQL +
   '   AND HMEDATAVENCTO           <= ' + OraData(edtDataVenctoFim.Date)                           + #13;

   if length(trim(edtDataEfetivaIni.Text)) > 0 then sSQL := sSQL +
   '   AND HMEDATAEFETIVA          >= ' + OraData(edtDataEfetivaIni.Date)                          + #13;

   if length(trim(edtDataEfetivaFim.Text)) > 0 then sSQL := sSQL +
   '   AND HMEDATAEFETIVA          <= ' + OraData(edtDataEfetivaFim.Date)                          + #13;

   sSQL := sSQL +
   '   UNION '                                                                                     + #13 +

   '   SELECT '                                                                                    + #13 +
   '      ''R'' AS TIPO, '                                                                         + #13 +
   '      IDHISTMOVEMPTMO, '                                                                       + #13 +

   '      DECODE(CODDOCUMENTO, '                                                                   + #13 +
   '             NULL, 0, '                                                                        + #13 +
   '                   DECODE(FLGENVIO, '                                                          + #13 +
   '                          NULL, DECODE(NVL(' + sABS + ', 0), '                                 + #13 +
   '                                       1, ABS(NVL(HMEVLRPREVISTO, 0)), '                       + #13 +
   '                                          NVL(HMEVLRPREVISTO, 0) '                             + #13 +
   '                                      ), '                                                     + #13 +
   '                                0 '                                                            + #13 +
   '                         ) '                                                                   + #13 +
   '            ) AS HMEVLRPREVISTODOC, '                                                          + #13 +

   '      DECODE(CODDOCUMENTO, '                                                                   + #13 +
   '             NULL, DECODE(FLGENVIO, '                                                          + #13 +
   '                          NULL, DECODE(NVL(' + sABS + ', 0), '                                 + #13 +
   '                                       1, ABS(NVL(HMEVLRPREVISTO, 0)), '                       + #13 +
   '                                          NVL(HMEVLRPREVISTO, 0) '                             + #13 +
   '                                      ), '                                                     + #13 +
   '                                0 '                                                            + #13 +
   '                         ), '                                                                  + #13 +
   '                   0 '                                                                         + #13 +
   '            ) AS HMEVLRPREVISTO, '                                                             + #13 +

   '      DECODE(NVL(' + sABS + ', 0), '                                                           + #13 +
   '             1, ABS(NVL(HMEVLREFETIVO, 0)), '                                                  + #13 +
   '             NVL(HMEVLREFETIVO, 0) ) AS HMEVLREFETIVO '                                        + #13 +
   '   FROM '                                                                                      + #13 +
   '      HISTMOVEMPTMO '                                                                          + #13 +
   '   WHERE '                                                                                     + #13 +
   '          HMEFORMACOBRANCA      = ''C'' '                                                      + #13 +
   '      AND HMERECPAG             = ''R'' '                                                      + #13 +
   '      AND (HMECENTRALIZA        = 1 OR HMEDESTACADO = 1) '                                     + #13 +
   '      AND NVL(FLGESTORNADO, 0)  = 0 '                                                          + #13;

   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '      AND IDCONTRATOEMPTMO      = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)          + #13;

   if chkFiltroCobranca.Checked then sSQL := sSQL +
   '      AND HMEANOCOBRANCA        = ' + FormatFloat('0000', DBspnAno.Value)                      + #13 +
   '      AND HMEMESCOBRANCA        = ' + FormatFloat(  '00', cboMes.ItemIndex + 1)                + #13;

   if length(trim(edtDataVenctoIni.Text)) > 0 then sSQL := sSQL +
   '   AND HMEDATAVENCTO           >= ' + OraData(edtDataVenctoIni.Date)                           + #13;

   if length(trim(edtDataVenctoFim.Text)) > 0 then sSQL := sSQL +
   '   AND HMEDATAVENCTO           <= ' + OraData(edtDataVenctoFim.Date)                           + #13;

   if length(trim(edtDataEfetivaIni.Text)) > 0 then sSQL := sSQL +
   '   AND HMEDATAEFETIVA          >= ' + OraData(edtDataEfetivaIni.Date)                          + #13;

   if length(trim(edtDataEfetivaFim.Text)) > 0 then sSQL := sSQL +
   '   AND HMEDATAEFETIVA          <= ' + OraData(edtDataEfetivaFim.Date)                          + #13;

   // Pendência 26919 - 14/11/2007
   sSQL := sSQL +
   '   ) FCT, '                                                                                    + #13 +
   '   HISTMOVEMPTMO HME '                                                                         + #13 +
   '   left outer join MIGRACONTRATOEP MIG '                                                       + #13 +
   '   on (MIG.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO AND '                                       + #13 +
   '       MIG.DATAMIGRA        = F_MIGRAEP_DATA(HME.IDCONTRATOEMPTMO, HME.HMEDATAPREVISTA)) '     + #13;

   sSQL := sSQL +
   // Fim Pendência 26919

   'WHERE '                                                                                        + #13 +
   '       TEP.IDEMPRESAPROP      = ' + IntToStr(Sistema.IdEmpresa)                                + #13;

   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '   AND CON.IDCONTRATOEMPTMO     = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)          + #13;

   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   '   AND TEP.IDTIPOEMPTMO         = ' + DBcboTipoEmptmo.LookupValue                              + #13;

   if DBcboTipoContrato.LookupValue <> '' then sSQL := sSQL +
   '   AND TCE.IDTIPOCONTREMPTMO    = ' + DBcboTipoContrato.LookupValue                            + #13;

   // Pendência 26919 - 14/11/2007
   sSQL := sSQL +
   //'   AND CON.IDPATRO              IN (' + molListaPatro.PegaPatro + ') '                         + #13 +
   //'   AND MIG.IDPLANOCONTATU       IN (' + molListaPlano.PegaPlano + ') '                         + #13 +
   //'   AND MIG.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO'                                          + #13 +
   //'   AND MIG.DATAMIGRA          = (SELECT MAX(DATAMIGRA)'                                        + #13 +
   //'                                 FROM VWMIGRACONTRATOEP'                                       + #13 +
   //'                                 WHERE IDCONTRATOEMPTMO = CON.IDCONTRATOEMPTMO'                + #13 +
   //'                                 AND   DATAMIGRA <= HME.HMEDATAPREVISTA)'                      + #13 +
   '   AND NVL(MIG.IDPATROANT,CON.IDPATRO) IN (' + molListaPatro.PegaPatro + ') '                  + #13 +
   '   AND NVL(MIG.IDPLANOCONTANT,CON.IDPLANOORIGEM) IN (' + molListaPlano.PegaPlano + ') '        + #13 +
   // Fim Pendência 26919

   '   AND TCE.IDTIPOEMPTMO       = TEP.IDTIPOEMPTMO '                                             + #13 +
   '   AND TCE.IDTIPOCONTREMPTMO  = CON.IDTIPOCONTREMPTMO '                                        + #13 +
   '   AND CON.IDCONTRATOEMPTMO   = HME.IDCONTRATOEMPTMO '                                         + #13 +
   '   AND ITE.IDITEMEMPTMO       = HME.IDITEMEMPTMO '                                             + #13 +
   '   AND HME.IDHISTMOVEMPTMO    = FCT.IDHISTMOVEMPTMO '                                          + #13 +
   '   AND PES.IDPESSOA           = CON.IDPATRO '                                                  + #13 +

   'ORDER BY '                                                                                     + #13 +
   '   TEP.DESCTIPOEMPTMO, PES.NOME, TCE.TCEDESCRICAO, ITE.IDITEMEMPTMO ';



   // ----------------------------------------------------------------------------------------------

   Result := sSQL;
end;



procedure TcfgRelItensEnvioSintCAPCAR.FiltraRelatorio;
var
   sTipoEmptmo    : String;
   sTipoContr     : String;
   sIteDescricao  : String;
   sPatro         : String;

   iIdItemEmptmo  : Int64;

   iQuant_CAR     : Integer;
   fVlr_CAR       : Currency;
   fVlr_CARDOC    : Currency;
   fVlr_Rec_CAR   : Currency;

   iQuant_CAP     : Integer;
   fVlr_CAP       : Currency;
   fVlr_CAPDOC    : Currency;
   fVlr_Rec_CAP   : Currency;
begin
   qryAux.SQL.Text := MontaQueryAux;

   dtmRelItensEnvioSintCAPCAR.qryItensEnvioSintCAPCAR.Close;
   dtmRelItensEnvioSintCAPCAR.qryItensEnvioSintCAPCAR.Open;

   with qryAux do
   begin
       //Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
       //SQL.SaveToFile(Sistema.TempDir + 'EP-ItensEnvioSintCaPCaR.txt');
         SQL.SaveToFile(ftempregra + '\' + 'EP-ItensEnvioSintCaPCaR.txt');
      Open;
      while not(qryAux.EOF) do
      begin
         sTipoEmptmo := qryAuxDESCTIPOEMPTMO.AsString;

         while not(qryAux.EOF) and (sTipoEmptmo = qryAuxDESCTIPOEMPTMO.AsString) do
         begin
            sPatro := qryAuxNOME.AsString;

            while ( not(qryAux.EOF) and
                  (sTipoEmptmo = qryAuxDESCTIPOEMPTMO.AsString) )  and
                  (sPatro = qryAuxNOME.AsString) do
            begin
               sTipoContr := qryAuxTCEDESCRICAO.AsString;

               while ( not(EOF) and
                     (sTipoEmptmo = qryAuxDESCTIPOEMPTMO.AsString) and
                     (sPatro = qryAuxNOME.AsString)                and
                     (sTipoContr  = qryAuxTCEDESCRICAO.AsString) ) do
               begin
                  iIdItemEmptmo := qryAuxIDITEMEMPTMO.AsInteger;
                  sIteDescricao := qryAuxITEDESCRICAO.AsString;

                  iQuant_CAR     := 0;
                  fVlr_CAR       := 0;
                  fVlr_CARDOC    := 0;
                  fVlr_Rec_CAR   := 0;

                  iQuant_CAP     := 0;
                  fVlr_CAP       := 0;
                  fVlr_CAPDOC    := 0;
                  fVlr_Rec_CAP   := 0;

                  while not(EOF) and
                        (sTipoEmptmo   = qryAuxDESCTIPOEMPTMO.AsString) and
                        (sPatro        = qryAuxNOME.AsString)           and
                        (sTipoContr    = qryAuxTCEDESCRICAO.AsString)   and
                        (iIdItemEmptmo = qryAuxIDITEMEMPTMO.AsInteger)  do
                  begin
                     case qryAuxTIPO.AsString[1] of

                        'P':
                        begin
                           Inc(iQuant_CAP);
                           fVlr_CAP     := fVlr_CAP + qryAuxVLR_ENV.AsCurrency;
                           fVlr_CAPDOC  := fVlr_CAPDOC + qryAuxVLR_DOC.AsCurrency;
                           fVlr_Rec_CAP := fVlr_Rec_CAP + qryAuxVLR_REC.AsCurrency;
                        end;

                        'R':
                        begin
                           Inc(iQuant_CAR);
                           fVlr_CAR     := fVlr_CAR + qryAuxVLR_ENV.AsCurrency;
                           fVlr_CARDOC  := fVlr_CARDOC + qryAuxVLR_DOC.AsCurrency;
                           fVlr_Rec_CAR := fVlr_Rec_CAR + qryAuxVLR_REC.AsCurrency;
                        end;

                     end;
                     qryAux.Next;
                  end;

                  // Grava os totais na query do relatorio
                  with dtmRelItensEnvioSintCAPCAR.qryItensEnvioSintCAPCAR do
                  begin
                     Append;

                     FieldByName('DESCTIPOEMPTMO').AsString := sTipoEmptmo;
                     FieldByName('TCEDESCRICAO').AsString   := sTipoContr;
                     FieldByName('ITEDESCRICAO').AsString   := sIteDescricao;
                     FieldByName('PATRO').AsString          := sPatro;

                     FieldByName('Quant_CAP').AsCurrency     := iQuant_CAP;
                     FieldByName('Vlr_CAP').AsCurrency       := fVlr_CAP;
                     FieldByName('Vlr_CAPDOC').AsCurrency    := fVlr_CAPDOC;
                     FieldByName('Vlr_Rec_CAP').AsCurrency   := fVlr_Rec_CAP;

                     FieldByName('Quant_CAR').AsCurrency     := iQuant_CAR;
                     FieldByName('Vlr_CAR').AsCurrency       := fVlr_CAR;
                     FieldByName('Vlr_CARDOC').AsCurrency    := fVlr_CARDOC;
                     FieldByName('Vlr_Rec_CAR').AsCurrency   := fVlr_Rec_CAR;

                     Post;
                  end;
               end;
            end;
         end;
      end;
      Close;
   end;

   dtmRelItensEnvioSintCAPCAR.qryItensEnvioSintCAPCAR.First;
end;



procedure TcfgRelItensEnvioSintCAPCAR.FormShow(Sender: TObject);
begin
   inherited;

   molContratoEmptmo.btnLimpaContrato.Click;

   // preenche o ano de referência/competência
   cboMes.ItemIndex := DiasUteis.ExtraiMes(Date) - 1;
   DBspnAno.Value   := DiasUteis.ExtraiAno(Date);

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



procedure TcfgRelItensEnvioSintCAPCAR.DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
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



procedure TcfgRelItensEnvioSintCAPCAR.DBcboTipoEmptmoExit(Sender: TObject);
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



procedure TcfgRelItensEnvioSintCAPCAR.molContratoEmptmobtnBuscaContratoClick(Sender: TObject);
begin
   inherited;
   molContratoEmptmo.btnBuscaContratoClick(Sender);
end;



procedure TcfgRelItensEnvioSintCAPCAR.molContratoEmptmobtnLimpaContratoClick(Sender: TObject);
begin
   inherited;
   molContratoEmptmo.btnLimpaContratoClick(Sender);
end;



procedure TcfgRelItensEnvioSintCAPCAR.bbtnConfirmarClick(Sender: TObject);
begin
   if VerificaPreenchimento then inherited;
end;



procedure TcfgRelItensEnvioSintCAPCAR.molListaPatrobtnInvertePatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnInvertePatroClick(Sender);
end;



procedure TcfgRelItensEnvioSintCAPCAR.molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnMarcaTodosPatroClick(Sender);
end;



procedure TcfgRelItensEnvioSintCAPCAR.molListaPlanobtnInvertePlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnInvertePlanoClick(Sender);
end;



procedure TcfgRelItensEnvioSintCAPCAR.molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnMarcaTodosPlanoClick(Sender);
end;



end.
