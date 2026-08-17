// Alterações:
{ --------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 04/12/2002
Autor     : Marchetti
Descrição : Deve existir cálculo de atualização diária quando trabalhar com atualização diária de
            saldo devedor 
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 04/12/2002
Autor     : Marchetti
Descrição : Mostra o total (em valores) de itens em aberto
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 04/12/2002
Autor     : Marchetti
Descrição : Número de parcelas restantes leva em consideração a ultima posição do histórico conforme
            o saldo devedor.
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : btnConfirmarClick
Data      : 29/11/2002
Autor     : Marchetti
Descrição : Não trata o erro quando não existe item a ser enviado, pois pode ter como resultado
            item que não é enviado
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : PreencheTabelaVirtual
Data      : 29/11/2002
Autor     : Marchetti
Descrição : Deixa visivel a forma de envio caso exista algum item de envio
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : qryAmortizacaoAnteriorEmAberto
Data      : 27/11/2002
Autor     : Marchetti
Descrição : Colocado o filtro por hmecentraliza = 1 ou hmedestacado = 1
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : btnContinuaEncerraClick
Data      : 27/11/2002
Autor     : Marchetti
Descrição : Se somente for aumento de prazo, coloca a forma de envio como folha.
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : CalculaItens
Data      : 25/11/2002
Autor     : Marchetti
Descrição : É passado o record dos dados da concessão. Nesse processo os dados seguem sem valor, pois
            os mesmos somente serão utilizados na alteração de valores da concessão.
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : CalculaItens
Data      : 12/11/2002
Autor     : Marchetti
Descrição : Passado o número de parcelas pagas
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : btnBuscaContratoClick
Data      : 23/10/2002
Autor     : Marchetti
Descrição : Limpa o resulta da consulta efetuada anteriormente
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : RepeteConsulta
Data      : 16/10/2002
Autor     : Marchetti
Descrição : ???
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : EnviaCAPCAR
Data      : 09/10/2002
Autor     : Marchetti
Descrição : Colocado o filtro de hmedestacado = 1
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 08/10/2002
Autor     : Marchetti
Descrição : Colocado botao para alterar margem consignavel
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : CalculaParcela
Data      : 08/10/2002
Autor     : Marchetti
Descrição : Colocada critica se valor da parcela está superior a margem consignável
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : Simulacao
Data      : 08/10/2002
Autor     : Marchetti
Descrição : Colocada opção de visualizaçào de simulaçào de prazos permitidos
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : btnBuscaContratoClick
Data      : 08/10/2002
Autor     : Marchetti
Descrição : Atribui o valor do saldo devedor atual ao objeto edtSaldoDevedor
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 01/10/2002
Autor     : Marchetti
Descrição : Carrega variáveis de país, estado e cidade antes de executar os cálculos de itens de
            amortização e itens calculados.
---------------------------------------------------------------------------------------------------}

unit FExecAmortizacao;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FSairAjudaImob, fcLabel, wwdblook, Grids, Wwdbigrd, Wwdbgrid, StdCtrls,
   ExtCtrls, wwdbdatetimepicker, CMDateTimePicker, Mask, DBCtrls, fcButton,
   fcImgBtn, fcShapeBtn, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons,
   TB97Tlbr, TB97, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery,
   TREdit, wwdbedit, Wwdbspin,

   uTypesEmptmo;

type
   TfrmExecAmortizacao = class(TfrmSairAjudaImob)
      ntbPrincipal: TNotebook;
      lblDataAmortizacao: TLabel;
      Bevel2: TBevel;
      Bevel3: TBevel;
      btnContinuaSelecao: TfcShapeBtn;
      btnBuscaContrato: TBitBtn;
      edtDataAmortizacao: TCMDateTimePicker;
      DBgrdHistMov: TwwDBGrid;
      btnCancelaEncerra: TfcShapeBtn;
      btnContinuaEncerra: TfcShapeBtn;
      Panel4: TPanel;
      Bevel1: TBevel;
      Panel9: TPanel;
      btnCancelaAltera: TfcShapeBtn;
      btnConfirmar: TfcShapeBtn;
      DBgrdHistMovVirtual: TwwDBGrid;
      lblTitulo: TfcLabel;
      dts: TwwDataSource;
      qryHistMov: TwwQuery;
      qryHistMovHMEANOCOMPETENCIA: TFloatField;
      qryHistMovHMEMESCOMPETENCIA: TFloatField;
      qryHistMovHMESEQCOBRANCA: TFloatField;
      qryHistMovHMETIPOMOV: TFloatField;
      qryHistMovHMEDATAPREVISTA: TDateTimeField;
      qryHistMovHMEVLRPREVISTO: TFloatField;
      qryHistMovHMESALDODEV: TFloatField;
      qryHistMovHMETXJUROS: TFloatField;
      qryHistMovHMEPARCELA: TFloatField;
      qryHistMovEVENTO: TStringField;
      qryHistMovANOMES: TStringField;
      qryHistMovITEDESCRICAO: TStringField;
      qryHistMovIDCONTRATOEMPTMO: TFloatField;
      qryHistMovIDITEMEMPTMO: TFloatField;
      dtsHistMov: TwwDataSource;
      updHistMovVirtual: TUpdateSQL;
      dtsHistMovVirtual: TwwDataSource;
      qryHistMovVirtual: TwwQuery;
      qryHistMovVirtualHMEANOCOMPETENCIA: TFloatField;
      qryHistMovVirtualHMEMESCOMPETENCIA: TFloatField;
      qryHistMovVirtualHMESEQCOBRANCA: TFloatField;
      qryHistMovVirtualHMETIPOMOV: TFloatField;
      qryHistMovVirtualHMEDATAPREVISTA: TDateTimeField;
      qryHistMovVirtualHMEVLRPREVISTO: TFloatField;
      qryHistMovVirtualHMESALDODEV: TFloatField;
      qryHistMovVirtualHMETXJUROS: TFloatField;
      qryHistMovVirtualHMEPARCELA: TFloatField;
      qryHistMovVirtualEVENTO: TStringField;
      qryHistMovVirtualANOMES: TStringField;
      qryHistMovVirtualITEDESCRICAO: TStringField;
      qryHistMovVirtualIDCONTRATOEMPTMO: TFloatField;
      qryHistMovVirtualIDITEMEMPTMO: TFloatField;
      Bevel4: TBevel;
      Bevel5: TBevel;
      lblVlrAmortizado: TLabel;
      edtVlrAmortizacao: TRealEdit;
      Label5: TLabel;
      DBspnParcelas: TwwDBSpinEdit;
      Label6: TLabel;
      ReValorParcela: TRealEdit;
      lblSaldoDevedor: TLabel;
      edtSaldoDevedor: TRealEdit;
      Label2: TLabel;
      edtParcRestantes: TRealEdit;
      qryAtualizacoesPosteriores: TwwQuery;
      qryAtualizacoesPosterioresHMEDATAATUALIZA: TDateTimeField;
      pnlCAR: TPanel;
      Label30: TLabel;
      DBcboFormaRecebimento: TwwDBLookupCombo;
      DBrdgDebito: TRadioGroup;
      Bevel6: TBevel;
      qryAmortizacaoMesmaData: TwwQuery;
      qryAmortizacaoMesmaDataIDHISTMOVEMPTMO: TFloatField;
      qryAmortizacaoPosterior: TwwQuery;
      FloatField1: TFloatField;
      qryAmortizacaoAnteriorEmAberto: TwwQuery;
      FloatField2: TFloatField;
      qryParcelaAtrasadaEmAberto: TwwQuery;
      FloatField3: TFloatField;
      Label29: TLabel;
      Label21: TLabel;
      Label43: TLabel;
      Label12: TLabel;
      Label17: TLabel;
      Label38: TLabel;
      Label39: TLabel;
      Label3: TLabel;
      Label1: TLabel;
      Label4: TLabel;
      Label7: TLabel;
      Label22: TLabel;
      Label8: TLabel;
      Label9: TLabel;
      Label11: TLabel;
      Label10: TLabel;
      DBedtNumContrato: TDBEdit;
      DBedtJuros: TDBEdit;
      DBedtDataInsc: TCMDateTimePicker;
      DBedtDataCredito: TCMDateTimePicker;
      DBedtValSolic: TDBEdit;
      DBedtValorParcela: TDBEdit;
      DBedtParcelas: TDBEdit;
      DBedtDataPrimParcela: TCMDateTimePicker;
      DBedtPatro: TDBEdit;
      DBedtPlanoPrev: TDBEdit;
      DBedtSitPart: TDBEdit;
      DBedtBeneficiario: TDBEdit;
      grpTitular: TGroupBox;
      Label13: TLabel;
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
      DBEdit4: TDBEdit;
      Label51: TLabel;
      Label14: TLabel;
      btnAlteraMargem: TBitBtn;
      edtMargem: TRealEdit;
      bbtnSimula: TBitBtn;
      qryTipoContrato: TwwQuery;
      qryTipoContratoIDTIPOCONTREMPTMO: TFloatField;
      qryTipoContratoTCEDESCRICAO: TStringField;
      qryTipoContratoIDTIPOEMPTMO: TFloatField;
      qryTipoContratoIDREGRAJURCONC: TFloatField;
      qryTipoContratoIDREGRAELEG: TFloatField;
      qryTipoContratoIDREGRALIMITES: TFloatField;
      qryTipoContratoIDREGRAPRAZOSCONC: TFloatField;
      qryTipoContratoIDREGRAMARGEM: TFloatField;
      qryTipoContratoIDREGRARESERVA: TFloatField;
      qryTipoContratoDESCTIPOEMPTMO: TStringField;
      qryTipoContratoTEPMAXCONTRATO: TFloatField;
      qryTipoContratoFLGOBRIGBENEF: TFloatField;
      qryTipoContratoIDREGRASALBAS: TFloatField;
      qryTipoContratoMOECODIGO: TFloatField;
      qryTipoContratoFLGCONCESSAOZERO: TFloatField;
      qryTipoContratoTCEMINRENOVA: TFloatField;
      qryTipoContratoIDREGRADATACRED: TFloatField;
      Label15: TLabel;
      edtValorParcela: TRealEdit;
      Label19: TLabel;
      edtVlrAberto: TRealEdit;
      dtsTotalizaAberto: TwwDataSource;
      qryTotalizaAberto: TwwQuery;
      qryTotalizaAbertoQUANT_ABERTO: TFloatField;
      qryTotalizaAbertoVALOR_TOTAL_ABERTO: TFloatField;
      qryAtualizacaoDiaria: TwwQuery;
      DateTimeField1: TDateTimeField;
      chkNAOContabiliza: TCheckBox;

      procedure FormCreate(Sender: TObject);
      procedure btnBuscaContratoClick(Sender: TObject);
      procedure btnContinuaSelecaoClick(Sender: TObject);
      procedure btnContinuaEncerraClick(Sender: TObject);
      procedure btnConfirmarClick(Sender: TObject);
      procedure FormShow(Sender: TObject);
      procedure btnCancelaAlteraClick(Sender: TObject);
      procedure btnCancelaEncerraClick(Sender: TObject);
      procedure DBspnParcelasExit(Sender: TObject);
      procedure edtDataAmortizacaoExit(Sender: TObject);
      procedure DBgrdHistMovCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
      procedure DBgrdHistMovVirtualCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
      procedure DBgrdHistMovTopRowChanged(Sender: TObject);
      procedure DBgrdHistMovVirtualTopRowChanged(Sender: TObject);
      procedure DBrdgDebitoClick(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure btnAlteraMargemClick(Sender: TObject);
      procedure edtMargemExit(Sender: TObject);
      procedure bbtnSimulaClick(Sender: TObject);


   private { Private declarations }

      sMes, sAno                       : String;

      iPais                            : Integer;
      sEstado                          : String;
      iCidade                          : Integer;

      sDiaSldDev                       : String;

      rContrato                        : TDadosContrato;
      rConcessao                       : TDadosConcessao;
      vLista, vItensParc               : TListaItem;

      bLimites                         : boolean;
      rSaldosAntPos                    : TSaldosAntPos;

      fMargem, fReserva                : Currency;
      fSldDevAposAmort, fSaldoaQuitar  : Currency;
      fSalParticipacao, fSalMantido    : Currency;
      fSalBenef, fSalAuxDoenca         : Currency;

      dDataFinalBeneficio              : TDateTime;
      sFiltro                          : String;
      bRepeteConsulta                  : Boolean;

      procedure HabilitaBotoes;
      procedure DesabilitaBotoes;
      procedure Sel(i: Int64);

      function VerificaPreenchimento: Boolean;
      function VerificaPreenchimentoAmortizacao: Boolean;

      function ExisteAmortizacaoMesmaData: Boolean;
      function ExisteAmortizacaoPosterior: Boolean;
      function ExisteAmortizacaoAnteriorEmAberto: Boolean;
      function ExisteParcelaAtrasadaEmAberto: Boolean;
      function PossuiAtualizacaoDiaria: Boolean;

      function VerificaAtualizacaoPosterior: Boolean;

      procedure PreencheTabelaVirtual;
      function VerificaBaixa: Boolean;
      function CalculaParcela: Boolean;
      function ValidaNumParcela: Boolean;

      function ContabilizaAmortizacao(const iContrato: Int64; var iPlanilhaResult: Integer;
                                      var sResult, sErro : TStringList): Integer;

      function EnviaAmortizacaoCAPCAR(var iPlanilha: Integer; var sResult, sErro: TStringList): Integer;
      function  Simulacao: Boolean;


  public { Public declarations }


  end;



var
  frmExecAmortizacao: TfrmExecAmortizacao;



implementation
{$R *.DFM}
uses
   uMensErro, uFuncoesEmptmo, dEmptmo, FProgresso, DLookEmptmo, uSistema,
   dBaseDados, uIntegraEmptmo, uVerificaPreenchimento, UCalcEmptmo,
   uDataBase (* Start, Commit, RollBact Transacao *),
   uDocumento, dMS, DDividaEP, RSimula, uModulo (* GetSaldoDoc *);



procedure TfrmExecAmortizacao.FormCreate(Sender: TObject);
begin
   inherited;

   ntbPrincipal.PageIndex := 0;

   edtDataAmortizacao.ButtonWidth   := 21;
   DBedtDataCredito.ButtonWidth     := 21;
   DBedtDataInsc.ButtonWidth        := 21;
   DBedtDataPrimParcela.ButtonWidth := 21;
   sFiltro                          := dtmMS.MS_ContratoEmptmo.Filtro.Text;
   bRepeteConsulta                  := dtmMS.MS_ContratoEmptmo.RepeteConsulta;
   dtmMS.MS_ContratoEmptmo.Filtro.Add('CON.FLGSITUACAO NOT IN (''C'',''Q'')');
end;



procedure TfrmExecAmortizacao.HabilitaBotoes;
begin
   btnContinuaEncerra.Enabled := True;
   btnCancelaEncerra.Enabled  := True;
   btnCancelaAltera.Enabled   := True;
   btnConfirmar.Enabled       := True;
   bbtnAjuda.Enabled          := True;
   bbtnSair.Enabled           := True;

   ntbPrincipal.Enabled       := True;
   Screen.Cursor              := crDefault;
end;



procedure TfrmExecAmortizacao.DesabilitaBotoes;
begin
   Screen.Cursor              := crHourGlass;
   ntbPrincipal.Enabled       := False;

   btnContinuaEncerra.Enabled := False;
   btnCancelaEncerra.Enabled  := False;
   btnCancelaAltera.Enabled   := False;
   btnConfirmar.Enabled       := False;
   bbtnAjuda.Enabled          := False;
   bbtnSair.Enabled           := False;
end;



procedure TfrmExecAmortizacao.btnBuscaContratoClick(Sender: TObject);
begin
   inherited;

   ParametrosSistema;
   if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
   begin
      if dtmMS.MS_ContratoEmptmo.Text <> '' then dtmMS.MS_ContratoEmptmo.Cancela;
   end;

   dtmMS.MS_ContratoEmptmo.Executar;

   // Redesenha o form na volta do MontaSelect
   Repaint;

   if dtmMS.MS_ContratoEmptmo.RetornouValor then
   begin
      Screen.Cursor := crHourGlass;

      (* abre a query principal com o participante escolhido *)
      Sel(StrToInt(dtmMS.MS_ContratoEmptmo.ValoresChave[0]));

      PreencheDadosContrato(dtmEmptmo.qryDadosContrato, rContrato);
      LimpaRegistroConcessao(rConcessao);

      rSaldosAntPos := CalcEmptmo.BuscaSaldosAntPos(dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsInteger,
                                                    edtDataAmortizacao.Date,
                                                    sDiaSldDev);

//      edtSaldoDevedor.Value  := rSaldosAntPos.fSaldoDevAnt;
      edtSaldoDevedor.Value  := rSaldosAntPos.fSaldoDevPos;

//      edtParcRestantes.Value := StrToFloat(FormatFloat('#,##0', (dtmEmptmo.qryDadosContratoPRAZO.AsInteger - rSaldosAntPos.iParcelaPos)));
      edtParcRestantes.Value := rSaldosAntPos.iParcRestaPos;
      
//      RParcelas.Value := ReParcRestantes.Value;

      DBspnParcelas.MinValue := 1;
//      DBspnParcelas.MaxValue := edtParcRestantes.Value;
      DBspnParcelas.Value     := edtParcRestantes.Value;
      edtMargem.Value         := 0;
      edtValorParcela.Value   := 0;
      edtVlrAmortizacao.Value := 0;


      (* Verifica se o Participante já recebeu o Crédito do Empréstimo *)
      if VerificaBaixa then
      begin
         btnContinuaSelecao.Enabled := True;
      end
      else
      begin
         btnContinuaSelecao.Enabled := False;

         MsgDlg('Não é possível Amortizar um Empréstimo cujo crédito ainda não foi confirmado.', 'Empréstimo', mtInformation, [mbOk], 0);
         Repaint;
      end;

      Screen.Cursor := crDefault;

   end; (* if dtmMS.MS_ContratoEmptmo.RetornouValor *)
end;



procedure TfrmExecAmortizacao.Sel(i: Int64);
begin
   with dtmEmptmo.qryDadosContrato do
   begin
      LimpaParametros(dtmEmptmo.qryDadosContrato);
      ParamByName('PIDCONTRATOEMPTMO').AsInteger := i;
      Open;
   end;
end;



function TfrmExecAmortizacao.VerificaBaixa: Boolean;
var
   sSql              : String;
   qryAux            : TwwQuery;
   fSaldo            : Real;
   fSaldoOutraMoeda  : Real;
begin
   qryAux               := TwwQuery.Create(Application);
   qryAux.DatabaseName  := 'BaseDados';

   sSql :=
   'SELECT '                                                                     + #13 +
   '  HMEDATAEFETIVA, CODDOCUMENTO '                                             + #13 +
   'FROM '                                                                       + #13 +
   '  HISTMOVEMPTMO '                                                            + #13 +
   'WHERE '                                                                      + #13 +
   '  ( IDCONTRATOEMPTMO = ' + IntToStr(rContrato.IDContratoEmptmo) + ' ) AND '  + #13 +
   '  ( HMETIPOMOV       = 0 ) AND '                                             + #13 +
   '  ( HMECENTRALIZA    = 1 )';

   qryAux.SQL.Text := sSql;

   try
      qryAux.Open;

      if not(qryAux.FieldByName('HMEDATAEFETIVA').IsNull) then
      begin
         (* Participante já recebeu o Crédito do EP, logo pode quitar o EP *)
         Result := True;
      end
      else
      begin
         (* Participante NÃO recebeu o Crédito do EP *)
         Documento.Saldo.GetSaldoDoc(qryAux.FieldByName('CODDOCUMENTO').AsInteger,
                                     '', (* Data do Saldo - Saldo Atual *) 'P', (* RecPag *)
                                     fSaldo, fSaldoOutraMoeda);

         if fSaldo = 0 then
         begin
            (* Crédito já pago pelo contas a Pagar, logo o participante pode quitar o EP *)
            Result := True
         end
         else
         begin
            (* Crédito ainda NÃO foi pago pelo contas a Pagar, logo o participante não poderá quitar o EP *)
            Result := False;
         end;

      end;

   finally
      qryAux.Free;
   end;
end;



procedure TfrmExecAmortizacao.btnContinuaSelecaoClick(Sender: TObject);
begin
   inherited;

   edtMargem.Value               := 0;
   edtValorParcela.Value         := 0;
   edtVlrAmortizacao.Value       := 0;

   DBrdgDebito.Visible           := False;
   Label30.Visible               := False;
   DBcboFormaRecebimento.Visible := False;

   if not(VerificaPreenchimento) then Exit;

   (* abre a query HistMov com os parâmetros passados *)
   with qryHistMov do
   begin
      LimpaParametros(qryHistMov);
      ParamByName('PIDCONTRATOEMPTMO').AsInteger  := dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsInteger;
      Open;
   end;

   with qryTotalizaAberto do
   begin
      LimpaParametros(qryTotalizaAberto);
      ParamByName('PIDCONTRATOEMPTMO').AsInteger  := dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsInteger;
      Open;
   end;

   edtVlrAberto.Value := qryTotalizaAbertoVALOR_TOTAL_ABERTO.AsCurrency;

   fMargem := edtMargem.Value;

   if edtMargem.Value = 0 then
   begin
      (* função da unit UCalcEmptmo que busca a Margem Consignável do participante *)
      if not dtmEmptmo.qryDadosContratoVLRMARGEM.IsNull then
      begin
         fMargem := dtmEmptmo.qryDadosContratoVLRMARGEM.AsCurrency;
      end
      else
      begin
         fMargem := CalcEmptmo.BuscaMargem(dtmEmptmo.qryDadosContratoIDPESSOA.AsInteger,
                                           dtmEmptmo.qryDadosContratoIDBENEF.AsInteger,
                                           dtmEmptmo.qryDadosContratoIDREGRAMARGEM.AsInteger,
                                           dtmEmptmo.qryDadosContratoVLRSALBASE.AsCurrency,
                                           0, 0,
                                           fSalParticipacao,
                                           fSalMantido,
                                           fSalAuxDoenca,
                                           fSalBenef,
                                           True);
      end;
      edtMargem.Value := fMargem;

   end;

   ntbPrincipal.PageIndex := 1;
end;



procedure TfrmExecAmortizacao.btnContinuaEncerraClick(Sender: TObject);
var
   sMsg     : String;
   sForma   : String;
begin
   inherited;

   qryHistMovVirtual.Close;

   DBrdgDebito.Visible           := False;
   Label30.Visible               := False;
   DBcboFormaRecebimento.Visible := False;

   (* Verificações --------------------------------------------------------------------------------- *)

   if not(ValidaNumParcela) then
   begin
      if DBspnParcelas.Canfocus then DBspnParcelas.Setfocus;
      Exit;
   end
   else
   begin
      rContrato.NumParcelas := Trunc(DBspnParcelas.Value);
   end;


   if not(VerificaPreenchimentoAmortizacao) then Exit;


   if (trim(edtVlrAmortizacao.Text) = '') or (edtVlrAmortizacao.Value = 0) then
   begin
      sMsg  := 'O Valor informado para Amortização está zerado. ' + #13 +
               'Dessa forma, o saldo devedor será apenas REFINANCIADO.' + #13 + #13 +
               'Deseja prosseguir?';

      if MsgDlg(sMsg, 'Empréstimo', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
      begin
         Repaint;
         if edtVlrAmortizacao.CanFocus then edtVlrAmortizacao.SetFocus;
         Exit;
      end;
   end;

   (* ---------------------------------------------------------------------------------------------- *)

   try

      DesabilitaBotoes;

      sMes := FormatDateTime('MM', edtDataAmortizacao.Date);
      sAno := FormatDateTime('YYYY', edtDataAmortizacao.Date);

      (* Chama a função ParametrosSistema da unit UFuncoesEmptmo que abre a tabela
        PARAMEMPTMO. Esta função retorna False se a tabela estiver vazia *)
      if ParametrosSistema then
      begin
         if not(dtmEmptmo.qryParamEmptmoFLGSALDODEVANT.isNULL) then
         begin
            case dtmEmptmo.qryParamEmptmoFLGSALDODEVANT.AsInteger of
               0: sDiaSldDev := 'C';
               1: sDiaSldDev := 'A';
            end;
         end;

         (* Serão utilizados os Parâmetros definidos no Sistema *)
//         if dtmEmptmo.qryParamEmptmoFLGFORMAREC.AsString = 'C' then begin

            if (DBspnParcelas.Value > edtParcRestantes.Value) and (edtVlrAmortizacao.Value = 0) then
            begin
               DBrdgDebito.ItemIndex := 1;
            end
            else
            begin
               DBrdgDebito.ItemIndex := 0;
               DBcboFormaRecebimento.LookupValue := dtmEmptmo.qryParamEmptmoPORTFORMARECTO.AsString;
            end;

            (* Procedimento da unit UFuncoesEmptmo que recebe como parâmetro um componente
               Container (Panel, GroupBox, etc.) e habilita/desabilita o próprio componente
               e os componentes dentro dele, trocando inclusive a cor de Edits e Combobox *)
            AtualizaConjunto(True, pnlCAR);

//         end else begin

//            DBrdgDebito.ItemIndex := 1;

            (* Procedimento da unit UFuncoesEmptmo que recebe como parâmetro um componente
               Container (Panel, GroupBox, etc.) e habilita/desabilita o próprio componente
               e os componentes dentro dele, trocando inclusive a cor de Edits e Combobox *)
//            AtualizaConjunto(False, pnlCAR);
//         end;

      end
      else
      begin
         (* A tabela Parâmetros do Sistema está vazia *)
         MsgDlg('Favor preencher os Parâmetros do Sistema.', 'Empréstimo', mtWarning, [mbOk], 0);
         Repaint;
         DBrdgDebito.ItemIndex := 0;
      end; (*if ParametrosSistema *)

      (* Configurando o Form com a Barra de Progresso que será usado na funçãoCalculaItensAtualiza *)
      with frmProgresso do
      begin
         BotaoVisivel    := True;
         BotaoHabilitado := False;
      end; (* frmProgresso *)

      case DBrdgDebito.ItemIndex of
         0: sForma := 'C';
         1: sForma := 'F';
      end;

      iPais    := -1;
      iCidade  := -1;
      sEstado  := '';

      if ParametrosSistema then
      begin
         iPais    := dtmEmptmo.qryParamEmptmoIDPAIS.AsInteger;
         iCidade  := dtmEmptmo.qryParamEmptmoIDCIDADES.AsInteger;
         sEstado  := dtmEmptmo.qryParamEmptmoCODESTADO.AsString;
      end;

      if not(CalcEmptmo.CalculaItensAmortizacao(rContrato,
                                                2, // Origem
                                                iPais, sEstado, iCidade,
                                                sDiaSldDev,
                                                sForma,
                                                edtVlrAmortizacao.Value,
                                                edtDataAmortizacao.Date,
                                                vLista,
                                                True, False)) then
      begin
         (* Não foi possível atualizar os itens, ou por problemas no Cálculo, ou
            por Cancelamento do Usuário, logo o procedimento será abortado *)
         Exit;
      end;

      PreencheTabelaVirtual;

      if CalculaParcela then ntbPrincipal.PageIndex := 2;

   finally
      HabilitaBotoes;
   end;
end;



procedure TfrmExecAmortizacao.PreencheTabelaVirtual;
var
   i : Integer;
begin

   qryHistMovVirtual.Close;
   qryHistMovVirtual.Open;

   (* Laço que varre o vetor Lista inserindo na tabela virtual TODOS os
      itens calculados *)
   for i := 0 to High(vLista) do
   begin
      if (vLista[i].FlgCentraliza = 1) or (vLista[i].FlgDestacado = 1) then
      begin
         DBrdgDebito.Visible           := True;
         Label30.Visible               := True;
         DBcboFormaRecebimento.Visible := True;
      end;

      qryHistMovVirtual.Insert;

      qryHistMovVirtualITEDESCRICAO.AsString       := vLista[i].Nome;
      qryHistMovVirtualANOMES.AsString             := sMes + '/' + sAno;
      qryHistMovVirtualHMEANOCOMPETENCIA.AsInteger := vLista[i].AnoCompetencia;
      qryHistMovVirtualHMEMESCOMPETENCIA.AsInteger := vLista[i].MesCompetencia;
      qryHistMovVirtualHMESEQCOBRANCA.AsInteger    := vLista[i].SeqCobranca;
      qryHistMovVirtualHMETIPOMOV.AsInteger        := vLista[i].iEvento;

      case vLista[i].iEvento of
        0: qryHistMovVirtualEVENTO.AsString := 'Concessão';
        1: qryHistMovVirtualEVENTO.AsString := 'Parcela';
        2: qryHistMovVirtualEVENTO.AsString := 'Amortização/Refin.';
        3: qryHistMovVirtualEVENTO.AsString := 'Quitação';
        4: qryHistMovVirtualEVENTO.AsString := 'Atualização Débito';
      end;(* case *)

      qryHistMovVirtualIDCONTRATOEMPTMO.AsInteger  := rContrato.IDContratoEmptmo;
      qryHistMovVirtualIDITEMEMPTMO.AsInteger      := vLista[i].CodigoItem;
      qryHistMovVirtualHMEDATAPREVISTA.AsDateTime  := vLista[i].DataPrevista;
      qryHistMovVirtualHMEVLRPREVISTO.AsCurrency   := vLista[i].Valor;
      qryHistMovVirtualHMESALDODEV.AsCurrency      := vLista[i].SaldoDevedor;
      qryHistMovVirtualHMETXJUROS.AsCurrency       := vLista[i].TxJuros;
      qryHistMovVirtualHMEPARCELA.AsInteger        := vLista[i].Parcela;
      fSldDevAposAmort                             := vLista[i].SaldoDevedor;

      qryHistMovVirtual.Post;

   end;(* for *)
end;



procedure TfrmExecAmortizacao.btnConfirmarClick(Sender: TObject);
var
   bErro             : Boolean;
   sMensErro         : String;
   sFormaEnvio       : String;
   i, iResult        : Integer;
   iPlanilhaResult   : Integer;
   fVlrAmortizacao   : Currency;
   sResult, sErro    : TStringList;
   iIdHistMovEmptmo  : Int64;
begin
   inherited;

   bErro       := False;
   sMensErro   := '';
   sResult     := TStringList.Create;
   sErro       := TStringList.Create;

   (* verifica o preenchimento do PortadorForma se o destino for CaR *)
   if ( (DBrdgDebito.ItemIndex = 0) and (DBcboFormaRecebimento.LookupValue = '') ) then
   begin
      sMensErro := 'É necessário indicar a Conta de Caixa x Forma Recebimento!';
      MsgDlg(sMensErro, 'Empréstimo', mtWarning, [mbOk], 0);
      Repaint;
      Exit;
   end;

   DesabilitaBotoes;

   (* Inicia uma transação *)
   if not(dtmBaseDados.dbBaseDados.InTransaction) then StartTransacao;

   try

     (*******************************************************************************
      |               HISTÓRICO  DO  EMPRÉSTIMO  A SER QUITADO                      |
      |                                                                             |
      | função que varre a lista de itens de um contrato e se for o caso,           |
      |  chama a função que grava o Histórico do Movimento na tabela HISTMOVEMPTMO. |
      |  A saída será True se a operação foi bem sucedida e False caso negativo     |
      *******************************************************************************)

      case DBrdgDebito.ItemIndex of
         0: sFormaEnvio := 'C';
         1: sFormaEnvio := 'F';
      end;

      if not CalcEmptmo.GravaMovEmptmo(rContrato, vLista, 2,                           (* Evento 2 - Amortização *)
                                       qryHistMovVirtualHMEPARCELA.AsInteger,          (* Parcela *)
                                       qryHistMovVirtualHMEANOCOMPETENCIA.AsInteger,   (* Ano Competência - Ano do Item *)
                                       qryHistMovVirtualHMEMESCOMPETENCIA.AsInteger,   (* Mês Competência - Mês do Item *)
                                       StrToInt(sAno),                                 (* Ano Cobrança - Ano da Data de Quitação *)
                                       StrToInt(sMes),                                 (* Mês Cobranca - Mês da Data de Quitação *)
                                       trunc(DBspnParcelas.Value),                     (* Parcelas Remanescentes *)
                                       edtDataAmortizacao.Date,                        (* DataPrevista -> Data de Amortização *)
                                       (* dDataUltAtualiza -> Data de Amortização *)
                                       rSaldosAntPos.dDataAtuPos,
                                       sFormaEnvio,
                                       '',
                                       True(* Mostra o Form de Progresso *),
                                       iIdHistMovEmptmo
                                      ) then
      begin
         (* Gravação do Histórido com Erro *)
         bErro       := True;
         sMensErro   := '[ Gravação do Histórido dos Itens de Contrato ]';
         Exit;
      end;(* if GravaMovEmptmo *)


      // -------------------------------------------------------------------------------------------
      //    Contabilização
      // -------------------------------------------------------------------------------------------
      if not(chkNAOContabiliza.Checked) then
      begin
         ParametrosSistema;
         if (dtmemptmo.qryParamEmptmoFLGINTEGRACONTAB.AsInteger = 1) and
            (dtmEmptmo.qryParamEmptmoFLGINTEGRAQUITA.AsInteger = 0)  then
         begin
            iResult := ContabilizaAmortizacao(rContrato.IDContratoEmptmo, iPlanilhaResult, sResult, sErro);

            if iResult <> 0 then
            begin
               (* Contabilização com Erro *)
               bErro := True;

               case iResult of
                  -1 : sMensErro := '[ ERRO ao tentar selecionar os itens a contabilizar ]';
                  -2 : sMensErro := '[ Query não retornou itens a contabilizar ]';
                  -3 : sMensErro := '[ ERRO ao tentar criar tabela para agrupamento ]';
                  -4 : sMensErro := '[ ERRO ao buscar Parâmetros de Integração ]';
                  -5 : sMensErro := '[ ERRO ao fazer o Lançamento Contábil ]';
                  -6 : sMensErro := '[ ERRO no Período Contábil ]';
                  -7 : sMensErro := '[ Processo interrompido pelo usuário sem contabilização ]';
               end;(* case *)

               sMensErro := sMensErro + #13 + sErro.Strings[sErro.Count -1];

               Exit;
            end;  // if iResult <> 0
         end;  // if (dtmEmptmo.qryParamEmptmoFLGINTEGRACONTAB.AsInteger = 1)
      end;  // if not(chkNAOContabiliza.Checked)
      // -------------------------------------------------------------------------------------------
      //    FIM Contabilização
      // -------------------------------------------------------------------------------------------


      // -------------------------------------------------------------------------------------------
      //    Envio
      // -------------------------------------------------------------------------------------------
      (* laço para vrificar o valor "líquido" (a enviar) de Amortização *)
      for i := 0 to High(vLista) do
      begin
         if ( (vLista[i].iEvento = 2) and (vLista[i].FlgCentraliza = 1) ) then
         begin
            fVlrAmortizacao := vLista[i].Valor;
         end;
      end;

      (* só envia se houver valor líquido a enviar *)
      if fVlrAmortizacao > 0 then
      begin
         if DBrdgDebito.ItemIndex = 0 then
         begin
            // o Débito é pelo Contas a Receber
            iPlanilhaResult := 0;
            iResult         := EnviaAmortizacaoCAPCAR(iPlanilhaResult, sResult, sErro);

            if (iResult <> 0) and (iResult <> -2) then
            begin
               (* Envio CAP com Erro *)
               bErro := True;

               case iResult of
               (* Códigos de retorno (controle de erro):
                   0 : Envio(s) realizados com sucesso *)
                  -1 : sMensErro := '[ ERRO ao tentar selecionar os itens a enviar ao CAP/CAR ]';
//                  -2 : sMensErro := '[ Query não retornou itens a Enviar ao CAP/CAR ]';
                  -3 : sMensErro := '[ ERRO ao inserir Documento no CAP/CAR ]';
                  -4 : sMensErro := '[ ERRO no Rateio do Documento no CAP/CAR ]';
                  -5 : sMensErro := '[ ERRO ao Lançar Documento no CAP/CAR ]';
                  -6 : sMensErro := '[ ERRO ao inserir Mensagens no Documento ]';
                  -7 : sMensErro := '[ ERRO ao Atualizar Histórico com o Documento no CAP/CAR ]';
                  -8 : sMensErro := '[ Processo interrompido pelo usuário sem envio ao CAP/CAR ]';
               end;(* case *)

               sMensErro := sMensErro + #13 +
                            sErro.Strings[sErro.Count -1];

               Exit;
            end; (* if Result CAP *)
         end
         else
         begin
            (* o Débito é pela Folha: NADA é feito na Quitação.
               A Quitação será enviado para TMPDESC pela rotina do ENVIO *)
         end; (* if FlgFormaPag *)

      end; (* if fVlrAmortizacao > 0 *)
      // -------------------------------------------------------------------------------------------
      //    FIM Envio
      // -------------------------------------------------------------------------------------------


      (* Atualiza a Situação do Contrato (FLGSITUACAO) = 'A' -> 'Ativo' *)
      if not CalcEmptmo.AtualizaFlgSituacao(rContrato.IDInscricaoEmptmo, 'CONTRATOEMPTMO', 'A', sMensErro) then
      begin
         (* Atualização da Situação do Contrato com Erro *)
         bErro := True;
         sMensErro := '[ Atualização da Situação do Contrato ]' + #13 + sMensErro;
         Exit;
      end;(* if Atualiza Flag Situação do Contrato *)


      // -------------------------------------------------------------------------------------
      // Log de operações
      if not(Sistema.GravaLogOperacoes('Amortização do Contrato ' +
                                       IntToStr(rContrato.IDContratoEmptmo) + ' ref: ' +
                                       FormatDateTime('dd/mm/yyyy', edtDataAmortizacao.Date))) then
      begin
         bErro := True;
         sMensErro := '[ Falha na gravação do Log da operação ]' + #13 + sMensErro;
      end;
      // -------------------------------------------------------------------------------------


   finally
      if bErro then
      begin
         // Houve erro
         if dtmBaseDados.dbBaseDados.InTransaction then RollbackTransacao;

         MsgDlg('Erro na Amortização do Contrato' + #13 + sMensErro, 'Empréstimo', mtError, [mbOk], 0);
         Repaint;
      end
      else
      begin
         // Não Houve erro - tudo OK
         if dtmBaseDados.dbBaseDados.InTransaction then CommitTransacao;

         (* fecha a qry *)
         LimpaParametros(dtmEmptmo.qryDadosContrato);

         (* volta para primeira página *)
         ntbPrincipal.PageIndex  := 0;

         MsgDlg('Amortização realizada com Sucesso.', 'Empréstimo', mtInformation, [mbOk], 0);
         Repaint;
      end; // if bErro

      HabilitaBotoes;
      sResult.Free;
      sErro.Free;
   end;  // try..finally
end;



procedure TfrmExecAmortizacao.FormShow(Sender: TObject);
begin
   inherited;
   edtDataAmortizacao.Date := Date;

   with dtmLookEmptmo.qryLookPortadorFormaR do
   begin
      LimpaParametros(dtmLookEmptmo.qryLookPortadorFormaR);
      ParamByName('PIDPESSOA').AsInteger := Sistema.IDEmpresa;
      Open;
   end;

   ParametrosSistema;

   if not(dtmEmptmo.qryParamEmptmoFLGSALDODEVANT.isNULL) then
   begin
      case dtmEmptmo.qryParamEmptmoFLGSALDODEVANT.AsInteger of
         0: sDiaSldDev := 'C';
         1: sDiaSldDev := 'A';
      end;
   end;

   grpTitular.Visible := (dtmEmptmo.qryParamEmptmoFLGMOSTRATIT.AsInteger = 0);
end;



procedure TfrmExecAmortizacao.btnCancelaAlteraClick(Sender: TObject);
begin
   inherited;
   ntbPrincipal.PageIndex := 1;
end;



procedure TfrmExecAmortizacao.btnCancelaEncerraClick(Sender: TObject);
begin
   inherited;
   ntbPrincipal.PageIndex := 0;
end;



function TfrmExecAmortizacao.ContabilizaAmortizacao(const iContrato: Int64;
                                                    var iPlanilhaResult: Integer;
                                                    var sResult, sErro : TStringList): Integer;
var sSql, sMensagem: String;
begin

   sSql :=
   'SELECT '                                                                                 + #13 +
   '  H.IDHISTMOVEMPTMO, H.IDCONTRATOEMPTMO, H.IDITEMEMPTMO, '                               + #13 +
   '  H.HMEFORMACOBRANCA, H.HMEVLRPREVISTO, H.HMEVLRPREVISTO, '                              + #13 +
   '  C.IDTIPOCONTREMPTMO, C.IDPLANOPREV, C.IDPATRO, '                                       + #13 +
   '  ITC.TIPCODIGO '                                                                        + #13 +

   'FROM '                                                                                   + #13 +
   '  HISTMOVEMPTMO H, '                                                                     + #13 +
   '  CONTRATOEMPTMO C, '                                                                    + #13 +
   '  ITEMXTIPOCONTR ITC, '                                                                  + #13 +
   '  TIPOCONTREMPTMO TC, '                                                                  + #13 +
   '  TIPOEMPTMO TE '                                                                        + #13 +

   'WHERE '                                                                                  + #13 +
   '      ( H.IDCONTRATOEMPTMO      = ' + IntToStr(iContrato) + ' ) '                        + #13 +
   '  AND ( TE.IDEMPRESAPROP        = ' + IntToStr(Sistema.IDEmpresa) + ' ) '                 + #13 +
   '  AND ( H.HMETIPOMOV            = 2 ) '                                                  + #13 +
   '  AND ( (H.HMECENTRALIZA = 0)   OR (H.HMECENTRALIZA IS NULL) ) '                         + #13 +
	'  AND ( (H.FLGESTORNADO = 0)    OR (H.FLGESTORNADO IS NULL) ) '                          + #13 +
	'  AND ( H.HMEDATAPREVISTA = TO_DATE(' + QuotedStr(edtDataAmortizacao.Text) + ',''DD/MM/YYYY'' )) ' + #13 +
	'  AND ( H.FLGQUITADO            = 0 OR H.FLGQUITADO IS NULL ) '                                                         + #13 +
	'  AND ( H.FLGABONADO            = 0 OR H.FLGABONADO IS NULL ) '                                                         + #13 +
   '  AND ( H.IDCONTRATOEMPTMO      = C.IDCONTRATOEMPTMO  ) '                                + #13 +
   '  AND ( C.IDTIPOCONTREMPTMO     = TC.IDTIPOCONTREMPTMO ) '                               + #13 +
   '  AND ( TC.IDTIPOEMPTMO         = TE.IDTIPOEMPTMO ) '                                    + #13 +
   '  AND ( C.IDTIPOCONTREMPTMO     = ITC.IDTIPOCONTREMPTMO ) '                              + #13 +
   '  AND ( H.IDITEMEMPTMO          = ITC.IDITEMEMPTMO ) '                                   + #13 +
   '  AND ( ITC.IDTIPOCONTREMPTMO   = TC.IDTIPOCONTREMPTMO ) '                               + #13 +
	'  AND ( H.FLGBAIXADO = 0 )';

   sMensagem := 'Amortização do EP - ' + IntToStr(iContrato);

   Result := IntegraEmptmo.ContabilizaItens('C', 'N', sSql, sMensagem,	(* Histórico *)
                                            edtDataAmortizacao.Date,			(* Data do Lançamento *)
                                            sResult(* Acertos *), sErro (* Erros *),
                                            iPlanilhaResult); 				(* Planilha *)
end;



function TfrmExecAmortizacao.EnviaAmortizacaoCAPCAR(var iPlanilha: Integer;
                                                    var sResult,sErro: TStringList): Integer;
var
	sSql: String;
begin

   sSql :=
   'SELECT '                                                                                 + #13 +
   '  HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO, HME.IDITEMEMPTMO, '                         + #13 +
   '  HME.HMEFORMACOBRANCA, HME.IDITEMCENTRALIZA, HME.HMEVLRPREVISTO, '                      + #13 +
   '  HME.HMERECPAG, HME.HMEDATAPREVISTA, HME.HMEDATAVENCTO, '                               + #13 +
   '  HME.HMEPARCELA, HME.HMENUMPARCELAS, HME.HMESALDODEV, '                                 + #13 +

   '  (LTRIM(RTRIM(TO_CHAR(HME.HMEMESCOMPETENCIA, ''00'')))) '                               + #13 +
   '  || ''/'' || '                                                                          + #13 +
   '  (LTRIM(RTRIM(TO_CHAR(HME.HMEANOCOMPETENCIA, ''0000'')))) AS ANOMESCOMPETENCIA, '       + #13 +

   '  ITC.CONTABAIXA, ITC.TIPCODIGO, ITc.ITCTRATASALDODEV, '                                 + #13 +
   '  CNT.IDPLANOPREV, CNT.IDPATRO, CNT.IDBENEF, CNT.IDPESSOA, '                             + #13 +
   '  CNT.CODFORMAPAG, CNT.PORTFORMAPAG, CNT.IDTIPOSUSPEMPTMO, '                             + #13 +
   '  TIP.IDTIPOCONTREMPTMO, IRC.ITEDESCRICAO, CNT.IDCBANCARIA, '                            + #13 +

    DBcboFormaRecebimento.LookupValue + ' AS PORTFORMAREC '                                  + #13 +

   'FROM '                                                                                   + #13 +
   '  HISTMOVEMPTMO HME, '                                                                   + #13 +
   '  CONTRATOEMPTMO CNT, '                                                                  + #13 +
   '  ITEMXTIPOCONTR ITC, '                                                                  + #13 +
   '  TIPOCONTREMPTMO TIP, '                                                                 + #13 +
   '  TIPOEMPTMO TEM, '                                                                      + #13 +
   '  ITEMEMPTMO IRC '                                                                       + #13 +

   'WHERE '                                                                                  + #13 +
   '  ( HME.IDCONTRATOEMPTMO = '+ IntToStr(rContrato.IDContratoEmptmo) + ' ) AND '           + #13 +
   '  ( TEM.IDEMPRESAPROP    = ' + IntToStr(Sistema.IdEmpresa) + ' ) AND '                   + #13 +
   '  ( HME.HMECENTRALIZA    = 1 OR HME.HMEDESTACADO = 1) AND '                              + #13 +
   '  ( HME.FLGBAIXADO       = 0 ) AND '                                                     + #13 +
   '  ( HME.HMETIPOMOV       = 2 ) AND '                                                     + #13 +
   '  ( (HME.FLGESTORNADO    IS NULL ) OR (HME.FLGESTORNADO = 0) ) AND '                     + #13 +
   '  ( HME.IDCONTRATOEMPTMO  = CNT.IDCONTRATOEMPTMO  ) AND '                                + #13 +
   '  ( CNT.IDTIPOCONTREMPTMO = TIP.IDTIPOCONTREMPTMO ) AND '                                + #13 +
   '  ( TIP.IDTIPOEMPTMO      = TEM.IDTIPOEMPTMO ) AND '                                     + #13 +
   '  ( CNT.IDTIPOCONTREMPTMO = ITC.IDTIPOCONTREMPTMO ) AND '                                + #13 +
   '  ( ITC.IDITEMEMPTMO      = IRC.IDITEMEMPTMO ) AND '                                     + #13 +
   '  ( ITC.IDITEMEMPTMO      = HME.IDITEMEMPTMO )';

   Result := IntegraEmptmo.EnviaCAPCAR(sSql,
                                       'Amortização - ',
                                       edtDataAmortizacao.Date,
                                       -1,
                                       Modulo.iMoedaCorrente,
                                       Modulo.sCentroCusto,
                                       Modulo.iPrograma,
                                       iPlanilha,
                                       sResult,
                                       sErro
                                       );
end;



procedure TfrmExecAmortizacao.DBspnParcelasExit(Sender: TObject);
begin
   inherited;

//   if not(ValidaNumParcela) then begin
//      if DBspnParcelas.Canfocus then DBspnParcelas.Setfocus;
//      Exit;
//   end;
end;



function TfrmExecAmortizacao.ValidaNumParcela: boolean;
begin
{
   if DBspnParcelas.Value > edtParcRestantes.Value then begin

      MsgDlg('O novo prazo não pode ser maior que o total de parcelas remanescentes.',
             'Empréstimo', mtWarning, [mbOk], 0);
      Repaint;

      DBspnParcelas.Value := StrToFloat(FormatFloat('#,##0', edtParcRestantes.Value));
      Result := False;

      if DBspnParcelas.Canfocus then DBspnParcelas.Setfocus;
      Exit;

   end else
}
   if DBspnParcelas.Text = '' then
   begin
      MsgDlg('O prazo não pode ser branco.', 'Empréstimo', mtWarning,[mbOk],0);
      Repaint;
      DBspnParcelas.Value  := StrToFloat(FormatFloat('#,##0', edtParcRestantes.Value));
      Result               := False;
   end
   else if DBspnParcelas.Text = '0' then
   begin
      MsgDlg('O prazo não pode ser zero.', 'Empréstimo', mtWarning, [mbOk], 0);
      Repaint;
      DBspnParcelas.Value  := StrToFloat(FormatFloat('#,##0', edtParcRestantes.Value));
      Result               := False;
   end
   else
   begin
      Result := True;
   end;
end;



function TfrmExecAmortizacao.CalculaParcela: Boolean;
var
   i : integer;
begin
   Result := True;

   (* Procedure que Calcula o Valor da parcela, verificando também se é atendida
      a Regra de Limites e calculando o valor Líquido do Empréstimo *)

   (* Se o usuário ainda não preencheu o Valor solicitado, o procedimento é
      abortado*)
   if ((edtVlrAmortizacao.Text = '' ) or (edtVlrAmortizacao.Text = '0')) then Exit;

   iPais    := -1;
   iCidade  := -1;
   sEstado  := '';

   if ParametrosSistema then
   begin
      iPais    := dtmEmptmo.qryParamEmptmoIDPAIS.AsInteger;
      iCidade  := dtmEmptmo.qryParamEmptmoIDCIDADES.AsInteger;
      sEstado  := dtmEmptmo.qryParamEmptmoCODESTADO.AsString;
   end;

   if CalcEmptmo.CalculaItens(rContrato,
                              rConcessao,
                              1, // Evento = Parcela
                              2, // Origem = Geração de Parcelas
                              iPais, sEstado, iCidade,
                              rSaldosAntPos.iParcelaPos,
                              dtmEmptmo.qryDadosContratoIDSITPART.AsInteger,
                              rContrato.FlgFormaRec,
                              rSaldosAntPos.fTxJurosPos,
                              fSldDevAposAmort,
                              0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                              (* VlrSolic, SaldoQuit, Margem, Reserva, SalPart,
                              SalMantido, SalDoenca, SalBenef, VlrMaxPermit *)
                              0, 0, 0,
                              edtDataAmortizacao.Date, rSaldosAntPos.dDataAtuPos, ' ',
                              True, False, False, vItensParc) then

   for i := 0 to High(vItensParc) do
   begin
      (* é a Parcela *)
      if ( (vItensParc[i].iEvento = 1) and (vItensParc[i].FlgCentraliza = 1) ) then
      begin
         if vItensParc[i].Valor > 0 then
         begin
            ReValorParcela.Value  := vItensParc[i].Valor;
            edtValorParcela.Value := vItensParc[i].Valor;
         end
         else
         begin
            edtValorParcela.Value := 0;
            ReValorParcela.Value  := 0;
         end;

      end;
   end;

   fMargem := edtMargem.Value;

   if edtMargem.Value = 0 then
   begin
      (* função da unit UCalcEmptmo que busca a Margem Consignável do participante *)
      if not dtmEmptmo.qryDadosContratoVLRMARGEM.IsNull then
      begin
         fMargem := dtmEmptmo.qryDadosContratoVLRMARGEM.AsCurrency;
      end
      else
      begin
         fMargem := CalcEmptmo.BuscaMargem(dtmEmptmo.qryDadosContratoIDPESSOA.AsInteger,
                                           dtmEmptmo.qryDadosContratoIDBENEF.AsInteger,
                                           dtmEmptmo.qryDadosContratoIDREGRAMARGEM.AsInteger,
                                           dtmEmptmo.qryDadosContratoVLRSALBASE.AsCurrency,
                                           0, 0,
                                           fSalParticipacao,
                                           fSalMantido,
                                           fSalAuxDoenca,
                                           fSalBenef,
                                           True);
      end;
      edtMargem.Value := fMargem;

   end;

   if (ReValorParcela.Value > fMargem) then
   begin
      MsgDlg('Valor da prestação: ' + FormatFloat('#,##0.00',ReValorParcela.Value) + ' não pode ser superior a margem consignável!', 'Empréstimo', mtWarning, [mbOk], 0);
      bbtnSimula.Enabled := True;
      Result := False;
      Repaint;
      Exit;
   end;

   (* função da unit UCalcEmptmo que busca a Reserva de Poupança do participante ou
      do beneficiário, no caso do pensionista *)
   fReserva := CalcEmptmo.BuscaReserva(dtmEmptmo.qryDadosContratoIDBENEF.AsInteger, dtmEmptmo.qryDadosContratoIDPATRO.AsInteger,
                                       dtmEmptmo.qryDadosContratoIDPLANOPREV.AsInteger, dtmEmptmo.qryDadosContratoIDREGRARESERVA.AsInteger,
                                       dtmEmptmo.qryDadosContratoDATAASSINATURA.AsDateTime, True);

   (* função da unit UCalcEmptmo que verifica se o participante atende Limites
      de concessão e limites de Quantidade e Prazos do Contrato/Empréstimo.
      O Atributo Flimites(PRIVATE) armazena o resultado da Regra de Limites *)
   bLimites := CalcEmptmo.BuscaLimites(rContrato, 2, (* origem = Amortização *)
                                       dtmEmptmo.qryDadosContratoIDSITPART.AsInteger,
                                       dtmEmptmo.qryDadosContratoIDREGRALIMITES.AsInteger,
                                       dDataFinalBeneficio, fMargem, fReserva,
                                       0, 0, fSaldoaQuitar,
                                       dtmEmptmo.qryDadosContratoDATAASSINATURA.AsDateTime,
                                       True(* Mostra *));
   if not(bLimites) then
   begin
      Result := False;

      MsgDlg('Empréstimo não passou na Regra de Limites.', 'Empréstimo', mtWarning, [mbOk], 0);
      Repaint;
      Exit;
   end;(* if not bLimites *)
end;



procedure TfrmExecAmortizacao.edtDataAmortizacaoExit(Sender: TObject);
begin
   inherited;

   PreencheDadosContrato(dtmEmptmo.qryDadosContrato, rContrato);

   rSaldosAntPos           := CalcEmptmo.BuscaSaldosAntPos(dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsInteger,
                                                           edtDataAmortizacao.Date,
                                                           sDiaSldDev);

//   edtSaldoDevedor.Value   := rSaldosAntPos.fSaldoDevAnt;
   edtSaldoDevedor.Value   := rSaldosAntPos.fSaldoDevPos;

//   edtParcRestantes.Value  := StrToFloat(FormatFloat('#,##0', (dtmEmptmo.qryDadosContratoPRAZO.AsInteger - rSaldosAntPos.iParcelaPos)));
   edtParcRestantes.Value  := rSaldosAntPos.iParcRestaPos;

   DBspnParcelas.MinValue  := 1;
//  DBspnParcelas.MaxValue := edtParcRestantes.Value;
   DBspnParcelas.Value     := edtParcRestantes.Value;
end;



function TfrmExecAmortizacao.VerificaPreenchimento: Boolean;
begin
   Result := False;

   try
      if length(trim(edtDataAmortizacao.Text)) = 0 then
         raise EValidacao.CreateVal('É necessário indicar a Data da Amortização!', edtDataAmortizacao);

      if edtDataAmortizacao.Date <= rContrato.DataCredito then
         raise EValidacao.CreateVal('A Data da Amortização precisa ser posterior à Data de Crédito do Empréstimo!', edtDataAmortizacao);

      (* verifica se já houve amortização na própria data: THERE CAN BE ONLY ONE !!! *)
      if ExisteAmortizacaoMesmaData then
         raise EValidacao.CreateVal('Já houve uma Amortização na data indicada!', edtDataAmortizacao);

      if ExisteAmortizacaoPosterior then
         raise EValidacao.CreateVal('Já existe uma Amortização posterior à data indicada!', edtDataAmortizacao);

      if ExisteAmortizacaoAnteriorEmAberto then
         raise EValidacao.CreateVal('Existe uma Amortização anterior em aberto!', edtDataAmortizacao);

      ParametrosSistema;

      if dtmEmptmo.qryParamEmptmoFLGAMTPRESTAB.AsInteger = 1 then
         if ExisteParcelaAtrasadaEmAberto then
            raise EValidacao.CreateVal('Existe(m) parcela(s) anterior(es) em aberto!', edtDataAmortizacao);

      (* se a amortização for antes da data de última atualização, verifica quantas atualizações
         posteriores à data de amortizção existem: THERE CAN BE ONLY ONE !!! *)
      if edtDataAmortizacao.Date <= dtmEmptmo.qryDadosContratoDATAULTATUALIZA.AsDateTime then
         if (ParametrosSistema) and (dtmEmptmo.qryParamEmptmoFLGCALCDIA.AsInteger <> 1) then
            if not(VerificaAtualizacaoPosterior) then
               raise EValidacao.CreateVal('Há mais de uma atualização do Saldo Devedor posterior à data de Amortização!', edtDataAmortizacao);

      (* Se trabalha com atualizaçào diária, deve existir cálculo da mesma para a data da amortização *)
      if dtmEmptmo.qryParamEmptmoFLGCALCDIA.AsInteger = 1 then
        if not(PossuiAtualizacaoDiaria) then
            raise EValidacao.CreateVal('NÃO existe Atualização Diária para a Data da Amortização!', edtDataAmortizacao);

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



function TfrmExecAmortizacao.VerificaPreenchimentoAmortizacao: Boolean;
begin
   Result := False;

   try

      if edtVlrAmortizacao.Value >= edtSaldoDevedor.Value then
         raise EValidacao.CreateVal('O Valor informado para Amortização está maior ou igual ao saldo ' +
                                    'devedor. ' + #13 + 'Se desejar quitar o Empréstimo, favor proceder ' +
                                    'a uma Quitação.', edtVlrAmortizacao);

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



function TfrmExecAmortizacao.ExisteAmortizacaoMesmaData: Boolean;
begin
   Result := False;

   try
      with qryAmortizacaoMesmaData do
      begin
         LimpaParametros(qryAmortizacaoMesmaData);
         ParamByName('PIDCONTRATOEMPTMO').AsInteger   := dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsInteger;
         ParamByName('PHMEDATAPREVISTA').AsDateTime   := edtDataAmortizacao.Date;
         Open;

         if not(IsEmpty) then Result := True;
      end;

   finally
      qryAmortizacaoMesmaData.Close;
   end
end;



function TfrmExecAmortizacao.ExisteAmortizacaoPosterior: Boolean;
begin
   Result := False;

   try
      with qryAmortizacaoPosterior do
      begin
         LimpaParametros(qryAmortizacaoPosterior);
         ParamByName('PIDCONTRATOEMPTMO').AsInteger   := dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsInteger;
         ParamByName('PHMEDATAPREVISTA').AsDateTime   := edtDataAmortizacao.Date;
         Open;

         if not(IsEmpty) then Result := True;
      end;

   finally
      qryAmortizacaoPosterior.Close;
   end
end;



function TfrmExecAmortizacao.ExisteParcelaAtrasadaEmAberto: Boolean;
begin
   Result := False;

   try
      with qryParcelaAtrasadaEmAberto do
      begin
         LimpaParametros(qryParcelaAtrasadaEmAberto);
         ParamByName('PIDCONTRATOEMPTMO').AsInteger   := dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsInteger;
         ParamByName('PHMEDATAPREVISTA').AsDateTime   := edtDataAmortizacao.Date;
         Open;

         if not(IsEmpty) then Result := True;
      end;

   finally
      qryParcelaAtrasadaEmAberto.Close;
   end
end;



function TfrmExecAmortizacao.ExisteAmortizacaoAnteriorEmAberto: Boolean;
begin
   Result := False;

   try
      with qryAmortizacaoAnteriorEmAberto do
      begin
         LimpaParametros(qryAmortizacaoAnteriorEmAberto);
         ParamByName('PIDCONTRATOEMPTMO').AsInteger   := dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsInteger;
         ParamByName('PHMEDATAPREVISTA').AsDateTime   := edtDataAmortizacao.Date;
         Open;

         if not(IsEmpty) then Result := True;
      end;

   finally
      qryAmortizacaoAnteriorEmAberto.Close;
   end
end;



function TfrmExecAmortizacao.VerificaAtualizacaoPosterior: Boolean;
begin
   Result := True;

   try
      with qryAtualizacoesPosteriores do
      begin
         LimpaParametros(qryAtualizacoesPosteriores);
         ParamByName('PIDCONTRATOEMPTMO').AsInteger   := dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsInteger;
         ParamByName('PHMEDATAATUALIZA').AsDateTime   := edtDataAmortizacao.Date;
         Open;

         if ( not(IsEmpty) and (RecordCount > 1) ) then Result := False;
      end;

   finally
      qryAtualizacoesPosteriores.Close;
   end
end;



function TfrmExecAmortizacao.PossuiAtualizacaoDiaria: Boolean;
begin
   Result := True;

   try
      with qryAtualizacaoDiaria do
      begin
         LimpaParametros(qryAtualizacaoDiaria);
         ParamByName('PIDCONTRATOEMPTMO').AsInteger   := dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsInteger;
         ParamByName('PHMEDATAATUALIZA').AsDateTime   := edtDataAmortizacao.Date;
         Open;

         if ( IsEmpty ) then Result := False;
      end;

   finally
      qryAtualizacaoDiaria.Close;
   end
end;



procedure TfrmExecAmortizacao.DBgrdHistMovCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
   inherited;

   (* faz com que as linhas do grid tenham cores alternadas *)
   if State <> [gdSelected] then
   begin
      if not Highlight then
      begin
         (* linhas ímpares = amarelo, linhas pares = branco *)
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then
         begin
            ABrush.Color := $00C0FFFF; (* amarelo bebê *)
         end
         else
         begin
            ABrush.Color := clWhite;
         end;
      end;
   end
   else
   begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
end;



procedure TfrmExecAmortizacao.DBgrdHistMovVirtualCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
   inherited;

   (* faz com que as linhas do grid tenham cores alternadas *)
   if State <> [gdSelected] then
   begin
      if not Highlight then
      begin
         (* linhas ímpares = amarelo, linhas pares = branco *)
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then
         begin
            ABrush.Color := $00C0FFFF; (* amarelo bebê *)
         end
         else
         begin
            ABrush.Color := clWhite;
         end;
      end;
   end
   else
   begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
end;



procedure TfrmExecAmortizacao.DBgrdHistMovTopRowChanged(Sender: TObject);
begin
   inherited;
   (* acerta as cores quando muda a linha da grid *)
   (Sender as TwwDBGrid).Invalidate;
end;



procedure TfrmExecAmortizacao.DBgrdHistMovVirtualTopRowChanged(Sender: TObject);
begin
   inherited;
   (* acerta as cores quando muda a linha da grid *)
   (Sender as TwwDBGrid).Invalidate;
end;



procedure TfrmExecAmortizacao.DBrdgDebitoClick(Sender: TObject);
begin
  if DBrdgDebito.ItemIndex = 0 then
  begin
      DBcboFormaRecebimento.LookupValue := dtmEmptmo.qryParamEmptmoPORTFORMARECTO.AsString;

      AtualizaConjunto(True, pnlCAR);
   end
   else
   begin
      AtualizaConjunto(False, pnlCAR);
   end;
end;



procedure TfrmExecAmortizacao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   dtmEmptmo.qryDadosContrato.Close;
   dtmMS.MS_ContratoEmptmo.Filtro.Text := sFiltro;
   dtmMS.MS_ContratoEmptmo.RepeteConsulta := bRepeteConsulta;

   inherited;
end;



procedure TfrmExecAmortizacao.btnAlteraMargemClick(Sender: TObject);
begin
  inherited;
   EdtMargem.Enabled  := True;
   EdtMargem.ReadOnly := False;
   EdtMargem.Color    := clWindow;
   EdtMargem.SetFocus;

end;

procedure TfrmExecAmortizacao.edtMargemExit(Sender: TObject);
begin
  inherited;
   EdtMargem.ReadOnly := True;
   EdtMargem.Color    := clBtnFace;
end;

procedure TfrmExecAmortizacao.bbtnSimulaClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TFrmRelSimula, FrmRelSimula);

  if Simulacao then
  begin
     FrmRelSimula.ShowModal;
     FrmRelSimula.Release;
  end
  else
  begin
     FrmRelSimula.Free;
  end;
  bbtnSimula.Enabled := False;

end;


function TfrmExecAmortizacao.Simulacao : Boolean;
var
   sAnoMesCompet        : String;
   sSql, sSqlExec       : String;
   vSQL                 : array of String;
   i, j, iPMin, iPMax   : Integer;
   vListaSimulacao      : TListaItem;
begin
   Result := True;


   LimpaParametros(qryTipoContrato);
   qryTipoContrato.ParamByName('PIDEMPRESAPROP').AsInteger     := Sistema.IdEmpresa;
   qryTipoContrato.ParamByName('PIDTIPOCONTREMPTMO').AsInteger := dtmEmptmo.qryDadosContrato.FieldByName('IDTIPOCONTREMPTMO').AsInteger;
   qryTipoContrato.Open;

   (* Número mínimo de Parcelas em relação ao tipo de contrato escolhido pelo participante *)
   iPMin := 1;

   (* Número máximo de Parcelas em relação ao tipo de contrato escolhido pelo participante *)
   iPMax := Round(edtParcRestantes.Value);

   sSql  := '';

   (* Vetor que armazenará uma linha de SQL para cada parcela a ser mostrada no Grid *)
   vSQL  := nil;
   (* Vetor que armazenará uma linha de itens de concessão e seus respectivos valores
      para cada item levando em consideração o Número de Parcelas *)
   vListaSimulacao := nil;

   (* Configurando o Form com a Barra de Progresso *)

   try
      for i := 0 to (iPMax - iPMin) do
      begin
         if qryTipoContratoIDREGRAPRAZOSCONC.AsString <> '' then
         begin
            (* Verifica se a Parcela pode ser concedida ou não usando a
               VerificaPrazoConcessao que é uma função da unit UCalcEmptmo,
               caso negativo interrompe o procedimento indo para o próximo item
               do laço(for) *)
            if not CalcEmptmo.VerificaPrazoConcessao(dtmEmptmo.qryDadosContratoIDPESSOA.AsInteger,
                                                     dtmEmptmo.qryDadosContratoIDBENEF.AsInteger,
                                                     iPMin + i, // Nº Parcela
                                                     qryTipoContratoIDREGRAPRAZOSCONC.AsInteger) then
            begin
               Continue;
            end;
         end;(* if Regra Prazo de Cocessão *)

         (* Montagem de uma linha do SQL referente a uma parcela que será passado
            para a query do frmSimulacao *)
         sSql := 'SELECT ' + ' ' + IntToStr(iPMin + i) + ' as "Prazo", ';

         sAnoMesCompet  := FormatDateTime('YYYYMM', edtDataAmortizacao.Date);

         (* Utiliza a função CalculaItens da unit UCalcEmptmo para pegar a parcela e
            os itens de concessão com seus respectivos valores, em relação ao número de
            parcelas escolhida pelo participante *)
         CalcEmptmo.CalculaItens(rContrato,
                                 rConcessao,
                                 1, // Evento = Parcela
                                 2, // Origem = Geração de Parcelas
                                 iPais, sEstado, iCidade,
                                 rSaldosAntPos.iParcelaPos,
                                 dtmEmptmo.qryDadosContratoIDSITPART.AsInteger,
                                 rContrato.FlgFormaRec,
                                 rSaldosAntPos.fTxJurosPos,
                                 fSldDevAposAmort,
                                 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                                 (* VlrSolic, SaldoQuit, Margem, Reserva, SalPart,
                                 SalMantido, SalDoenca, SalBenef, VlrMaxPermit *)
                                 0, 0, 0, 
                                 edtDataAmortizacao.Date, rSaldosAntPos.dDataAtuPos, ' ',
                                 True, False, False, vListaSimulacao);

         (* A declaração do array não aloca memoria.
            Uso a procedure SetLength para criar o array em memória, determinando
            ou alterando seu tamanho dinâmicamente conforme necessário *)
         SetLength(vSQL, i + 1);

         (* Laço que varre o vetor Lista adicionando ao SQL TODOS os itens de
            concessão e o valor da parcela referente a aquela parcela *)
         for j := 0 to High(vListaSimulacao) do
         begin
            (* passagem para o SQL do valor do item de PARCELA/CONCESSÃO e
               seu respectivo nome *)
            sSql := sSql + ' ' + OraNumero(FloatToStr(vListaSimulacao[j].Valor))
                         + ' as "'+  vListaSimulacao[j].Nome + '",';
         end;(* for j *)

         (* Armazena no Vetor a Linha de SQL montada para uma determinada parcela *)
         vSQL[i] := Copy(sSql, 0, Length(sSql) - 1) + ' FROM DUAL';

      end;(* for *)

      (* Laço que varre o vetor vSQL buscando TODAS as linha do SQL referente a
         TODAS as parcela e montando o SQL completo que será passado para a query
         do frmSimulacao que mostrará TODAS as parcelas e seus respectivos valores *)
      for j := 0 to High(vSQL) do
      begin
         if j <= 0 then
         begin
            sSqlExec := vSQL[j];
         end
         else
         begin
            (* Verifica se o SQL da Parcela está vazio caso positivo não adiciona
               o UNION e o sql vazio ao SQL completo *)
            if vSQL[j] <> '' then sSqlExec := sSqlExec + ' UNION ' + vSQL[j];
         end;(* if j <= 1 *)
      end;(* for j*)

      (* Atribuição do SQL completo para a propridade SQL do frmSimulacao que tem
         como objetivo receber o SQL que será usado na Query do Grid *)
      FrmRelSimula.bbtnConfirmar.Visible  := False;
      FrmRelSimula.btnImprimir.Visible    := False;
      FrmRelSimula.SQL                    := sSqlExec;
   finally
      Repaint;
   end;
end;



end.
