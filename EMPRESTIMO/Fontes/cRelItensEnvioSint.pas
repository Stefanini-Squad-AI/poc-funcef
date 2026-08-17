{---------------------------Alteração-------------------------------------------
Pendência   : SOL 114575 KINTANA 535771
Responsável : Jéssica Lana
Data        : 24/04/2009
Descrição   : Gravar arquivos com a query de entrada na pasta C:\PLANUS\TEMP.
-------------------------------------------------------------------------------}
unit cRelItensEnvioSint;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   CRel, fcCombo, fcColorCombo, StdCtrls, Mask, wwdbedit, Wwdbspin,
   wwdblook, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97,
   ExtCtrls, Db, DBTables, Wwquery, mContratoEmptmo, wwdbdatetimepicker,
   //Pendência 26919 - 13/11/2007
   //mListaPlano, mListaPatro;
   mListaPlanoContab, mListaPatro;
   //Fim Pendência 26919 - 13/11/2007

type
   TcfgRelItensEnvioSint = class(TcfgRel)
      Panel1: TPanel;
      Label15: TLabel;
      DBspnAno: TwwDBSpinEdit;
      cboMes: TComboBox;
      GroupBox1: TGroupBox;
      chkCorLinha: TCheckBox;
      cboCorLinha: TfcColorCombo;
      chkLinhas: TCheckBox;
      Label1: TLabel;
      Label2: TLabel;
      DBcboTipoEmptmo: TwwDBLookupCombo;
      DBcboTipoContrato: TwwDBLookupCombo;
      qryAux: TwwQuery;
      qryAuxDESCTIPOEMPTMO: TStringField;
      qryAuxTCEDESCRICAO: TStringField;
      qryAuxIDITEMEMPTMO: TFloatField;
      qryAuxITEDESCRICAO: TStringField;
      qryAuxTIPO: TStringField;
      qryAuxVLR_ENV: TFloatField;
      qryAuxVLR_REC: TFloatField;
      qryAuxNOME: TStringField;
      molContratoEmptmo: TmolContratoEmptmo;
      rdgPositivoNegativo: TRadioGroup;
      GroupBox3: TGroupBox;
      Label3: TLabel;
      Label4: TLabel;
      edtDataIni: TwwDBDateTimePicker;
      edtDataFim: TwwDBDateTimePicker;
      chkFiltroCobranca: TCheckBox;
      chkFiltroEfetiva: TCheckBox;
      Label5: TLabel;
      Label6: TLabel;
      Label7: TLabel;
      molListaPatro: TmolListaPatro;
      //Pendência 26919 - 13/11/2007
      //molListaPlano: TmolListaPlano;
      molListaPlano: TmolListaPlanoContab;
      //Fim Pendência 26919

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

      function  VerificaPreenchimento: Boolean;


   public   // Public declarations


   end;



var
  cfgRelItensEnvioSint: TcfgRelItensEnvioSint;



implementation
{$R *.DFM}
uses
   DLookEmptmo,
   uDiasUteis,
   uMensErro,                 (* MsgDlg *)
   uSistema,
   uVerificaPreenchimento,
   uFuncoesEmptmo,
   dRelItensEnvioSint;




function TcfgRelItensEnvioSint.VerificaPreenchimento: Boolean;
begin
   Result := False;

   try
      if not(chkFiltroCobranca.Checked) and not(chkFiltroEfetiva.Checked) then
         raise EValidacao.CreateVal('É necessário indicar pelo menos um tipo de filtro!', chkFiltroCobranca);

      if chkFiltroEfetiva.Checked then
      begin
         if length(trim(edtDataIni.Text)) = 0 then
            raise EValidacao.CreateVal('É necessário indicar a Data Inicial!', edtDataIni);

         if length(trim(edtDataFim.Text)) = 0 then
            raise EValidacao.CreateVal('É necessário indicar a Data Final!', edtDataFim);
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



procedure TcfgRelItensEnvioSint.AbreQueries;
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



procedure TcfgRelItensEnvioSint.MontaQuery;
begin
   inherited;

   with dtmRelItensEnvioSint do
   begin
      lblDataIni.Caption            := '';
      lblDataFim.Caption            := '';
      lblMesCobranca.Caption        := '';

      if chkFiltroCobranca.Checked then
      begin
         lblMesCobranca.Caption     := cboMes.Text + ' / ' + DBspnAno.Text;
      end;

      if chkFiltroEfetiva.Checked then
      begin
         lblDataIni.Caption         := edtDataIni.Text;
         lblDataFim.Caption         := edtDataFim.Text;
      end;

      lblPositivoNegativo.Visible   := rdgPositivoNegativo.ItemIndex = 1;

      bSeparador                    := chkLinhas.Checked;
      bCorlinha                     := chkCorLinha.Checked;
      CorLinha                      := cboCorLinha.SelectedColor;
   end;

   FiltraRelatorio;
end;


function  TcfgRelItensEnvioSint.MontaQueryAux: String;
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
   '   NVL(FCT.HMEVLREFETIVO, 0)  AS VLR_REC, '                                                    + #13 +
   '   PES.NOME '                                                                                  + #13 +

   'FROM '                                                                                         + #13 +
   '   PESSOA            PES, '                                                                    + #13 +
   '   HISTMOVEMPTMO     HME, '                                                                    + #13 +
   '   CONTRATOEMPTMO    CON, '                                                                    + #13 +

   '   ITEMEMPTMO        ITE, '                                                                    + #13 +
   '   TIPOCONTREMPTMO   TCE, '                                                                    + #13 +
   '   TIPOEMPTMO        TEP, '                                                                    + #13 +

   // ----------------------------------------------------------------------------------------------

   '   ( '                                                                                         + #13 +
   '   SELECT '                                                                                    + #13 +
   '      ''P'' AS TIPO, '                                                                         + #13 +
   '      IDHISTMOVEMPTMO, '                                                                       + #13 +

   '      DECODE(NVL(' + sABS + ', 0), 1, DECODE(FLGENVIO, NULL, ABS(NVL(HMEVLRPREVISTO, 0)), 0), '               + #13 +
   '                               DECODE(FLGENVIO, NULL, NVL(HMEVLRPREVISTO, 0), 0) ) AS HMEVLRPREVISTO, '       + #13 +
   '      DECODE(NVL(' + sABS + ', 0), 1, ABS(NVL(HMEVLREFETIVO, 0)), NVL(HMEVLREFETIVO, 0) ) AS HMEVLREFETIVO '  + #13 +

   '   FROM '                                                                                      + #13 +
   // Pendência 26919 - 14/11/2007
   '      CONTRATOEMPTMO C, '                                                                      + #13 +
   '      HISTMOVEMPTMO H '                                                                        + #13 +
   '      left outer join MIGRACONTRATOEP MIG '                                                    + #13 +
   '      on (MIG.IDCONTRATOEMPTMO = H.IDCONTRATOEMPTMO AND '                                      + #13;

   if chkFiltroEfetiva.Checked then sSQL := sSQL +
   '          MIG.DATAMIGRA        = F_MIGRAEP_DATA(H.IDCONTRATOEMPTMO, H.HMEDATAEFETIVA)) '       + #13
   else sSQL := sSQL +
   '          MIG.DATAMIGRA        = F_MIGRAEP_DATA(H.IDCONTRATOEMPTMO, H.HMEDATAPREVISTA)) '      + #13;

   sSQL := sSQL +
   // Fim Pendência 26919
   '   WHERE '                                                                                     + #13 +

   '          HMEFORMACOBRANCA      = ''F'' '                                                      + #13 +
   '      AND HMETIPOFOLHA          = ''P'' '                                                      + #13 +
   '      AND (HMECENTRALIZA        = 1 OR HMEDESTACADO = 1) '                                     + #13 +
   '      AND NVL(FLGESTORNADO, 0)  = 0 '                                                          + #13;

   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '      AND IDCONTRATOEMPTMO      = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)          + #13;

   if chkFiltroCobranca.Checked then sSQL := sSQL +
   '      AND HMEANOCOBRANCA        = ' + FormatFloat('0000', DBspnAno.Value)                      + #13 +
   '      AND HMEMESCOBRANCA        = ' + FormatFloat(  '00', cboMes.ItemIndex + 1)                + #13;

   if chkFiltroEfetiva.Checked then sSQL := sSQL +
   '      AND HMEDATAEFETIVA        BETWEEN TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY', edtDataIni.Date)) + ', ''DD/MM/YYYY'') AND '  +
                                           'TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY', edtDataFim.Date)) + ', ''DD/MM/YYYY'') '      + #13;
   // Pendência 26919 - 14/11/2007
   sSQL := sSQL +
   '      AND NVL(MIG.IDPATROANT,C.IDPATRO) IN (' + molListaPatro.PegaPatro + ') '                 + #13 +
   '      AND NVL(MIG.IDPLANOCONTANT,C.IDPLANOORIGEM) IN (' + molListaPlano.PegaPlano + ') '       + #13 +
   '      AND H.IDCONTRATOEMPTMO = C.IDCONTRATOEMPTMO '                                            + #13;
   // Fim Pendência 26919

   sSQL := sSQL +
   '   UNION '                                                                                     + #13 +

   '   SELECT '                                                                                    + #13 +
   '      ''B'' AS TIPO, '                                                                         + #13 +
   '      IDHISTMOVEMPTMO , '                                                                       + #13 +

   '      DECODE(NVL(' + sABS + ', 0), 1, DECODE(FLGENVIO, NULL, ABS(NVL(HMEVLRPREVISTO, 0)), 0), '         +
   '                               DECODE(FLGENVIO, NULL, NVL(HMEVLRPREVISTO, 0), 0) ) AS HMEVLRPREVISTO, ' + #13 +
   '      DECODE(NVL(' + sABS + ', 0), 1, ABS(NVL(HMEVLREFETIVO, 0)), '                                     +
   '                               NVL(HMEVLREFETIVO, 0) ) AS HMEVLREFETIVO '                               + #13 +
   '   FROM '                                                                                      + #13 +
   // Pendência 26919 - 14/11/2007
   '      CONTRATOEMPTMO C, '                                                                      + #13 +
   '      HISTMOVEMPTMO H '                                                                        + #13 +
   '      left outer join MIGRACONTRATOEP MIG '                                                    + #13 +
   '      on (MIG.IDCONTRATOEMPTMO = H.IDCONTRATOEMPTMO AND '                                      + #13;

   if chkFiltroEfetiva.Checked then sSQL := sSQL +
   '          MIG.DATAMIGRA        = F_MIGRAEP_DATA(H.IDCONTRATOEMPTMO, H.HMEDATAEFETIVA)) '       + #13
   else sSQL := sSQL +
   '          MIG.DATAMIGRA        = F_MIGRAEP_DATA(H.IDCONTRATOEMPTMO, H.HMEDATAPREVISTA)) '      + #13;

   sSQL := sSQL +
   // Fim Pendência 26919
   '   WHERE '                                                                                     + #13 +
   '          HMEFORMACOBRANCA      = ''F'' '                                                      + #13 +
   '      AND HMETIPOFOLHA          = ''B'' '                                                      + #13 +
   '      AND (HMECENTRALIZA        = 1 OR HMEDESTACADO = 1) '                                     + #13 +
   '      AND NVL(FLGESTORNADO, 0)  = 0 '                                                          + #13;

   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '      AND IDCONTRATOEMPTMO      = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)          + #13;

   if chkFiltroCobranca.Checked then sSQL := sSQL +
   '      AND HMEANOCOBRANCA        = ' + FormatFloat('0000', DBspnAno.Value)                      + #13 +
   '      AND HMEMESCOBRANCA        = ' + FormatFloat(  '00', cboMes.ItemIndex + 1)                + #13;

   if chkFiltroEfetiva.Checked then sSQL := sSQL +
   '      AND HMEDATAEFETIVA        BETWEEN TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY', edtDataIni.Date)) + ', ''DD/MM/YYYY'') AND '  +
                                           'TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY', edtDataFim.Date)) + ', ''DD/MM/YYYY'') '      + #13;

   // Pendência 26919 - 14/11/2007
   sSQL := sSQL +
   '      AND NVL(MIG.IDPATROANT,C.IDPATRO) IN (' + molListaPatro.PegaPatro + ') '                 + #13 +
   '      AND NVL(MIG.IDPLANOCONTANT,C.IDPLANOORIGEM) IN (' + molListaPlano.PegaPlano + ') '       + #13 +
   '      AND H.IDCONTRATOEMPTMO = C.IDCONTRATOEMPTMO '                                            + #13;
   // Fim Pendência 26919

   sSQL := sSQL +
   '   ) FCT '                                                                                     + #13 +

   'WHERE '                                                                                        + #13 +
   '       TEP.IDEMPRESAPROP        = ' + FormatFloat(#0, Sistema.IDEmpresa)                       + #13;

   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '   AND CON.IDCONTRATOEMPTMO     = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)          + #13;

   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   '   AND TEP.IDTIPOEMPTMO         = ' + DBcboTipoEmptmo.LookupValue                              + #13;

   if DBcboTipoContrato.LookupValue <> '' then sSQL := sSQL +
   '   AND TCE.IDTIPOCONTREMPTMO    = ' + DBcboTipoContrato.LookupValue                            + #13;

   sSQL := sSQL +
   '   AND TCE.IDTIPOEMPTMO         = TEP.IDTIPOEMPTMO '                                           + #13 +
   '   AND TCE.IDTIPOCONTREMPTMO    = CON.IDTIPOCONTREMPTMO '                                      + #13 +
   '   AND CON.IDCONTRATOEMPTMO     = HME.IDCONTRATOEMPTMO '                                       + #13 +
   '   AND ITE.IDITEMEMPTMO         = HME.IDITEMEMPTMO '                                           + #13 +
   '   AND HME.IDHISTMOVEMPTMO      = FCT.IDHISTMOVEMPTMO '                                        + #13 +
   '   AND PES.IDPESSOA             = CON.IDPATRO '                                                + #13 +

   'ORDER BY '                                                                                     + #13 +
   '   TEP.DESCTIPOEMPTMO, PES.NOME, TCE.TCEDESCRICAO, ITE.IDITEMEMPTMO ';

   // ----------------------------------------------------------------------------------------------

   Result := sSQL;
end;



procedure TcfgRelItensEnvioSint.FiltraRelatorio;
var
   sTipoEmptmo    : String;
   sTipoContr     : String;
   sIteDescricao  : String;
   sPatro         : String;

   iIdItemEmptmo  : Int64;

   iQuant_Patro   : Integer;
   fVlr_Patro     : Currency;
   fVlr_Rec_Patro : Currency;

   iQuant_Benef   : Integer;
   fVlr_Benef     : Currency;
   fVlr_Rec_Benef : Currency;

   iQuant_Car     : Integer;
   fVlr_Car       : Currency;
   fVlr_Rec_Car   : Currency;
begin
   qryAux.SQL.Text := MontaQueryAux;

   //qryAux.SQL.SaveToFile('c:\EP-RelItensEnvioAnalCAPCAR.txt');
   //Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
   //qryAux.SQL.SaveToFile(Sistema.TempDir + 'EP-RelItensEnvioAnalCAPCAR.txt');
     qryAux.SQL.SaveToFile(ftempregra + '\' + 'EP-RelItensEnvioAnalCAPCAR.txt');

   dtmRelItensEnvioSint.qryItensEnvioSint.Close;
   dtmRelItensEnvioSint.qryItensEnvioSint.Open;

   with qryAux do
   begin
      Open;

      while not(qryAux.EOF) do
      begin
         sTipoEmptmo := FieldByName('DESCTIPOEMPTMO').AsString;

         while not(qryAux.EOF) and (sTipoEmptmo = FieldByName('DESCTIPOEMPTMO').AsString) do
         begin
            sPatro := FieldByName('NOME').AsString;

            while ( not(qryAux.EOF) and
                  (sTipoEmptmo = FieldByName('DESCTIPOEMPTMO').AsString) )  and
                  (sPatro = FieldByName('NOME').AsString) do
            begin
               sTipoContr := FieldByName('TCEDESCRICAO').AsString;

               while ( not(EOF) and
                     (sTipoEmptmo = FieldByName('DESCTIPOEMPTMO').AsString) and
                     (sPatro = FieldByName('NOME').AsString)                and
                     (sTipoContr  = FieldByName('TCEDESCRICAO').AsString) ) do
               begin
                  iIdItemEmptmo := FieldByName('IDITEMEMPTMO').AsInteger;
                  sIteDescricao := FieldByName('ITEDESCRICAO').AsString;

                  iQuant_Patro   := 0;
                  fVlr_Patro     := 0;
                  fVlr_Rec_Patro := 0;

                  iQuant_Benef   := 0;
                  fVlr_Benef     := 0;
                  fVlr_Rec_Benef := 0;

                  iQuant_Car     := 0;
                  fVlr_Car       := 0;
                  fVlr_Rec_Car   := 0;

                  while not(EOF) and
                        (sTipoEmptmo   = FieldByName('DESCTIPOEMPTMO').AsString) and
                        (sPatro        = FieldByName('NOME').AsString)           and
                        (sTipoContr    = FieldByName('TCEDESCRICAO').AsString)   and
                        (iIdItemEmptmo = FieldByName('IDITEMEMPTMO').AsInteger)  do
                  begin
                     case FieldByName('TIPO').AsString[1] of
                        'P':
                        begin
                           Inc(iQuant_Patro);
                           fVlr_Patro     := fVlr_Patro + FieldByName('VLR_ENV').AsCurrency;
                           fVlr_Rec_Patro := fVlr_Rec_Patro + FieldByName('VLR_REC').AsCurrency;
                        end;

                        'B':
                        begin
                           Inc(iQuant_Benef);
                           fVlr_Benef     := fVlr_Benef + FieldByName('VLR_ENV').AsCurrency;
                           fVlr_Rec_Benef := fVlr_Rec_Benef + FieldByName('VLR_REC').AsCurrency;
                        end;

                        'C':
                        begin
                           Inc(iQuant_Car);
                           fVlr_Car     := fVlr_Car + FieldByName('VLR_ENV').AsCurrency;
                           fVlr_Rec_Car := fVlr_Rec_Car + FieldByName('VLR_REC').AsCurrency;
                        end;

                     end;
                     qryAux.Next;
                  end;

                  // Grava os totais na query do relatorio
                  with dtmRelItensEnvioSint.qryItensEnvioSint do
                  begin
                     Append;
                     FieldByName('DESCTIPOEMPTMO').AsString := sTipoEmptmo;
                     FieldByName('TCEDESCRICAO').AsString   := sTipoContr;
                     FieldByName('ITEDESCRICAO').AsString   := sIteDescricao;
                     FieldByName('PATRO').AsString          := sPatro;

                     FieldByName('QUANT_PATRO').AsCurrency   := iQuant_Patro;
                     FieldByName('VLR_PATRO').AsCurrency     := fVlr_Patro;
                     FieldByName('VLR_REC_PATRO').AsCurrency := fVlr_Rec_Patro;

                     FieldByName('QUANT_BENEF').AsCurrency   := iQuant_Benef;
                     FieldByName('VLR_BENEF').AsCurrency     := fVlr_Benef;
                     FieldByName('VLR_REC_BENEF').AsCurrency := fVlr_Rec_Benef;

                     FieldByName('QUANT_CAR').AsCurrency     := iQuant_Car;
                     FieldByName('VLR_CAR').AsCurrency       := fVlr_Car;
                     FieldByName('VLR_REC_CAR').AsCurrency   := fVlr_Rec_Car;
                     Post;
                  end;
               end;
            end;
         end;
      end;
      Close;
   end;

   dtmRelItensEnvioSint.qryItensEnvioSint.First;
end;



procedure TcfgRelItensEnvioSint.FormShow(Sender: TObject);
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



procedure TcfgRelItensEnvioSint.DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
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



procedure TcfgRelItensEnvioSint.DBcboTipoEmptmoExit(Sender: TObject);
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



procedure TcfgRelItensEnvioSint.molContratoEmptmobtnBuscaContratoClick(Sender: TObject);
begin
   inherited;
   molContratoEmptmo.btnBuscaContratoClick(Sender);
end;



procedure TcfgRelItensEnvioSint.molContratoEmptmobtnLimpaContratoClick(Sender: TObject);
begin
   inherited;
   molContratoEmptmo.btnLimpaContratoClick(Sender);
end;



procedure TcfgRelItensEnvioSint.bbtnConfirmarClick(Sender: TObject);
begin
   if VerificaPreenchimento then inherited;
end;



procedure TcfgRelItensEnvioSint.molListaPatrobtnInvertePatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnInvertePatroClick(Sender);
end;



procedure TcfgRelItensEnvioSint.molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnMarcaTodosPatroClick(Sender);
end;



procedure TcfgRelItensEnvioSint.molListaPlanobtnInvertePlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnInvertePlanoClick(Sender);
end;



procedure TcfgRelItensEnvioSint.molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnMarcaTodosPlanoClick(Sender);
end;



end.
