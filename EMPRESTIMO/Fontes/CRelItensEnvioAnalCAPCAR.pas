{---------------------------Alteração-------------------------------------------
Rotina      : FiltraRelatorio
Pendência   : SIG131775
Responsável : Leandro            
Data        : 02/08/2023
Descrição   : Ajustar queries para adequação a segregação da HISTMOVEMPTMO->HEMORIGEM = 11
--------------------------------------------------------------------------------------------------
Pendência   : SOL 114575 Kintana 535771
Responsável : Jéssica Lana
Data        : 24/04/2009
Descrição   : Gravar arquivos com a query de entrada na pasta C:\PLANUS\TEMP.
-------------------------------------------------------------------------------}
unit CRelItensEnvioAnalCAPCAR;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   CRel, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr,
   TB97, ExtCtrls, mContratoEmptmo, Mask, wwdbedit, Wwdbspin, CheckLst,
   wwdblook, db, fcCombo, fcColorCombo, DBTables, Wwquery,

   uTypesEmptmo, mMutuario, mListaPlano, mListaPatro, wwdbdatetimepicker;

type
   TcfgRelItensEnvioAnalCAPCAR = class(TcfgRel)
      DBcboTipoContrato: TwwDBLookupCombo;
      Label2: TLabel;
      Panel1: TPanel;
      Label15: TLabel;
      DBspnAno: TwwDBSpinEdit;
      cboMes: TComboBox;
      GroupBox1: TGroupBox;
      chkFinanceiro: TCheckBox;
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
      Label4: TLabel;
      DBcboSitPart: TwwDBLookupCombo;
      CheckBox1: TCheckBox;
      GroupBox3: TGroupBox;
      Label5: TLabel;
      edtDataEfetivaIni: TwwDBDateTimePicker;
      edtDataEfetivaFim: TwwDBDateTimePicker;
      rdgPositivoNegativo: TRadioGroup;
      GroupBox4: TGroupBox;
      edtDataVenctoIni: TwwDBDateTimePicker;
      edtDataVenctoFim: TwwDBDateTimePicker;
      chkFiltroCobranca: TCheckBox;
      Label3: TLabel;

      procedure FormShow(Sender: TObject);
      procedure DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure molMutuario1btnBuscaPartClick(Sender: TObject);
      procedure molMutuariobtnLimpaPartClick(Sender: TObject);
      procedure molListaPatrobtnInvertePatroClick(Sender: TObject);
      procedure molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
      procedure molListaPlanobtnInvertePlanoClick(Sender: TObject);
      procedure molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
    procedure DBcboTipoEmptmoExit(Sender: TObject);


   private  // Private declarations

      procedure AbreQueries;

      procedure MontaQuery; override;
      procedure FiltraRelatorio;

      function VerificaPreenchimento: Boolean;

   public   // Public declarations

   end;



var
  cfgRelItensEnvioAnalCAPCAR: TcfgRelItensEnvioAnalCAPCAR;




implementation
{$R *.DFM}
uses
   DLookEmptmo,
   UDiasUteis,
   USistema,
   UfuncoesEmptmo,
   uVerificaPreenchimento,
   FProgresso,     (* FrmProgresso *)
   uMensErro, dRelItensEnvioAnalCAPCAR;



function TcfgRelItensEnvioAnalCAPCAR.VerificaPreenchimento: Boolean;
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



procedure TcfgRelItensEnvioAnalCAPCAR.AbreQueries;
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




procedure TcfgRelItensEnvioAnalCAPCAR.MontaQuery;
begin
   inherited;

   with dtmRelItensEnvioAnalCAPCAR do
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

      bCorLinha      := chkCorLinha.Checked;
      CorLinha       := cboCorLinha.SelectedColor;

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

      dtmRelItensEnviolAnal_lblSitPart.Caption := '< Todas >';
      if DBcboSitPart.LookupValue <> '' then
      begin
         dtmRelItensEnviolAnal_lblSitPart.Caption := DBcboSitPart.Text;
      end;
   end;

   FiltraRelatorio;
end;



procedure TcfgRelItensEnvioAnalCAPCAR.FiltraRelatorio;
var
   sABS        : String;
   sSQL        : String;
   sAno, sMes  : String;
   sOrdenacao  : String;
begin
   sAno  := FormatFloat('0000', DBspnAno.Value);
   sMes  := FormatFloat('00', cboMes.ItemIndex + 1);

   sABS  := IntToStr(rdgPositivoNegativo.ItemIndex);

   case rdgOrdenar.ItemIndex of
      0 : sOrdenacao := '   PTR.NOME, CON.IDCONTRATOEMPTMO';
      1 : sOrdenacao := '   PTR.NOME, NVL(DEP.MATRICULA, ELP.MATRICULA), CON.IDCONTRATOEMPTMO';
      2 : sOrdenacao := '   PTR.NOME, MUT.NOME, CON.IDCONTRATOEMPTMO';
   end;

   sSQL :=
   'SELECT '                                                                                 + #13 +
   '   CON.IDCONTRATOEMPTMO, '                                                               + #13 +

   '   CON.IDPATRO, PTR.NOME AS PATRO, '                                                     + #13 +
   '   CON.IDPLANOPREV,  '                                                                   + #13 +

   '   MUT.NOME, '                                                                           + #13 +
   '   NVL(DEP.MATRICULA, ELP.MATRICULA) AS MATRICULA, '                                     + #13 +
   '   TCE.TCEDESCRICAO, '                                                                   + #13 +

   '   ITE.ITEDESCRICAO, '                                                                   + #13 +
   '   HME.HMEPARCELA, '                                                                     + #13 +
   '   HME.HMENUMPARCELAS, '                                                                 + #13 +
   '   DECODE(HME.HMETIPOMOV, 0, ''Concessão'',    '                                         + #13 +
   '                          1, ''Prestação'',    '                                         + #13 +
   '                          2, ''Amortização'',  '                                         + #13 +
   '                          3, ''Quitação'',     '                                         + #13 +
   '                          4, ''Atualização Débito'',  '                                  + #13 +
   '                          5, ''Atualização Diária'') AS DESC_EVENTO, '                   + #13 +
   '   DECODE(HME.HMEORIGEM,                       '                                         + #13 +
   '        0, ''Concessão/Renovação'',            '                                         + #13 +
   '        1, ''Geração de Parcelas'',            '                                         + #13 +
   '        2, ''Amortização/Refinanciamento'',    '                                         + #13 +
   '        3, ''Quitação Antecipada'',            '                                         + #13 +
   '        4, ''Tratamento de Divergências'',     '                                         + #13 +
   '        5, ''Atualização de Saldo (Diária)'',  '                                         + #13 +
   '        6, ''Recálculo Diário'',               '                                         + #13 +
   '        7, ''Tratamento Individual'',          '                                         + #13 +
   '        8, ''Quitação por Morte/Invalidez'',   '                                         + #13 +
   '        9, ''Importação/Migração'',            '                                         + #13 +
   '       10, ''Quitação por Resgate'',           '                                         + #13 +
   //'       11, ''Recebimento'',                    '                                         + #13 +   //LEANDRO SIG131775
   '          11, DECODE(TMP_ORI.PRESTPARCIAL,''1'', ''Prestação Parcial'', NULL , ''Recebimento''), ' + #13 +    //LEANDRO SIG131775
   '       12, ''Entrada Manual'',                 '                                         + #13 +
   '       13, ''Alteração de Concessão'',         '                                         + #13 +
   '       14, ''Tratamento de Valores Não Programados'',   '                                + #13 +
   '       15, ''Consulta de Contratos'',          '                                         + #13 +
   '       16, ''Cancelamento de Concessão'',      '                                         + #13 +
   '       17, ''Alteração Contratual'',           '                                         + #13 +
   '       18, ''Liberação de Concessão'',         '                                         + #13 +
   '       19, ''Envio'',                          '                                          + #13 +
   '       20, ''Tratamento de Itens não Recebidos'',       '                                + #13 +
   '       21, ''Lançamento de Prestações Atualizadas'',    '                                + #13 +
   '       23, ''Envio de Concessão em Lote'',              '                                + #13 +
   '       24, ''Envio de Seguros em Lote'',                '                                + #13 +
   '       41, ''Contabilização em Lote de Concessão'',     '                                + #13 +
   '       42, ''Contabilização em Lote de Prestação'',     '                                + #13 +
   '       43, ''Contabilização em Lote de Amortização'',   '                                + #13 +
   '       44, ''Contabilização em Lote de Quitação'',      '                                + #13 +
   '       45, ''Contabilização em Lote de Encargos'',      '                                + #13 +
   '       46, ''Contabilização em Lote de Atualização Diária'',  '                          + #13 +
   '       47, ''Contabilização em Lote de Ajustes'',       '                                + #13 +
   '       51, ''Desfazer Geração de Parcelas'',            '                                + #13 +
   '       52, ''Cancelamento de Amortização'',             '                                + #13 +
   '       53, ''Cancelamento de Quitação'',                '                                + #13 +
   '       61, ''Desfazer Envio'',                          '                                + #13 +
   '       62, ''Desfazer Recebimento'',                    '                                + #13 +
   '       63, ''Desfazer Envio de Concessão em Lote'',     '                                + #13 +
   '       64, ''Desfazer Envio de Seguros em Lote'',       '                                + #13 +
   '       71, ''Desfazer Contabilização em Lote de Concessão'',    '                        + #13 +
   '       72, ''Desfazer Contabilização em Lote de Prestação'',    '                        + #13 +
   '       73, ''Desfazer Contabilização em Lote de Amortização'',  '                        + #13 +
   '       74, ''Desfazer Contabilização em Lote de Quitação'',     '                        + #13 +
   '       75, ''Desfazer Contabilização em Lote de Encargos'',     '                        + #13 +
   '       76, ''Desfazer Contabilização em Lote de Atualização Diária'',  '                 + #13 +
   '       77, ''Desfazer Contabilização em Lote de Ajustes''              '                 + #13 +
   '      ) AS ORIGEM, '                                                                     + #13 +


   '   DECODE(HME.HMERECPAG, '                                                               + #13 +
   '          ''P'', 0, '                                                                    + #13 +
   '                 DECODE(HME.CODDOCUMENTO, '                                              + #13 +
   '                        NULL, 0, '                                                       + #13 +
   '                        DECODE(HME.FLGENVIO, '                                           + #13 +
   '                               NULL, DECODE(NVL(' + sABS + ', 0), '                      + #13 +
   '                                            1, ABS(NVL(HME.HMEVLRPREVISTO, 0)), '        + #13 +
   '                                            NVL(HME.HMEVLRPREVISTO, 0)), '               + #13 +
   '                               0) '                                                      + #13 +
   '                       ) '                                                               + #13 +
   '        ) AS HMEVLRPREVISTODOCREC, '                                                     + #13 +

   '   DECODE(HME.HMERECPAG, '                                                               + #13 +
   '          ''P'', 0, '                                                                    + #13 +
   '                 DECODE(CODDOCUMENTO, '                                                  + #13 +
   '                        NULL, DECODE(FLGENVIO, '                                         + #13 +
   '                                     NULL, DECODE(NVL(' + sABS + ', 0), '                + #13 +
   '                                                  1, ABS(NVL(HMEVLRPREVISTO, 0)), '      + #13 +
   '                                                  NVL(HMEVLRPREVISTO, 0)), '             + #13 +
   '                                     0), '                                               + #13 +
   '                        0) '                                                             + #13 +
   '         ) AS HMEVLRPREVISTOREC, '                                                       + #13 +

   '   DECODE(HME.HMERECPAG, '                                                               + #13 +
   '          ''R'', 0, '                                                                    + #13 +
   '                 DECODE(HME.CODDOCUMENTO, '                                              + #13 +
   '                        NULL, 0, '                                                       + #13 +
   '                        DECODE(HME.FLGENVIO, '                                           + #13 +
   '                               NULL, DECODE(NVL(' + sABS + ', 0), '                      + #13 +
   '                                            1, ABS(NVL(HME.HMEVLRPREVISTO, 0)), '        + #13 +
   '                                            NVL(HME.HMEVLRPREVISTO, 0)), '               + #13 +
   '                               0) '                                                      + #13 +
   '                       ) '                                                               + #13 +
   '        ) AS HMEVLRPREVISTODOCPAG, '                                                     + #13 +

   '   DECODE(HME.HMERECPAG, '                                                               + #13 +
   '          ''R'', 0, '                                                                    + #13 +
   '                 DECODE(CODDOCUMENTO, '                                                  + #13 +
   '                        NULL, DECODE(FLGENVIO, '                                         + #13 +
   '                                     NULL, DECODE(NVL(' + sABS + ', 0), '                + #13 +
   '                                                  1, ABS(NVL(HMEVLRPREVISTO, 0)), '      + #13 +
   '                                                  NVL(HMEVLRPREVISTO, 0)), '             + #13 +
   '                                     0), '                                               + #13 +
   '                        0) '                                                             + #13 +
   '         ) AS HMEVLRPREVISTOPAG, '                                                       + #13 +

   '   DECODE(HME.HMERECPAG, '                                                               + #13 +
   '          ''R'', 0, '                                                                    + #13 +
   '                 DECODE(NVL(' + sABS + ', 0), '                                          + #13 +
   '                        1, ABS(NVL(HMEVLREFETIVO, 0)), '                                 + #13 +
   '                        NVL(HMEVLREFETIVO, 0) ) '                                        + #13 +
   '         ) AS HMEVLREFETIVOPAG, '                                                        + #13 +

   '   DECODE(HME.HMERECPAG, '                                                               + #13 +
   '          ''P'', 0, '                                                                    + #13 +
   '                 DECODE(NVL(' + sABS + ', 0), '                                          + #13 +
   '                        1, ABS(NVL(HMEVLREFETIVO, 0)), '                                 + #13 +
   '                        NVL(HMEVLREFETIVO, 0) ) '                                        + #13 +
   '         ) AS HMEVLREFETIVOREC '                                                         + #13 +

   'FROM '                                                                                   + #13 +
   '   HISTMOVEMPTMO   HME, '                                                                + #13 +
   '   ITEMEMPTMO      ITE, '                                                                + #13 +
   '   ITEMXTIPOCONTR  ITC, '                                                                + #13 +
   '   PESSOA          PTR, '                                                                + #13 +
   '   PESSOA          MUT, '                                                                + #13 +
   '   CONTRATOEMPTMO  CON, '                                                                + #13 +
   '   TIPOCONTREMPTMO TCE, '                                                                + #13 +
   '   TIPOEMPTMO      TEP, '                                                                + #13 +
   '   DEPENTIT        DEP, '                                                                + #13 +
   '   ELEGPATRO       ELP, '                                                                + #13 +
   //Pendência 27333 - 30/01/2008
   '   PARTPREVPLAN    PPP, '                                                                + #13 +
   //Fim Pendência 27333

   // Pendência 23260 - Marcos Topini em 14/11/2006
   '   VWMIGRACONTRATOEP MIG, '                                                              + #13 +

   //LEANDRO SIG131775 INICIO
   '     (SELECT ''1'' AS PRESTPARCIAL , TMP.*   '                                                   + #13 +
   '                             FROM TMPDESC TMP    '                                             + #13 +
   '                             WHERE ((TMP.VALORRECEBIDO > 0 AND TMP.VALORRECEBIDO < VALOR)  '   + #13 +
   '                             AND  TMP.DATARECEBIMENTO IS NOT NULL)) as TMP_ORI'                + #13 +
   //LEANDRO SIG131775 FIM

   'WHERE '                                                                                  + #13 +

   // ----------------------------------------------------------------------------------------------

   // filtro por Empresa Proprietátia
   '       TEP.IDEMPRESAPROP           = ' + IntToStr(Sistema.IDEmpresa)                     + #13;


   // filtro por Contrato
   if molMutuario.IDBenef > 0 then sSql := sSql +
   '   AND CON.IDBENEF                 = ' + IntToStr(molMutuario.IDBenef)             + #13;

   // filtro por Tipo de Empréstimo
   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   '   AND TCE.IDTIPOEMPTMO            = ' + DBcboTipoEmptmo.LookupValue                     + #13;

   // filtro por Tipo de Contrato
   if DBcboTipoContrato.LookupValue <> '' then sSQL := sSQL +
   '   AND CON.IDTIPOCONTREMPTMO       = ' + DBcboTipoContrato.LookupValue                   + #13;

   // filtro por SitPart
   if DBcboSitPart.LookupValue <> '' then sSQL := sSQL +
   //Pendência 27333 - 30/01/2008
   //'   AND CON.IDSITPART               = ' + DBcboSitPart.LookupValue                        + #13;
   '   AND PPP.IDSITPART               = ' + DBcboSitPart.LookupValue                        + #13;
   //Fim Pendência 27333

   // filtro por Patrocinadora / Plano
   //sSQL := sSQL +
   //'   AND CON.IDPATRO               IN (' + molListaPatro.PegaPatro + ') '                + #13 +
   //'   AND CON.IDPLANOPREV           IN (' + molListaPlano.PegaPlano + ') '                + #13;

   // filtro por Patrocinadora / Plano
   sSQL := sSQL +
   '   AND MIG.IDPATROATU              IN (' + molListaPatro.PegaPatro + ') '                + #13 +
   '   AND MIG.IDPLANOCONTATU          IN (' + molListaPlano.PegaPlano + ') '                + #13;

   // ----------------------------------------------------------------------------------------------

   if chkFiltroCobranca.Checked then sSQL := sSQL +
   '   AND HME.HMEANOCOBRANCA          = ' + sAno                                            + #13 +
   '   AND HME.HMEMESCOBRANCA          = ' + sMes                                            + #13;

   if length(trim(edtDataVenctoIni.Text)) > 0 then sSQL := sSQL +
   '   AND HME.HMEDATAVENCTO          >= ' + OraData(edtDataVenctoIni.Date)                  + #13;

   if length(trim(edtDataVenctoFim.Text)) > 0 then sSQL := sSQL +
   '   AND HME.HMEDATAVENCTO          <= ' + OraData(edtDataVenctoFim.Date)                  + #13;

   if length(trim(edtDataEfetivaIni.Text)) > 0 then sSQL := sSQL +
   '   AND HME.HMEDATAEFETIVA          >= ' + OraData(edtDataEfetivaIni.Date)                + #13;

   if length(trim(edtDataEfetivaFim.Text)) > 0 then sSQL := sSQL +
   '   AND HME.HMEDATAEFETIVA          <= ' + OraData(edtDataEfetivaFim.Date)                + #13;

   sSQL := sSQL +
   '   AND HME.HMETIPOMOV              NOT IN (5, 8) '                                       + #13 +
   '   AND ( HME.HMECENTRALIZA         = 1     OR HME.HMEDESTACADO = 1 ) '                   + #13 +
   '   AND ( HME.FLGESTORNADO          IS NULL OR HME.FLGESTORNADO = 0 ) '                   + #13 +
   '   AND ( HME.FLGABONADO            IS NULL OR HME.FLGABONADO   = 0 ) '                   + #13 +
   '   AND ( HME.FLGQUITADO            IS NULL OR HME.FLGQUITADO   = 0 ) '                   + #13 +
   '   AND HME.HMEFORMACOBRANCA        = ''C'' '                                             + #13;

   if chkQuitaAmortiza.Checked then sSQL := sSQL +
   '   AND HME.HMETIPOMOV              IN (0, 1, 4, 6, 7) '                                  + #13;

   if chkValorZero.Checked then sSQL := sSQL +
   '   AND NVL(HME.HMEVLREFETIVO, 0)   = 0 '                                                 + #13;

   if chkValorDiverg.Checked then sSQL := sSQL +
   '   AND NVL(HME.HMEVLREFETIVO, 0)   <> NVL(HME.HMEVLRPREVISTO, 0) '                       + #13;

   if chkValorNAOZero.Checked then sSQL := sSQL +
   '   AND NVL(HME.HMEVLREFETIVO, 0)   <> 0 '                                                + #13;

   sSQL := sSQL +
   '   AND CON.IDPATRO           = PTR.IDPESSOA '                                            + #13 +
   '   AND CON.IDPESSOA          = DEP.IDTITULAR '                                           + #13 +
   '   AND CON.IDBENEF           = DEP.IDPESSOA '                                            + #13 +
   '   AND CON.IDPESSOA          = ELP.IDPESSOA '                                            + #13 +
   '   AND CON.IDPATRO           = ELP.IDPESSJUR '                                           + #13 +
   '   AND CON.IDBENEF           = MUT.IDPESSOA '                                            + #13 +
   '   AND CON.IDTIPOCONTREMPTMO = TCE.IDTIPOCONTREMPTMO '                                   + #13 +
   '   AND TCE.IDTIPOEMPTMO      = TEP.IDTIPOEMPTMO '                                        + #13 +
   '   AND CON.IDCONTRATOEMPTMO  = HME.IDCONTRATOEMPTMO '                                    + #13 +
   //Pendência 27333 - 30/01/2008
   '   AND CON.IDPESSOA          = PPP.IDPESSOA '                                            + #13 +
   '   AND CON.IDPATRO           = PPP.IDPESSJUR '                                           + #13 +
   '   AND CON.IDPLANOPREV       = PPP.IDPLANOPREV '                                         + #13 +
   //Fim Pendência 27333
   '   AND CON.IDTIPOCONTREMPTMO = ITC.IDTIPOCONTREMPTMO '                                   + #13 +
   '   AND HME.IDITEMEMPTMO      = ITC.IDITEMEMPTMO '                                        + #13 +
   '   AND ITC.IDITEMEMPTMO      = ITE.IDITEMEMPTMO '                                        + #13 +
   '   AND HME.IDITEMEMPTMO      = ITE.IDITEMEMPTMO '                                        + #13 +

   '   AND (HME.idcontratoemptmo = TMP_ORI.IDDESCONTO(+) AND HME.HMEPARCELAALT    = TMP_ORI.PARCELA(+) ) ' + #13 +  // LEANDRO SIG131775

   // Pendência 23260 - Marcos Topini
   '  AND MIG.IDCONTRATOEMPTMO         = HME.IDCONTRATOEMPTMO '                              + #13 +
   '  AND MIG.DATAMIGRA                = (SELECT MAX(DATAMIGRA) '                            + #13 +
   '                                        FROM VWMIGRACONTRATOEP '                         + #13 +
   '                                       WHERE IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO '   + #13 +
   '                                         AND DATAMIGRA       <= HME.HMEDATAPREVISTA) '   + #13 +

   'ORDER BY ' + #13 + sOrdenacao;

   with dtmRelItensEnvioAnalCAPCAR.qryItensEnvioAnalCAPCAR do
   begin
      Close;
      SQL.Clear;
      SQL.Text := sSQL;
    //Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
    //SQL.SaveToFile(Sistema.TempDir + 'EP-RelItensEnvioAnalCAPCAR.txt');
      SQL.SaveToFile(ftempregra + '\' + 'EP-RelItensEnvioAnalCAPCAR.txt');
      Open;
   end;
end;



procedure TcfgRelItensEnvioAnalCAPCAR.FormShow(Sender: TObject);
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



procedure TcfgRelItensEnvioAnalCAPCAR.DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
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



procedure TcfgRelItensEnvioAnalCAPCAR.molMutuario1btnBuscaPartClick(Sender: TObject);
begin
   inherited;
   molMutuario.btnBuscaPartClick(Sender);
end;



procedure TcfgRelItensEnvioAnalCAPCAR.molMutuariobtnLimpaPartClick(Sender: TObject);
begin
   inherited;
   molMutuario.btnLimpaPartClick(Sender);
end;



procedure TcfgRelItensEnvioAnalCAPCAR.molListaPatrobtnInvertePatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnInvertePatroClick(Sender);
end;



procedure TcfgRelItensEnvioAnalCAPCAR.molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnMarcaTodosPatroClick(Sender);
end;



procedure TcfgRelItensEnvioAnalCAPCAR.molListaPlanobtnInvertePlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnInvertePlanoClick(Sender);
end;



procedure TcfgRelItensEnvioAnalCAPCAR.molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnMarcaTodosPlanoClick(Sender);
end;



procedure TcfgRelItensEnvioAnalCAPCAR.DBcboTipoEmptmoExit(Sender: TObject);
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
