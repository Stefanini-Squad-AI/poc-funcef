{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : 27370
Responsável : Daniel Simões
Data        : 11/02/2008
Descrição   : Alteração/Implementação do número do Help Context...
--------------------------------------------------------------------------------
Rotina    : FormShow
Data      : 30/03/2007
Autor     : Marchetti
Pendencia : 22042
Descrição : Colocado processo para mostrar form com os contratos da matricula
            passada pela CentralAP.
--------------------------------------------------------------------------------
Rotina    : VerificaPreenchimento
Data      : 28/09/2005
Autor     : André Pontes
Pendência : 20058
Descrição : Para FUNCEF, não permitir cancelamento de amortização/quitação já
            enviada.
--------------------------------------------------------------------------------
Rotina    : Várias (VerificaPreenchimento e declarações em outros lugares)
Data      : 03/06/2005
Autor     : André Pontes
Pendência : 19404
Descrição : Bloqueio de lançamento e contabilização / estorno / exclusão de
            acordo com parâmetro contábil por módulo + TestaPeríodo.
--------------------------------------------------------------------------------
Rotina    : VerificaPreenchimento
Data      : 05/03/2004
Autor     : Marchetti
Pendencia : 16172
Descrição : Verifica se a quitação se encontra como enviada, mandando mensagem e
            bloqueando o processo.
--------------------------------------------------------------------------------
Rotina    : -
Data      : 09/12/2002
Autor     : André Pontes
Descrição : NÃO HÁ MAIS EXCLUSÃO CONTÁBIL, SÓ ESTORNO. A data de estorno é
            preenchida por default com a data da própria quitação.
--------------------------------------------------------------------------------
Rotina    : btnBuscaContratoClick
Data      : 23/10/2002
Autor     : Marchetti
Descrição : Limpa o resulta da consulta efetuada anteriormente.
--------------------------------------------------------------------------------
Rotina    : bbtnConfirmarClick
Data      : 18/10/2002
Autor     : Marchetti
Descrição : Acerto nos parâmetros do procedimento que exclui os dados do
            histórico.
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit fCancQuitacao_90359_379854;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FSairAjudaImob, wwdblook, wwdbdatetimepicker, CMDateTimePicker, StdCtrls,
   Mask, DBCtrls, fcLabel, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons,
   TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, Wwdatsrc, uFiario,
   uCtrlContab, uCtrlPadroes,
   uTypesEmptmo;

type
   TfrmCancQuitacao_90359_379854 = class(TfrmSairAjudaImob)
      lblTitulo: TfcLabel;
      Label2: TLabel;
      edtDataQuitacao: TCMDateTimePicker;
      dts: TwwDataSource;
      bbtnConfirmar: TBitBtn;
      DBedtFormaPagto: TDBEdit;
      Label5: TLabel;
      qryVerParcelaGerada: TwwQuery;
      Label29: TLabel;
      Label21: TLabel;
      Label43: TLabel;
      Label12: TLabel;
      Label17: TLabel;
      Label38: TLabel;
      Label39: TLabel;
      Label3: TLabel;
      DBedtNumContrato: TDBEdit;
      btnBuscaContrato: TBitBtn;
      DBedtJuros: TDBEdit;
      DBedtDataInsc: TCMDateTimePicker;
      DBedtDataCredito: TCMDateTimePicker;
      DBedtValSolic: TDBEdit;
      DBedtValorParcela: TDBEdit;
      DBedtParcelas: TDBEdit;
      DBedtDataPrimParcela: TCMDateTimePicker;
      Label1: TLabel;
      Label4: TLabel;
      Label6: TLabel;
      Label22: TLabel;
      Label7: TLabel;
      Label8: TLabel;
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
      Label11: TLabel;
      DBedtTipoEmptmo: TDBEdit;
      DBEdit3: TDBEdit;
      Label10: TLabel;
      Panel1: TPanel;
      Label15: TLabel;
      edtDataCanc: TCMDateTimePicker;
      ToolbarSep974: TToolbarSep97;

      procedure btnBuscaContratoClick(Sender: TObject);
      procedure bbtnConfirmarClick(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure FormShow(Sender: TObject);


   private  // Private declarations

      Contab               : TCtrlContab;   // André Pontes - 03/06/2005 - pendência 19404

      sFiltroContEmp       : String;
      bRepeteConsulta      : Boolean;

      procedure Sel(i: Extended);

      function VerificaPreenchimento: Boolean;


   public   // Public declarations

      // Marchetti - Pendencia 22042
      sMatricula : String;
      // Fim Marchetti - Pendencia 22042
      
   end;



var
  frmCancQuitacao_90359_379854: TfrmCancQuitacao_90359_379854;



implementation
{$R *.DFM}
uses
   UFuncoesEmptmo,   // LimpaParametros, AtualizaConjunto
   UMensErro,        // MsgDlg
   USistema,         // Sistema
   UDatabase,        // StartTransacao
   UCalcEmptmo,      // AtualizaFlgSituacao
   DLookEmptmo,      // qryLookPortadorFormaR
   UIntegraEmptmo,
   uVerificaPreenchimento,
   uLancContab,
   dMS,
   DBaseDados,
   FExecBuscaContrato,
   dEmptmo,
   dAtualizacaoDiaria,
   FExecSelecionaContrato,
   uIntegraModulo;          




function TfrmCancQuitacao_90359_379854.VerificaPreenchimento: Boolean;
var
   sDataLanc   : String;
   sMsgContab  : String;
   iEmpresa    : Integer;
   iExercicio  : Integer;
   iPeriodo    : Integer;
begin
   Result := False;

   try
      // -------------------------------------------------------------------------------------------

      // Verifica se existe algum contrato no momento
      if dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.IsNULL then
         raise EValidacao.CreateVal('É necessário selecionar um Contrato!', btnBuscaContrato);

      // -------------------------------------------------------------------------------------------

      // data de cancelamento
      if length(trim(edtDataCanc.Text))= 0 then
         raise EValidacao.CreateVal('É necessário indicar a Data de Cancelamento!', edtDataCanc);

      // -------------------------------------------------------------------------------------------

      // Pega o contrato no historico de contrato e verifica se esta vazio
      if not(dtmEmptmo.AbreHistMov(dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsFloat,
                                   3,  // evento 3  = quitação
                                   -1, // origem -1 = qualquer uma
                                   dtmEmptmo.qryDadosContratoQUIDATAPREVISTA.AsDateTime
                                  )) then
      begin
         raise EValidacao.CreateVal('Não foi encontrado registro de Quitação!', btnBuscaContrato);
      end;

      // -------------------------------------------------------------------------------------------

      // data de cancelamento
      if length(trim(edtDataCanc.Text))= 0 then
         raise EValidacao.CreateVal('É necessário indicar a Data de Cancelamento!', edtDataCanc);

      // -------------------------------------------------------------------------------------------

      if IntegraEmptmo.EventoBaixado(dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsFloat, 3, edtDataQuitacao.Date) then
         raise EValidacao.CreateVal('A Quitação já foi Baixada!', btnBuscaContrato);

      // -------------------------------------------------------------------------------------------

      // Marchetti - Pendencia 16172
      if Sistema.TipoCliente = 19991 then // André Pontes - pendência 20058 - 28/09/2005
         if IntegraEmptmo.EventoEnviado(dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsFloat, 3, edtDataQuitacao.Date) then
            raise EValidacao.CreateVal('A Quitação já foi ENVIADA! ' + #13 + 'É necessário desfazer o Envio.', btnBuscaContrato);
      // Marchetti - FIM Pendencia 16172

      if dtmEmptmo.qryParamEmptmoFLGINTEGRACONTAB.AsInteger = 1 then
      begin
         // Chamada da função TestaPeríodo para verificar se pode(m) ser lançada(s) planilha(s) de
         // estorno na data de cancelamento indicada
         sDataLanc   := FormatDateTime('dd/mm/yyyy', edtDataCanc.Date);
         iEmpresa    := Sistema.idEmpresa;
         sMsgContab  := '';

         if TestaPeriodo(False, 'BaseDados', sDataLanc, '15', iExercicio, iPeriodo, iEmpresa, sMsgContab) <> 0 then
            raise EValidacao.CreateVal('Não é possível fazer o estorno contábil na data indicada:' + #13 + '"' + sMsgContab + '"', edtDataCanc);

         // André Pontes - 03/06/2005 - pendência 19404
         if not(Contab.TestaDataBloqueadaProc(iEmpresa, 15, sDataLanc)) then
         begin
            sMsgContab := Contab.MessageInfo;
            raise EValidacao.CreateVal('Não é possível fazer lançamentos para a data escolhida:' + #13 + '"' + sMsgContab + '"', edtDataCanc);
         end;
         // FIM André Pontes - 03/06/2005 - pendência 19404
      end;

      // -------------------------------------------------------------------------------------------

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



procedure TfrmCancQuitacao_90359_379854.Sel(i: Extended);
begin
   with dtmEmptmo.qryDadosContrato do begin
      LimpaParametros(dtmEmptmo.qryDadosContrato);
      ParamByName('PIDCONTRATOEMPTMO').AsFloat := i;
      Open;
   end;
end;



procedure TfrmCancQuitacao_90359_379854.btnBuscaContratoClick(Sender: TObject);
begin
   inherited;

   if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
   begin
      if dtmMS.MS_ContratoEmptmo.Text <> '' then dtmMS.MS_ContratoEmptmo.Cancela;
   end;

   if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
   begin
      Application.CreateForm(TfrmExecBuscaContrato, frmExecBuscaContrato);

      frmExecBuscaContrato.Filtro :=
      '   AND CON.FLGSITUACAO <> ''C'' '                             + #13 +
      '   AND EXISTS '                                               + #13 +
      '       ( '                                                    + #13 +
      '       SELECT '                                               + #13 +
      '          HME.IDCONTRATOEMPTMO '                              + #13 +
      '       FROM '                                                 + #13 +
      '          HISTMOVEMPTMO HME '                                 + #13 +
      '       WHERE '                                                + #13 +
      '              HME.HMETIPOMOV       = 3 '                      + #13 +
      '          AND HME.IDCONTRATOEMPTMO = CON.IDCONTRATOEMPTMO '   + #13 +
      '       ) '                                                    + #13;

      frmExecBuscaContrato.ShowModal;

      Repaint;

      if frmExecBuscaContrato.RetornouValor then
      begin
         Screen.Cursor := crHourGlass;
         Sel(StrToFloat(frmExecBuscaContrato.ValoresChave[0]));
         Screen.Cursor := crDefault;
         DBEdit1.Text  := frmExecBuscaContrato.ValoresChave[1];
         edtDataCanc.Date := dtmEmptmo.qryDadosContratoQUIDATAPREVISTA.AsDateTime;
         frmExecBuscaContrato.Free;
      end;
   end
   else
   begin
      dtmMS.MS_ContratoEmptmo.Executar;
      Repaint;

      if dtmMS.MS_ContratoEmptmo.RetornouValor then
      begin
         Screen.Cursor := crHourGlass;
         Sel(StrToFloat(dtmMS.MS_ContratoEmptmo.ValoresChave[0]));
         Screen.Cursor := crDefault;

         edtDataCanc.Date := dtmEmptmo.qryDadosContratoQUIDATAPREVISTA.AsDateTime;

      end;
   end;

   // Habilita botao de confirma se qry estiver populada
   bbtnConfirmar.Enabled := not(dtmEmptmo.qryDadosContrato.IsEmpty);
end;



procedure TfrmCancQuitacao_90359_379854.bbtnConfirmarClick(Sender: TObject);
var
   rLogTotalPrev : TLogTotalPrev;
begin
   inherited;

   if not(VerificaPreenchimento) then Exit;

   // Confirmação do processo
   if MsgDlg('Deseja realmente CANCELAR a Quitação?', 'Empréstimo', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
   begin
      Repaint;
      Exit;
   end;
   Repaint;

   //-----------------------------------------------------------------------------------------------
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

      if CalcEmptmo.CancelaQuitacao(dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsFloat,
                                    dtmEmptmo.qryDadosContratoQUIDATAPREVISTA.AsDateTime,
                                    edtDataCanc.Date,
                                    -1,
                                    True
                                   ) = 0 then
      begin
         // -----------------------------------------------------------------------------------------------------------------
         LimpaRegistroLog(rLogTotalPrev);

         rLogTotalPrev.IDModulo   := 15;
         rLogTotalPrev.IDContrato := dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsFloat;
         rLogTotalPrev.IDHistMov  := -1;
         rLogTotalPrev.Origem     := 53;
         rLogTotalPrev.Operacao   := 'Cancelamento de Quitação : ' + FormatDateTime('dd/mm/yyyy', dtmEmptmo.qryDadosContratoQUIDATAPREVISTA.AsDateTime);
         rLogTotalPrev.Data       := SysDate;
         rLogTotalPrev.IDUsuario  := Sistema.IdUsuario;
         rLogTotalPrev.Versao     := Sistema.Versao;

         GravaLogTotalPrev(rLogTotalPrev);
         // -----------------------------------------------------------------------------------------------------------------

         // Só "commita" se não houver transacao anterior
         if dtmBaseDados.dbBaseDados.InTransaction then CommitTransacao;

         // Marchetti - Pendencia 22042
         IntegraModulo.iEvento         := 3;
         IntegraModulo.iContratoEmptmo := dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsFloat;
         // Fim Marchetti - Pendencia 22042

         bbtnConfirmar.Enabled := False;
         MsgDlg('Quitação cancelada.', 'Empréstimo', mtInformation, [mbOk], 0);
         Repaint;
         Sel(-1);

         // Marchetti - Pendencia 22042
         if Sistema.IdModulo = 19 then bbtnSairClick(Self);
         // Fim Marchetti - Pendencia 22042
      end
      else
      begin
        // Houve erro
        if dtmBaseDados.dbBaseDados.InTransaction then RollbackTransacao;

         MsgDlg('Não foi possível cancelar a Quitação.', 'Empréstimo', mtError, [mbOk], 0);
         Repaint;
      end;

   except
      // Houve erro
      if dtmBaseDados.dbBaseDados.InTransaction then RollbackTransacao;

      Raise;
      Repaint;

      MsgDlg('Não foi possível cancelar a Quitação.', 'Empréstimo', mtError, [mbOk], 0);
      Repaint;
   end;
end;



procedure TfrmCancQuitacao_90359_379854.FormCreate(Sender: TObject);
begin
   inherited;

   // André Pontes - 03/06/2005 - pendência 19404
   Contab := TCtrlContab.Create;
   Contab.Initialize(dtmBaseDados.dbBaseDados,
                     True,
                     Sistema.ConnectionType,
                     Sistema.ConnectionSide,
                     Sistema.AppRemoteServer,
                     True
                    );

   Contab.OpenTransaction := False;
   // FIM André Pontes - 03/06/2005 - pendência 19404

   // Armazena o Filtro Original do MontaSelect
   sFiltroContEmp := dtmMS.MS_ContratoEmptmo.Filtro.Text;

   // Faz o MontaSelect mostrar, somente os Contratos que estao pendentes de quitação
   bRepeteConsulta                  := dtmMS.MS_ContratoEmptmo.RepeteConsulta;
   dtmMS.MS_ContratoEmptmo.Filtro.Add('CON.FLGSITUACAO IN (''K'', ''Q'')');
end;



procedure TfrmCancQuitacao_90359_379854.FormClose(Sender: TObject; var Action: TCloseAction);
begin

   dtmEmptmo.qryDadosContrato.Close;

   dtmMS.MS_ContratoEmptmo.Filtro.Clear;
   dtmMS.MS_ContratoEmptmo.Filtro.Text := sFiltroContEmp;
   dtmMS.MS_ContratoEmptmo.RepeteConsulta := bRepeteConsulta;

   dtmEmptmo.qryHistoricoMov.Close;

   Contab.Free;   // André Pontes - 03/06/2005 - pendência 19404

   inherited;
end;



procedure TfrmCancQuitacao_90359_379854.FormShow(Sender: TObject);
begin
   inherited;

   ParametrosSistema;
   grpTitular.Visible := (dtmEmptmo.qryParamEmptmoFLGMOSTRATIT.AsInteger = 0);

   // Marchetti - Pendencia 22042
   if Sistema.IdModulo = 19 then
   begin
      btnBuscaContrato.Visible := False;
      Application.CreateForm(TFrmExecSelecionaContrato, frmExecSelecionaContrato);
      frmExecSelecionaContrato.Matricula := sMatricula;
      frmExecSelecionaContrato.ShowModal;
      if frmExecSelecionaContrato.RetornouValor then
      begin
         Screen.Cursor := crHourGlass;
         Sel(StrToFloat(frmExecSelecionaContrato.ValoresChave[0]));
         Screen.Cursor := crDefault;
         DBEdit1.Text  := frmExecSelecionaContrato.ValoresChave[0];
         edtDataCanc.Date := dtmEmptmo.qryDadosContratoQUIDATAPREVISTA.AsDateTime;

      end;
      frmExecSelecionaContrato.Free;
   end;
   // Fim Marchetti - Pendencia 22042
end;



end.
