// Alterações:
{ --------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 09/12/2002
Autor     : André Pontes
Descrição : NÃO HÁ MAIS EXCLUSÃO CONTÁBIL, SÓ ESTORNO. A data de estorno é preenchida por default
            com a data da própria quitação.
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : btnBuscaContratoClick
Data      : 23/10/2002
Autor     : Marchetti
Descrição : Limpa o resulta da consulta efetuada anteriormente
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : bbtnConfirmarClick
Data      : 18/10/2002
Autor     : Marchetti
Descrição : Acerto nos parâmetros do procedimento que exclui os dados do histórico
---------------------------------------------------------------------------------------------------}
unit fCancQuitacao;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FSairAjudaImob, wwdblook, wwdbdatetimepicker, CMDateTimePicker, StdCtrls,
   Mask, DBCtrls, fcLabel, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons,
   TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, Wwdatsrc, uFiario,

   uTypesEmptmo;

type
   TfrmCancQuitacao = class(TfrmSairAjudaImob)
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
      qryEstornaItensAtualizacao: TwwQuery;

      procedure btnBuscaContratoClick(Sender: TObject);
      procedure bbtnConfirmarClick(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure FormShow(Sender: TObject);


   private { Private declarations }

//      Fiario         : TFiario;

      sFiltroContEmp  : String;
      bRepeteConsulta : Boolean;

      procedure Sel(i: Int64);

      function VerificaPreenchimento: Boolean;


   public { Public declarations }

   end;



var
  frmCancQuitacao: TfrmCancQuitacao;



implementation
{$R *.DFM}
uses
   UFuncoesEmptmo,   (* LimpaParametros, AtualizaConjunto *)
   UMensErro,        (* MsgDlg *)
   USistema,         (* Sistema *)
   UDatabase,        (* StartTransacao *)
   UCalcEmptmo,      (* AtualizaFlgSituacao *)
   DLookEmptmo,      (* qryLookPortadorFormaR *)
   UIntegraEmptmo,
   uVerificaPreenchimento,
   uLancContab,
   dMS,
   DBaseDados,
   dEmptmo;          (* DataModule de Geral*)




function TfrmCancQuitacao.VerificaPreenchimento: Boolean;
var
   sDataLanc   : String;
   sMsgContab  : String;
   iEmpresa    : Integer;
   iExercicio  : Integer;
   iPeriodo    : Integer;
begin
   Result := False;

   try
      // Verifica se existe algum contrato no momento
      if dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.IsNULL then
      begin
         MsgDlg('É necessário selecionar um Contrato.', 'Empréstimo', mtWarning, [mbOK], 0);
         Repaint;
         if btnBuscaContrato.CanFocus then btnBuscaContrato.SetFocus;
         Exit;
      end;

      // Pega o contrato no historico de contrato e verifica se esta vazio
      if not(dtmEmptmo.AbreHistMov(dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsInteger,
                                   3,  // evento 3  = quitação
                                   -1, // origem -1 = qualquer uma
                                   dtmEmptmo.qryDadosContratoQUIDATAPREVISTA.AsDateTime)) then
      begin
         MsgDlg('Não foi encontrado registro de Quitação.', 'Empréstimo', mtWarning, [mbOK], 0);
         Repaint;
         if btnBuscaContrato.CanFocus then btnBuscaContrato.SetFocus;
         Exit;
      end;

      // data de cancelamento
      if length(trim(edtDataCanc.Text))= 0 then
         raise EValidacao.CreateVal('É necessário indicar a Data de Cancelamento!', edtDataCanc);

      ParametrosSistema;
      if dtmEmptmo.qryParamEmptmoFLGINTEGRACONTAB.AsInteger = 1 then
      begin
         // Chamada da função TestaPeríodo para verificar se pode(m) ser lançada(s) planilha(s) de
         // estorno na data de cancelamento indicada
         sDataLanc   := FormatDateTime('dd/mm/yyyy', edtDataCanc.Date);
         iEmpresa    := Sistema.idEmpresa;
         sMsgContab  := '';

         if TestaPeriodo(False, 'BaseDados', sDataLanc, '15', iExercicio, iPeriodo, iEmpresa, sMsgContab) <> 0 then
            raise EValidacao.CreateVal('Não é possível fazer o estorno contábil na data indicada:' + #13 + '"' + sMsgContab + '"', edtDataCanc);
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



procedure TfrmCancQuitacao.Sel(i: Int64);
begin
   with dtmEmptmo.qryDadosContrato do begin
      LimpaParametros(dtmEmptmo.qryDadosContrato);
      ParamByName('PIDCONTRATOEMPTMO').AsInteger := i;
      Open;
   end;
end;



procedure TfrmCancQuitacao.btnBuscaContratoClick(Sender: TObject);
begin
   inherited;

   ParametrosSistema;
   if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
   begin
      if dtmMS.MS_ContratoEmptmo.Text <> '' then dtmMS.MS_ContratoEmptmo.Cancela;
   end;

   dtmMS.MS_ContratoEmptmo.Executar;
   Repaint;

   if dtmMS.MS_ContratoEmptmo.RetornouValor then begin

      Screen.Cursor := crHourGlass;
      Sel(StrToInt(dtmMS.MS_ContratoEmptmo.ValoresChave[0]));
      Screen.Cursor := crDefault;

      edtDataCanc.Date := dtmEmptmo.qryDadosContratoQUIDATAPREVISTA.AsDateTime;

   end;

   // Habilita botao de confirma se qry estiver populada
   bbtnConfirmar.Enabled := not(dtmEmptmo.qryDadosContrato.IsEmpty);
end;



procedure TfrmCancQuitacao.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;

   if not(VerificaPreenchimento) then Exit;

   (* Confirmação do processo *)
   if MsgDlg('Deseja realmente CANCELAR a Quitação?', 'Empréstimo', mtConfirmation, [mbYes, mbNo], 0) = mrNo then Exit;

   if not(dtmBaseDados.dbBaseDados.InTransaction) then StartTransacao;

   try
      if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then 
      begin
         with qryEstornaItensAtualizacao do
         begin
            LimpaParametros(qryEstornaItensAtualizacao);
            ParamByName('PIDCONTRATOEMPTMO').AsInteger   := dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsInteger;
            ParamByName('PHMEDATAQUITABONO').AsDateTime  := edtDataCanc.Date;
            ExecSQL;
         end;
      end;

      if CalcEmptmo.CancelaQuitacao(dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsInteger,
                                    dtmEmptmo.qryDadosContratoQUIDATAPREVISTA.AsDateTime,
                                    edtDataCanc.Date,
                                    -1,
                                    dtmEmptmo.qryDadosContrato
                                    ) = 0 then
      begin
         CommitTransacao;

         LimpaParametros(qryVerParcelaGerada);
         qryVerParcelaGerada.ParamByName('PIDCONTRATOEMPTMO').AsInteger  := dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsInteger;
         qryVerParcelaGerada.ParamByName('PHMEANOCOMPETENCIA').AsInteger := dtmEmptmo.qryHistoricoMovHMEANOCOMPETENCIA.AsInteger;
         qryVerParcelaGerada.ParamByName('PHMEMESCOMPETENCIA').AsInteger := dtmEmptmo.qryHistoricoMovHMEMESCOMPETENCIA.AsInteger;
         qryVerParcelaGerada.Open;

         if qryVerParcelaGerada.IsEmpty then
         begin
            MsgDlg('Não existe parcela gerada para o mês/ano da quitação.', 'Empréstimo', mtWarning, [mbOK], 0);
            Repaint;
         end;

         qryVerParcelaGerada.Close;

         bbtnConfirmar.Enabled := False;
         MsgDlg('Quitação cancelada.', 'Empréstimo', mtInformation, [mbOk], 0);
         Repaint;
         Sel(-1);
      end
      else
      begin
         dtmBaseDados.dbBaseDados.Rollback;
      end;

   except
      RollbackTransacao;

      Raise;
      Repaint;

      MsgDlg('Não foi possível cancelar a Quitação.', 'Empréstimo', mtError, [mbOk], 0);
      Repaint;
   end;
end;



procedure TfrmCancQuitacao.FormCreate(Sender: TObject);
begin
   inherited;

//   Fiario := TFiario.Create;

   (* Armazena o Filtro Original do MontaSelect*)
   sFiltroContEmp := dtmMS.MS_ContratoEmptmo.Filtro.Text;

   (* Faz o MontaSelect mostrar, somente os Contratos que estao pendentes de quitação *)
   bRepeteConsulta                  := dtmMS.MS_ContratoEmptmo.RepeteConsulta;   
   dtmMS.MS_ContratoEmptmo.Filtro.Add('CON.FLGSITUACAO IN (''K'', ''Q'')');
end;



procedure TfrmCancQuitacao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//   Fiario.Free;

   dtmEmptmo.qryDadosContrato.Close;

   dtmMS.MS_ContratoEmptmo.Filtro.Clear;
   dtmMS.MS_ContratoEmptmo.Filtro.Text := sFiltroContEmp;
   dtmMS.MS_ContratoEmptmo.RepeteConsulta := bRepeteConsulta;

   dtmEmptmo.qryHistoricoMov.Close;

   inherited;
end;



procedure TfrmCancQuitacao.FormShow(Sender: TObject);
begin
   inherited;

   ParametrosSistema;
   grpTitular.Visible := (dtmEmptmo.qryParamEmptmoFLGMOSTRATIT.AsInteger = 0);
end;



end.
