{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : SOL 143413 Kintana 938370
Responsável : Fanuel Junior
Data        : 05/11/2010
Descrição   : Utilizar a procedure buscaMutuario para procurar se o usuario é
o mutuario do contrato e bloquea-lo.
--------------------------------------------------------------------------------
Pendência   : 27370
Responsável : Daniel Simões
Data        : 11/02/2008
Descrição   : Alteração/Implementação do número do Help Context...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit FExecLiberaConcessao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjudaImob, StdCtrls, wwdbdatetimepicker, CMDateTimePicker, Mask,
  DBCtrls, fcLabel, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, Wwdatsrc, DBTables, Wwquery, uTypesEmptmo;

type
  TfrmExecLiberaConcessao = class(TfrmSairAjudaImob)
    lblTitulo: TfcLabel;
    Label29: TLabel;
    Label21: TLabel;
    Label43: TLabel;
    Label12: TLabel;
    Label17: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label22: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label11: TLabel;
    Label10: TLabel;
    DBedtNumContrato: TDBEdit;
    btnBuscaContrato: TBitBtn;
    DBedtJuros: TDBEdit;
    DBedtDataInsc: TCMDateTimePicker;
    DBedtDataCredito: TCMDateTimePicker;
    DBedtValSolic: TDBEdit;
    DBedtValorParcela: TDBEdit;
    DBedtParcelas: TDBEdit;
    DBedtDataPrimParcela: TCMDateTimePicker;
    DBedtFormaPagto: TDBEdit;
    DBedtPatro: TDBEdit;
    DBedtPlanoPrev: TDBEdit;
    DBedtSitPart: TDBEdit;
    DBedtBeneficiario: TDBEdit;
    grpTitular: TGroupBox;
    Label9: TLabel;
    Label16: TLabel;
    Label18: TLabel;
    DBedtMtrEmpresa: TDBEdit;
    DBedtCPF: TDBEdit;
    DBedtInscricao: TDBEdit;
    DBedtParticipante: TDBEdit;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBedtTipoEmptmo: TDBEdit;
    DBEdit3: TDBEdit;
    Panel1: TPanel;
    Label15: TLabel;
    edtDataCredito: TCMDateTimePicker;
    bbtnConfirmar: TBitBtn;
    dts: TwwDataSource;
    qryUpdateContrato: TwwQuery;
    qryUpdateContratoDESCSITINSCRICAO: TStringField;
    qryUpdateContratoINSCRICAONUMERO: TFloatField;
    qryUpdateContratoIDSITPART: TFloatField;
    qryUpdateContratoSITUACAO: TStringField;
    qryUpdateContratoFLGINTERNO: TStringField;
    qryUpdateContratoPLANO: TStringField;
    qryUpdateContratoPATRO: TStringField;
    qryUpdateContratoMATRICULA: TStringField;
    qryUpdateContratoTITULAR: TStringField;
    qryUpdateContratoBENEFICIARIO: TStringField;
    qryUpdateContratoDESCTIPOEMPTMO: TStringField;
    qryUpdateContratoIDPESSOA: TFloatField;
    qryUpdateContratoIDPLANOPREV: TFloatField;
    qryUpdateContratoIDPATRO: TFloatField;
    qryUpdateContratoIDBENEF: TFloatField;
    qryUpdateContratoIDCBANCARIA: TFloatField;
    qryUpdateContratoFLGFORMAPAG: TStringField;
    qryUpdateContratoPORTFORMAPAG: TFloatField;
    qryUpdateContratoCODFORMAPAG: TFloatField;
    qryUpdateContratoNUMPARCELAS: TFloatField;
    qryUpdateContratoFLGFORMAREC: TStringField;
    qryUpdateContratoPORTFORMAREC: TFloatField;
    qryUpdateContratoFLGPENDENTE: TStringField;
    qryUpdateContratoFLGSITUACAO: TStringField;
    qryUpdateContratoVLRSOLIC: TFloatField;
    qryUpdateContratoDATAINSC: TDateTimeField;
    qryUpdateContratoDATACANCINSC: TDateTimeField;
    qryUpdateContratoTCEDESCRICAO: TStringField;
    qryUpdateContratoIDINSCRICAOEMPTMO: TFloatField;
    qryUpdateContratoIDTIPOCONTREMPTMO: TFloatField;
    qryUpdateContratoCPF: TStringField;
    qryUpdateContratoIDTIPOEMPTMO: TFloatField;
    qryUpdateContratoFLGSUSPENSAOAUTO: TFloatField;
    qryUpdateContratoVLRSALBASE: TFloatField;
    qryUpdateContratoVLRMARGEM: TFloatField;
    qryUpdateContratoVLRMAXPERMIT: TFloatField;
    qryUpdateContratoMOECODIGO: TFloatField;
    qryUpdateContratoVLRPARCELAMES: TFloatField;
    qryUpdateContratoVLRPARCATRASO: TFloatField;
    qryUpdateContratoFLGALTSALARIO: TFloatField;
    qryUpdateContratoFLGALTMARGEM: TFloatField;
    qryUpdateContratoFLGALTVALMAX: TFloatField;
    qryUpdateContratoMATRICULA_TIT: TStringField;
    qryUpdateContratoINSCRICAO_TIT: TFloatField;
    qryUpdateContratoCPF_TIT: TStringField;
    qryUpdateContratoDATACREDITO: TDateTimeField;
    qryUpdateContratoIDRESPONSAVEL: TFloatField;
    qryUpdateContratoIDCBANCARIADEB: TFloatField;
    qryUpdateContratoDATAENVIO: TDateTimeField;
    qryUpdateContratoDATARECEB: TDateTimeField;
    qryUpdateContratoFLGINTERNET: TFloatField;
    qryUpdateHistMov: TwwQuery;
    StringField1: TStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    StringField10: TStringField;
    FloatField8: TFloatField;
    FloatField9: TFloatField;
    FloatField10: TFloatField;
    StringField11: TStringField;
    FloatField11: TFloatField;
    StringField12: TStringField;
    StringField13: TStringField;
    FloatField12: TFloatField;
    DateTimeField1: TDateTimeField;
    DateTimeField2: TDateTimeField;
    StringField14: TStringField;
    FloatField13: TFloatField;
    FloatField14: TFloatField;
    StringField15: TStringField;
    FloatField15: TFloatField;
    FloatField16: TFloatField;
    FloatField17: TFloatField;
    FloatField18: TFloatField;
    FloatField19: TFloatField;
    FloatField20: TFloatField;
    FloatField21: TFloatField;
    FloatField22: TFloatField;
    FloatField23: TFloatField;
    FloatField24: TFloatField;
    FloatField25: TFloatField;
    StringField16: TStringField;
    FloatField26: TFloatField;
    StringField17: TStringField;
    DateTimeField3: TDateTimeField;
    FloatField27: TFloatField;
    FloatField28: TFloatField;
    DateTimeField4: TDateTimeField;
    DateTimeField5: TDateTimeField;
    FloatField29: TFloatField;

    procedure btnBuscaContratoClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

   private  // Private declarations

      procedure Sel(i: Extended);


   public   // Public declarations


  end;



var
  frmExecLiberaConcessao: TfrmExecLiberaConcessao;



implementation
{$R *.DFM}
uses
   UFuncoesEmptmo, (* LimpaParametros, AtualizaConjunto *)
   UMensErro,      (* MsgDlg *)
   USistema,       (* Sistema *)
   UDatabase,      (* StartTransacao *)
   UCalcEmptmo,    (* AtualizaFlgSituacao *)
   DLookEmptmo,    (* qryLookPortadorFormaR *)
   UIntegraEmptmo,
   dMS,
   DBaseDados,
   dEmptmo, FExecBuscaContrato;



procedure TfrmExecLiberaConcessao.Sel(i: Extended);
begin
   with dtmEmptmo.qryDadosContrato do
   begin
      LimpaParametros(dtmEmptmo.qryDadosContrato);
      ParamByName('PIDCONTRATOEMPTMO').AsFloat := i;
      Open;
      edtDataCredito.Date := dtmEmptmo.qryDadosContratoDATACREDITO.AsDateTime;
   end;
end;



procedure TfrmExecLiberaConcessao.btnBuscaContratoClick(Sender: TObject);
var
iIdBenef : integer;
begin
   inherited;

   ParametrosSistema;

   if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
   begin
      Application.CreateForm(TfrmExecBuscaContrato, frmExecBuscaContrato);
      frmExecBuscaContrato.Tabelas := ', HISTMOVEMPTMO HME ' + #13;
      frmExecBuscaContrato.Filtro  := 'AND HME.HMETIPOMOV        = 0 '                                       + #13 +
                                      'AND HME.FLGBAIXADO        = 0 '                                       + #13 +
                                      'AND (HME.HMEVLREFETIVO    IS NULL) AND (HME.HMEDATAEFETIVA IS NULL) ' + #13 +
                                      'AND ((HME.FLGESTORNADO    IS NULL)  OR (HME.FLGESTORNADO   = 0)) '    + #13 +                                      'AND (HME.HMECENTRALIZA    = 1) '                                      + #13 +
                                      'AND HME.IDCONTRATOEMPTMO  = CON.IDCONTRATOEMPTMO '                    + #13;
      frmExecBuscaContrato.ShowModal;

      Repaint;

      if frmExecBuscaContrato.RetornouValor then
      begin
         Screen.Cursor := crHourGlass;
         (* abre a query principal com o participante escolhido *)

         
         iIdBenef := StrToInt(frmExecBuscaContrato.ValoresChave[4]);
         UFuncoesEmptmo.buscaUsuarioMutuario(iIdBenef);


         Sel(StrToFloat(frmExecBuscaContrato.ValoresChave[0]));
         (* faz a critica de efetivacao com o participante escolhido *)
         Screen.Cursor := crDefault;
         DBEdit1.Text  := frmExecBuscaContrato.ValoresChave[1];

      end;
      frmExecBuscaContrato.Free;
   end 
   else
   begin
      dtmMS.MS_ContratoPendente.Executar;
      (* redesenha o form na volta do MontaSelect *)
      Repaint;

      if dtmMS.MS_ContratoPendente.RetornouValor then
      begin
         Screen.Cursor := crHourGlass;
         (* abre a query principal com o participante escolhido *)
         
         iIdBenef := StrToInt(dtmMS.MS_ContratoPendente.ValoresChave[5]);
         UFuncoesEmptmo.buscaUsuarioMutuario(iIdBenef);
         Sel(StrToFloat(dtmMS.MS_ContratoPendente.ValoresChave[0]));
         (* faz a critica de efetivacao com o participante escolhido *)
         Screen.Cursor := crDefault;
      end;(* if MontaSelect.RetornouValor *)
   end;

   (*Habilita botao de confirma se qry estiver populada*)
   bbtnConfirmar.Enabled := not(dtmEmptmo.qryDadosContrato.IsEmpty);
end;



procedure TfrmExecLiberaConcessao.bbtnConfirmarClick(Sender: TObject);
var
   rLogTotalPrev : TLogTotalPrev;
   sMensErro     : String;
begin
   inherited;

   if UFuncoesEmptmo.bBuscaMutuario then
      begin
         MessageBox(handle,'O processo não poderá ser executado.'+#13#10+
                           'O usuário é o próprio mutuário do '+
                           'contrato de empréstimo!','Atenção',MB_ICONWARNING + MB_OK);
         Abort;
      end;


   // Verifica se existe algum contrato no momento
   if dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.IsNull then
   begin
      MsgDlg('É necessário selecionar um contrato.', 'Empréstimo', mtInformation, [mbOK], 0);
      if btnBuscaContrato.CanFocus then  btnBuscaContrato.SetFocus;
      Exit;
   end;

   if edtDataCredito.Date < dtmEmptmo.qryDadosContratoDATACREDITO.AsDateTime then
   begin
      MsgDlg('Data de Crédito informada não pode ser inferior à anteriormente cadastrada.', 'Empréstimo', mtInformation, [mbOK], 0);
      edtDataCredito.Date := dtmEmptmo.qryDadosContratoDATACREDITO.AsDateTime;
      if edtDataCredito.CanFocus then edtDataCredito.SetFocus;
      Exit;
   end;

   // Confirmação
   if MsgDlg('Deseja realmente Liberar a Concessão', 'Empréstimo', mtConfirmation, [mbYes, mbNo], 0) = mrNo then Exit;

   // ----------------------------------------------------------------------------------------------

   // Inicia uma transação - só se não ouver transação iniciada
   if dtmBaseDados.dbBaseDados.InTransaction then
   begin
      MsgDlg('Transação anterior em progresso!', 'Empréstimo', mtError, [mbOk], 0);
      Repaint;
      Exit;
   end;

   StartTransacao;

   // ----------------------------------------------------------------------------------------------

   try
     if CalcEmptmo.AtualizaFlgSituacao(dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsFloat,
                                       'CONTRATOEMPTMO', 'A',
                                       sMensErro) then
     begin
         // Só "commita" se não houver transacao anterior

         with qryUpdateContrato do
         begin
            LimpaParametros(qryUpdateContrato);
            ParamByName('PDATACREDITO').AsDateTime   := edtDataCredito.Date;
            ParamByName('PIDCONTRATOEMPTMO').AsFloat := dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsFloat;
            ExecSql;
         end;

         with qryUpdateHistMov do
         begin
            LimpaParametros(qryUpdateHistMov);
            ParamByName('PDATACREDITO').AsDateTime   := edtDataCredito.Date;
            ParamByName('PIDCONTRATOEMPTMO').AsFloat := dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsFloat;
            ExecSql;
         end;

         // ----------------------------------------------------------------------------------------

         LimpaRegistroLog(rLogTotalPrev);

         rLogTotalPrev.IDModulo   := Sistema.IDModulo;
         rLogTotalPrev.IDContrato := dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsFloat;
         rLogTotalPrev.IDHistMov  := -1;
         rLogTotalPrev.Origem     := 0;
         rLogTotalPrev.Operacao   := 'Liberação de Concessão - Contrato: ' + dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsString;
         rLogTotalPrev.Data       := SysDate;
         rLogTotalPrev.IDUsuario  := Sistema.IdUsuario;
         rLogTotalPrev.Versao     := Sistema.Versao;

         GravaLogTotalPrev(rLogTotalPrev);

         // ----------------------------------------------------------------------------------------

         if dtmBaseDados.dbBaseDados.InTransaction then CommitTransacao;

         bbtnConfirmar.Enabled := False;
         Sel(-1);
      end
      else
      begin
        // Houve erro
        if dtmBaseDados.dbBaseDados.InTransaction then RollbackTransacao;
      end;

   except
      // Houve erro
      if dtmBaseDados.dbBaseDados.InTransaction then RollbackTransacao;

      MsgDlg('Processo interrompido.' + #13 + 'Não foi possível liberar essa concessão',
             'Empréstimo', mtError, [mbOk], 0);
      Repaint;

      Raise;
      Repaint;
   end;
end;

procedure TfrmExecLiberaConcessao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   UFuncoesEmptmo.bBuscaMutuario := false;
end;


end.
