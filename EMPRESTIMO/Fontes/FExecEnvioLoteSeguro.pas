{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : SOL 253185 PPM 771995
Responsável : Wylliam Leite da Silva
Data        : 18/05/2015
Descrição   : Reestruturação da HistMovEmptmo(*Retirada dos Hint's)
--------------------------------------------------------------------------------
Pendência   : SOL 143413 Kintana 938370
Responsável : Fanuel Junior
Data        : 05/11/2010
Descrição   : Bloquear usuario que for mutuario do contrato com a variavel
'bBuscaMutuario'.
--------------------------------------------------------------------------------
Pendência   : SOL 118376 KINTANA 561884
Responsável : Jéssica Lana
Data        : 29/05/2009
Descrição   : Gravar arquivos com a query de entrada na pasta C:\PLANUS\TEMP.
--------------------------------------------------------------------------------
Pendência   : SOL 114575 KINTANA 535771
Responsável : Jéssica Lana
Data        : 24/04/2009
Descrição   : Gravar arquivos com a query de entrada na pasta C:\PLANUS\TEMP.
--------------------------------------------------------------------------------
Pendência   : 27370
Responsável : Daniel Simões
Data        : 11/02/2008
Descrição   : Alteração/Implementação do número do Help Context...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit FExecEnvioLoteSeguro;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FWizardMTEP, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
   TB97Tlbr, TB97, fcLabel, ComCtrls, ExtCtrls, Wwdbigrd, Grids, Wwdbgrid,
   mListaPlano, mListaPatro, wwdblook, mContratoEmptmo, wwdbdatetimepicker,
   Db, DBTables, Wwquery, Wwdatsrc;

type
   TfrmExecEnvioLoteSeguro = class(TfrmWizardMTEP)
      GroupBox3: TGroupBox;
      Label5: TLabel;
      Label6: TLabel;
      edtDataIni: TwwDBDateTimePicker;
      edtDataFim: TwwDBDateTimePicker;
      Label1: TLabel;
      DBcboTipoEmptmo: TwwDBLookupCombo;
      Label2: TLabel;
      DBcboTipoContrato: TwwDBLookupCombo;
      molContratoEmptmo: TmolContratoEmptmo;
      molListaPatro: TmolListaPatro;
      molListaPlano: TmolListaPlano;
      qryPortForma: TwwQuery;
      qryPortFormaPORTFORMAPAG: TFloatField;
      qryPortFormaDESCRICAO: TStringField;
      qryTipoContr: TwwQuery;
      qryTipoContrIDTIPOCONTREMPTMO: TFloatField;
      qryTipoContrTCEDESCRICAO: TStringField;
      qryUpdateDocumento: TwwQuery;
      Panel2: TPanel;
      memResult: TMemo;
      TabSheet3: TTabSheet;
      GroupBox1: TGroupBox;
      Label3: TLabel;
      DBcboPortadorForma: TwwDBLookupCombo;
      edtDataVencto: TwwDBDateTimePicker;
      Label4: TLabel;
      Label15: TLabel;
      DBcboTipoDoc: TwwDBLookupCombo;

      procedure FormShow(Sender: TObject);
      procedure molListaPatrobtnInvertePatroClick(Sender: TObject);
      procedure molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
      procedure molListaPlanobtnInvertePlanoClick(Sender: TObject);
      procedure molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
      procedure btnContinuarClick(Sender: TObject);
      procedure molContratoEmptmobtnBuscaContratoClick(Sender: TObject);
      procedure molContratoEmptmobtnLimpaContratoClick(Sender: TObject);
      procedure DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure DBcboTipoEmptmoExit(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);



   private // Private declarations

      procedure AbreQueries;

      function  VerificaPreenchimentoFiltro: Boolean;
      function  VerificaPreenchimentoDoc: Boolean;

      function  MontaSQLEnvio(const iPortForma : Integer): String;
      procedure Envia;

      function  EnviaLoteSeguro(const sSQL           : String;
                                const sHistorico     : String;
                                const dDataLanc      : TDateTime;
                                const iCodTipoDoc    : Integer;
                                const iMoedaCorrente : Integer;
                                const sCCusto        : String;
                                const iPrograma      : Integer;
                                var   iPlanilha      : Integer
                               ): Integer;


   public // Public declarations

   end;



var
  frmExecEnvioLoteSeguro: TfrmExecEnvioLoteSeguro;



implementation
{$R *.DFM}
uses
   uFuncoesEmptmo, uSistema, dLookEmptmo, uVerificaPreenchimento, dEmptmo, uMensErro, dBaseDados,
   uIntegraEmptmo, uDatabase, uModulo, uCtrlDocumento, fProgresso, UTypesEmptmo, uIntegraBack;




function TfrmExecEnvioLoteSeguro.VerificaPreenchimentoFiltro: Boolean;
begin
   Result := False;

   try
      // data inicial
      if length(trim(edtDataIni.Text)) = 0 then
         raise EValidacao.CreateVal('É necessário indicar a Data Inicial!', edtDataIni);

      // data final
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



function TfrmExecEnvioLoteSeguro.VerificaPreenchimentoDoc: Boolean;
begin
   Result := False;

   try
      // portador-forma
      if DBcboPortadorForma.LookupValue = '' then
         raise EValidacao.CreateVal('É necessário indicar a Conta de Caixa X Forma de Pagamento!', DBcboPortadorForma);

      // tipo de documento
      if DBcboTipoDoc.LookupValue = '' then
         raise EValidacao.CreateVal('É necessário indicar o Tipo de Documento!', DBcboTipoDoc);

      // data de vencimento
      if length(trim(edtDataVencto.Text)) = 0 then
         raise EValidacao.CreateVal('É necessário indicar a Data de Vencimento!', edtDataVencto);

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



function TfrmExecEnvioLoteSeguro.MontaSQLEnvio(const iPortForma : Integer): String;
var
   sSQL : String;
   sSeguradora : String;
begin
   sSeguradora := FormatFloat('#0', dtmEmptmo.qryParamEmptmoIDSEGURADORA.AsFloat);

   sSQL :=
   'SELECT '                                                                                 + #13 +
   '  HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO, HME.IDITEMEMPTMO, '                         + #13 +
   '  HME.HMEFORMACOBRANCA, HME.IDITEMCENTRALIZA, '                                          + #13 +

   '  DECODE(NVL(IXP.FLGNEGATIVO, 0), 0, NVL(HME.HMEVLRPREVISTO, 0), (NVL(HME.HMEVLRPREVISTO, 0) * (-1)) ) AS HMEVLRPREVISTO, '  + #13 +

   '  ''P'' AS HMERECPAG, HME.HMEDATAPREVISTA, HME.HMEDATAVENCTO, '                          + #13 +
   '  HME.HMEPARCELA, NVL(HME.HMENUMPARCELAS, 0) AS HMENUMPARCELAS, HME.HMESALDODEV, '       + #13 +
   '  HME.HMETIPOMOV, '                                                                      + #13 +

   '  (LTRIM(RTRIM(TO_CHAR(HME.HMEMESCOMPETENCIA, ''00'')))) '                               + #13 +
   '  || ''/'' || '                                                                          + #13 +
   '  (LTRIM(RTRIM(TO_CHAR(HME.HMEANOCOMPETENCIA, ''0000'')))) AS ANOMESCOMPETENCIA, '       + #13 +

   '  ITC.CONTABAIXA, ITC.TIPCODIGO, ITC.ITCTRATASALDODEV, '                                 + #13 +

   //Pendência 23255 - 09/10/2006 - Alberto
   '  CON.IDPLANOPREV, NVL(MIG.IDPLANOCONTATU, CON.IDPLANOPREV) AS IDPLANOORIGEM, '          + #13 +

   '  ' + sSeguradora + ' AS IDBENEF, '                                                      + #13 +
   '  ' + sSeguradora + ' AS IDPESSOA, '                                                     + #13 +

   '  -1 AS IDCBANCARIA, '                                                                   + #13 +
   '  -1 AS IDCBANCARIADEB, '                                                                + #13 +

   //Pendência 23255 - 09/10/2006 - Alberto
   '  MIG.IDPATROATU AS IDPATRO, CON.MATRICULA_TIT AS MATRICULA, '                           + #13 +

   '  CON.CODFORMAPAG, CON.PORTFORMAPAG, CON.PORTFORMAREC, '                                 + #13 +
   '  CON.IDTIPOCONTREMPTMO, IRC.ITEDESCRICAO, CON.FLGINTERNO, '                             + #13 +
   '  0 AS FLGATUALSALDOENV, -1 AS IDREGRAENVIOPARC, CON.IDTIPOSUSPEMPTMO '                  + #13 +

   'FROM '                                                                                   + #13 +
   '  HISTMOVEMPTMO   HME, '                                                                 + #13 +

   //Pendência 23255 - 09/10/2006 - Alberto
   '  VWMIGRACONTRATOEP MIG, '                                                               + #13 +

   '  ( '                                                                                    + #13 +
   //Wylliam Leite da Silva SOL 253185 PPM 771995 - Início
   '  SELECT '                                             + #13 +
   //Wylliam Leite da Silva SOL 253185 PPM 771995 - Fim
   '     CON.IDCONTRATOEMPTMO,      CON.IDINSCRICAOEMPTMO,        CON.IDCONTRQUITACAO, '     + #13 +
   '     CON.IDVERBA,               CON.FLGSITUACAO, '                                       + #13 +
   '     CON.NUMPARCELAS            AS PRAZO, '                                              + #13 +
   '     CON.VLRCONTRATO,           CON.VLRPARCELA,               CON.TXJUROS, '             + #13 +
   '     TEP.IDEMPRESAPROP, '                                                                + #13 +

   '     CON.IDPLANOPREV, NVL(CON.IDPLANOORIGEM, CON.IDPLANOPREV) AS IDPLANOORIGEM, '        + #13 +

   '     CON.IDTIPOCONTREMPTMO,     TCE.TCEDESCRICAO, '                                      + #13 +
   '     TCE.IDTIPOEMPTMO,          TEP.DESCTIPOEMPTMO, '                                    + #13 +
   '     CON.IDPESSOA,              CON.IDBENEF, '                                           + #13 +
   '     CON.MOECODIGO,             CON.IDCBANCARIADEB, '                                    + #13 +

   '     CON.CODFORMAPAG, CON.PORTFORMAPAG, CON.PORTFORMAREC, CON.IDCBANCARIA, '             + #13 +

   '     ELP.MATRICULA                 AS MATRICULA_TIT, '                                   + #13 +

   '     CON.FLGSUSPENSAOAUTO,      CON.IDTIPOSUSPEMPTMO, '                                  + #13 +

   '     PPP.INSCRICAONUMERO, '                                                              + #13 +
   '     NVL(PPP.SALPARTICIPACAO, 0)   AS SALPARTICIPACAO, '                                 + #13 +
   '     NVL(PPP.SALMANTIDO, 0)        AS SALMANTIDO, '                                      + #13 +
   '     NVL(PPP.SALAUXDOENCA, 0)      AS SALAUXDOENCA, '                                    + #13 +

   '     SIT.IDSITPART,             SIT.FLGINTERNO, '                                        + #13 +
   '     SIT.DESCRICAO                 AS SIT_TITULAR, '                                     + #13 +
   '     CON.IDPATRO, '                                                                      + #13 +
   '     DECODE(CON.IDBENEF, CON.IDPESSOA, SIT.DESCRICAO, ''Pensionista'') AS SITDESCRICAO ' + #13 +

   '  FROM '                                                                                 + #13 +
   '     CONTRATOEMPTMO  CON, '                                                              + #13 +
   '     PARTPREVPLAN    PPP, '                                                              + #13 +
   '     ELEGPATRO       ELP, '                                                              + #13 +
   '     PATRO           PTR, '                                                              + #13 +
   '     PLANPREV        PLP, '                                                              + #13 +
   '     TIPOCONTREMPTMO TCE, '                                                              + #13 +
   '     TIPOEMPTMO      TEP, '                                                              + #13 +
   '     SITPART         SIT, '                                                              + #13 +
   '     SITPLANOPREV    SPP '                                                               + #13 +

   '  WHERE '                                                                                + #13 +
   '         TEP.IDEMPRESAPROP     = ' + IntToStr(Sistema.IDEmpresa)                         + #13 +
   '     AND CON.FLGSITUACAO      <> ''C'' '                                                 + #13;

   // ----------------------------------------------------------------------------------------------

   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '     AND CON.IDCONTRATOEMPTMO  = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)     + #13;

   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   '     AND TCE.IDTIPOEMPTMO      = ' + DBcboTipoEmptmo.LookupValue                         + #13;

   if DBcboTipoContrato.LookupValue <> '' then sSQL := sSQL +
   '     AND CON.IDTIPOCONTREMPTMO = ' + DBcboTipoContrato.LookupValue                       + #13;

   // ----------------------------------------------------------------------------------------------

   sSQL := sSQL +
   '     AND CON.IDPLANOPREV       IN (' + molListaPlano.PegaPlano + ') '                    + #13 +
   '     AND CON.IDPATRO           IN (' + molListaPatro.PegaPatro + ') '                    + #13 +

   '     AND CON.IDPATRO           = PTR.IDPESSOA '                                          + #13 +
   '     AND CON.IDPLANOPREV       = PLP.IDPLANOPREV '                                       + #13 +
   '     AND CON.IDPESSOA          = ELP.IDPESSOA '                                          + #13 +
   '     AND CON.IDPESSOA          = PPP.IDPESSOA '                                          + #13 +
   '     AND PTR.IDPESSOA          = ELP.IDPESSJUR '                                         + #13 +
   '     AND PTR.IDPESSOA          = PPP.IDPESSJUR '                                         + #13 +
   '     AND CON.IDTIPOCONTREMPTMO = TCE.IDTIPOCONTREMPTMO '                                 + #13 +
   '     AND TCE.IDTIPOEMPTMO      = TEP.IDTIPOEMPTMO '                                      + #13 +
   '     AND PPP.IDSITPART         = SIT.IDSITPART '                                         + #13 +
   '     AND PPP.IDSITPLANOPREV    = SPP.IDSITPLANOPREV '                                    + #13 +
   '     AND PPP.FLGDESATIVADO     = 0 '                                                     + #13 +
   '  ) CON, '                                                                               + #13 +

   '  ( '                                                                                    + #13 +
   '  SELECT DISTINCT '                                                                      + #13 +
   '     IDITEMEMPTMO, IDTIPOCONTREMPTMO, FLGTIPOITEM, FLGNEGATIVO, DESCRICAO '              + #13 +
   '  FROM '                                                                                 + #13 +
   '     ITEMXPROCESSOEP '                                                                   + #13 +
   '  WHERE '                                                                                + #13 +
   '         IDPROCESSO = 24 '                                                               + #13 +
   '     AND FLGENVIO   = 1 '                                                                + #13 +
   '  ) IXP, '                                                                               + #13 +

   '  ITEMXTIPOCONTR  ITC, '                                                                 + #13 +
   '  ITEMEMPTMO      IRC  '                                                                 + #13 +

   'WHERE '                                                                                  + #13 +
   '       HME.CODDOCUMENTOPROC     IS NULL '                                                + #13 +

   '   AND HME.HMEDATAPREVISTA      BETWEEN ' + OraData(edtDataIni.Date) + ' AND ' + OraData(edtDataFim.Date)  + #13 +

   '   AND NVL(HME.FLGESTORNADO, 0) = 0 '                                                    + #13 +

   '   AND HME.IDCONTRATOEMPTMO     = CON.IDCONTRATOEMPTMO '                                 + #13 +
   '   AND CON.IDTIPOCONTREMPTMO    = ITC.IDTIPOCONTREMPTMO '                                + #13 +
   '   AND ITC.IDITEMEMPTMO         = IRC.IDITEMEMPTMO '                                     + #13 +
   '   AND ITC.IDITEMEMPTMO         = HME.IDITEMEMPTMO '                                     + #13 +

   '   AND ITC.IDITEMEMPTMO         = IXP.IDITEMEMPTMO '                                     + #13 +
   '   AND ITC.IDTIPOCONTREMPTMO    = IXP.IDTIPOCONTREMPTMO '                                + #13 +

   //Pendência 23255 - 09/10/2006 - Alberto
   '   AND MIG.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO '                                     + #13 +
   '   AND MIG.DATAMIGRA        = (select max(DATAMIGRA) '                                   + #13 +
   '                               from   VWMIGRACONTRATOEP '                                + #13 +
   '                               where  IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO '          + #13 +
   '                               and    DATAMIGRA <= HME.HMEDATAPREVISTA) '                + #13 +
   //Fim Pendência 23255

   'ORDER BY '                                                                               + #13 +
   '   CON.IDCONTRATOEMPTMO, HME.HMEDATAPREVISTA, HME.HMEPARCELA ';

   Result := sSQL;
end;



procedure TfrmExecEnvioLoteSeguro.Envia;
var
   iPlanilha   : Integer;
   iResult     : Integer;
   sSQLEnvio   : String;
   sHistorico  : String;
begin
   try
      // ----------------------------------------------------------------------------------

      MostraEspera('Selecionando seguros a enviar...');

      sSQLEnvio   := MontaSQLEnvio(qryPortFormaPORTFORMAPAG.AsInteger);

      sHistorico  := 'Envio de Seguros: ' + FormatDateTime('dd/mm/yyyy', edtDataVencto.Date);
      iPlanilha   := 0;

      EscondeEspera;

      // ----------------------------------------------------------------------------------

      // Inicia uma transação - só se não ouver transação iniciada
      if dtmBaseDados.dbBaseDados.InTransaction then
      begin
         MsgDlg('Transação anterior em progresso!', 'Empréstimo', mtError, [mbOk], 0);
         Repaint;
         Exit;
      end;

      StartTransacao;

      // ----------------------------------------------------------------------------------

      memResult.Clear;

      memResult.Lines.Add('  ');
      memResult.Lines.Add('Nº Contrato     Item  Data Prev. Valor        ');
      memResult.Lines.Add('--------------- ----- ---------- -------------');

      // ----------------------------------------------------------------------------------

      iResult := EnviaLoteSeguro(sSQLEnvio,
                                 sHistorico,
                                 SysDate,
                                 StrToInt(DBcboTipoDoc.LookupValue),
                                 Modulo.iMoedaCorrente,
                                 Modulo.sCentroCusto,
                                 Modulo.iPrograma,
                                 iPlanilha
                                );

      // ----------------------------------------------------------------------------------

      memResult.Lines.Add('  ');

      // ----------------------------------------------------------------------------------

      if iResult = 0 then
      begin
         if dtmBaseDados.dbBaseDados.InTransaction then CommitTransacao;
      end
      else
      begin
         if dtmBaseDados.dbBaseDados.InTransaction then RollbackTransacao;
      end;

   finally
      if dtmBaseDados.dbBaseDados.InTransaction then RollbackTransacao;
   end;
end;



function TfrmExecEnvioLoteSeguro.EnviaLoteSeguro(const sSQL           : String;
                                                 const sHistorico     : String;
                                                 const dDataLanc      : TDateTime;
                                                 const iCodTipoDoc    : Integer;
                                                 const iMoedaCorrente : Integer;
                                                 const sCCusto        : String;
                                                 const iPrograma      : Integer;
                                                 var   iPlanilha      : Integer
                                                ): Integer;
var
   vContaBaixa       : Array of TContaBaixa;
   vHistDocumento    : Array of THistDocumento;

   bAchou            : Boolean;

   dDataVenc         : TDateTime;
   fTotal 				: Currency;

   i, j, k, y, z, x  : Integer;
   iTipoMov          : Integer;
   iFloat            : Integer;

   iTipoDocRec			: Int64;
   iTipoDocPag			: Int64;
   iBanco            : Int64;

   TabelaPDXRateio   : TTable;

   qryItensCAPCAR		: TwwQuery;
   qryLancaRateio    : TwwQuery;

   sSQLRateio        : String;
   sMsgErro          : String;
   sErro             : TStringList;

   rParamAtual       : TParamIntegra;
   rParamAnterior    : TParamIntegra;

   CtrlDocumento     : TCtrlDocumento;
   rLogTotalPrev     : TLogTotalPrev;
begin
   Result := 0;

   sErro := TStringList.Create;

   // incializa a tabela
   TabelaPDXRateio               := nil;

   // cria as queries necessárias
   qryItensCAPCAR                := TwwQuery.Create(Application);
   qryItensCAPCAR.DatabaseName   := 'BaseDados';

   qryLancaRateio                := TwwQuery.Create(Application);
 //Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
 //qryLancaRateio.DatabaseName   := copy(Sistema.TempDir, 1, length(Sistema.TempDir) - 1);
 //qryLancaRateio.DatabaseName   := copy(ftempregra, 1, length(ftempregra) - 1);
   qryLancaRateio.DatabaseName   := ftempregra;
   // ----------------------------------------------------------------------------------------------

   try
      CtrlDocumento := TCtrlDocumento.Create;
      CtrlDocumento.Initialize(dtmBaseDados.dbBaseDados,
                               True,
                               Sistema.ConnectionType,
                               Sistema.ConnectionSide,
                               Sistema.AppRemoteServer,
                               True
                              );

      CtrlDocumento.OpenTransaction := False;

      try
         MostraEspera('Selecionando Itens para Contas a Pagar/Receber...');

         try
            qryItensCAPCAR.SQL.Clear;
            qryItensCAPCAR.SQL.Text := sSQL;
          //Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
          //qryItensCAPCAR.SQL.SaveToFile(Sistema.TempDir + 'EP-ItensEnvioLoteSeguro.txt');
            qryItensCAPCAR.SQL.SaveToFile(ftempregra + '\' + 'EP-ItensEnvioLoteSeguro.txt');
            qryItensCAPCAR.Open;
         except
            on E:Exception do
            begin
               memResult.Lines.Add(' ');
               memResult.Lines.Add('Erro ao tentar selecionar os registros para Envio');
               memResult.Lines.Add(E.Message);
               Result := -1; // ERRO ao abrir
               Exit;
            end;
         end;

      finally
         EscondeEspera;
      end;

      if qryItensCAPCAR.isEmpty then
      begin
         memResult.Lines.Add(' ');
         memResult.Lines.Add('Não há registros para envio');
         Result := -2;  // não há itens
         Exit;
      end;


      // -------------------------------------------------------------------------------------------
      // -------------------------------------------------------------------------------------------

      // Aqui itera-se pela query para verificar se as contas de baixa estão todas preenchidas (nem
      //    seria possível preenchê-las com a filosofia antiga do sistema)

      qryItensCAPCAR.First;
      while not(qryItensCAPCAR.EOF) do
      begin
         if qryItensCAPCAR.FieldByName('CONTABAIXA').IsNull then
         begin
            sMsgErro := 'O item ' + IntToStr(qryItensCAPCAR.FieldByName('IDITEMEMPTMO').AsInteger) + ' do ' +
                        'contrato nº ' + FormatFloat('#0', qryItensCAPCAR.FieldByName('IDCONTRATOEMPTMO').AsFloat) +
                        ' não está com a conta de baixa preenchida. ';

            memResult.Lines.Add(' ');
            memResult.Lines.Add(sMsgErro);
            Result := -10;  // conta de baixa não preenchida
            Exit;
         end;

         qryItensCAPCAR.Next;
      end;

      // -------------------------------------------------------------------------------------------
      // -------------------------------------------------------------------------------------------



      // -------------------------------------------------------------------------------------------
      //    Criação da tabela temporário em Paradox
      // -------------------------------------------------------------------------------------------

      // exclui a tabela Paradox
      if not(IntegraEmptmo.ExcluiTabelaPDX('RATEIOEP.DB', TabelaPDXRateio)) then
      begin
         memResult.Lines.Add(' ');
         memResult.Lines.Add('Erro ao Excluir Tabela Temporária.');
         Result := -5;  // não conseguiu excluir
         Exit;
      end;

      // cria a tabela Paradox
      try
         IntegraEmptmo.CriaTabelaPDX('RATEIOEP.DB', TabelaPDXRateio);
      except
         on E:Exception do
         begin
            memResult.Lines.Add(' ');
            memResult.Lines.Add(E.Message);
            Result := -5;  // não conseguir criar
            Exit;
         end;
      end;

      // define a estrutura da tabela Paradox
      if not(IntegraEmptmo.DefineEstruturaTabelaPDXRateio(TabelaPDXRateio)) then
      begin
         memResult.Lines.Add(' ');
         memResult.Lines.Add('ERRO ao tentar criar tabela para agrupamento');
         Result := -5;  // não conseguir criar
         Exit;
      end;

      // -------------------------------------------------------------------------------------------
      //    FIM Criação da tabela temporário em Paradox
      // -------------------------------------------------------------------------------------------


      // -------------------------------------------------------------------------------------------

      dDataVenc   := edtDataVencto.Date;
      iTipoMov    := 0;

      with dtmEmptmo.qryPortadorForma do
      begin
         LimpaParametros(dtmEmptmo.qryPortadorForma);
         ParamByName('PCODPORTFORMA').AsInteger := StrToInt(DBcboPortadorForma.LookupValue);
         Open;

         if not(dtmEmptmo.qryPortadorForma.IsEmpty) and not(dtmEmptmo.qryPortadorFormaIDBANCO.IsNull) then
         begin
            if iBanco = -1 then iBanco := dtmEmptmo.qryPortadorFormaIDBANCO.AsInteger;
         end
         else
         begin
            Result := -9; // Não foi encontrado banco
            memResult.Lines.Add(' ');
            memResult.Lines.Add('Não foi encontrado Banco associado à Conta de Caixa');
            Exit;
         end;  // if not(dtmEmptmo.qryBancoPortForma.IsEmpty)
      end;  // with dtmEmptmo.qryBancoPortForma

      // -------------------------------------------------------------------------------------------


      // -------------------------------------------------------------------------------------------

      // tendo conseguido, começa a iterar pela query
      with qryItensCAPCAR do
      begin
         First;
         i := 0;

         iBanco := -1;

         frmProgresso.MostraFormProgresso('Enviando Itens para Contas a Pagar...',
                                          True,
                                          True,
                                          True,
                                          i,
                                          qryItensCAPCAR.RecordCount
                                         );

         // guarda os valores do 1º registro para o Documento a a LanctoDocum
         IntegraEmptmo.MontaParamCAPCAR(iTipoMov, iCodTipoDoc, iCodTipoDoc, dDataLanc, dDataVenc, qryItensCAPCAR, iMoedaCorrente, rParamAnterior);

         // passa o banco como Fornecedor para o Documento
         rParamAnterior.iPessoa := qryItensCAPCAR.FieldByName('IDBENEF').AsInteger;

         // ----------------------------------------------------------------------------------------
         //    Vai-se criar um único documento para todos os itens de um contrato que tiverem
         //       o mesmo mês e ano de cobrança.  Cada item corresponderá a um RateioDocum, e haverá
         //       um LanctoDocum com o valor total dos itens.
         // ----------------------------------------------------------------------------------------

         // ----------------------------------------------------------------------------------------
         //    Gravação do Documento
         // ----------------------------------------------------------------------------------------
         // cria o Documento com os dados do registro 'ANTERIOR'.
         // função que insere Cliente/Fornecedor e insere Documento
         if not(IntegraEmptmo.InsereDocumento(rParamAnterior, sErro, CtrlDocumento, sHistorico, True)) then
         begin
            Result := -3;  // ERRO ao inserir Documento
            memResult.Lines.Add(' ');
            memResult.Lines.Add('Erro ao criar Documento');
            Exit;
         end
         else
         begin
            // atribuição do Código do Documento
            rParamAtual.iDocumento := rParamAnterior.iDocumento;
         end;  // if not(InsereDocumento(rParamAnterior, sErro))
         // ----------------------------------------------------------------------------------------
         //    FIM Gravação do Documento
         // ----------------------------------------------------------------------------------------


         // ----------------------------------------------------------------------------------------
         //    Preparação para gravação da RateioDocum
         // ----------------------------------------------------------------------------------------
         fTotal := 0;
         SetLength(vContaBaixa, 0);
         SetLength(vHistDocumento, 0);

         // ----------------------------------------------------------------------------------------

         while not(qryItensCAPCAR.EOF) do
         begin
            inc(i);
            frmProgresso.AndaFormProgresso(i);

            // Verifica se o usuário Cancelou a Operação
            if frmProgresso.Cancelou then
            begin
               memResult.Lines.Add(' ');
               memResult.Lines.Add('Processo interrompido pelo usuário');
               Result := -8;
               Exit;
            end;

            // -------------------------------------------------------------------------------------
            IntegraEmptmo.MontaParamCAPCAR(iTipoMov,
                                           iCodTipoDoc,
                                           iCodTipoDoc,
                                           dDataLanc,
                                           dDataVenc,
                                           qryItensCAPCAR,
                                           iMoedaCorrente,
                                           rParamAtual
                                          );
            // -------------------------------------------------------------------------------------

            fTotal := fTotal + rParamAtual.fVlrLanc;

            IntegraEmptmo.GravaItemPDXRateio(rParamAnterior.iDocumento,
                                             rParamAtual,
                                             TabelaPDXRateio
                                            );

            // -------------------------------------------------------------------------------------

            memResult.Lines.Add(CompletaFim(FormatFloat('#0', qryItensCAPCAR.FieldByName('IDCONTRATOEMPTMO').AsFloat), ' ', 15) +
                                CompletaFim(FormatFloat('#0', qryItensCAPCAR.FieldByName('IDITEMEMPTMO').AsFloat), ' ', 5) +
                                CompletaFim(FormatDateTime('mm/dd/yyyy', qryItensCAPCAR.FieldByName('HMEDATAPREVISTA').AsFloat), ' ', 12) +
                                CompletaInicio(FormatFloat('#,#.00;(#,#.00)', qryItensCAPCAR.FieldByName('HMEVLRPREVISTO').AsFloat), ' ', 13)
                               );

            // -------------------------------------------------------------------------------------

            bAchou := False;
            //Pendência 28219
            x := -1;
            for y := 0 to length(vContaBaixa) - 1 do
            begin
               if (vContaBaixa[y].sConta     = rParamAtual.sCCBaixa) and
                  (vContaBaixa[y].iPatro     = rParamAtual.iPatro) and
                  (vContaBaixa[y].iUnidNegoc = rParamAtual.iUnidNegoc) and
                  (vContaBaixa[y].iPlanoPrev = rParamAtual.iPlanPrevContab) then
               begin
                  vContaBaixa[y].fValor := vContaBaixa[y].fValor + rParamAtual.fVlrLanc;

                  bAchou := True;
                  Break;
               end;
            end;


            //if (y >= (length(vContaBaixa) - 1)) and not(bAchou) then
            if ((x > (length(vContaBaixa))) or (x = -1)) and not(bAchou) then
            begin
               z := length(vContaBaixa) + 1;
               SetLength(vContaBaixa, z);

               vContaBaixa[z - 1].sConta      := rParamAtual.sCCBaixa;
               vContaBaixa[z - 1].fValor      := rParamAtual.fVlrLanc;
               vContaBaixa[z - 1].iPatro      := rParamAtual.iPatro;
               vContaBaixa[z - 1].iUnidNegoc  := rParamAtual.iUnidNegoc;
               vContaBaixa[z - 1].iPlanoPrev  := rParamAtual.iPlanPrevContab;
            end;

            // -------------------------------------------------------------------------------------
            //Fim Pendência 28219
            SetLength(vHistDocumento, i);

            vHistDocumento[i - 1].IDHistMov     := qryItensCAPCAR.FieldByName('IDHISTMOVEMPTMO').AsFloat;
            vHistDocumento[i - 1].CodDocumento  := rParamAtual.iDocumento;

            // -------------------------------------------------------------------------------------

            qryItensCAPCAR.Next;
         end;  // while not(qryItensCAPCAR.EOF)

         // ----------------------------------------------------------------------------------------
         //    FIM Preparação para gravação da RateioDocum
         // ----------------------------------------------------------------------------------------


         // ----------------------------------------------------------------------------------------
         //    Gravação da RateioDocum
         // ----------------------------------------------------------------------------------------

         // cria as queries necessárias
         sSQLRateio :=
         'SELECT '                                             + #13 +
         '  SUM(VALOR) AS VALOR, '                             + #13 +
         '  IDPATRO, IDPLANOPREVCONTAB, '                      + #13 +
         '  UNIDNEGOC, CENTRORESPON, '                         + #13 +
         '  TIPODESEMB, CODDOCUMENTO '                         + #13 +
         'FROM '                                               + #13 +
         '  "RATEIOEP.DB" RATEIOEP '                           + #13 +
         'GROUP BY '                                           + #13 +
         '  IDPATRO, IDPLANOPREVCONTAB, '                      + #13 +
         '  UNIDNEGOC, CENTRORESPON, '                         + #13 +
         '  TIPODESEMB, CODDOCUMENTO '                         + #13;

         qryLancaRateio.Close;
         qryLancaRateio.SQL.Clear;
         qryLancaRateio.SQL.Text := sSQLRateio;

         qryLancaRateio.Open;

         // executa todos os lançamentos
         qryLancaRateio.First;
         while not(qryLancaRateio.EOF) do
         begin
            IntegraEmptmo.MontaParamRateio(qryLancaRateio, rParamAtual);

            // cria o RateioDocum com os dados do registro 'ATUAL'
            // função que faz o Rateio do documento
            if not(IntegraEmptmo.LancaRateio(sCCusto, iPrograma, CtrlDocumento, rParamAtual, sErro)) then
            begin
               Result := -4;  // ERRO no Rateio do Documento
               memResult.Lines.Add(' ');
               memResult.Lines.Add('Erro ao criar Rateio do Documento');
               Exit;
            end;// Lança Rateio

            qryLancaRateio.Next;
         end;

         // ----------------------------------------------------------------------------------------
         //    FIM Gravação da RateioDocum
         // ----------------------------------------------------------------------------------------

         // -------------------------------------------------------------------------------------

         // Lança as contas de baixa no documento
         for y := 0 to length(vContaBaixa) - 1 do
         begin
            CtrlDocumento.CCBaixasXDocum.SetValues(vContaBaixa[y].fValor,        //
                                                   0,                            // liIDCcBaixasXDocum
                                                   Sistema.IDEmpresa,            // liIDPessos
                                                   rParamAnterior.iDocumento,    // liCodDocumento
                                                   vContaBaixa[y].iUnidNegoc,    // liUnidNegoc
                                                   IntegraBack.Plano,            // liPlano
                                                   vContaBaixa[y].iPlanoPrev,    // liIDPlanoPrev
                                                   vContaBaixa[y].iPatro,        // liIDPatro
                                                   -1,                           // liIDSegregaCriter
                                                   vContaBaixa[y].sConta         // sPlaConta
                                                  );
         end;

         // Limpa o vetor de contas
         SetLength(vContaBaixa, 0);

         // -------------------------------------------------------------------------------------

         // ----------------------------------------------------------------------------------------
         //    Gravação da LanctoDocum
         // ----------------------------------------------------------------------------------------

         // cria o LanctoDocum com os dados do registro 'ANTERIOR', mais
         // a totalização de todos os registros 'ATUAIS'
         // função que faz o lançamento na LanctoDocum
         if not(IntegraEmptmo.LancaDocumento(rParamAnterior, fTotal, sHistorico, CtrlDocumento, iPlanilha, sErro, False)) then
         begin
            Result := -6;  // ERRO ao Lançar Documento
            memResult.Lines.Add(' ');
            memResult.Lines.Add('Erro ao criar Lançamento do Documento');
            Exit;
         end;

         // ----------------------------------------------------------------------------------------
         //    FIM Gravação da LanctoDocum
         // ----------------------------------------------------------------------------------------

         // ----------------------------------------------------------------------------------------

         if not(CtrlDocumento.Insert) then
         begin
            memResult.Lines.Add(' ');
            memResult.Lines.Add(CtrlDocumento.MessageInfo);
            Result := -3;  // ERRO ao inserir Documento
            Exit;
         end;

         // ----------------------------------------------------------------------------------------

         for y := 0 to length(vHistDocumento) - 1 do
         begin
            with qryUpdateDocumento do
            begin
               ParamByName('PCODDOCUMENTO').AsInteger    := vHistDocumento[y].CodDocumento;
               ParamByName('PIDHISTMOVEMPTMO').AsFloat   := vHistDocumento[y].IDHistMov;
               ExecSQL;
            end;

            // -------------------------------------------------------------------------------------
            // André Pontes - 19/01/2006 - LogDocumento - OK

            LimpaRegistroLog(rLogTotalPrev);

            rLogTotalPrev.IDModulo   := Sistema.IDModulo;
            rLogTotalPrev.IDContrato := -1;
            rLogTotalPrev.IDHistMov  := vHistDocumento[y].IDHistMov;
            rLogTotalPrev.CodPlanDoc := vHistDocumento[y].CodDocumento;
            rLogTotalPrev.Origem     := -1;
            rLogTotalPrev.Operacao   := 'EnviaLoteSeguro - qryUpdateDocumento';
            rLogTotalPrev.Data       := SysDate;
            rLogTotalPrev.IDUsuario  := Sistema.IDUsuario;
            rLogTotalPrev.Versao     := Sistema.Versao;

            GravaLogTotalPrev(rLogTotalPrev);

            // -------------------------------------------------------------------------------------
         end;

         SetLength(vHistDocumento, 0);

         // ----------------------------------------------------------------------------------------

         memResult.Lines.Add(' ');
         memResult.Lines.Add('Valor do documento: ' + FormatFloat('#,#0.00', fTotal));
         memResult.Lines.Add(' ');

         // ----------------------------------------------------------------------------------------

      end; // with

   finally
      CtrlDocumento.Free;

      frmProgresso.EscondeFormProgresso;
      EscondeEspera;

      sErro.Free;

      qryLancaRateio.Free;
      qryItensCAPCAR.Free;

      if TabelaPDXRateio <> nil then TabelaPDXRateio.Close;
      if TabelaPDXRateio <> nil then TabelaPDXRateio.Free;
   end;
end;



procedure TfrmExecEnvioLoteSeguro.btnContinuarClick(Sender: TObject);
begin
   // ----------------------------------------------------------------------------------------------
    if UFuncoesEmptmo.bBuscaMutuario then
      begin
         MessageBox(handle,'O processo não poderá ser executado.'+#13#10+
                           'O usuário é o próprio mutuário do '+
                           'contrato de empréstimo!','Atenção',MB_ICONWARNING + MB_OK);
         Abort;
      end;

   case pgcControle.ActivePageIndex of

      0: if not(VerificaPreenchimentoFiltro) then Exit;

      1:
      begin
         if not(VerificaPreenchimentoDoc) then Exit;
         Envia;
      end;

   end;


   inherited;

   // ----------------------------------------------------------------------------------------------
end;



procedure TfrmExecEnvioLoteSeguro.AbreQueries;
begin
   ParametrosSistema;

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

   // PortadorForma
   with dtmLookEmptmo.qryLookPortadorFormaP do
   begin
      LimpaParametros(dtmLookEmptmo.qryLookPortadorFormaP);
      ParamByName('PIDPESSOA').AsInteger := Sistema.IDEmpresa;
      Open;
   end;
end;



procedure TfrmExecEnvioLoteSeguro.FormShow(Sender: TObject);
begin
   inherited;

   // limpa a seleção de Contrato
   molContratoEmptmo.btnLimpaContrato.Click;

   edtDataIni.Date   := Date;
   edtDataFim.Date   := Date;

   AbreQueries;

   // Preenche a listbox de patrocinadoras...
   molListaPatro.PreenchePatro;
   // ...e marca todas por default
   molListaPatrobtnMarcaTodosPatroClick(self);

   // Preenche a listbox de Planos...
   molListaPlano.PreenchePlano;
   // ...e marca todos por default
   molListaPlanobtnMarcaTodosPlanoClick(self);

   dtmLookEmptmo.qryLookTipoDocPag.Open;

   // Posiciona as combos nos valores default do sistema
   DBcboTipoDoc.LookupValue         := IntToStr(dtmEmptmo.qryParamEmptmoTIPODOCPAG.AsInteger);
   DBcboPortadorForma.LookupValue   := IntToStr(dtmEmptmo.qryParamEmptmoPORTFORMAPAGTO.AsInteger);
end;



procedure TfrmExecEnvioLoteSeguro.molListaPatrobtnInvertePatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnInvertePatroClick(Sender);
end;



procedure TfrmExecEnvioLoteSeguro.molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnMarcaTodosPatroClick(Sender);
end;



procedure TfrmExecEnvioLoteSeguro.molListaPlanobtnInvertePlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnInvertePlanoClick(Sender);
end;



procedure TfrmExecEnvioLoteSeguro.molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnMarcaTodosPlanoClick(Sender);
end;




procedure TfrmExecEnvioLoteSeguro.molContratoEmptmobtnBuscaContratoClick(Sender: TObject);
begin
   inherited;
   molContratoEmptmo.btnBuscaContratoClick(Sender);
end;



procedure TfrmExecEnvioLoteSeguro.molContratoEmptmobtnLimpaContratoClick(Sender: TObject);
begin
   inherited;
   molContratoEmptmo.btnLimpaContratoClick(Sender);
end;



procedure TfrmExecEnvioLoteSeguro.DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
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



procedure TfrmExecEnvioLoteSeguro.DBcboTipoEmptmoExit(Sender: TObject);
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

procedure TfrmExecEnvioLoteSeguro.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  UFuncoesEmptmo.bBuscaMutuario := false;
end;

end.
