{-------------------------------------------------------------------------------
//***************************************************************************************
//Rotina.............: <Nome da função ou procedimento alterado>
//N. SIG.............: 94625
//Data da Alteração..: 20/12/2019
//Alteração Form.....: FExecAlteraContrato
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Adequações para o gerenciamento das autorizações de débito 
                       automático em conta, via SIACC
//***************************************************************************************
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
Pendência   : SOL 137562 KINTANA 833159
Responsável : Vinicius Ferreira
Data        : 25/08/2010
Descrição   : criar funcionalidade no módulo de empréstimo para gravar
              histórico das alterações de conta bancária
              (nome usuário, data alteração, dados bancários).
--------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
Pendência   : SOL 142594 KTN 912858
Responsável : Ádler Souza
Data        : 25/08/2010
Descrição   : Não exibir suspensão que não seja apenas de concessão na tela de
              Inscrição / Concessão / Renovação
--------------------------------------------------------------------------------
Rotina      : Qry e MontaSelect
Pendência   : Sol 121125 Kintana 579142
Responsável : Renato Visoni
Data        : 23/06/2009
Descrição   : Alterar o filtro AND PPP.FLGDESATIVADO = 0
para AND (PPP.FLGDESATIVADO = 0 OR (PPP.FLGDESATIVADO = 1 AND NOT EXISTS
(SELECT 1 FROM partprevplan ppp1 WHERE ppp1.idpessoa = ppp.idpessoa AND ppp1.flgdesativado = 0)
AND (ppp.idsitplanoprev = 25 OR (ppp.idsitplanoprev <> 25 AND ppp.datacancelamento = (SELECT MAX(ppp1.datacancelamento)
FROM partprevplan ppp1 WHERE ppp1.idpessoa = ppp.idpessoa) AND NOT EXISTS (SELECT 1 FROM partprevplan ppp1 WHERE ppp1.idpessoa = ppp.idpessoa
AND ppp1.idsitplanoprev = 25)))))
--------------------------------------------------------------------------------
Rotina      : AtualizaVariave e SalvaLog
Pendência   : Sol 99961 Kintana 441109
Responsável : Renato Visoni
Data        : 03/11/2008
Descrição   : Na gravação do log a coluna descrição deve conter o tipo de operação realizada
              conforme abaixo: 1) Alteração da forma de cobrança; 2) Alteração de conta bancária para débito;
              3) Alteração de Conta-Caixa x Forma Recebimento; 4) Alteração de Beneficiário do Seguro.
--------------------------------------------------------------------------------
Rotina      : bbtnConfirmarClick
Pendência   : Sol 99494 Kintana 437153
Responsável : Renato Visoni
Data        : 27/10/2008
Descrição   : O sistema não estava gravando o Log de alterações Contratuais.
--------------------------------------------------------------------------------
Pendência   : 27370
Responsável : Daniel Simões
Data        : 11/02/2008
Descrição   : Alteração/Implementação do número do Help Context...
--------------------------------------------------------------------------------
Rotina    : sbtnProcurarClick
Data      : 06/08/2007
Autor     : Marchetti
Pendencia : 26031
Descrição : Ajuste na habilitação dos botões apos procurar um contrato.
--------------------------------------------------------------------------------
Rotina    : AlteraParcelas
Data      : 17/10/2002
Autor     : André Pontes
Descrição : Na alteração da forma de cobrança, todas as parcelas em aberto não
            enviadas passam a ter o HMEFORMACOBRANCA alterado de acordo.
--------------------------------------------------------------------------------
Rotina    : qry
Data      : 17/10/2002
Autor     : André Pontes
Descrição : Colocado ALTER JOIN na query de Contrato (tabela INSCRICAO)
--------------------------------------------------------------------------------
Rotina    : -
Data      : 01/10/2002
Autor     : Marchetti
Descrição : Colocado as críticas dos beneficiários de seguro, nos mesmos moldes
            da Inscrição.
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit FExecAlteraContrato;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FCadastroCS, Db, CmEventosCadastro, ImgList, Wwdatsrc, MontaSelect,
   DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, StdCtrls,
   Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, Grids, DBGrids, DBCtrls,
   wwdblook, wwdbdatetimepicker, CMDateTimePicker, ComCtrls, Mask, fcLabel,
   FCadastroCSImob, Wwdbigrd, Wwdbgrid, FTelaAut, Menus, wwdbedit, Wwdbspin,
   Wwdotdot, Wwdbcomb, uCMTypes;

type
   TfrmExecAlteraContrato = class(TfrmCadastroCSImob)
      dsBanco: TDataSource;
      Label27: TLabel;
      Label29: TLabel;
      Label42: TLabel;
      Label8: TLabel;
      Label4: TLabel;
      Label34: TLabel;
      Label41: TLabel;
      Label18: TLabel;
      DBedtCodInsc: TDBEdit;
      DBedtPlanoPrev: TDBEdit;
      DBedtSituacao: TDBEdit;
      DBedtParticipante: TDBEdit;
      DBedtNumContrato: TDBEdit;
      DBedtPatro: TDBEdit;
      DBedtInscricao: TDBEdit;
      DBedtMtrEmpresa: TDBEdit;
      DBedtSitPart: TDBEdit;
      pgcAltContrato: TPageControl;
      tbsInformacoes: TTabSheet;
      Label43: TLabel;
      Label12: TLabel;
      Label17: TLabel;
      Label1: TLabel;
      Label13: TLabel;
      Label14: TLabel;
      DBedtDataInsc: TCMDateTimePicker;
      DBedtDataCredito: TCMDateTimePicker;
      DBedtValSolic: TDBEdit;
      DBedtBeneficiario: TDBEdit;
      DBedtTipoContrato: TDBEdit;
      DBedtTipoEmptmo: TDBEdit;
      tbsAlteraContrato: TTabSheet;
      qryContrato: TwwQuery;
      qryContratoFLGFORMAREC: TStringField;
      qryContratoPORTFORMAREC: TFloatField;
      qryAlteraContrato: TwwQuery;
      qryContratoIDCONTRATOEMPTMO: TFloatField;
      TabSheet1: TTabSheet;
      Dock974: TDock97;
      Toolbar972: TToolbar97;
      sbtnInsereBenef: TToolbarButton97;
      sbtnAlteraBenef: TToolbarButton97;
      sbtnExcluiBenef: TToolbarButton97;
      sbtnNovoBenef: TToolbarButton97;
      dbEdtPercIndeniz: TDBEdit;
      Label36: TLabel;
      wwDBGrid1: TwwDBGrid;
      qryBenefSeguro: TwwQuery;
      qryBenefSeguroNOME: TStringField;
      qryBenefSeguroPERCINDENIZACAO: TFloatField;
      qryBenefSeguroIDBENEFSEGURO: TFloatField;
      dsBenefSeguro: TDataSource;
      updBenefSeguro: TUpdateSQL;
      bbtnOkDetBenef: TBitBtn;
      bbtnCancelarDetBenef: TBitBtn;
      pnlIntegracao: TPanel;
      Label7: TLabel;
      pnlCAR: TPanel;
      Label30: TLabel;
      Bevel1: TBevel;
      DBcboFormaRecebimento: TwwDBLookupCombo;
      DBrdgDebito: TDBRadioGroup;
      DBgBanco: TDBGrid;
    DBcboContaBancDeb: TwwDBLookupCombo;
      qryAlteraParcelas: TwwQuery;
      qryContratoIDCBANCARIADEB: TFloatField;
      Label11: TLabel;
    DBPARCECOBRANCA: TwwDBSpinEdit;
      qryBenefSeguroIDINSCRICAOEMPTMO: TFloatField;
      qryBenefSeguroNUMBANCO: TFloatField;
      qryBenefSeguroCODAGENCIA: TStringField;
      qryBenefSeguroCONTACORRENTE: TStringField;
      Label2: TLabel;
      DBEdit1: TDBEdit;
      DBEdit2: TDBEdit;
      DBEdit3: TDBEdit;
      Label3: TLabel;
      Label5: TLabel;
      qryIDINSCRICAOEMPTMO: TFloatField;
      qryDATAINSC: TDateTimeField;
      qryIDCONTRATOEMPTMO: TFloatField;
      qryIDPESSOA: TFloatField;
      qryIDBENEF: TFloatField;
      qryDATACREDITO: TDateTimeField;
      qryVLRCONTRATO: TFloatField;
      qryFLGFORMAPAG: TStringField;
      qryFLGFORMAREC: TStringField;
      qryPORTFORMAPAG: TFloatField;
      qryPORTFORMAREC: TFloatField;
      qryIDCBANCARIADEB: TFloatField;
      qryDESCSITCONTRATO: TStringField;
      qryIDTIPOSUSPEMPTMO: TFloatField;
      qryDATAINICIOSUSP: TDateTimeField;
      qryDATAFIMSUSP: TDateTimeField;
      qryDATALIBSUSP: TDateTimeField;
      qryHORALIBSUSP: TStringField;
      qryUSUARIOLIBSUSP: TStringField;
      qryIDTIPOCONTREMPTMO: TFloatField;
      qryFLGSUSPENSAOAUTO: TFloatField;
      qryANOSUSPENSAO: TFloatField;
      qryMESSUSPENSAO: TFloatField;
      qryNUMPARCDESCONTO: TFloatField;
      qryINSCRICAONUMERO: TFloatField;
      qrySITUACAO: TStringField;
      qryPLANOPREV: TStringField;
      qryPATRO: TStringField;
      qryMATRICULA: TStringField;
      qryTITULAR: TStringField;
      qryBENEFICIARIO: TStringField;
      qryTCEDESCRICAO: TStringField;
      qryDESCTIPOEMPTMO: TStringField;
      qryBANCO: TStringField;
      qryCONTACORRENTE: TStringField;
      qryNUMAGENCIA: TStringField;
      qryFLGOBRIGBENEF: TFloatField;
      qryBenefSeguroOBS: TStringField;
    wwDBGrid2: TwwDBGrid;
    Label6: TLabel;
    qryHistAltContratuais: TwwQuery;
    dsHistAltContratuais: TDataSource;
      procedure CmeCadastroEdit(Sender: TObject);
      procedure FormShow(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure CmeCadastroConfirma(Sender: TObject);
      procedure DBrdgDebitoChange(Sender: TObject);
      procedure CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
      procedure qryAfterOpen(DataSet: TDataSet);
      procedure sbtnExcluiBenefClick(Sender: TObject);
      procedure sbtnNovoBenefClick(Sender: TObject);
      procedure sbtnInsereBenefClick(Sender: TObject);
      procedure sbtnAlteraBenefClick(Sender: TObject);
      procedure bbtnConfirmarClick(Sender: TObject);
      procedure bbtnOkDetBenefClick(Sender: TObject);
      procedure bbtnCancelarDetBenefClick(Sender: TObject);
      procedure dsBenefSeguroStateChange(Sender: TObject);
      procedure bbtnCancelarClick(Sender: TObject);
      procedure sbtnProcurarClick(Sender: TObject);
      procedure sbtnAlterarClick(Sender: TObject);



   private  // Private declarations

      sTipo : String;

      (* Procedure que abre as queries utilizadas para buscar a Conta Bancária *)
      procedure AbreQueriesBanco;

      (* Procedure que abre as queries utilizadas quando o Débito do Empréstimo será pelo CAR *)
      procedure AbreQueriesDebito;

      (* Seleciona Contrato *)
      procedure Sel(i: Extended);

      (* Cria Log na tabela de ALteraContrato *)
      function AlteraContrato : Boolean;

      (* Verifica se e necessario alterar o contrato e seleciona Tipo de Alteracao*)
      function ValidaAlteracao(const idContrato : Extended; idCBancaria, iPortFormaRec: Int64; const sFormaRec: String): Boolean;

      // Altera a forma de cobrança de todas as parcelas em aberto e não enviadas
      procedure AlteraParcelas;

      function  VerificaBeneficiario : Integer;

      function  CriticaPercentuaisBeneficiarios : Boolean;

      //Renato SOL 99961 Kintana 441109
      Procedure SalvaLog();
      Procedure AtualizaVariavel();
      //Fim


   public   // Public declarations
     //Renato Visoni SOL 99961 Kintana 441109
     IDCBANCARIADEB,PORTFORMAREC,FlgFormaRec : String ;
     NumParcDesconto,iBeneficiarios: Integer;
     bIncluir,bExcluir : Boolean;
     //Fim
   end;



var
  frmExecAlteraContrato: TfrmExecAlteraContrato;



implementation
{$R *.DFM}
uses
   dMS, DLookEmptmo, dEmptmo,
   FExecBuscaContrato,
   UDatabase,
   DBaseDados,
   USistema,
   UMensErro,
   UFuncoesEmptmo,
   UDiasUteis,
   UCalcEmptmo,
   UTypesEmptmo, FCadBenefSeguro;



procedure TfrmExecAlteraContrato.AbreQueriesBanco;
begin
   dtmLookEmptmo.qryLookDadosBancarios.Close;
   LimpaParametros(dtmLookEmptmo.qryLookDadosBancarios);
   dtmLookEmptmo.qryLookDadosBancarios.ParamByName('PIDPESSOA').AsInteger := qryIDBENEF.AsInteger;
   dtmLookEmptmo.qryLookDadosBancarios.Open;
end;



procedure TfrmExecAlteraContrato.AbreQueriesDebito;
begin
   dtmLookEmptmo.qryLookPortadorFormaR.Close;
   LimpaParametros(dtmLookEmptmo.qryLookPortadorFormaR);
   dtmLookEmptmo.qryLookPortadorFormaR.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
   dtmLookEmptmo.qryLookPortadorFormaR.Open;
end;



procedure TfrmExecAlteraContrato.Sel(i: Extended);
begin
   (* abre a query principal com os parâmetros passados *)
   (* Procedure da unit UFuncoesEmptmo que fecha a query e limpa todos os parâmetros *)
   LimpaParametros(qry);
   qry.ParamByName('PIDCONTRATOEMPTMO').AsFloat := i;
   qry.Open;
end;



procedure TfrmExecAlteraContrato.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   UFuncoesEmptmo.bBuscaMutuario := false;
   if (qryBenefSeguro.Active) and (qryBenefSeguro.UpdatesPending) then
   begin
      qryBenefSeguro.RevertRecord;
      qryBenefSeguro.CancelUpdates;
   end;

   inherited;
end;



procedure TfrmExecAlteraContrato.CmeCadastroEdit(Sender: TObject);
begin
   if qryDESCSITCONTRATO.AsString <> 'Quitado' then
   begin
      inherited;

      pgcAltContrato.ActivePage := tbsAlteraContrato;
      if DBrdgDebito.CanFocus then DBrdgDebito.SetFocus;
   end
   else
   begin
      MsgDlg('Contrato QUITADO NÃO pode ser Alterado.', 'Empréstimo', mtError, [mbOk], 0);
      bbtnCancelarClick(Self);
      Exit;
   end;
end;



procedure TfrmExecAlteraContrato.FormShow(Sender: TObject);
begin
   inherited;

   ParametrosSistema;

   Sel(-1);

   pgcAltContrato.ActivePage := tbsInformacoes;
end;



(* Verifica se e necessario Alterar, se necessario, retorna o tipo da alteração *)
function TfrmExecAlteraContrato.ValidaAlteracao(const idContrato : Extended; idCBancaria, iPortFormaRec : Int64; const sFormaRec: String) : Boolean;
begin
   Result := False;
   sTipo  := '';

   qryContrato.Close;
   qryContrato.ParamByName('PIDCONTRATOEMPTMO').AsFloat := idContrato;
   qryContrato.Open;

   if not(qryContrato.IsEmpty) then
   begin
      if qryContratoPORTFORMAREC.AsInteger <> iPortFormaRec    then sTipo := 'P';
      if qryContratoIDCBANCARIADEB.AsInteger <> idCBancaria    then sTipo := 'C';
      if qryContratoFLGFORMAREC.AsString <> sFormaRec          then sTipo := 'F';

      if sTipo <> '' then Result := True;
   end;
end;




function TfrmExecAlteraContrato.AlteraContrato: Boolean;
var
   rLogTotalPrev : TLogTotalPrev;
begin
   qryAlteraContrato.Close;
   qryAlteraContrato.ParamByName('PDATA').AsDateTime            := Now;
   qryAlteraContrato.ParamByName('PIDCONTRATOEMPTMO').AsFloat   := qryContratoIDCONTRATOEMPTMO.AsFloat;
   qryAlteraContrato.ParamByName('PIDUSUARIO').AsInteger        := Sistema.IdUsuario;
   qryAlteraContrato.ParamByName('PTIPO').AsString              := sTipo;
   qryAlteraContrato.ParamByName('PIDCBANCARIA').AsInteger      := dtmLookEmptmo.qryLookDadosBancariosIDCBANCARIA.AsInteger;
   qryAlteraContrato.ParamByName('PFLGFORMAREC').AsString       := qryContratoFLGFORMAREC.AsString;

   if not(qryContratoPORTFORMAREC.IsNull) then
   begin
      qryAlteraContrato.ParamByName('PPORTFORMAREC').AsInteger  := qryContratoPORTFORMAREC.AsInteger
   end
   else
   begin
      qryAlteraContrato.ParamByName('PPORTFORMAREC').Clear;
   end;

   try
      qryAlteraContrato.ExecSQL;

      // ----------------------------------------------------------------------------------------

      LimpaRegistroLog(rLogTotalPrev);

      rLogTotalPrev.IDModulo   := Sistema.IDModulo;
      rLogTotalPrev.IDContrato := qryContratoIDCONTRATOEMPTMO.AsFloat;
      rLogTotalPrev.IDHistMov  := -1;
      rLogTotalPrev.Origem     := 17;
      rLogTotalPrev.Operacao   := 'Alteração de Beneficiário do Seguro';
      rLogTotalPrev.Data       := SysDate;
      rLogTotalPrev.IDUsuario  := Sistema.IdUsuario;
      rLogTotalPrev.Versao     := Sistema.Versao;

      GravaLogTotalPrev(rLogTotalPrev);

      // ----------------------------------------------------------------------------------------

      Result := True;
   except
      Result := False;
   end;
end;



procedure TfrmExecAlteraContrato.CmeCadastroConfirma(Sender: TObject);
begin
   if qry.State = dsEdit then
   begin
      qryIDCBANCARIADEB.AsInteger := dtmLookEmptmo.qryLookDadosBancariosIDCBANCARIA.AsInteger;

      AplicaAlteracoes([qry]);
      AlteraContrato;

      if sTipo = 'F' then AlteraParcelas;

      MsgDlg('Processo finalizado. Contrato Alterado.', 'Empréstimo', mtInformation, [mbOk], 0)
   end;

   inherited;
end;



procedure TfrmExecAlteraContrato.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
begin
   // inherited;

   Accept := ValidaAlteracao(qryIDCONTRATOEMPTMO.AsFloat,
                             qryIDCBANCARIADEB.AsInteger,
                             qryPORTFORMAREC.AsInteger,
                             qryFLGFORMAREC.AsString
                             );
end;



procedure TfrmExecAlteraContrato.DBrdgDebitoChange(Sender: TObject);
begin
   inherited;

   (* Verifica a Forma de Débito do Empréstimo: Contas a Receber ou Folha de Pagamento
      colocando o painel pnlCAR visível ou não *)

   if DBrdgDebito.ItemIndex = 0 then
   begin
      if qry.State = dsEdit then
      begin
         qryPORTFORMAREC.AsInteger  := dtmLookEmptmo.qryLookPortadorFormaRCODPORTFORMA.AsInteger;
         DBcboFormaRecebimento.Text := dtmLookEmptmo.qryLookPortadorFormaRDESCRICAO.AsString;
      end;

      AtualizaConjunto(True, pnlCAR);
   end
   else
   begin

      AtualizaConjunto(False, pnlCAR, False);
   end;
end;



procedure TfrmExecAlteraContrato.qryAfterOpen(DataSet: TDataSet);
begin
   inherited;

   LimpaParametros(qryBenefSeguro);
   qryBenefSeguro.ParamByName('IDINSCRICAOEMPTMO').AsFloat := qryIDINSCRICAOEMPTMO.AsFloat;
   qryBenefSeguro.Open;
end;



procedure TfrmExecAlteraContrato.sbtnNovoBenefClick(Sender: TObject);
var
   iTotal : Real;
   rLogTotalPrev : TLogTotalPrev;
begin
   inherited;

   sbtnNovoBenef.Down := False;

   iTotal := 0;

   Application.CreateForm(TfrmCadBenefSeguro, frmCadBenefSeguro);

   frmCadBenefSeguro.TipoOperacao      := toInclui;
   frmCadBenefSeguro.IDTitular         := qryIDPESSOA.AsInteger;
   frmCadBenefSeguro.IDMutuario        := qryIDBENEF.AsInteger;
   frmCadBenefSeguro.NomeMutuario      := DBedtBeneficiario.Text;
   frmCadBenefSeguro.IDInscricaoEmptmo := qryIDINSCRICAOEMPTMO.AsFloat;
   frmCadBenefSeguro.ShowModal;

   qryBenefSeguro.First;
   while not(qryBenefSeguro.EOF) do
   begin
      iTotal := iTotal + qryBenefSeguroPERCINDENIZACAO.AsFloat;

      if qryBenefSeguroNOME.AsString = frmCadBenefSeguro.NomeBeneficiario then
      begin
         MsgDlg('Beneficiário já cadastrado para essa inscrição', 'Empréstimo', mtWarning, [mbOk], 0);
         Exit;
      end;

      if (iTotal + frmCadBenefSeguro.Percentual) > 100 then
      begin
         MsgDlg('Total de Percentual ultrapassa os 100%', 'Empréstimo', mtWarning, [mbOk], 0);
         Exit;
      end;

      qryBenefSeguro.Next;
   end;

   if frmCadBenefSeguro.IDBenefSeguro <> 0 then begin
     qryBenefSeguro.Insert;
     qryBenefSeguroIDINSCRICAOEMPTMO.AsFloat   := qryIDInscricaoEmptmo.AsFloat;
     qryBenefSeguroIDBENEFSEGURO.AsInteger     := frmCadBenefSeguro.IDBenefSeguro;
     qryBenefSeguroNOME.AsString               := frmCadBenefSeguro.NomeBeneficiario;
     qryBenefSeguroPERCINDENIZACAO.AsFloat     := frmCadBenefSeguro.Percentual;
     qryBenefSeguroNUMBANCO.AsFloat            := frmCadBenefSeguro.CodBanco;
     qryBenefSeguroCODAGENCIA.AsString         := frmCadBenefSeguro.Agencia;
     qryBenefSeguroCONTACORRENTE.ASString      := frmCadBenefSeguro.ContaCorrente;
     qryBenefSeguroOBS.AsString                := frmCadBenefSeguro.Observacao;
     qryBenefSeguro.Post;

     //Renato Visoni SOL 99961 Kintana 441109
     bIncluir := True;
     //Fim

   end;

   Repaint;
   Application.ProcessMessages;

end;



procedure TfrmExecAlteraContrato.sbtnInsereBenefClick(Sender: TObject);
begin
   inherited;

   dtmMS.MS_Beneficiario.Executar;

   if dtmMS.MS_Beneficiario.RetornouValor then
   begin
      Repaint;

      qryBenefSeguro.Insert;
      qryBenefSeguroIDINSCRICAOEMPTMO.AsFloat   := qryIDINSCRICAOEMPTMO.AsFloat;
      qryBenefSeguroIDBENEFSEGURO.AsInteger     := StrToInt(dtmMS.MS_Beneficiario.ValoresChave[0]);
      qryBenefSeguroNOME.AsString               := dtmMS.MS_Beneficiario.ValoresChave[1];
      qryBenefSeguroPERCINDENIZACAO.AsFloat     := 0;

      dbEdtPercIndeniz.SetFocus;
   end;
end;



procedure TfrmExecAlteraContrato.sbtnAlteraBenefClick(Sender: TObject);
begin
   inherited;

   qryBenefSeguro.Edit;
   dbEdtPercIndeniz.SetFocus;
end;



procedure TfrmExecAlteraContrato.sbtnExcluiBenefClick(Sender: TObject);
var rLogTotalPrev : TLogTotalPrev;
begin
   inherited;

   if MsgDlg('Confirma a exclusão deste Beneficiário?', 'Empréstimo', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
   begin
      qryBenefSeguro.Delete;
      //Renato Visoni SOL 99961 Kintana 441109
      bExcluir := True;
      //Fim
   end;

   sbtnExcluiBenef.Down := False;
end;



procedure TfrmExecAlteraContrato.bbtnConfirmarClick(Sender: TObject);
var
   qryHstAltContrEmptmo : TwwQuery;
   qryCadContaBancariaDebAuto: TwwQuery;
   sMsg: String;
   iTipoSQL: Integer;
   sTipoSituacao: string;
   sSQL: string;

begin
   // ----------------------------------------------------------------------------------------------
   iTipoSQL := 0;
   sTipoSituacao:= EmptyStr;
   //if UFuncoesEmptmo.bBuscaMutuario then
   // begin
   //    MessageBox(handle,'O processo não poderá ser executado.'+#13#10+
   //                      'O usuário é o próprio mutuário do '+
   //                      'contrato de empréstimo!','Atenção',MB_ICONWARNING + MB_OK);
   //    Abort;
   // end;

   sMsg :=  'Atenção:' + #13 + #13 +
            'Apenas os Itens EM ABERTO e NÃO ENVIADOS serão alterados para refletir a nova ' +
            'forma de cobrança do Contrato.' + #13 + #13 +
            'Se for necessário alterar a forma de cobrança de TODOS os Itens em aberto, ' +
            'é necessário desfazer o envio desses itens ANTES de fazer a alteração contratual. ' + #13 + #10 + '' + #13 + #10 +
            'Deseja prosseguir, alterando APENAS os itens não enviados?';

   if MsgDlg(sMsg, 'Empréstimo', mtWarning, [mbYes, mbNo], 0) = mrNo then
   begin
      Repaint;
      Exit;
   end;
   Repaint;

   // ----------------------------------------------------------------------------------------------

   //Vinicius Ferreira SOL 137562 KINTANA 833159
   if (DBcboContaBancDeb.LookupValue <> IDCBANCARIADEB) then begin

     //Cássio Rovaroto - SIG nº 94625 - Início
     //Verificação do status da conta
     if (dtmLookEmptmo.qryLookDadosBancarios.FieldByName('STATUS').asString <> 'AT') then
     begin
      if (dtmLookEmptmo.qryLookDadosBancarios.FieldByName('STATUS').IsNull) then
      begin
        sMsg := 'A conta bancária selecionada não possui autorização para débito. ' + #13 +
                'Será encaminhada uma solicitação de inclusão da conta para débito automático. ';
        iTipoSQL := 1; //INSERT
        sTipoSituacao := 'SL';
      end
      else
      begin
        if (dtmLookEmptmo.qryLookDadosBancarios.FieldByName('STATUS').asString = 'CA') or
           (dtmLookEmptmo.qryLookDadosBancarios.FieldByName('STATUS').asString = 'RJ') then
        begin
          sMsg := 'A conta bancária selecionada desautorizada para débito. ' + #13 +
                  'Será encaminhada uma solicitação de inclusão da conta para débito automático. ';
          iTipoSQL := 2; //UPDATE
          sTipoSituacao := 'SL';
        end
        else
          sMsg := 'A conta bancária selecionada está em trâmite de autorização para débito. ' + #13 +
                  'O débito em conta será somente após a autorização do participante. ';
      end;

      MsgDlg(sMsg, 'Empréstimo', mtInformation, [mbOk], 0);

      case iTipoSQL of
        1: sSQL := 'INSERT INTO CORE_CADASTRO.CONTA_BANCARIA_DEBITO_AUTO ' +
                   '(ID_CONTA_BANCARIA_DEBITO_AUTO, ID_CONTA_BANCARIA, ID_PORTADOR_FORMA, ' +
                   'CO_SITUACAO_DEBITO_AUTOMATICO, CO_ORIGEM_SOLICITACAO, DS_ORIGEM_EXECUCAO, ' +
                   ' ID_USUARIO_INCLUSAO) VALUES (CORE_CADASTRO.SQ_ID_CONTA_BANCA_DEBITO_AUTO.NEXTVAL, ' +
                   DBcboContaBancDeb.LookupValue + ', ' + DBcboFormaRecebimento.LookupValue + ', '+
                   QuotedStr(sTipoSituacao) + ', ' + QuotedStr('C') + ', ' + QuotedStr('Planus') + ', ' + IntToStr(Sistema.IdUsuario) + ')';
        2: sSQL := 'UPDATE CORE_CADASTRO.CONTA_BANCARIA_DEBITO_AUTO SET CO_SITUACAO_DEBITO_AUTOMATICO = ' +
                   QuotedStr(sTipoSituacao) + ' WHERE ID_CONTA_BANCARIA = ' + DBcboContaBancDeb.LookupValue;
      end;

      if iTipoSQL > 0 then
      begin
        try
          qryCadContaBancariaDebAuto := TwwQuery.Create(nil);
          qryCadContaBancariaDebAuto.DataBaseName := 'BaseDados';
          qryCadContaBancariaDebAuto.Close;
          qryCadContaBancariaDebAuto.SQL.Clear;
          qryCadContaBancariaDebAuto.SQL.Add(sSQL);
          qryCadContaBancariaDebAuto.ExecSql;
        finally
          FreeAndNil(qryCadContaBancariaDebAuto);
        end;
      end;
     end;
     //Cássio Rovaroto - SIG nº 94625 - Fim

      try
        qryHstAltContrEmptmo := TwwQuery.Create(nil);
        qryHstAltContrEmptmo.DataBaseName := 'BaseDados';
        qryHstAltContrEmptmo.Close;
        qryHstAltContrEmptmo.SQL.Clear;
        qryHstAltContrEmptmo.SQL.Add(' INSERT INTO HSTCBANCARIAEMPTMO ');
        qryHstAltContrEmptmo.SQL.Add(' (IDHSTCBANCARIAEMPTMO,IDCONTRATOEMPTMO, IDCBANCARIADEB) Values ') ;
        qryHstAltContrEmptmo.SQL.Add(' (SEQHSTCBANCARIAEMPTMO.NEXTVAL,'+ qryIDCONTRATOEMPTMO.AsString +','+ IDCBANCARIADEB +') ');
        qryHstAltContrEmptmo.ExecSql;
      finally
        FreeAndNil(qryHstAltContrEmptmo);
      end;
      qryHistAltContratuais.Close;
      qryHistAltContratuais.ParamByName('IDCONTRATOEMPTMO').AsString:= qryHistAltContratuais.ParamByName('IDCONTRATOEMPTMO').AsString;
      qryHistAltContratuais.ParamByName('IDPESSOA').AsInteger := qryIDBENEF.AsInteger;
      qryHistAltContratuais.Open;
   end;

   //Renato Visoni Sol 99494 Kintana 437153
   SalvaLog();
   //Fim

   if qry.State in dsEditModes then
   begin
      if (qryBenefSeguro.Active) and (qryBenefSeguro.UpdatesPending) then
      begin
         qryBenefSeguro.ApplyUpdates;
         qryBenefSeguro.CommitUpdates;
      end;

      qry.Post;
      qry.ApplyUpdates;

     //Vinicius Ferreira SOL 137562 KINTANA 833159
     qry.Close;
     qry.ParamByName('PIDCONTRATOEMPTMO').AsString := qryHistAltContratuais.ParamByName('IDCONTRATOEMPTMO').AsString;
     qry.Open;
     pnlFundo.Enabled := False;
   end;



   inherited;
   //Vinicius Ferreira SOL 137562 KINTANA 833159 - inicio
   bbtnConfirmar.Enabled := False;
   bbtnCancelar.Enabled := False;
   sbtnProcurar.Enabled := True;
   sbtnAlterar.Enabled := True;
   sbtnAlterar.Down := False;
   //Vinicius Ferreira SOL 137562 KINTANA 833159 - fim

   //pgcAltContrato.ActivePageIndex := 0;
end;



procedure TfrmExecAlteraContrato.bbtnOkDetBenefClick(Sender: TObject);
var
    Recno      : TBookMark;
    fPerc      : Real;
    dsEstado   : TDataSetState;
    iInscricao : Extended;
    iBenef     : LongInt;
    sNome      : string;
    rLogTotalPrev : TLogTotalPrev; //Renato Visoni SOL 99961 Kintana 441109
begin
   inherited;

   dsEstado   := qryBenefSeguro.State;
   iBenef     := qryBenefSeguroIDBENEFSEGURO.AsInteger;
   iInscricao := qryIDINSCRICAOEMPTMO.AsFloat;
   fPerc      := qryBenefSeguroPERCINDENIZACAO.AsFloat;
   sNome      := qryBenefSeguroNOME.AsString;

   if dsEstado = dsInsert then
   begin
      qryBenefSeguro.Cancel;
      if (qryBenefSeguro.Locate('IDBENEFSEGURO',iBenef,[loCaseInsensitive])) then
      begin
         MsgDlg('Beneficiário Já cadastrado.', 'Empréstimo', mtError, [mbOk], 0);
         qryBenefSeguro.RevertRecord;
         bbtnCancelarDetBenefClick(Self);
         Exit;
      end;
   end;

   if dsEstado = dsInsert then
   begin
      qryBenefSeguro.Insert;
      qryBenefSeguroIDBENEFSEGURO.AsInteger     := iBenef;
      qryBenefSeguroIDINSCRICAOEMPTMO.AsFloat   := iInscricao;
      qryBenefSeguroPERCINDENIZACAO.AsFloat     := fPerc;
      qryBenefSeguroNOME.AsString               := sNome;
   end;

   qryBenefSeguro.Post;

   if qryBenefSeguroIDBENEFSEGURO.AsInteger = qryIDBENEF.AsInteger then
   begin
      MsgDlg('Beneficiário do seguro não pode ser o solicitante do Empréstimo.', 'Empréstimo', mtError, [mbOk], 0);
      qryBenefSeguro.RevertRecord;
      sbtnAlteraBenefClick(Self);
      Exit;
   end;

   if qryBenefSeguroPERCINDENIZACAO.AsFloat = 0 then
   begin
      MsgDlg('Percentual de Indenização não pode ser igual a 0 (zero).', 'Empréstimo', mtError, [mbOk], 0);
      qryBenefSeguro.RevertRecord;
      sbtnAlteraBenefClick(Self);
      Exit;
   end;

   if qryBenefSeguroPERCINDENIZACAO.AsFloat < 0 then
   begin
      MsgDlg('Percentual de Indenização não pode ser negativo.', 'Empréstimo', mtError, [mbOk], 0);
      qryBenefSeguro.RevertRecord;
      sbtnAlteraBenefClick(Self);
      Exit;
   end;

   Recno := qryBenefSeguro.GetBookmark;
   qryBenefSeguro.DisableControls;
   qryBenefSeguro.First;

   fPerc := 0;

   while not qryBenefSeguro.Eof do
   begin
      fPerc := fPerc + qryBenefSeguroPERCINDENIZACAO.AsFloat;
      qryBenefSeguro.Next;
   end;

   qryBenefSeguro.GotoBookmark(Recno);
   qryBenefSeguro.FreeBookmark(Recno);

   qryBenefSeguro.EnableControls;

   if ( fPerc < 100 ) then
   begin
      MsgDlg('ATENÇÃO: Somatório de Percentuais de Indenização ainda não atingiu 100%', 'Empréstimo', mtWarning, [mbOk], 0);
      Repaint;
      Exit;
   end;

   if ( fPerc > 100 ) then
   begin
      MsgDlg('Somatório de Percentuais de Indenização ultrapassa a 100%', 'Empréstimo', mtError, [mbOk], 0);
      sbtnAlteraBenefClick(Self);
      Exit;
   end;

   //Renato Visoni SOL 99961 Kintana 441109
   if dsEstado = dsEdit then begin
     LimpaRegistroLog(rLogTotalPrev);

     rLogTotalPrev.IDModulo   := Sistema.IDModulo;
     rLogTotalPrev.IDContrato := qryIDCONTRATOEMPTMO.AsFloat;
     rLogTotalPrev.IDHistMov  := -1;
     rLogTotalPrev.Origem     := 17;
     rLogTotalPrev.Operacao   := 'Alteração de Beneficiário do Seguro';
     rLogTotalPrev.Data       := SysDate;
     rLogTotalPrev.IDUsuario  := Sistema.IdUsuario;
     rLogTotalPrev.Versao     := Sistema.Versao;

     GravaLogTotalPrev(rLogTotalPrev);
   end;
   //Fim
end;



procedure TfrmExecAlteraContrato.bbtnCancelarDetBenefClick(Sender: TObject);
begin
   inherited;
   qryBenefSeguro.Cancel;
end;



procedure TfrmExecAlteraContrato.dsBenefSeguroStateChange(Sender: TObject);
begin
   inherited;

   bbtnOkDetBenef.Enabled       := dsBenefSeguro.State in [dsEdit, dsInsert];
   bbtnCancelarDetBenef.Enabled := dsBenefSeguro.State in [dsEdit, dsInsert];
   sbtnInsereBenef.Down         := dsBenefSeguro.State = dsInsert;
   sbtnAlteraBenef.Down         := dsBenefSeguro.State = dsEdit;
end;



procedure TfrmExecAlteraContrato.bbtnCancelarClick(Sender: TObject);
begin
   if (qryBenefSeguro.Active) and (qryBenefSeguro.UpdatesPending) then
   begin
      qryBenefSeguro.RevertRecord;
      qryBenefSeguro.CancelUpdates;
   end;

   pgcAltContrato.ActivePageIndex := 0;

   inherited;
end;



function TfrmExecAlteraContrato.CriticaPercentuaisBeneficiarios : boolean;
begin
   Result := True;

   if ( qryFLGOBRIGBENEF.AsInteger = 1 ) then
   begin
      case VerificaBeneficiario of
         -1:
         begin
            Result := False;
            MsgDlg('Somatório do Percentual de indenização deve ser maior que ZERO.', 'Empréstimo', mtWarning, [mbOk], 0);
            Repaint;
            Exit;
         end;

         -2:
         begin
            Result := False;
            MsgDlg('Somatório do Percentual de indenização deve ser igual a 100%.', 'Empréstimo', mtWarning, [mbOk], 0);
            Repaint;
            Exit;
         end;

         -3:
         begin
            Result := False;
            MsgDlg('Somatório do Percentual de indenização deve ser igual a 100%.', 'Empréstimo', mtWarning, [mbOk], 0);
            Repaint;
            Exit;
         end;
      end;
   end;
end;



function TfrmExecAlteraContrato.VerificaBeneficiario : Integer;
var
   iRecno : TBookMark;
   fPerc  : Real;
begin
   Result := 0;
   iRecno := qryBenefSeguro.GetBookmark;

   with qryBenefSeguro do
   begin
      First;
      fPerc := 0;

      while not(EOF)do
      begin
         fPerc := fPerc + FieldByName('PERCINDENIZACAO').AsFloat;
         Next;
      end;

   end;

   qryBenefSeguro.GotoBookmark(iRecno);
   qryBenefSeguro.FreeBookmark(iRecno);

   if      fPerc = 0   then Result := -1
   else if fPerc < 100 then Result := -2
   else if fPerc > 100 then Result := -3;
end;



procedure TfrmExecAlteraContrato.AlteraParcelas;
begin
   with qryAlteraParcelas do
   begin
      LimpaParametros(qryAlteraParcelas);
      ParamByName('PHMEFORMACOBRANCA').AsString    := qryFLGFORMAREC.AsString;
      ParamByName('PIDCONTRATOEMPTMO').AsFloat     := qryIDCONTRATOEMPTMO.AsFloat;
   end;
end;



procedure TfrmExecAlteraContrato.sbtnProcurarClick(Sender: TObject);
var
   bRetornou : Boolean;
   iIdBenef  : Integer;
begin

   bRetornou := False;

   if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
   begin
      Application.CreateForm(TfrmExecBuscaContrato, frmExecBuscaContrato);
      frmExecBuscaContrato.Filtro := 'AND CON.FLGSITUACAO NOT IN (''C'', ''Q'') ' + #13;
      frmExecBuscaContrato.ShowModal;

      Repaint;

      if frmExecBuscaContrato.RetornouValor then
      begin
         bRetornou      := True;
         Screen.Cursor  := crHourGlass;

         // abre a query principal com o participante escolhido
         Sel(StrToFloat(frmExecBuscaContrato.ValoresChave[0]));
         
         iIdBenef := StrToInt(frmExecBuscaContrato.ValoresChave[4]);
         UFuncoesEmptmo.buscaUsuarioMutuario(iIdBenef);

      end;

      CmeCadastro.Find(Self);

      if qry.IsEmpty then
         CmeCadastro.Operacao := opVazio
      else
         CmeCadastro.Operacao := opIdle;

      CmeCadastro.AtualizaBotoes(Self);
   end
   else
   begin
      inherited;

      if MontaSelect.RetornouValor then
      begin
         bRetornou     := True;
         Screen.Cursor := crHourGlass;

         iIdBenef := StrToInt(MontaSelect.ValoresChave[3]);
         UFuncoesEmptmo.buscaUsuarioMutuario(iIdBenef);

         Sel(StrToFloat(MontaSelect.ValoresChave[0]));
      end;  // if MontaSelect.RetornouValor

      // Marchetti - pendencia 26031
      CmeCadastro.Find(Self);

      if qry.IsEmpty then
         CmeCadastro.Operacao := opVazio
      else
         CmeCadastro.Operacao := opIdle;

      CmeCadastro.AtualizaBotoes(Self);
      // Fim Marchetti - pendencia 26031

   end;

   if bRetornou then
   begin
      // Procedure que abre as queries utilizadas para buscar a Conta Bancária
      AbreQueriesBanco;

      // Procedure que abre as queries utilizadas quando o Débito do Empréstimo será pelo CAR
      AbreQueriesDebito;

      LimpaParametros(dtmLookEmptmo.qryLookTipoSusp);
      dtmLookEmptmo.qryLookTipoSusp.ParamByName('PIDTIPOCONTREMPTMO').AsInteger := qryIDTIPOCONTREMPTMO.AsInteger;
      dtmLookEmptmo.qryLookTipoSusp.ParamByName('PCONC').AsInteger := 0; // Ádler Souza - SOL 142594 KTN 912858
      dtmLookEmptmo.qryLookTipoSusp.Open;

      //Vinicius Ferreira SOL 137562 KINTANA 833159
      qryHistAltContratuais.Close;
      qryHistAltContratuais.ParamByName('IDCONTRATOEMPTMO').AsString := qryIDCONTRATOEMPTMO.AsString;
      qryHistAltContratuais.ParamByName('IDPESSOA').AsInteger := qryIDBENEF.AsInteger;
      qryHistAltContratuais.Open;
   end;

   Screen.Cursor := crDefault;

   // Habilita botao de confirma se qry estiver populada
   bbtnConfirmar.Enabled := not(qry.IsEmpty);

end;



procedure TfrmExecAlteraContrato.SalvaLog;
var rLogTotalPrev : TLogTotalPrev; //Renato Visoni Sol 99494 Kintana 437153
begin
  //Renato Visoni Sol 99494 Kintana 437153  e  SOL 99961 Kintana 441109
  if (DBcboContaBancDeb.LookupValue <> IDCBANCARIADEB) then begin
    LimpaRegistroLog(rLogTotalPrev);
    rLogTotalPrev.IDModulo   := Sistema.IDModulo;
    rLogTotalPrev.IDContrato := qryIDCONTRATOEMPTMO.AsFloat;
    rLogTotalPrev.IDHistMov  := -1;
    rLogTotalPrev.Origem     := 17;
    rLogTotalPrev.Operacao   := 'Alteração de conta bancária para débito';
    rLogTotalPrev.Data       := SysDate;
    rLogTotalPrev.IDUsuario  := Sistema.IdUsuario;
    rLogTotalPrev.Versao     := Sistema.Versao;
    GravaLogTotalPrev(rLogTotalPrev);
  end;

  if (DBcboFormaRecebimento.LookupValue <> PORTFORMAREC) then begin
    LimpaRegistroLog(rLogTotalPrev);
    rLogTotalPrev.IDModulo   := Sistema.IDModulo;
    rLogTotalPrev.IDContrato := qryIDCONTRATOEMPTMO.AsFloat;
    rLogTotalPrev.IDHistMov  := -1;
    rLogTotalPrev.Origem     := 17;
    rLogTotalPrev.Operacao   := 'Alteração de Conta-Caixa x Forma Recebimento';
    rLogTotalPrev.Data       := SysDate;
    rLogTotalPrev.IDUsuario  := Sistema.IdUsuario;
    rLogTotalPrev.Versao     := Sistema.Versao;
    GravaLogTotalPrev(rLogTotalPrev);
  end;

  if (DBrdgDebito.Value <> FLGFORMAREC) then begin
    LimpaRegistroLog(rLogTotalPrev);
    rLogTotalPrev.IDModulo   := Sistema.IDModulo;
    rLogTotalPrev.IDContrato := qryIDCONTRATOEMPTMO.AsFloat;
    rLogTotalPrev.IDHistMov  := -1;
    rLogTotalPrev.Origem     := 17;
    rLogTotalPrev.Operacao   := 'Alteração da forma de cobrança';
    rLogTotalPrev.Data       := SysDate;
    rLogTotalPrev.IDUsuario  := Sistema.IdUsuario;
    rLogTotalPrev.Versao     := Sistema.Versao;
    GravaLogTotalPrev(rLogTotalPrev);
  end;

  if (DBPARCECOBRANCA.Value <> NUMPARCDESCONTO) then begin
    LimpaRegistroLog(rLogTotalPrev);
    rLogTotalPrev.IDModulo   := Sistema.IDModulo;
    rLogTotalPrev.IDContrato := qryIDCONTRATOEMPTMO.AsFloat;
    rLogTotalPrev.IDHistMov  := -1;
    rLogTotalPrev.Origem     := 17;
    rLogTotalPrev.Operacao   := 'Alteração de Nº de Parcelas Atrasadas para Cobrança';
    rLogTotalPrev.Data       := SysDate;
    rLogTotalPrev.IDUsuario  := Sistema.IdUsuario;
    rLogTotalPrev.Versao     := Sistema.Versao;
    GravaLogTotalPrev(rLogTotalPrev);
  end;

  if (bIncluir) and (iBeneficiarios < qryBenefSeguro.Recordcount) then begin
    LimpaRegistroLog(rLogTotalPrev);
    rLogTotalPrev.IDModulo   := Sistema.IDModulo;
    rLogTotalPrev.IDContrato := qryIDCONTRATOEMPTMO.AsFloat;
    rLogTotalPrev.IDHistMov  := -1;
    rLogTotalPrev.Origem     := 17;
    rLogTotalPrev.Operacao   := 'Inclusão de Beneficiário do Seguro. ';
    rLogTotalPrev.Data       := SysDate;
    rLogTotalPrev.IDUsuario  := Sistema.IdUsuario;
    rLogTotalPrev.Versao     := Sistema.Versao;
    GravaLogTotalPrev(rLogTotalPrev);
  end;


  if (bExcluir) and (iBeneficiarios > qryBenefSeguro.Recordcount) then begin
    LimpaRegistroLog(rLogTotalPrev);
    rLogTotalPrev.IDModulo   := Sistema.IDModulo;
    rLogTotalPrev.IDContrato := qryIDCONTRATOEMPTMO.AsFloat;
    rLogTotalPrev.IDHistMov  := -1;
    rLogTotalPrev.Origem     := 17;
    rLogTotalPrev.Operacao   := 'Exclusão de Beneficiário do Seguro. ';
    rLogTotalPrev.Data       := SysDate;
    rLogTotalPrev.IDUsuario  := Sistema.IdUsuario;
    rLogTotalPrev.Versao     := Sistema.Versao;
    GravaLogTotalPrev(rLogTotalPrev);
  end;

  AtualizaVariavel();

  //Fim Sol 99494 Kintana 437153

end;

procedure TfrmExecAlteraContrato.AtualizaVariavel;
begin
   //Renato Visoni SOL 99961 / Kintana 441109
   bIncluir        := False;
   bExcluir        := False;
   iBeneficiarios  :=0;
   IDCBANCARIADEB  :='';
   PORTFORMAREC    :='';
   FlgFormaRec     :='';
   NumParcDesconto :=0;


   if not (qry.IsEmpty) then begin
     IDCBANCARIADEB  := DBcboContaBancDeb.LookupValue;
     PORTFORMAREC    := qry.FieldByname('PORTFORMAREC').Asstring;
     FlgFormaRec     := qry.FieldByname('FLGFORMAREC').AsString;

     if qry.FieldByname('NUMPARCDESCONTO').Asstring <> '' then begin
       NumParcDesconto := qry.FieldByname('NUMPARCDESCONTO').AsInteger;
     end;
   end;

   iBeneficiarios := qryBenefSeguro.Recordcount;
   //Fim
end;

procedure TfrmExecAlteraContrato.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  //Renato Visoni SOL 99961 / Kintana 441109
  AtualizaVariavel();
  //Fim
   //Vinicius Ferreira SOL 137562 KINTANA 833159 - inicio
   bbtnConfirmar.Enabled := True;
   bbtnCancelar.Enabled := True;
   //Vinicius Ferreira SOL 137562 KINTANA 833159 - fim
end;



end.
