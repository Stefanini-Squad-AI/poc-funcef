{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : SOL 143413 Kintana 938370
Responsável : Fanuel Junior
Data        : 05/11/2010
Descrição   : Bloquear usuario que for mutuario do contrato com a variavel
'bBuscaMutuario'.
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

unit FExecCalculoRepasse;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FWizardMTEP, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
   TB97Tlbr, TB97, fcLabel, ComCtrls, ExtCtrls, mListaPlano, mListaPatro,
   mContratoEmptmo, mMutuario, wwdbdatetimepicker, Db, DBTables, Wwquery,
   Grids, Wwdbigrd, Wwdbgrid;

type
   TfrmCalculoRepasse = class(TfrmWizardMTEP)
      gbxQuitacao: TGroupBox;
      Label5: TLabel;
      edtDataInicial: TwwDBDateTimePicker;
      edtDataFinal: TwwDBDateTimePicker;
      Label3: TLabel;
      qryHistMov: TwwQuery;
      qryHistMovVirtual: TwwQuery;
      dtsHistMovVirtual: TDataSource;
      updHistMovVirtual: TUpdateSQL;
      qryHistMovVirtualIDCONTRATOEMPTMO: TFloatField;
      qryHistMovVirtualBENEFICIARIO: TStringField;
      qryHistMovVirtualREPASSESEGURO: TFloatField;
      qryHistMovVirtualREPASSEBENEF: TFloatField;
      wwDBGrid1: TwwDBGrid;
      qryHistMovIDCONTRATOEMPTMO: TFloatField;
      qryHistMovIDINSCRICAOEMPTMO: TFloatField;
      qryHistMovNOME: TStringField;
      qryHistMovIDBENEFSEGURO: TFloatField;
      qryHistMovPERCINDENIZACAO: TFloatField;
      qryHistMovHMEVLRPREVISTO: TFloatField;
      qryCalculo: TwwQuery;
      qryHistMovVLRCONTRATO: TFloatField;
      qryHistMovDATACREDITO: TDateTimeField;
      qryHistMovHMEDATAPREVISTA: TDateTimeField;
      qryHistMovTXJUROS: TFloatField;
      qryUpdate: TwwQuery;
      qryHistMovVirtualPERCINDENIZACAO: TFloatField;
      molContratoEmptmo: TmolContratoEmptmo;
      molListaPatro: TmolListaPatro;
      molListaPlano: TmolListaPlano;

      procedure FormCreate(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure btnContinuarClick(Sender: TObject);
      procedure bbtnSairClick(Sender: TObject);
      procedure bbtnConfirmarClick(Sender: TObject);
      procedure FormShow(Sender: TObject);
      procedure molListaPatrobtnInvertePatroClick(Sender: TObject);
      procedure molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
      procedure molListaPlanobtnInvertePlanoClick(Sender: TObject);
      procedure molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
      procedure molContratoEmptmobtnBuscaContratoClick(Sender: TObject);


   private  // Private declarations

      sSQLAnt     : String;

      function  VerificaPreenchimento: Boolean;
      function  SelecionaContratos   : Boolean;
      procedure ProcessaContratos;

   public   // Public declarations


   end;



var
   frmCalculoRepasse: TfrmCalculoRepasse;



implementation
{$R *.DFM}
uses
   uMensErro, uFuncoesEmptmo, dEmptmo, FProgresso, DLookEmptmo, uSistema,
   dBaseDados, uVerificaPreenchimento, UCalcEmptmo,
   uDataBase (* Start, Commit, RollBact Transacao *),
   dMS (* GetSaldoDoc *);



procedure TfrmCalculoRepasse.FormCreate(Sender: TObject);
begin
   inherited;

   sSQLAnt := dtmMS.MS_ContratoEmptmo.Filtro.Text;

   dtmMS.MS_ContratoEmptmo.Filtro.Add('CON.FLGSITUACAO IN (''K'',''Q'')');
end;



procedure TfrmCalculoRepasse.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   dtmMS.MS_ContratoEmptmo.Filtro.Text := sSQLAnt;
   UFuncoesEmptmo.bBuscaMutuario := false;
   inherited;
end;



procedure TfrmCalculoRepasse.btnContinuarClick(Sender: TObject);
begin

   if UFuncoesEmptmo.bBuscaMutuario then
      begin
         MessageBox(handle,'O processo não poderá ser executado.'+#13#10+
                           'O usuário é o próprio mutuário do '+
                           'contrato de empréstimo!','Atenção',MB_ICONWARNING + MB_OK);
         Abort;
      end;



   if pgcControle.ActivePageIndex = 0 then
   begin
      qryHistMovVirtual.Close;
      qryHistMovVirtual.Open;

      if VerificaPreenchimento then
      begin
         if SelecionaContratos then
         begin
            // -------------------------------------------------------------------------------------

            // Inicia uma transação - só se não ouver transação iniciada
            if dtmBaseDados.dbBaseDados.InTransaction then
            begin
               MsgDlg('Transação anterior em progresso!', 'Empréstimo', mtError, [mbOk], 0);
               Repaint;
               Exit;
            end;

            StartTransacao;

            // -------------------------------------------------------------------------------------

            ProcessaContratos;
         end;
      end;
   end;

   inherited;
end;



function TfrmCalculoRepasse.VerificaPreenchimento: Boolean;
begin
   Result := False;

   try
      if length(trim(edtDataInicial.Text)) = 0 then
         raise EValidacao.CreateVal('É necessário indicar a Data Inicial!', edtDataInicial);

      if length(trim(edtDataFinal.Text)) = 0 then
         raise EValidacao.CreateVal('É necessário indicar a Data Final!', edtDataFinal);

      if edtDataInicial.Date > edtDataFinal.Date then
         raise EValidacao.CreateVal('A Data Inicial não pode ser posterior à Data Final!!', edtDataFinal);

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



procedure TfrmCalculoRepasse.bbtnSairClick(Sender: TObject);
begin
  if dtmBaseDados.dbBaseDados.InTransaction then RollbackTransacao;

  inherited;
end;



procedure TfrmCalculoRepasse.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;

   try
      if dtmBaseDados.dbBaseDados.InTransaction then CommitTransacao;
   except
      if dtmBaseDados.dbBaseDados.InTransaction then RollbackTransacao;
   end;
end;



function TfrmCalculoRepasse.SelecionaContratos: Boolean;
var
   sSQL : String;
begin
   sSQL :=
   'SELECT '                                                                                    + #13 +
   '   CON.IDCONTRATOEMPTMO, '                                                                  + #13 +
   '   CON.IDINSCRICAOEMPTMO, '                                                                 + #13 +
   '   SOL.HMEVLRPREVISTO AS VLRCONTRATO, '                                                     + #13 +
   '   CON.DATACREDITO, '                                                                       + #13 +
   '   CON.TXJUROS, '                                                                           + #13 +
   '   CXB.NOME, '                                                                              + #13 +
   '   CXB.IDBENEFSEGURO, '                                                                     + #13 +
   '   NVL(CXB.PERCINDENIZACAO,0) AS PERCINDENIZACAO, '                                         + #13 +
   '   HME.HMEDATAPREVISTA, '                                                                   + #13 +
   '   HME.HMEVLRPREVISTO '                                                                     + #13 +

   'FROM '                                                                                      + #13 +
   '   HISTMOVEMPTMO     HME, '                                                                 + #13 +
   '   CONTRATOEMPTMO    CON, '                                                                 + #13 +
   '   CONTRATOXBENEFSEG CXB, '                                                                 + #13 +

   '   ( '                                                                                      + #13 +
   '   SELECT '                                                                                 + #13 +
   '      HME.IDCONTRATOEMPTMO, SUM(HME.HMEVLRPREVISTO) AS HMEVLRPREVISTO '                     + #13 +
   '   FROM '                                                                                   + #13 +
   '      HISTMOVEMPTMO  HME, '                                                                 + #13 +
   '      CONTRATOEMPTMO CON, '                                                                 + #13 +
   '      ITEMXTIPOCONTR ITC '                                                                  + #13 +
   '   WHERE '                                                                                  + #13;

   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '          CON.IDCONTRATOEMPTMO     = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)    + #13;

   sSQL := sSQL +
   '      AND HME.HMETIPOMOV           = 0 '                                                    + #13 +
   '      AND HME.HMETIPOMOV           = 0 '                                                    + #13 +
   '      AND NVL(HME.FLGESTORNADO, 0) = 0 '                                                    + #13 +
   '      AND ITC.ITCEVENTO            = 0 '                                                    + #13 +
   '      AND ITC.ITCTRATASALDODEV     = 2 '                                                    + #13 +
   '      AND ITC.ITCSEQCALCULO        = ( '                                                    + #13 +
   '                                     SELECT '                                               + #13 +
   '                                        MIN(ITE.ITCSEQCALCULO) '                            + #13 +
   '                                     FROM '                                                 + #13 +
   '                                        ITEMXTIPOCONTR ITE '                                + #13 +
   '                                     WHERE '                                                + #13 +
   '                                            ITE.ITCEVENTO         = 0 '                     + #13 +
   '                                        AND ITE.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO ' + #13 +
   '                                     ) '                                                    + #13 +
   '      AND HME.IDCONTRATOEMPTMO     = CON.IDCONTRATOEMPTMO '                                 + #13 +
   '      AND HME.IDITEMEMPTMO         = ITC.IDITEMEMPTMO '                                     + #13 +
   '      AND CON.IDTIPOCONTREMPTMO    = ITC.IDTIPOCONTREMPTMO '                                + #13 +
   '   GROUP BY '                                                                               + #13 +
   '      HME.IDCONTRATOEMPTMO '                                                                + #13 +
   '   ) SOL '                                                                                  + #13 +

   'WHERE '                                                                                     + #13 +
   '       CON.FLGSITUACAO          IN (''K'',''Q'') '                                          + #13 +
   '   AND HME.HMETIPOMOV           = 3 '                                                       + #13 +
   '   AND HME.HMEORIGEM            = 8 '                                                       + #13 +
   '   AND (HME.HMECENTRALIZA       = 1 OR HME.HMEDESTACADO = 1) '                              + #13 +
   '   AND NVL(HME.FLGESTORNADO, 0) = 0 '                                                       + #13 +

   '   AND HME.HMEDATAPREVISTA     >=  TO_DATE(' + QuotedStr(edtDataInicial.Text) + ',''DD/MM/YYYY'') '  + #13 +
   '   AND HME.HMEDATAPREVISTA     <=  TO_DATE(' + QuotedStr(edtDataFinal.Text)   + ',''DD/MM/YYYY'') '  + #13;

   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '   AND CON.IDCONTRATOEMPTMO     = ' + FloatToStr(molContratoEmptmo.IDContrato)              + #13;

   sSQL := sSQL +
   '   AND CON.IDPATRO              IN (' + molListaPatro.PegaPatro + ') '                      + #13 +
   '   AND CON.IDPLANOPREV          IN (' + molListaPlano.PegaPlano + ') '                      + #13 +

   '   AND HME.IDCONTRATOEMPTMO     = CON.IDCONTRATOEMPTMO '                                    + #13 +
   '   AND CON.IDINSCRICAOEMPTMO    = CXB.IDINSCRICAOEMPTMO '                                   + #13 +
   '   AND CON.IDCONTRATOEMPTMO     = SOL.IDCONTRATOEMPTMO '                                    + #13 +

   'ORDER BY '                                                                                  + #13 +
   '   CON.IDINSCRICAOEMPTMO '                                                                  + #13;

   with qryHistMov do
   begin
      Close;
      SQL.Text := sSQL;
    //Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
    //SQL.SaveToFile(Sistema.TempDir + 'EP-ContratosCalculoRepasse.txt');
      SQL.SaveToFile(ftempregra + '\' + 'EP-ContratosCalculoRepasse.txt');
      Open;
      Result := not(IsEmpty);
   end;
end;



procedure TfrmCalculoRepasse.ProcessaContratos;
var
   fSaldoAtualizado     : Currency;
   fValorSeguro         : Currency;
   sResultado           : String;
   sSQL                 : String;

   iContador            : Integer;
   iPais                : Integer;
   iCidade              : Integer;
   iEstado              : Integer;
   sUF                  : String;

   iIdInscricaoEmptmo   : Int64;
begin
   ParametrosSistema;

   iPais    := dtmEmptmo.qryParamEmptmoIDPAIS.AsInteger;
   iCidade  := dtmEmptmo.qryParamEmptmoIDCIDADES.AsInteger;
   iEstado  := dtmEmptmo.qryParamEmptmoIDESTADO.AsInteger;
   sUF      := dtmEmptmo.qryParamEmptmoCODESTADO.AsString;

   frmProgresso.MostraFormProgresso('Calculando Repasse...',
                                    False,
                                    False,
                                    True,
                                    0,
                                    qryHistMov.RecordCount
                                   );

   iContador := 0;

   qryHistMov.First;
   while not(qryHistMov.EOF) do
   begin
      sSQL :=
      'SELECT '                                                                                                      + #13 +
      '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', qryHistMovDATACREDITO.AsDateTime))       + ' AS DATASOLIC, '     + #13 +
      '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', qryHistMovHMEDATAPREVISTA.AsDateTime))   + ' AS DATAEVENTO, '    + #13 +
      '  ' + NumeroIngles(qryHistMovTXJUROS.AsFloat)                                         + ' AS TXJUROS, '       + #13 +
      '  ' + NumeroIngles(qryHistMovVLRCONTRATO.AsCurrency)                                  + ' AS VALORSOLIC, '    + #13 +
      '  ' + IntToStr(iPais)                                                                 + ' AS IDPAIS, '        + #13 +
      '  ' + IntToStr(iCidade)                                                               + ' AS IDCIDADES, '     + #13 +
      '  ' + IntToStr(iEstado)                                                               + ' AS IDESTADO, '      + #13 +
      '  ' + QuotedStr(sUF)                                                                  + ' AS CODESTADO '      + #13 +
      'FROM DUAL '                                                                                                   + #13;

      iIdInscricaoEmptmo := qryHistMovIDINSCRICAOEMPTMO.AsInteger;

      if UtilizaRegraValor(dtmEmptmo.qryParamEmptmoIDREGRADEVSEG.AsInteger,
                           sSQL,
                           'e Atualização de Saldo para Quitação por Falecimento',
                           sResultado,
                           False
                          ) then
      begin
         if (sResultado <> '') and (sResultado <> 'NULO') then
         begin
            fSaldoAtualizado := StrToFloat(ConverteVirg(sResultado));

            while (iIdInscricaoEmptmo = qryHistMovIDINSCRICAOEMPTMO.AsInteger) and
                  not(qryHistMov.EOF) do
            begin
               fValorSeguro     := (fSaldoAtualizado - qryHistMovHMEVLRPREVISTO.AsCurrency) * (qryHistMovPERCINDENIZACAO.AsFloat / 100);

               LimpaParametros(qryUpdate);
               qryUpdate.ParamByName('PVLRSALDOREC').AsCurrency      := fSaldoAtualizado - qryHistMovHMEVLRPREVISTO.AsCurrency;
               qryUpdate.ParamByName('PVLRREPASSE').AsCurrency       := fValorSeguro;
               qryUpdate.ParamByName('PIDINSCRICAOEMPTMO').AsFloat   := qryHistMovIDINSCRICAOEMPTMO.AsFloat;
               qryUpdate.ParamByName('PIDBENEFSEGURO').AsFloat       := qryHistMovIDBENEFSEGURO.AsFloat;
               qryUpdate.ExecSQL;

               with qryHistMovVirtual do
               begin
                  Insert;
                  FieldByName('IDCONTRATOEMPTMO').AsFloat   := qryHistMovIDCONTRATOEMPTMO.AsFloat;
                  FieldByName('BENEFICIARIO').AsString      := qryHistMovNOME.AsString;
                  FieldByName('PERCINDENIZACAO').AsFloat    := qryHistMovPERCINDENIZACAO.AsFloat;
                  FieldByName('REPASSESEGURO').AsCurrency   := fSaldoAtualizado - qryHistMovHMEVLRPREVISTO.AsCurrency;
                  FieldByName('REPASSEBENEF').AsCurrency    := fValorSeguro;
                  Post;
               end;

               qryHistMov.Next;
            end;
         end;
      end
      else
      begin
         qryHistMov.Next;
      end;

      inc(iContador);
      frmProgresso.AndaFormProgresso(iContador);
   end;

   qryHistMov.Close;
   frmProgresso.EscondeFormProgresso;
end;



procedure TfrmCalculoRepasse.FormShow(Sender: TObject);
begin
   inherited;

   // limpa a seleção de Contrato
   molContratoEmptmo.btnLimpaContrato.Click;

   // Preenche a listbox de patrocinadoras...
   molListaPatro.PreenchePatro;
   // ...e marca todas por default
   molListaPatrobtnMarcaTodosPatroClick(self);

   // Preenche a listbox de Planos...
   molListaPlano.PreenchePlano;
   // ...e marca todos por default
   molListaPlanobtnMarcaTodosPlanoClick(self);
end;



procedure TfrmCalculoRepasse.molListaPatrobtnInvertePatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnInvertePatroClick(Sender);
end;



procedure TfrmCalculoRepasse.molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnMarcaTodosPatroClick(Sender);
end;



procedure TfrmCalculoRepasse.molListaPlanobtnInvertePlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnInvertePlanoClick(Sender);
end;



procedure TfrmCalculoRepasse.molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnMarcaTodosPlanoClick(Sender);
end;



procedure TfrmCalculoRepasse.molContratoEmptmobtnBuscaContratoClick(Sender: TObject);
begin
   inherited;

   molContratoEmptmo.Filtro := 'AND CON.FLGSITUACAO IN (''K'', ''Q'')';
   molContratoEmptmo.btnBuscaContratoClick(Sender);
end;



end.
