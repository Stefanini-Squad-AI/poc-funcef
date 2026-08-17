unit FCancAmortizacao;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FSairAjudaImob, wwdblook, wwdbdatetimepicker, CMDateTimePicker, StdCtrls,
   Mask, DBCtrls, fcLabel, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons,
   TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, Wwdatsrc,

   uFiario, uTypesEmptmo;

type
   TfrmCancAmortizacao = class(TfrmSairAjudaImob)
      lblTitulo: TfcLabel;
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
      Label2: TLabel;
    edtDataAmortiza: TCMDateTimePicker;
      dts: TwwDataSource;
      bbtnConfirmar: TBitBtn;
      DBedtFormaPagto: TDBEdit;
      Label5: TLabel;
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

      procedure Sel(i: Int64);
      procedure btnBuscaContratoClick(Sender: TObject);
      procedure bbtnConfirmarClick(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);


  private { Private declarations }

      (* objeto Fiário *)
      Fiario         : TFiario;

  public { Public declarations }

  end;



var
  frmCancAmortizacao: TfrmCancAmortizacao;





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
   dEmptmo;        (* DataModule de Geral*)




procedure TfrmCancAmortizacao.Sel(i: Int64);
begin
   with dtmEmptmo.qryDadosContrato do begin
      LimpaParametros(dtmEmptmo.qryDadosContrato);
      ParamByName('PIDCONTRATOEMPTMO').AsInteger := i;
      Open;
   end;
end;



procedure TfrmCancAmortizacao.btnBuscaContratoClick(Sender: TObject);
begin
   inherited;

   dtmMS.MS_ContrCancAmort.Executar;
   (* redesenha o form na volta do MontaSelect *)
   Repaint;

   if dtmMS.MS_ContrCancAmort.RetornouValor then
   begin
      Screen.Cursor := crHourGlass;
      (* abre a query principal com o participante escolhido *)
      Sel(StrToInt(dtmMS.MS_ContrCancAmort.ValoresChave[0]));
      (* faz a critica de efetivacao com o participante escolhido *)
      Screen.Cursor := crDefault;
   end;(* if MontaSelect.RetornouValor *)


   (*Habilita botao de confirma se qry estiver populada*)
   bbtnConfirmar.Enabled := not(dtmEmptmo.qryDadosContrato.IsEmpty);
end;



procedure TfrmCancAmortizacao.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;

   // Verifica se existe algum contrato no momento
   if dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.IsNull then
   begin
      MsgDlg('É necessário selecionar um contrato.', 'Empréstimo', mtInformation, [mbOK], 0);
      if btnBuscaContrato.CanFocus then  btnBuscaContrato.SetFocus;
      Exit;
   end;

   // Confirmação
   if MsgDlg('Deseja realmente CANCELAR a Amortização', 'Empréstimo', mtConfirmation, [mbYes, mbNo], 0) = mrNo then Exit;

   // Pega o contrato no historico de contrato e verifica se ta vazio
   if not(dtmEmptmo.AbreHistMov(dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsInteger,
                                2,
                                2,
                                dtmEmptmo.qryDadosContratoAMODATAPREVISTA.AsDateTime)) then
   begin
      MsgDlg('Não foram encontrados informações válidas neste contrato','Empréstimo', mtInformation, [mbOK], 0);
      if btnBuscaContrato.CanFocus then btnBuscaContrato.SetFocus;
      Exit;
   end;

   if not dtmBaseDados.dbBaseDados.InTransaction then StartTransacao;

   try

      if CalcEmptmo.CancelaAmortizacao(dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsInteger,
                                       dtmEmptmo.qryDadosContratoAMODATAPREVISTA.AsDateTime,
                                       edtDataAmortiza.Date,
                                       dtmEmptmo.qryDadosContrato
                                       ) = 0 then
      begin
         CommitTransacao;

         bbtnConfirmar.Enabled := False;
         MsgDlg('Processo finalizado.' + #13 + 'Amortização cancelada.', 'Empréstimo', mtInformation, [mbOk], 0);

         Sel(-1);
      end
      else
      begin
         dtmBaseDados.dbBaseDados.Rollback;
      end;

   except
      dtmBaseDados.dbBaseDados.Rollback;
      MsgDlg('Processo interrompido.' + #13 + 'Não foi possível cancelar esta amortização',
             'Empréstimo', mtError, [mbOk], 0);
      Repaint;
      Raise;
      Repaint;
   end;
end;



procedure TfrmCancAmortizacao.FormCreate(Sender: TObject);
begin
   Fiario := TFiario.Create;

   inherited;
end;



procedure TfrmCancAmortizacao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   dtmEmptmo.qryDadosContrato.Close;

   Fiario.Free;
   inherited;
end;




procedure TfrmCancAmortizacao.FormShow(Sender: TObject);
begin
   inherited;

   ParametrosSistema;
   grpTitular.Visible := (dtmEmptmo.qryParamEmptmoFLGMOSTRATIT.AsInteger = 0);
end;



end.
