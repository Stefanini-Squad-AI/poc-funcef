// Alterações:
{ --------------------------------------------------------------------------------------------------
Rotina    : Alteração de Vencimento
Data      : 04/02/2003
Autor     : André Pontes
Descrição : Itens não são mais contabilizados nesse momento. Serão contabilizados em bloco no
            Tratamento de Divergências.
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : btnSuspensaoClick e btnLiberaSuspensaoClick
Data      : 11/01/2003
Autor     : André Pontes
Descrição : Habilitação dos botões e implementação das rotinas (apenas marcar/desmarcar flgSuspensao)
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : BaixaManualCAR
Data      : 11/12/2002
Autor     : André Pontes
Descrição : Fim da restrição de baixa manual de registros que estejam ligados a um documento de
            Contas a Receber
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : btnConfirmarClick
Data      : 18/10/2002
Autor     : Marchetti
Descrição : Envia os itens para o CAP/CAR, independente se calculou divergência, pois pode ocorrer
            somente a mudança de vencimento, sem recálculo de encargos
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : BaixaManualFolha / BaixaManualCAR
Data      : 08/10/2002
Autor     : André Pontes
Descrição : Itens baixados manualmente recebem FLGENVIO = NULL
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : ContabilizaAbono
Data      : 07/10/2002
Autor     : Marchetti
Descrição : Colocado o número do contrato na mensagem para contabilização
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : btnContinuaSelecaoClick
Data      : 07/10/2002
Autor     : André Pontes
Descrição : checkbox + parametro PFLGBAIXAMANUAL que regula a exibição de itens baixados manualmente
---------------------------------------------------------------------------------------------------}

unit FExecTrataParcela;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FWizard, IvDictio, IvMulti, IvEMulti, ComCtrls, StdCtrls, MAHlpBtn,
   Buttons, TB97Tlbr, TB97, fcLabel, ExtCtrls, Db, Wwdatsrc, DBTables,
   Wwquery, wwdbdatetimepicker, CMDateTimePicker, TREdit, Mask, DBCtrls,
   Grids, Wwdbigrd, Wwdbgrid, fcButton, fcImgBtn, fcShapeBtn, wwdblook,
   FSairAjudaImob, MontaSelect, wwdbedit,

   uTypesEmptmo;

type
   TTipoTratamento = (ttAbono, ttBaixa, ttDesvioFolha, ttSuspensao, ttLiberaSuspensao, ttVencto, ttDesvioCAR);

   TNovosDados = record
      Valor          : Double;
      FlgDivergPend  : Integer;
      FlgBaixado     : Integer;
   end;

   TfrmExecTrataParcela = class(TfrmSairAjudaImob)
      ntbPrincipal: TNotebook;
      btnContinuaSelecao: TfcShapeBtn;
      DBgrdHistMov: TwwDBGrid;
      btnVolta: TfcShapeBtn;
      btnContinua: TfcShapeBtn;
      Panel4: TPanel;
      pnlInformaFinal: TPanel;
      btnVoltaInicio: TfcShapeBtn;
      btnConfirmar: TfcShapeBtn;
      dts: TwwDataSource;
      dtsHistMov: TwwDataSource;
      qryHistMov: TwwQuery;
      qryHistMovANOMES: TStringField;
      qryHistMovHMEANOCOMPETENCIA: TFloatField;
      qryHistMovHMEMESCOMPETENCIA: TFloatField;
      qryHistMovHMETIPOMOV: TFloatField;
      qryHistMovHMEDATAPREVISTA: TDateTimeField;
      qryHistMovHMEVLRPREVISTO: TFloatField;
      qryHistMovEVENTO: TStringField;
      qryHistMovHMETXJUROS: TFloatField;
      qryHistMovHMEPARCELA: TFloatField;
      qryHistMovHMESEQCOBRANCA: TFloatField;
      lblData: TLabel;
      edtDataProcesso: TCMDateTimePicker;
      DBrdgDebito: TRadioGroup;
      pnlCAR: TPanel;
      Label30: TLabel;
      Bevel1: TBevel;
      DBcboFormaRecebimento: TwwDBLookupCombo;
      qryHistMovVirtual: TwwQuery;
      dtsHistMovVirtual: TwwDataSource;
      DBgrdHistMovVirtual: TwwDBGrid;
      updHistMovVirtual: TUpdateSQL;
      lblTitulo: TfcLabel;
      qryHistMovITEDESCRICAO: TStringField;
      qryHistMovIDCONTRATOEMPTMO: TFloatField;
      qryHistMovIDITEMEMPTMO: TFloatField;
      qryHistMovHMESALDODEV: TFloatField;
      btnDesvio: TfcShapeBtn;
      btnAbono: TfcShapeBtn;
      btnBaixaManual: TfcShapeBtn;
      qryAux: TwwQuery;
      qryHistMovHMEFORMACOBRANCA: TStringField;
      qryHistMovIDRUBRICA: TFloatField;
      qryHistMovIDPATRO: TFloatField;
      qryHistMovCODDOCUMENTO: TFloatField;
      qryHistMovIDHISTMOVEMPTMO: TFloatField;
      qryHistMovHMECENTRALIZA: TFloatField;
      qryHistMovHMEDESTACADO: TFloatField;
      qryHistMovHMEANOCOBRANCA: TFloatField;
      qryHistMovHMEMESCOBRANCA: TFloatField;
      qryHistMovVirtualTRATAMENTO: TStringField;
      qryHistMovVirtualHMEPARCELA: TFloatField;
      qryHistMovVirtualPARCELA: TStringField;
      qryHistMovVirtualANOMES: TStringField;
      qryHistMovVirtualHMEDATAPREVISTA: TStringField;
      qryHistMovVirtualDESCRICAO: TStringField;
      btnSuspensao: TfcShapeBtn;
      edtDataVencimento: TCMDateTimePicker;
      Label2: TLabel;
      cbxAgrupaParcela: TCheckBox;
      DBgrdHistMovIButton: TwwIButton;
      qryHistMovFLGESCOLHA: TStringField;
      qryHistMovHMEDATAATUALIZA: TDateTimeField;
      qryHistMovHMENUMPARCELAS: TFloatField;
      qryAgrupaDocs: TwwQuery;
      btnAlteraVencto: TfcShapeBtn;
      updHistMov: TUpdateSQL;
      qryHistMovPLNCODIGO: TFloatField;
      btnInverteSelecao: TBitBtn;
      btnMarcaTodos: TBitBtn;
      qryHistMovFORMACOBRANCA: TStringField;
      qryAgrupaDocsCODDOCUMENTO: TFloatField;
      qryAgrupaDocsDATAVENCTO: TDateTimeField;
      qryAgrupaDocsCODPORTFORMA: TFloatField;
      qryAgrupaDocsGRUPODOC: TStringField;
      Label5: TLabel;
      edtVlrSelecao: TRealEdit;
      qryHistMovVirtualIDHISTMOVEMPTMO: TFloatField;
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
      qryHistMovVirtualIDCONTRATOEMPTMO: TFloatField;
      edtVlrRecebido: TRealEdit;
      Label13: TLabel;
      qryHistMovHMEDATAVENCTO: TDateTimeField;
      Label14: TLabel;
      qryHistMovFLGENVIO: TFloatField;
      btnDesfazBaixa: TfcShapeBtn;
      qryHistMovFLGBAIXADO: TFloatField;
      qryHistMovSTATUS: TStringField;
      qryHistMovFLGBAIXAMANUAL: TFloatField;
      Label51: TLabel;
      DBEdit4: TDBEdit;
      qryHistMovHMEDATAEFETIVA: TDateTimeField;
      qryHistMovHMEVLREFETIVO: TFloatField;
      Label15: TLabel;
      DBcboTipoDocRec: TwwDBLookupCombo;
      qryHistMovVirtualHMEDATAVENCTO: TStringField;
      qryHistMovVirtualVALOR: TFloatField;
      chkBaixaManual: TCheckBox;
      qryHistMovHMERECPAG: TStringField;
      qryHistMovIDITEMCENTRALIZA: TFloatField;
      qryHistMovIDREGRA: TFloatField;
      qryHistMovHMEORIGEM: TFloatField;
      qryHistMovHMEPRIORIDADE: TFloatField;
      chkSuspensao: TCheckBox;
      qryHistMovFLGSUSPENSAO: TFloatField;
      btnLiberaSuspensao: TfcShapeBtn;
      qryDesMarcaSuspensao: TwwQuery;
      qryMarcaSuspensao: TwwQuery;
    Label19: TLabel;

      procedure btnContinuaSelecaoClick(Sender: TObject);
      procedure btnBuscaContratoClick(Sender: TObject);
      procedure btnContinuaClick(Sender: TObject);
      procedure btnVoltaClick(Sender: TObject);
      procedure btnVoltaInicioClick(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure DBrdgDebitoClick(Sender: TObject);
      procedure DBgrdVlrAtualizadosCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
      procedure DBgrdVlrAtualizadosTopRowChanged(Sender: TObject);
      procedure FormActivate(Sender: TObject);
      procedure btnDesvioClick(Sender: TObject);
      procedure btnBaixaManualClick(Sender: TObject);
      procedure btnAbonoClick(Sender: TObject);
      procedure btnSuspensaoClick(Sender: TObject);
      procedure btnConfirmarClick(Sender: TObject);
      procedure btnAlteraVenctoClick(Sender: TObject);
      procedure qryHistMovFLGESCOLHAChange(Sender: TField);
      procedure DBgrdHistMovExit(Sender: TObject);
      procedure btnInverteSelecaoClick(Sender: TObject);
      procedure btnMarcaTodosClick(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure btnDesfazBaixaClick(Sender: TObject);
      procedure FormShow(Sender: TObject);
      procedure btnLiberaSuspensaoClick(Sender: TObject);


   private { Private declarations }

      rContrato     : TDadosContrato;
      vLista        : TListaItem;
      pbOk          : Boolean;
      pbExclui      : Boolean;
      IDContrato    : Int64;
      sNomePatro    : String;
      iContMarcados : Integer;

      iPais         : Integer;
      sEstado       : String;
      iCidade       : Integer;
      sRegistros    : String;

      sDiaSldDev    : String;

      procedure Sel(i: Int64);
      procedure AbreQueriesDebito;
      procedure HabilitaBotoes;
      procedure DesabilitaBotoes;

      function VerificaPreenchimento(TipoTratamento: TTipoTratamento): Boolean;

      procedure PreencheTabelaVirtual(bAbreTabela : Boolean);

      procedure ProcessaMudancaVencimento;
      procedure PreencheDadosContrato(const qryContrato      : TwwQuery;
                                      var   rDadosContrato   : TDadosContrato);

      procedure PreencheTabelaVirtualVencimento(bAbreTabela : Boolean);
      function  ContabilizaAbono : Int64;

      function DesviarParaFolha: Boolean;   // altera forma de cobrança da parcela para folha de benefícios 
      function DesviarParaCAR: Boolean;     // altera forma de cobrança da parcela para contas a receber 
      function BaixaManualCAR: Boolean;     // baixa manual car 
      function BaixaManualFolha: Boolean;   // baixa manual folha de benefícios 

      function VerificaBaixa: Boolean;
      function VerificaTMPDESC: Boolean;
      procedure InsereDiferencaHist(qryLocal:TwwQuery; NovosDados:TNovosDados);


   public { Public declarations }

   end;


var
  frmExecTrataParcela: TfrmExecTrataParcela;
  TipoTratamento     : TTipoTratamento;



implementation
{$R *.DFM}
uses
   UFuncoesEmptmo, // LimpaParametros, AtualizaConjunto 
   uCalcEmptmo,
   UMensErro,      // MsgDlg 
   USistema,       // Sistema 
   dBaseDados,
   UIntegraEmptmo, // IntegraEmptmo 
   dEmptmo,        // qryParamEmptmo 
   DLookEmptmo,    // qryLookPortadorFormaR 
   FProgresso,     // FrmProgresso 
   UDocumento,     // Rotinas do CAPCAR 
   uDatabase,
   uModulo,
   uDiasUteis,
   uVerificaPreenchimento,
   uBiblioteca, dMS, fAguarde;    // ZD, ZE 



procedure TfrmExecTrataParcela.FormCreate(Sender: TObject);
begin
   inherited;
   ntbPrincipal.PageIndex  := 0;
   iContMarcados           := 0;
end;



procedure TfrmExecTrataParcela.FormActivate(Sender: TObject);
begin
   inherited;

   edtDataProcesso.ButtonWidth      := 21;
   edtDataProcesso.Date             := SysDate;
   DBedtDataCredito.ButtonWidth     := 21;
   DBedtDataInsc.ButtonWidth        := 21;
   DBedtDataPrimParcela.ButtonWidth := 21;
end;



procedure TfrmExecTrataParcela.HabilitaBotoes;
begin
   btnContinua.Enabled        := True;
   btnVolta.Enabled           := True;
   btnVoltaInicio.Enabled     := True;
   btnConfirmar.Enabled       := True;
   bbtnAjuda.Enabled          := True;
   bbtnSair.Enabled           := True;

   ntbPrincipal.Enabled       := True;
   Screen.Cursor              := crDefault;
end;



procedure TfrmExecTrataParcela.DesabilitaBotoes;
begin
   Screen.Cursor              := crHourGlass;
   ntbPrincipal.Enabled       := False;

   btnContinua.Enabled        := False;
   btnVolta.Enabled           := False;
   btnVoltaInicio.Enabled     := False;
   btnConfirmar.Enabled       := False;
   bbtnAjuda.Enabled          := False;
   bbtnSair.Enabled           := False;
end;



function TfrmExecTrataParcela.VerificaPreenchimento(TipoTratamento: TTipoTratamento): Boolean;
var
   sMsg : String;
begin
	Result := False;

   try

      // -------------------------------------------------------------------------------------------

      if TipoTratamento in [ttAbono, ttBaixa, ttSuspensao] then
         if length(trim(edtDataProcesso.Text)) = 0 then
            raise EValidacao.CreateVal('É necessário indicar a Data do Processo!', edtDataProcesso);

      // -------------------------------------------------------------------------------------------

      if TipoTratamento = ttBaixa then
      begin
         if edtVlrRecebido.Value = 0 then
         begin
            // se valor recebido = ZERO, baixa pelo valor previsto
            if MsgDlg('O Valor Recebido está zerado! ' + #13 +
                      'Isso acarretará a baixa o(s) registro(s) selecionado(s) pelo valor previsto.' + #13 + #13 +
                      'Deseja prosseguir com a baixa?', 'Empréstimo', mtConfirmation, [mbyes, mbNo], 0) = mrNo then
            begin
               Repaint;
               raise EValidacao.CreateVal('É necessário indicar o Valor Recebido!', edtVlrRecebido);
            end;
         end
         else
         begin
            // se valor recebido preenchido, só pode selecionar 1 registro
            // *** isso precisa ser refeito posteriormente para ratear o valor informado pelos reistros ***
            if iContMarcados > 1 then
               raise EValidacao.CreateVal('Só é possível baixar 1 registro por vez, com valor recebido informado!', edtVlrRecebido);
         end;
      end;

      // -------------------------------------------------------------------------------------------

      if TipoTratamento = ttBaixa then
      begin
         sMsg  := 'A Baixa Manual de um Item não produz contabilização. ' + #13 +
                  'O Item será meramente marcado como "baixado". ' + #13 + #13 +
                  'Deseja realmente prosseguir?';

         if MsgDlg(sMsg, 'Empréstimo', mtConfirmation, [mbYes, mbNo], 0) = mrNo then begin
            Repaint;
            raise EValidacao.CreateVal('Baixa cancelada!', btnBaixaManual);
         end;
      end;

      // -------------------------------------------------------------------------------------------

      if TipoTratamento = ttBaixa then begin

         // se data de vencimento não indicada, baixa na data do processo
         if length(trim(edtDataVencimento.Text)) = 0 then
//         begin
//
//            if MsgDlg('A Nova Data de Vencimento não foi indicada.! ' + #13 +
//                      'Isso acarretará a baixa o(s) registro(s) selecionado(s) na Data do Processo.' + #13 + #13 +
//                      'Deseja prosseguir com a baixa?', 'Empréstimo', mtConfirmation, [mbyes, mbNo], 0) = mrNo then
//            begin
//               Repaint;
               raise EValidacao.CreateVal('É necessário indicar a Nova Data de Vencimento!', edtDataVencimento);
//            end;
//
//         end;
      end;

      // -------------------------------------------------------------------------------------------

      if TipoTratamento = ttVencto then
         if length(trim(edtDataVencimento.Text)) = 0 then
            raise EValidacao.CreateVal('É necessário indicar a Nova Data de Vencimento!', edtDataVencimento);

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



procedure TfrmExecTrataParcela.Sel(i: Int64);
begin
   with dtmEmptmo.qryDadosContrato do begin
      LimpaParametros(dtmEmptmo.qryDadosContrato);
      ParamByName('PIDCONTRATOEMPTMO').AsInteger := i;
      Open;
   end;
end;



procedure TfrmExecTrataParcela.AbreQueriesDebito;
begin
   // abre as queries utilizadas quando o Débito do Empréstimo será pelo CAR 
   with dtmLookEmptmo.qryLookPortadorFormaR do begin
      LimpaParametros(dtmLookEmptmo.qryLookPortadorFormaR);
      ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
      Open;
   end;
end;



procedure TfrmExecTrataParcela.btnBuscaContratoClick(Sender: TObject);
begin
  inherited;

  dtmMS.MS_ContratoEmptmo.Executar;

  // Redesenha o form na volta do MontaSelect
	Repaint;

	if dtmMS.MS_ContratoEmptmo.RetornouValor then begin

      Screen.Cursor := crHourGlass;

      // abre a query principal com o participante escolhido 
      Sel(StrToInt(dtmMS.MS_ContratoEmptmo.ValoresChave[0]));

      PreencheDadosContrato(dtmEmptmo.qryDadosContrato, rContrato);

      // Verifica se o Participante já recebeu o Crédito do Empréstimo 
      if VerificaBaixa then begin

         btnContinuaSelecao.Enabled := True;

      end else begin

         btnContinuaSelecao.Enabled := False;
         MsgDlg('O Contrato selecionado ainda não foi efetivado.' + #13 +
                'Não é possível tratar parcelas', 'Empréstimo', mtWarning,[mbOk],0);

      end;// if 

      Screen.Cursor     := crDefault;

   end; // if MontaSelect.RetornouValor 
end;



function TfrmExecTrataParcela.VerificaBaixa: Boolean;
var
   sSql              : String;
   qryAux            : TwwQuery;
   fSaldo            : Real;
   fSaldoOutraMoeda  : Real;
begin
   // Cria a Query Auxiliar 
   qryAux               := TwwQuery.Create(Application);
   qryAux.DatabaseName  := 'BaseDados';

   sSql :=
   'SELECT '                           + #13 +
   '  HMEDATAEFETIVA, CODDOCUMENTO '   + #13 +
   'FROM '                             + #13 +
   '  HISTMOVEMPTMO '                  + #13 +
   'WHERE '                            + #13 +
   '  ( IDCONTRATOEMPTMO  = ' + IntToStr(rContrato.IDContratoEmptmo) + ' ) '  + #13 +
   '  AND ( HMETIPOMOV    = 0 ) '                                             + #13 +
   '  AND ( HMECENTRALIZA = 1 ) ';

   qryAux.SQL.Text := sSql;

   try

      qryAux.Open;
      if not(qryAux.FieldByName('HMEDATAEFETIVA').IsNull) then begin

         // Participante já recebeu o Crédito do EP, logo pode quitar o EP 
         Result := True;

      end else begin

         // Participante NÃO recebeu o Crédito do EP 

         Documento.Saldo.GetSaldoDoc(qryAux.FieldByName('CODDOCUMENTO').AsInteger,
                                     '', // Data do Saldo - Saldo Atual 
                                     'P', // RecPag 
                                     fSaldo, fSaldoOutraMoeda);

         if fSaldo = 0 then begin
            Result := True;
         end else begin
            Result := False;
         end;

      end;// if not DataEfetiva 

   finally
      qryAux.Free;
   end;
end;



procedure TfrmExecTrataParcela.btnContinuaSelecaoClick(Sender: TObject);
begin
   inherited;

   iContMarcados := 0;

   if not(dtmEmptmo.qryDadosContrato.Active) then
   begin
      MsgDlg('É necessário selecionar um Contrato!', 'Empréstimo', mtWarning, [mbOk], 0);
      Repaint;
      if btnBuscaContrato.CanFocus then btnBuscaContrato.SetFocus;
   end
   else
   begin
      // abre a query HistMov com os parâmetros passados
      with qryHistMov do
      begin
         LimpaParametros(qryHistMov);
         ParamByName('PIDCONTRATOEMPTMO').AsInteger  := dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsInteger;
         ParamByName('PIDTIPOCONTREMPTMO').AsInteger := dtmEmptmo.qryDadosContratoIDTIPOCONTREMPTMO.AsInteger;

         if chkBaixaManual.Checked then ParamByName('PFLGBAIXAMANUAL').AsInteger := 1;
         if chkSuspensao.Checked   then ParamByName('PFLGSUSPENSAO').AsInteger   := 1;

         Open;
      end;

      edtVlrSelecao.Value        := 0;

      DBgrdHistMov.Enabled       := True;
      ntbPrincipal.PageIndex     := 1;
   end;
end;



procedure TfrmExecTrataParcela.btnContinuaClick(Sender: TObject);
begin
   inherited;


   IDContrato  := dtmEmptmo.qryDadosContrato.FieldByName('IDCONTRATOEMPTMO').AsInteger;
   sNomePatro  := dtmEmptmo.qryDadosContrato.FieldByName('PATRO').AsString;

//   if TipoTratamento <> ttVencto then
   PreencheTabelaVirtual(True);

   ntbPrincipal.PageIndex  := 2;
   btnConfirmar.Enabled    := pbOk;

   try
{
   Exit;

   if edtDataProcesso.Text = '' then begin
      MsgDlg('A Data de Quitação deve ser informada.', 'Empréstimo',MtWarning,[mbOk],0);
      Repaint;

      if edtDataProcesso.CanFocus then edtDataProcesso.SetFocus;
      Exit;
   end;

   try
      DesabilitaBotoes;

      sMes := FormatDateTime('MM', edtDataProcesso.Date);
      sAno := FormatDateTime('YYYY', edtDataProcesso.Date);

      // Procedure que abre as queries utilizadas quando o Débito do Empréstimo
         será pelo CAR 
      AbreQueriesDebito;

      // Chama a função ParametrosSistema da unit UFuncoesEmptmo que abre a tabela
        PARAMEMPTMO. Esta função retorna False se a tabela estiver vazia 
      if ParametrosSistema then begin
         // Serão utilizados os Parâmetros definidos no Sistema 

         if dtmEmptmo.qryParamEmptmoFLGFORMAREC.AsString = 'C' then begin

            DBrdgDebito.ItemIndex := 0;
            DBcboFormaRecebimento.LookupValue := dtmEmptmo.qryParamEmptmoPORTFORMARECTO.AsString;

            // Procedimento da unit UFuncoesEmptmo que recebe como parâmetro um componente
               Container (Panel, GroupBox, etc.) e habilita/desabilita o próprio componente
               e os componentes dentro dele, trocando inclusive a cor de Edits e Combobox 
            AtualizaConjunto(True, pnlCAR);

         end else begin
            DBrdgDebito.ItemIndex := 1;

            // Procedimento da unit UFuncoesEmptmo que recebe como parâmetro um componente
               Container (Panel, GroupBox, etc.) e habilita/desabilita o próprio componente
               e os componentes dentro dele, trocando inclusive a cor de Edits e Combobox 
            AtualizaConjunto(False,pnlCAR);
         end;

      end else begin

         // A tabela Parâmetros do Sistema está vazia 

         MsgDlg('Favor preencher os Parâmetros do Sistema.','Empréstimo',mtWarning,[mbOk],0);

         DBrdgDebito.ItemIndex := 0;

      end;//if ParametrosSistema 

      // Configurando o Form com a Barra de Progresso que será usado na função CalculaItensAtualiza 
      with frmProgresso do begin
         BotaoVisivel    := True;
         BotaoHabilitado := True;
      end;// frmProgresso 

{      if not CalcEmptmo.CalculaItensQuitacao(rContrato,
                                             3,// Quitação 
                                             edtDataProcesso.Date,
                                             vLista,
                                             True,// Mostra a mensagem de erro 
                                             True // Mostra o Form de Progresso 
                                             ) then
      begin
         // Não foi possível atualizar os itens, ou por problemas no Cálculo, ou
            por Cancelamento do Usuário, logo o procedimento será abortado 
         Exit;
      end;

      PreencheTabelaVirtual;

      ntbPrincipal.PageIndex := 2;
}
   finally
      HabilitaBotoes;
   end;
end;



procedure TfrmExecTrataParcela.PreencheTabelaVirtual(bAbreTabela : Boolean);
var
   lsMesCobranca  : String;
begin

   if bAbreTabela or not(qryHistMovVirtual.Active) then
   begin
      qryHistMovVirtual.Close;
      qryHistMovVirtual.Open;
   end;

   // preenche a parcela tratada
   lsMesCobranca   := FormatFloat('0000', qryHistMov.FieldByName('HMEANOCOBRANCA').AsFloat) + '/' +
                      FormatFloat('00', qryHistMov.FieldByName('HMEMESCOBRANCA').AsFloat);

   qryHistMovVirtual.Insert;

   qryHistMovVirtualANOMES.AsString                := lsMesCobranca;

   if ( (TipoTratamento <> ttVencto) and (TipoTratamento <> ttBaixa) ) then
   begin
      qryHistMovVirtualHMEDATAPREVISTA.AsDateTime  := edtDataProcesso.Date;
   end
   else
   begin
      qryHistMovVirtualHMEDATAPREVISTA.AsDateTime  := edtDataVencimento.Date;
   end;

   qryHistMovVirtualHMEPARCELA.AsInteger        := qryHistMov.FieldByName('HMEPARCELA').AsInteger;

   if TipoTratamento = ttAbono then
   begin
      // Seleciona o ítem abonado
      qryHistMovVirtualDESCRICAO.AsString        := qryHistMov.FieldByName('ITEDESCRICAO').AsString;
   end
   else
   begin
      qryHistMovVirtualDESCRICAO.AsString        := 'Parcela';
   end;

   // tipo de tratamento
   case TipoTratamento of
      ttDesvioFolha     : qryHistMovVirtualTRATAMENTO.AsString := 'Desvio Folha';
      ttDesvioCAR       : qryHistMovVirtualTRATAMENTO.AsString := 'Desvio CaR';
      ttBaixa           : qryHistMovVirtualTRATAMENTO.AsString := 'Baixa Manual';
      ttAbono           : qryHistMovVirtualTRATAMENTO.AsString := 'Abono';
      ttSuspensao       : qryHistMovVirtualTRATAMENTO.AsString := 'Suspensão';
      ttLiberaSuspensao : qryHistMovVirtualTRATAMENTO.AsString := 'Liberação de Suspensão';
      ttVencto          : qryHistMovVirtualTRATAMENTO.AsString := 'Mudança de Vencimento';
   end;

   qryHistMovVirtual.Post;
end;



procedure TfrmExecTrataParcela.btnVoltaClick(Sender: TObject);
begin
   inherited;
   ntbPrincipal.PageIndex := 0;
end;



procedure TfrmExecTrataParcela.btnVoltaInicioClick(Sender: TObject);
begin
  inherited;
  if dtmBaseDados.dbBaseDados.InTransaction then dtmBaseDados.dbBaseDados.RollBack;

  qryHistMov.Close;
  qryHistMov.Open;

  qryHistMovVirtual.Close;

  iContMarcados := 0;

  ntbPrincipal.PageIndex  := 1;
  edtVlrRecebido.Value    := 0;
  edtVlrSelecao.Value     := 0;
end;



procedure TfrmExecTrataParcela.DBrdgDebitoClick(Sender: TObject);
begin
	inherited;

   if DBrdgDebito.ItemIndex = 0 then
   begin
      DBcboFormaRecebimento.LookupValue := dtmEmptmo.qryParamEmptmoPORTFORMARECTO.AsString;

      AtualizaConjunto(True,pnlCAR);

   end else begin

      AtualizaConjunto(False,pnlCAR);

   end;
end;



procedure TfrmExecTrataParcela.DBgrdVlrAtualizadosCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
   inherited;

   // faz com que as linhas do grid tenham cores alternadas 
   if qryHistMov.IsEmpty then Exit;

   // faz com que as linhas do grid tenham cores alternadas
   if State <> [gdSelected] then
   begin
      if not(Highlight) then
      begin
         // linhas ímpares = amarelo, linhas pares = branco
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then
         begin
            ABrush.Color := $00C0FFFF; // amarelo bebê
         end
         else
         begin
            ABrush.Color := clWhite;
         end;
{
         // fonte fica azul em caso de abono
         // fonte fica verde em caso de quitação
         if not(Highlight) then
         begin
            if Field = qryHistMovHMEDATAEFETIVA then
            begin
               AFont.Color := clWindowText;
               if qryHistMovFLGQUITADO.AsInteger = 1 then AFont.Color := clGreen;
               if qryHistMovFLGABONADO.AsInteger = 1 then AFont.Color := clBlue;
            end;
         end;
}
      end;
   end
   else // if State <> [gdSelected]
   begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
end;



procedure TfrmExecTrataParcela.DBgrdVlrAtualizadosTopRowChanged(Sender: TObject);
begin
  inherited;
   // acerta as cores quando muda a linha da grid 
   (Sender as TwwDBGrid).Invalidate;
end;



procedure TfrmExecTrataParcela.btnDesvioClick(Sender: TObject);
begin
   inherited;

   if not(VerificaPreenchimento(ttDesvioFolha)) and not(VerificaPreenchimento(ttDesvioCaR)) then Exit;

   try
      DesabilitaBotoes;

      // Forma de desvio: HMEFORMACOBRANCA = {C,F}

      pbOk := True;

      if not(dtmBaseDados.dbBaseDados.InTransaction) then StartTransacao;

      try
         with qryHistMov do
         begin
            DisableControls;
            First;
            while not(qryHistMov.EOF) do
            begin
               if qryHistMovFLGESCOLHA.AsInteger = 1 then
               begin
                  try
                     case qryHistMovHMEFORMACOBRANCA.AsString[1] of
                        'C': pbOk := DesviarParaFolha;
                        'F': pbOk := DesviarParaCAR;
                     end;
                  except
                     if dtmBaseDados.dbBaseDados.InTransaction then RollBackTransacao;

                     Raise;
                     Repaint;

                     Exit;
                  end;

                  PreencheTabelaVirtual(False);
               end;
               qryHistMov.Next;
            end;
            EnableControls;
         end;


         // -------------------------------------------------------------------------------------
         // Log de operações
         if not(Sistema.GravaLogOperacoes('Trat.Parc Contr: ' +
                                          IntToStr(dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsInteger) +
                                          ': Desvio')) then
         begin
            Raise Exception.Create('Falha na gravação do Log da operação.');
         end;
         // -------------------------------------------------------------------------------------


         if dtmBaseDados.dbBaseDados.InTransaction then CommitTransacao;


      except
         if dtmBaseDados.dbBaseDados.InTransaction then RollBackTransacao;

         pbOk := False;

         Raise;
         Repaint;
      end;

      if not(pbOk) then pnlInformaFinal.Caption := 'Parcela NÃO tratada!';

      if pbOk then begin
         pnlInformaFinal.Color   := clNavy;
      end else begin
         pnlInformaFinal.Color   := clMaroon;
      end;

      ntbPrincipal.PageIndex  := 2;
      btnConfirmar.Enabled    := pbOk;

   finally
      HabilitaBotoes;
   end;
end;



function TfrmExecTrataParcela.DesviarParaFolha: Boolean;
var
   sMsg     : String;
   iRetorno : Integer;
begin
   { 1º Passo: Verifica se foi enviado e exclui Documento              }
   { 2º Passo: Alterar tabela HISTMONEMPTMO                            }
   { OBS.: Não trata envio.}

   TipoTratamento := ttDesvioFolha;
   Result := True;

   {1ºPasso ===========================================================}
   if not(qryHistMovCODDOCUMENTO.IsNull) then 
   begin
      iRetorno := IntegraEmptmo.ExcluiFinanceiro(qryHistMov.FieldByName('CODDOCUMENTO').AsInteger, sMsg);

      if iRetorno <> 0 then MsgDlg(sMsg, 'Empréstimo', mtWarning, [mbOk], 0);
   end;

   {2ºPasso ===========================================================}
   qryAux.SQL.Clear;
   qryAux.SQL.Add(' UPDATE HISTMOVEMPTMO SET HMEFORMACOBRANCA = ''F'', HMETIPOFOLHA = ''B'', ' +
                  ' FLGENVIO              = 0 '+
                  ' WHERE IDCONTRATOEMPTMO = '+qryHistMov.FieldByName('IDCONTRATOEMPTMO').AsString+
                  ' AND IDHISTMOVEMPTMO  = '+qryHistMov.FieldByname('IDHISTMOVEMPTMO').AsString+
                  ' AND   HMEPARCELA      = '+qryHistMov.FieldBYName('HMEPARCELA').AsString);
   try
     qryAux.ExecSql;
   except
     Result := False;
   end;
   {FIM - 2ºPasso}
end;



function TfrmExecTrataParcela.DesviarParaCAR: Boolean;
var
   sSQL           : String;
   lsMesCobranca  : String;
begin
   {1º Passo: Verifica se foi enviado (TMPDESC)
              Ir na TMPDESC através de rubricas. Portanto, saber quais rubricas
              foram inseridas. }
   {2º Passo: Excluir da TmpDesc as parcelas não enviadas.
              Para setar os registros na TMPDESC não utilizo o campo MESREFERENCIA,
              pois devo pegar todos os registros daquela parcela.              }
   {3º Passo: Alterar tabela HISTMOVEMPTMO                            }
   {OBS.: Não trata envio.
          Ao desviar uma parcela, será considerada todas àquelas que possuirem
          o mesmo MESCOBRANCA.}

   TipoTratamento := ttDesvioCAR;

   if qryHistMovFLGENVIO.IsNull then
   begin
      IntegraEmptmo.ExcluiTMPDESC(qryHistMovIDCONTRATOEMPTMO.AsInteger,
                                  qryHistMovIDHISTMOVEMPTMO.AsInteger,
                                  '',
                                  True);
   end;

   with qryAux do
   begin
      sSQL :=
      'UPDATE '                                                                     + #13 +
      '  HISTMOVEMPTMO '                                                            + #13 +
      'SET '                                                                        + #13 +
      '  HMEFORMACOBRANCA     = ''C'', '                                            + #13 +
      '  HMETIPOFOLHA         = NULL, '                                             + #13 +
      '  FLGENVIO             = 0 '                                                 + #13 +
      'WHERE '                                                                      + #13 +
      '      IDCONTRATOEMPTMO = ' + IntToStr(qryHistMovIDCONTRATOEMPTMO.AsInteger)  + #13 +
      '  AND IDHISTMOVEMPTMO  = ' + IntToStr(qryHistMovIDHISTMOVEMPTMO.AsInteger);

      SQL.Clear;
      SQL.Text := sSQL;

      try
         ExecSql;
      except
         Result := False;
      end;

   end; // with qryAux do
end;



procedure TfrmExecTrataParcela.btnBaixaManualClick(Sender: TObject);
var
   bExisteSaldo   : Boolean;
   bExisteAberto  : Boolean;
   sErro          : String;
   sSituacao      : String;
   sNovaSituacao  : String;
begin
   inherited;

   TipoTratamento := ttBaixa;

   if not(VerificaPreenchimento(ttBaixa)) then Exit;

   if MsgDlg('Confirma a baixa do(s) item(ns) selecionado(s)?', 'Empréstimo', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
   begin
      Repaint;
      Exit;
   end;

   try
      DesabilitaBotoes;

      if not(dtmBaseDados.dbBaseDados.InTransaction) then StartTransacao;

      with qryHistMov do
      begin
         DisableControls;
         First;
         while not(qryHistMov.EOF) do
         begin
            if qryHistMovFLGESCOLHA.AsInteger = 1 then
            begin
               try
                  case qryHistMovHMEFORMACOBRANCA.AsString[1] of
                    'F': pbOk := BaixaManualFolha;
                    'C': pbOk := BaixaManualCAR;
                  end;
               except
                  if dtmBaseDados.dbBaseDados.InTransaction then RollBackTransacao;

                  Raise;
                  Repaint;

                  Exit;
               end;

               PreencheTabelaVirtual(False);
            end;
            qryHistMov.Next;
         end;
         EnableControls;
      end;

      // ----------------------------------------------------------------------------------
      //    Acerto da situação do Contrato
      // ----------------------------------------------------------------------------------
      bExisteSaldo := CalcEmptmo.ExisteSaldoDevedor(dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsInteger);

      if bExisteSaldo then
      begin
         // se houver saldo devedor, o Contrato precisa ser (A)tivo
         sNovaSituacao := 'A';
      end
      else
      begin
         bExisteAberto := CalcEmptmo.ExistemItensEmAberto(dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsInteger);

         if not(bExisteAberto) then
         begin
            // se não houver saldo devedor, E não houver itens em aberto,
            // o Contrato está (Q)uitado
            sNovaSituacao := 'Q';
         end
         else
         begin
            sSituacao := dtmEmptmo.qryDadosContratoFLGSITUACAO.AsString;

            if sSituacao = 'K' then
            begin
               // havendo itens em aberto, e havendo quitação, o contrato será 'K' (em quitação)
               sNovaSituacao := 'K';
            end
            else
            begin
               // não havendo quitação, o contrato será apenas (E)ncerrado
               sNovaSituacao := 'E';
            end;
         end;
      end;

      if sNovaSituacao <> '' then
      begin
         CalcEmptmo.AtualizaFlgSituacao(dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsInteger,
                                        'CONTRATOEMPTMO',
                                        sNovaSituacao[1],
                                        sErro);
      end;
      // ----------------------------------------------------------------------------------
      //    FIM Acerto da situação do Contrato
      // ----------------------------------------------------------------------------------

      // -------------------------------------------------------------------------------------
      // Log de operações
      if not(Sistema.GravaLogOperacoes('Trat. Parc Contr ' +
                                       IntToStr(dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsInteger) +
                                       ': Baixa Manual')) then
      begin
         pbOk := False;
         MsgDlg('Falha na gravação do Log da operação.', 'Empréstimo', mtError, [mbOk], 0);
      end;
      // -------------------------------------------------------------------------------------


      if pbOk then
      begin
         if dtmBaseDados.dbBaseDados.InTransaction then CommitTransacao;
      end
      else
      begin
         if dtmBaseDados.dbBaseDados.InTransaction then RollBackTransacao;
      end;

//      ntbPrincipal.PageIndex  := 2;
//      btnConfirmar.Enabled    := pbOk;

   finally
      qryHistMov.Close;
      qryHistMov.Open;

      qryHistMovVirtual.Close;

      HabilitaBotoes;
   end;
end;



procedure TfrmExecTrataParcela.InsereDiferencaHist(qryLocal:TwwQuery; NovosDados:TNovosDados);
var
   rContrato         : TDadosContrato;
   ItemContrato      : TItemRecDep;
   iIdHistMovEmptmo  : Int64;
begin

   try
     // Limpa o registro com os dados do Contrato 
     LimpaRegistroContrato(rContrato);

     // Inicializa o registro com os dados do Contrato 
     rContrato.IDContratoEmptmo      := qryLocal.FieldByName('IDCONTRATOEMPTMO').AsInteger;

     { Preenche dados do Item }
     ItemContrato.Parcela            := qryLocal.FieldByName('HMEPARCELA').AsInteger;
     ItemContrato.CodigoItem         := qryLocal.FieldByName('IDITEMEMPTMO').AsInteger;
     ItemContrato.RecPag             := qryLocal.FieldByName('HMERECPAG').AsString;
     ItemContrato.FormaCobranca      := qryLocal.FieldByName('HMEFORMACOBRANCA').AsString;
     ItemContrato.IdItemCentraliza   := qryLocal.FieldByName('IDITEMCENTRALIZA').AsInteger;

     ItemContrato.DataPrevista       := qryLocal.FieldByName('HMEDATAPREVISTA').AsDateTime;
     ItemContrato.DataVencto         := qryLocal.FieldByName('HMEDATAVENCTO').AsDateTime;
     ItemContrato.DataUltAtualiza    := qryLocal.FieldByName('HMEDATAATUALIZA').AsDateTime;
     ItemContrato.DataEfetiva        := 0;
     ItemContrato.AnoCompetencia     := qryLocal.FieldByName('HMEANOCOMPETENCIA').AsInteger;
     ItemContrato.MesCompetencia     := qryLocal.FieldByName('HMEMESCOMPETENCIA').AsInteger;

     ItemContrato.AnoCobranca        := qryLocal.FieldByName('HMEANOCOBRANCA').AsInteger;
     ItemContrato.MesCobranca        := qryLocal.FieldByName('HMEMESCOBRANCA').AsInteger;

     ItemContrato.Valor              := NovosDados.Valor;
     ItemContrato.ValorEfetivo       := 0;
     ItemContrato.SaldoDevedor       := qryLocal.FieldByName('HMESALDODEV').AsFloat;
     ItemContrato.TxJuros            := qryLocal.FieldByName('HMETXJUROS').AsFloat;
     ItemContrato.Regra              := qryLocal.FieldByName('IDREGRA').AsInteger;
     ItemContrato.Rubrica            := qryLocal.FieldByName('IDRUBRICA').AsInteger;

     ItemContrato.iEvento            := qryLocal.FieldByName('HMETIPOMOV').AsInteger;
     ItemContrato.Origem             := 7; //qryLocal.FieldByName('HMEORIGEM').AsInteger;
     ItemContrato.Prioridade         := qryLocal.FieldByName('HMEPRIORIDADE').AsInteger;
     ItemContrato.SeqCobranca        := (qryLocal.FieldByName('HMESEQCOBRANCA').AsInteger + 1);
     ItemContrato.FlgCentraliza      := qryLocal.FieldByName('HMECENTRALIZA').AsInteger;

     ItemContrato.FlgEnvio           := 0;
     ItemContrato.FlgTipoDiverg      := 1;
     ItemContrato.FlgBaixado         := NovosDados.FlgBaixado;
     ItemContrato.FlgDivergPend      := NovosDados.FlgDivergPend;

     ItemContrato.ParcResta          := qryLocal.FieldByName('HMENUMPARCELAS').AsInteger;
     ItemContrato.FlgDestacado       := qryLocal.FieldByName('HMEDESTACADO').AsInteger;


     // função que grava as informações pertinentes a um contrato no histórico de movimento
     //  de Empréstimo (tabela HISTMOVEMPTMO), tendo como saída True se a operação foi
     //  bem sucedida e False caso negativo
      if not(CalcEmptmo.InsertMovEmptmo(ItemContrato, rContrato, iIdHistMovEmptmo)) then
      begin
        ShowMessage('Erro ao incluir Histórico !!!!');
      end;

   finally
      // Limpa o registro com os dados do Contrato 
      LimpaRegistroContrato(rContrato);
   end;
end;



function TfrmExecTrataParcela.BaixaManualCAR: Boolean;
var
   dDataBaixa        : TDateTime;
   sDataBaixa        : String;
   fVlrRecebido      : Currency;
   sFlgBaixado       : String;
   sFlgDivergPend    : String;
   sFlgTipoDiverg    : String;
   sMsg              : String;
   NovosDadosParcela : TNovosDados;
begin
{
   1º Passo: Verifica se CODDOCUMENTO esta preenchido, se FLGDIVERGPEND = 1,
              algum caso afirmativo não faz.
   2º Passo: Verifica se PLNCODIGO esta preenchido algum caso afirmativo não faz.
   3º Passo: Marcar FLGBAIXADO  = NULL
}
   Result := True;

   // atribui a data de baixa
   dDataBaixa := edtDataVencimento.Date;
   sDataBaixa := FormatDateTime('dd/mm/yyyy', dDataBaixa);

   // atribui o valor recebido
   if edtVlrRecebido.Value <> 0 then fVlrRecebido := edtVlrRecebido.Value;

   // se o previsto for negativo, presume que o valor digitado está em valor absoluto,
   // logo, inverte o sinal para compatibilizar
   if qryHistMovHMEVLRPREVISTO.AsCurrency < 0 then fVlrRecebido := fVlrRecebido * (-1);


   with qryAux do
   begin
      sFlgBaixado    := 'NULL';
      sFlgDivergPend := '0';
      sFlgTipoDiverg := 'NULL';

      if dDataBaixa > qryHistMovHMEDATAVENCTO.AsDateTime then
      begin
         sFlgDivergPend := '1';
         sFlgTipoDiverg := '5';
      end;

      // só poderá haver divergência de valores se o valor recebido estiver preenchido
      if edtVlrRecebido.Value > 0 then
      begin
         if abs(edtVlrRecebido.Value) < abs(qryHistMovHMEVLRPREVISTO.AsCurrency) then
         begin
            sFlgDivergPend := '1';
            sFlgTipoDiverg := '3';
         end;

         if abs(edtVlrRecebido.Value) > abs(qryHistMovHMEVLRPREVISTO.AsCurrency) then
         begin
            sFlgDivergPend := '1';
            sFlgTipoDiverg := '4';
         end;
      end
      else
      begin
         // se o valor recebido não estiver preenchido, o valor recebido será o valo previsto
         fVlrRecebido := qryHistMovHMEVLRPREVISTO.AsCurrency;
      end;

      if (sFlgTipoDiverg = '3') or (sFlgTipoDiverg = '4') then
      begin
         NovosDadosParcela.Valor         := abs(qryHistMovHMEVLRPREVISTO.AsCurrency) - abs(fVlrRecebido);

         // faz a jogada do valor negativo
         if qryHistMovHMEVLRPREVISTO.AsCurrency < 0 then NovosDadosParcela.Valor := NovosDadosParcela.Valor * (-1);

         NovosDadosParcela.FlgBaixado    := 0;
         NovosDadosParcela.FlgDivergPend := 1;

         InsereDiferencaHist(qryHistMov, NovosDadosParcela);
      end;

      // -- 3ºPasso --------------------------------------------------------------------------------
      if Result then
      begin
         sFlgBaixado    := 'NULL';
         sFlgDivergPend := '0';
         sFlgTipoDiverg := 'NULL';

         SQL.Clear;
         SQL.Add(' UPDATE HISTMOVEMPTMO '+
                 ' SET FLGBAIXADO         = ' + sFlgBaixado + ',' +
                 '     HMEDATAEFETIVA     = TO_DATE(''' + sDataBaixa + ''',''DD/MM/YYYY''), '+
                 '     FLGENVIO           = NULL, ' +
                 '     FLGDIVERGPEND      = ' + sFlgDivergPend + ',' +
                 '     FLGBAIXAMANUAL     = 1, ' +
                 '     FLGTIPODIVERG      = ' + sFlgTipoDiverg + ',' +
                 '     HMEVLREFETIVO      = ' + NumeroIngles(fVlrRecebido) +
                 ' WHERE IDHISTMOVEMPTMO  = ' + qryHistMov.FieldByname('IDHISTMOVEMPTMO').AsString);
         try
            ExecSql;
         except;
            MsgDlg('Erro ao atualizar o Histórico.', 'Empréstimo', mtError, [mbOk], 0);
            Repaint;
            Result := False;
         end;
      end;

     {FIM - 3ºPasso}

   end; // with qryAux do

   // quitação
   if ( (qryHistMovHMECENTRALIZA.AsInteger = 1) and (qryHistMovHMETIPOMOV.AsInteger = 3) and
        (qryHistMov.FieldByname('HMEVLRPREVISTO').AsCurrency = fVlrRecebido) ) then
   begin
      CalcEmptmo.AtualizaFlgSituacao(qryHistMovIDCONTRATOEMPTMO.AsInteger, 'CONTRATOEMPTMO', 'Q', sMsg);
   end;
end;



function TfrmExecTrataParcela.BaixaManualFolha: Boolean;
var
   dDataBaixa        : TDateTime;
   sDataBaixa        : String;
   fVlrRecebido      : Currency;
   lsMesCobranca     : String;
   sFlgBaixado       : String;
   sFlgDivergPend    : String;
   sFlgTipoDiverg    : String;
   sMsg              : String;
   NovosDadosParcela : TNovosDados;
begin
   {1º Passo: Verifica se a FOLHA já leu TMPDESC (TMPDESC.SITENVIO = 1)}
   {2º Passo: Excluir todos os ítems do mesmo MESCOBRANCA!}
   {3º Passo: Marcar FLGBAIXADO  = NULL           }

   // atribui a data de baixa
   dDataBaixa := edtDataVencimento.Date;
   sDataBaixa := FormatDateTime('dd/mm/yyyy', dDataBaixa);

   // atribui o valor recebido
   if edtVlrRecebido.Value > 0 then fVlrRecebido := edtVlrRecebido.Value;


   lsMesCobranca   := qryHistMov.FieldByName('HMEANOCOBRANCA').AsString+'/'+
                      Biblioteca.ZD(Trim(qryHistMov.FieldByName('HMEMESCOBRANCA').AsString), 2);

   // -- 1ºPasso -----------------------------------------------------------------------------------
   Result := True;

   sFlgBaixado    := 'NULL';
   sFlgDivergPend := '0';
   sFlgTipoDiverg := 'NULL';

   // só poderá haver divergência de valores se o valor recebido estiver preenchido
   if edtVlrRecebido.Value > 0 then
   begin
      if edtVlrRecebido.Value < qryHistMov.FieldByname('HMEVLRPREVISTO').AsCurrency then
      begin
         sFlgDivergPend := '1';
         sFlgTipoDiverg := '3';
      end;

      if edtVlrRecebido.Value > qryHistMov.FieldByname('HMEVLRPREVISTO').AsCurrency then
      begin
         sFlgDivergPend := '1';
         sFlgTipoDiverg := '4';
      end;
   end
   else
   begin
      // se o valor recebido não estiver preenchido, o valor recebido será o valo previsto
      fVlrRecebido := qryHistMov.FieldByname('HMEVLRPREVISTO').AsCurrency;
   end;

   // se recebido a menor ou recebido a maior
   if ( (sFlgTipoDiverg = '3') or (sFlgTipoDiverg = '4') ) then
   begin
      NovosDadosParcela.Valor         := qryHistMov.FieldByname('HMEVLRPREVISTO').AsCurrency - fVlrRecebido;
      NovosDadosParcela.FlgBaixado    := 0;
      NovosDadosParcela.FlgDivergPend := 1;

      InsereDiferencaHist(qryHistMov, NovosDadosParcela);
   end;

   with qryAux do
   begin
      if Result then
      begin
         sFlgBaixado    := 'NULL';
         sFlgDivergPend := '0';
         sFlgTipoDiverg := 'NULL';

         SQL.Clear;
         SQL.Add(' UPDATE HISTMOVEMPTMO ' +
                 ' SET FLGBAIXADO         = ' + sFlgBaixado + ',' +
                 '     HMEDATAEFETIVA     = TO_DATE(''' + sDataBaixa + ''',''DD/MM/YYYY''), '+
                 '     FLGENVIO           = NULL, ' +
                 '     FLGDIVERGPEND      = ' + sFlgDivergPend + ',' +
                 '     FLGBAIXAMANUAL     = 1, ' +
                 '     FLGTIPODIVERG      = ' + sFlgTipoDiverg + ',' +
                 '     HMEVLREFETIVO      = ' + NumeroIngles(fVlrRecebido) +
                 ' WHERE IDHISTMOVEMPTMO  = ' + qryHistMov.FieldByname('IDHISTMOVEMPTMO').AsString);
         try
            ExecSQL;
         except;
            MsgDlg('Erro ao atualizar Histórico.', 'Empréstimo', mtError, [mbOk], 0);
            Repaint;
            Result := False;
            Exit;
         end;
      end;
   end;

   // quitação
   if ( (qryHistMovHMECENTRALIZA.AsInteger = 1) and (qryHistMovHMETIPOMOV.AsInteger = 3) and
        (qryHistMov.FieldByname('HMEVLRPREVISTO').AsCurrency = fVlrRecebido) ) then
   begin
      CalcEmptmo.AtualizaFlgSituacao(qryHistMovIDCONTRATOEMPTMO.AsInteger, 'CONTRATOEMPTMO', 'Q', sMsg);
   end;
end;



procedure TfrmExecTrataParcela.btnAbonoClick(Sender: TObject);
var
   iPlanilha      : Int64;
   sDataAbono     : String;
   bExisteSaldo   : Boolean;
   bExisteAberto  : Boolean;
   sErro          : String;
   sSituacao      : String;
   sNovaSituacao  : String;
begin
   inherited;

   // ----------------------------------------------------------------------------------------------
   //
   // 1º Passo: Verifica se a FOLHA já leu TMPDESC (TMPDESC.SITENVIO = 1)
   // 2º Passo: Tratar ítem (válido) atualizando na tabela.
   // 3º Passo: Preparar entrada para contabilidade.
   //
   // ----------------------------------------------------------------------------------------------

   // 1ºPasso ------------------------------------------------------------------------------------ 

   TipoTratamento := ttAbono;
   if not(VerificaPreenchimento(ttAbono)) then Exit;

   ParametrosSistema;
   if not(dtmBaseDados.dbBaseDados.InTransaction) then StartTransacao;

   with qryHistMov do
   begin
      DisableControls;

      // Acerta tela de acompanhamento
      frmAguarde.Max := RecordCount;
      frmAguarde.Pos := 0;

      frmAguarde.Mostra('Processando Abono. Aguarde...');

      First;
      while not(qryHistMov.EOF) do
      begin
         // Atualiza tela de acompanhamento
         frmAguarde.Pos := frmAguarde.Pos + 1;

         // Caso não tenha sido selecionado pula
         if FieldByName('FLGESCOLHA').AsInteger = 0 then
         begin
            qryHistMov.Next;
            Continue;
         end;

         pbOk := True;

         // 1º Passo -------------------------------------------------------------------------------
         if pbOk then
         begin
            if (qryHIstMov.FieldByName('HMETIPOMOV').AsInteger <> 4) then
            begin
               MsgDlg('Só é permitido o abono de encargos.' + #13 +
                      'Não é possível efetuar operação.', 'Empréstimo', mtWarning, [mbOk], 0);
               pbOk := False;
               PreencheTabelaVirtual(False);
               Next;
               Continue;
            end;
         end;

         // exibe controle para informar DATAEFETIVA
         lblData.Caption := 'Data Efetiva';

         sDataAbono := FormatDateTime('dd/mm/yyyy', edtDataProcesso.Date);

         with qryAux do
         begin
            if pbOk then
            begin
               SQL.Clear;
               SQL.Text :=
               'UPDATE '                                                                           + #13 +
               '  HISTMOVEMPTMO '                                                                  + #13 +
               'SET '                                                                              + #13 +
               '  FLGABONADO           = 1, '                                                      + #13 +
               '  FLGDIVERGPEND        = 0, '                                                      + #13 +
               '  FLGTIPODIVERG        = NULL, '                                                   + #13 +
               '  FLGENVIO             = NULL, '                                                   + #13 +
               '  HMEDATAQUITABONO     = TO_DATE(' + QuotedStr(sDataAbono) + ', ''DD/MM/YYYY'') '  + #13 +
               'WHERE '                                                                            + #13 +
               '      IDCONTRATOEMPTMO = ' + IntToStr(qryHistMovIDCONTRATOEMPTMO.AsInteger)        + #13 +
               '  AND HMEPARCELA       = ' + IntToStr(qryHistMovHMEPARCELA.AsInteger)              + #13 +
               '  AND IDITEMEMPTMO     = ' + IntToStr(qryHistMovIDITEMEMPTMO.AsInteger)            + #13 +
               '  AND IDHISTMOVEMPTMO  = ' + IntToStr(qryHistMovIDHISTMOVEMPTMO.AsInteger);

               try
                  ExecSql;
               except;
                  MsgDlg('Erro ao atualizar Histórico.', 'Empréstimo', mtError, [mbOk], 0);
                  pbOk := False;
               end;

            end; // if lbOk

         end; // with qryAux


         // 2º Passo -------------------------------------------------------------------------------

         if pbOk then
         begin
            if ( (dtmEmptmo.qryParamEmptmoFLGINTEGRACONTAB.AsInteger = 1) and not(qryHistMovPLNCODIGO.IsNull) ) then
            begin
               if (FieldByName('FLGESCOLHA').AsInteger = 1) and (FieldByName('HMETIPOMOV').AsInteger = 4) then
               begin
                  iPlanilha := ContabilizaAbono;

                  if iPlanilha > 0 then
                  begin
                     with qryAux do
                     begin
                        SQL.Clear;
                        SQL.Text :=
                        'UPDATE HISTMOVEMPTMO '     +
                        'SET PLNCODIGOESTORNO   = ' + IntToStr(iPlanilha) +
                        'WHERE IDCONTRATOEMPTMO = ' + qryHistMov.FieldByname('IDCONTRATOEMPTMO').AsString   +
                        '  AND HMEPARCELA       = ' + qryHistMov.FieldByName('HMEPARCELA').AsString         +
                        '  AND IDITEMEMPTMO     = ' + qryHistMov.FieldByName('IDITEMEMPTMO').AsString;

                        try
                           ExecSql;
                        except;
                           MsgDlg('Erro ao atualizar HIstórico.', 'Empréstimo',MtError,[mbOk],0);
                           pbOk := False;
                        end;
                     end;

                  end; // if iPlanilha > 0

               end;
            end;
         end; // if pbOk

         {FIM - 3ºPasso}
         PreencheTabelaVirtual(False);

         Next;
      end; // while not(EOF)

      EnableControls;
      frmAguarde.Apaga;
   end;


   // ----------------------------------------------------------------------------------------------
   //    Acerto da situação do Contrato
   // ----------------------------------------------------------------------------------------------
   bExisteSaldo := CalcEmptmo.ExisteSaldoDevedor(dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsInteger);

   if bExisteSaldo then
   begin
      // se houver saldo devedor, o Contrato precisa ser (A)tivo
      sNovaSituacao := 'A';
   end
   else
   begin
      bExisteAberto := CalcEmptmo.ExistemItensEmAberto(dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsInteger);

      if not(bExisteAberto) then
      begin
         // se não houver saldo devedor, E não houver itens em aberto,
         // o Contrato está (Q)uitado
         sNovaSituacao := 'Q';
      end
      else
      begin
         sSituacao := dtmEmptmo.qryDadosContratoFLGSITUACAO.AsString;

         if sSituacao = 'K' then
         begin
            // havendo itens em aberto, e havendo quitação, o contrato será 'K' (em quitação)
            sNovaSituacao := 'K';
         end
         else
         begin
            // não havendo quitação, o contrato será apenas (E)ncerrado
            sNovaSituacao := 'E';
         end;
      end;
   end;

   if sNovaSituacao <> '' then
   begin
      CalcEmptmo.AtualizaFlgSituacao(dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsInteger,
                                     'CONTRATOEMPTMO',
                                     sNovaSituacao[1],
                                     sErro);
   end;
   // ----------------------------------------------------------------------------------------------
   //    FIM Acerto da situação do Contrato
   // ----------------------------------------------------------------------------------------------

   // ----------------------------------------------------------------------------------------------
   // Log de operações
   if not(Sistema.GravaLogOperacoes('Trat. Parc Contr ' +
                                    IntToStr(dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsInteger) +
                                    ': Abono.')) then
   begin
      pbOk := False;
      MsgDlg('Falha na gravação do Log da operação.', 'Empréstimo', mtError, [mbOk], 0);
   end;
   // -------------------------------------------------------------------------------------

   if pbOk then
   begin
      if dtmBaseDados.dbBaseDados.InTransaction then CommitTransacao;
      pnlInformaFinal.Color   := clNavy;
   end
   else
   begin
      if dtmBaseDados.dbBaseDados.InTransaction then RollBackTransacao;
      pnlInformaFinal.Color   := clMaroon;
      pnlInformaFinal.Caption := 'Parcela NÃO tratada!';
   end;

   pnlInformaFinal.Update;
   ntbPrincipal.PageIndex  := 2;
end;



// verifica se existe parcela e se foi enviada na TMPDESC
function TfrmExecTrataParcela.VerificaTMPDESC: Boolean;
var
   lbOk           : Boolean;
   lsMesCobranca  : String;
begin
   // 1ºPasso ----------------------------------------------------------------------------------- 
   lsMesCobranca  := qryHistMov.FieldByName('HMEANOCOBRANCA').AsString + '/' +
                     Biblioteca.ZD(Trim(qryHistMov.FieldByName('HMEMESCOBRANCA').AsString), 2);

   lbOk     := True;
   pbExclui := True;

   with qryAux do begin
      SQL.Clear;
      SQL.Add('SELECT COUNT(*) AS OCORRENCIA, SITENVIO FROM TMPDESC WHERE '+
              '     MESCOBRANCA = '+ QuotedStr(lsMesCobranca) +
              ' AND IDDESCONTO  = '+ qryHistMov.FieldByName('IDCONTRATOEMPTMO').AsString +
              ' AND IDMODULO    = '+ IntToStr(Sistema.IdModulo) +
              ' GROUP BY SITENVIO ');
      try
        Open;
      except
        lbOk := False;
        MsgDlg('Erro ao abrir tabela.', 'Empréstimo', mtError, [mbOk], 0);
      end;

      // SE RETORNAR MAIS DE UM REGISTRO PODE HAVER INCONSISTÊNCIA,
      // POIS, PARA UM MESCOBRANCA EXISTE UMA RUBRICA ENVIADA E OUTRA NÃO.
      if RecordCount > 1 then
      begin
         MsgDlg('Existem problemas no Envio.', 'Empréstimo',MtError,[mbOk],0);
         lbOk := False;
      end;

      // uma linha não eviada.
      lbOk := (RecordCount = 1) and (FieldByName('SITENVIO').AsInteger = 0);

      if (not lbOk) and (not IsEmpty) then
         MsgDlg('A parcela já foi Enviada pela Folha de Benefícios'+#13+
                'Não é possível efetuar operação.','Empréstimo',MtError,[mbOk],0)
      else if IsEmpty then
      begin
         lbOk :=  MsgDlg('Não há registros enviados para Folha de Benefícios.'+#13+
                         'Deseja continuar o processo?', 'Empréstimo', mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrYes;
         pbExclui := False;
      end;
   end;

   Result := lbOk;
end;



procedure TfrmExecTrataParcela.btnSuspensaoClick(Sender: TObject);
var
  iAno, iMes, iDia: Word;
begin
   inherited;

   TipoTratamento := ttSuspensao;
   if not(VerificaPreenchimento(ttSuspensao)) then Exit;

   try
      DesabilitaBotoes;

      // separa as datas
      DecodeDate(edtDataProcesso.Date, iAno, iMes, iDia);

      if not(dtmBaseDados.dbBaseDados.InTransaction) then StartTransacao;

      if MsgDlg('A Suspensão de Cobrança não terá efeito se o(s) Item(ns) selecionados já estiver(em) enviado(s).' + #13 + #13 +
                'Deseja prosseguir com a Suspensão?', 'Empréstimo', mtConfirmation, [mbYes,mbNo], 0) = mrNo then
      begin
         Repaint;
         Exit;
      end;

      Repaint;

      with qryHistMov do
      begin
         DisableControls;
         First;
         while not(qryHistMov.EOF) do
         begin
            if qryHistMovFLGESCOLHA.AsInteger = 1 then
            begin
               try
                  with qryMarcaSuspensao do
                  begin
                     LimpaParametros(qryMarcaSuspensao);
                     ParamByName('PIDCONTRATOEMPTMO').AsInteger   := qryHistMovIDCONTRATOEMPTMO.AsInteger;
                     ParamByName('PIDHISTMOVEMPTMO').AsInteger    := qryHistMovIDHISTMOVEMPTMO.AsInteger;
                     ParamByName('PHMEANOSUSPENSAO').AsInteger    := iAno;
                     ParamByName('PHMEMESSUSPENSAO').AsInteger    := iMes;

                     ExecSQL;
                  end;

                  // -------------------------------------------------------------------------------
                  //    InsertLogTotalPrev();
                  // -------------------------------------------------------------------------------

               except
                  RollBackTransacao;

                  MsgDlg('Ocorreu um ERRO ao tentar suspender o item!', 'Empréstimo', mtError, [mbOK], 0);
                  Repaint;

                  PreencheTabelaVirtual(False);
                  Exit;
               end;
            end;

            PreencheTabelaVirtual(True);
            qryHistMov.Next;
         end;
         EnableControls;
      end;

      if dtmBaseDados.dbBaseDados.InTransaction then CommitTransacao;

   finally
      qryHistMov.Close;
      qryHistMov.Open;

      qryHistMovVirtual.Close;

      HabilitaBotoes;
   end;
end;



procedure TfrmExecTrataParcela.ProcessaMudancaVencimento;
var
   sSQL                 : String;
   sDataVencto          : String;
   sNovaFormaCobranca   : String;
   sNovoMesCobranca     : String;
   sNovoAnoCobranca     : String;
   sAnoMesCompet        : String;
   sNovaDataCobranca    : String;
begin
   pbOk := True;

   // Passos do processamento:
   //   1 - Selecionar todos os itens da parcela
   //   2 - Chamar regra de atualização de valores dos itens
   //   3 - Desfazer o envio da parcela
   //   4 - Armazenar o numero do documento anterior gerado e salvar em historico de documento
   //   5 - Baixar documento anterior


   // PASSO 1 - Selecionar todos os itens da parcela

   if not(dtmBaseDados.dbBaseDados.InTransaction) then StartTransacao;

   sRegistros  := '';
   sDataVencto := QuotedStr(edtDataVencimento.Text);

   try
      // Varre todo historico de Divergencias e trata as escolhidas
      with qryHistMov do
      begin
         DisableControls;

         // Acerta tela de acompanhamento
         frmAguarde.Max := RecordCount;
         frmAguarde.Pos := 0;

         frmAguarde.Mostra('Processando, Aguarde...');

         First;
         while not(qryHistMov.EOF) do
         begin
            // Atualiza tela de acompanhamento
            frmAguarde.Pos := frmAguarde.Pos + 1;

            // Caso não tenha sido selecionado pula
            if qryHistMovFLGESCOLHA.AsInteger = 0 then
            begin
               Next;
               Continue;
            end;

            sNovaFormaCobranca := 'C'; // FieldByName('HMEFORMACOBRANCA').AsString;

            sNovaDataCobranca  := edtDataVencimento.Text;

            sNovoMesCobranca   := Copy(sNovaDataCobranca, 4, 2);
            sNovoAnoCobranca   := Copy(sNovaDataCobranca, 7, 4);

            Sel(FieldByName('IDCONTRATOEMPTMO').AsInteger);

            // Preenche registro com os dados do Contrato
            PreencheDadosContrato(dtmEmptmo.qryDadosContrato, rContrato);

            sAnoMesCompet  := FormatFloat('0000', FieldByName('HMEANOCOMPETENCIA').AsFloat) +
                              FormatFloat('00', FieldByName('HMEMESCOMPETENCIA').AsFloat);

// PASSO 2 - Chamar regra de atualização de valores dos itens

            if not(CalcEmptmo.CalculaItensDiverg(rContrato,
                                                 7,            // Origem
                                                 sDiaSldDev,
                                                 FieldByName('HMEPARCELA').AsInteger,
                                                 FieldByName('HMENUMPARCELAS').AsInteger,
                                                 DiasUteis.ExtraiAno(edtDataVencimento.Date),
                                                 DiasUteis.ExtraiMes(edtDataVencimento.Date),
                                                 edtDataVencimento.Date,
                                                 edtDataVencimento.Date,
                                                 edtDataVencimento.Date,
                                                 sNovaFormaCobranca,
                                                 vLista,
                                                 True,
                                                 True
                                                 )) then
            begin
               // Não foi possível atualizar os itens, ou por problemas no Cálculo, ou
               //   por Cancelamento do Usuário, logo o procedimento será abortado
               pbOk := False;
               frmAguarde.Apaga;
               Exit;
            end;


            PreencheTabelaVirtualVencimento(True);


            // -------------------------------------------------------------------------------------
            // PASSO 4 - Armazenar o numero do documento anterior gerado e salvar em historico de documento
            // -------------------------------------------------------------------------------------
            if sRegistros <> '' then sRegistros := sRegistros + ',';
            sRegistros := sRegistros + IntToStr(qryHistMovIDHISTMOVEMPTMO.AsInteger);

            if not(qryHistMovCODDOCUMENTO.IsNull) then
            begin
               with dtmEmptmo.qryAuxEmptmo do
               begin
                  sSQL :=
                  'INSERT INTO HISTMOVXDOCUM '                          + #13 +
                  '(IDHISTMOVEMPTMO, HMDCODDOCUMENTO, HMDDATA) '        + #13 +
                  'VALUES '                                             + #13 +
                  '( ' + IntToStr(qryHistMovIDHISTMOVEMPTMO.AsInteger)  + ',' +
                         qryHistMovCODDOCUMENTO.AsString                + ',' +
                         QuotedStr(DateToStr(Date))                     + ' ) ';

                  Close;
                  SQL.Clear;
                  SQL.Text := sSQL;
                  ExecSQL;
               end;
            end;
            // -------------------------------------------------------------------------------------


            // -------------------------------------------------------------------------------------
            // PASSO 5 - Baixar documento anterior
            // -------------------------------------------------------------------------------------
            if not(qryHistMovCODDOCUMENTO.IsNull) then
            begin
               IntegraEmptmo.EfetuaBaixaCAR(qryHistMovCODDOCUMENTO.AsInteger);

               with dtmEmptmo.qryAuxEmptmo do
               begin
                  sSQL :=
                  'UPDATE '                     + #13 +
                  '  HISTMOVEMPTMO '            + #13 +
                  'SET '                        + #13 +
                  '  CODDOCUMENTO    = NULL '   + #13 +
                  'WHERE '                      + #13 +
                  '  IDHISTMOVEMPTMO = '        + IntToStr(qryHistMovIDHISTMOVEMPTMO.AsInteger);

                  Close;
                  SQL.Clear;
                  SQL.Text := sSQL;
                  ExecSQL;
               end;
            end;
            // -------------------------------------------------------------------------------------


            // -------------------------------------------------------------------------------------
            // PASSO 3 - Desfazer o envio da parcela
            // -------------------------------------------------------------------------------------
            sSQL :=
            'UPDATE '                                                                        + #13 +
            '  HISTMOVEMPTMO '                                                               + #13 +
            'SET '                                                                           + #13 +
            '  HMEDATAVENCTO    = '   + 'TO_DATE(' + sDataVencto + ', ''DD/MM/YYYY''), '     + #13 +
            '  HMEANOCOBRANCA   = ' + sNovoAnoCobranca   + ', '                              + #13 +
            '  HMEMESCOBRANCA   = ' + sNovoMesCobranca   + ', '                              + #13 +
            '  HMEFORMACOBRANCA = ' + QuotedStr(sNovaFormaCobranca)  + ', '                  + #13 +
            '  FLGENVIO         = 0, '                                                       + #13 +
            '  FLGSUSPENSAO     = NULL, '                            + #13 +
            '  FLGDIVERGPEND    = 0, '                               + #13 +
            '  FLGDIVERGTRAT    = 1, '                               + #13 +
            '  CODDOCUMENTO     = NULL '                             + #13 +
            'WHERE '                                                 + #13 +
            '  IDHISTMOVEMPTMO = ' + IntToStr(qryHistMovIDHISTMOVEMPTMO.AsInteger);

            with dtmEmptmo.qryAuxEmptmo do
            begin
               Close;
               SQL.Clear;
               SQL.Text := sSQL;
               ExecSQL;
            end;
            // -------------------------------------------------------------------------------------

            qryHistMov.Next;
         end;  // while not(qryHistMov.EOF)

         First;
         EnableControls;
      end;  // with qryHistMov

   except
      //
   end;

   btnConfirmar.Visible   := True;
   btnConfirmar.Enabled   := True;

   frmAguarde.Apaga;
end;



procedure TfrmExecTrataParcela.PreencheTabelaVirtualVencimento(bAbreTabela : Boolean);
var
   i : Integer;
   sMesCobranca  : String;
begin
   if (bAbreTabela) or not(qryHistMovVirtual.Active) then
   begin
      qryHistMovVirtual.Close;
      qryHistMovVirtual.Open;
   end;

   sMesCobranca   := Copy(edtDataVencimento.Text, 7, 4) + '/' + Copy(edtDataVencimento.Text, 4, 2) ;

   // Laço que varre o vetor Lista inserindo na tabela virtual TODOS os itens calculados
   for i := 0 to High(vLista) do
   begin
      qryHistMovVirtual.Insert;

      qryHistMovVirtualIDCONTRATOEMPTMO.AsInteger  := qryHistMovIDCONTRATOEMPTMO.AsInteger;
      qryHistMovVirtualIDHISTMOVEMPTMO.AsInteger   := 0;
      qryHistMovVirtualDESCRICAO.AsString          := vLista[i].Nome;
      qryHistMovVirtualANOMES.AsString             := sMesCobranca;
      qryHistMovVirtualHMEDATAPREVISTA.AsDateTime  := edtDataVencimento.Date;
      qryHistMovVirtualHMEPARCELA.AsInteger        := vLista[i].Parcela;
      qryHistMovVirtualPARCELA.AsInteger           := vLista[i].Parcela;
      qryHistMovVirtualTRATAMENTO.AsString         := 'Mudança de Vencimento';
      qryHistMovVirtualHMEDATAVENCTO.AsString      := qryHistMovHMEDATAVENCTO.AsString;
      qryHistMovVirtualVALOR.AsCurrency            := vLista[i].Valor;

      qryHistMovVirtual.Post;

   end;  // for i := 0 to High(vLista)
end;



procedure TfrmExecTrataParcela.btnConfirmarClick(Sender: TObject);
var
   sAnoCobranca     : String;
   sMesCobranca     : String;
   sSQL             : String;
   sSQLAgrupaDocs   : String;
   sResult, sErro   : TStringList;
   i                : Integer;
   iPlanilha        : Integer;
   sMensagem        : String;
   sDocumentos      : String;
   IDHistMovEmptmo  : Int64;
   IDContratoEmptmo : Int64;
begin
   // Passos:
   //   1 - Gravar Historico
   //   3 - Gerar CAR
   //   4 - Fazer envio (agrupado ou individual)

   inherited;

   sAnoCobranca := Copy(edtDataVencimento.Text, 7, 4);
   sMesCobranca := Copy(edtDataVencimento.Text, 4, 2);

   // PASSO 1 - Gravar Historico -----------------------------------------------------------------

   with qryHistMovVirtual do
   begin
      First;
      IDContratoEmptmo := 0;

      while not(qryHistMovVirtual.EOF) do
      begin
         if IDContratoEmptmo <> FieldByName('IDCONTRATOEMPTMO').AsInteger then
         begin
            IDContratoEmptmo := FieldByName('IDCONTRATOEMPTMO').AsInteger;
            sAnoCobranca     := Copy(edtDataVencimento.Text, 7, 4);
            sMesCobranca     := Copy(edtDataVencimento.Text, 4, 2);

            CalcEmptmo.GravaMovEmptmo(rContrato,
                                      vLista,
                                      4, // = Atualização
                                      FieldByName('HMEPARCELA').AsInteger,
                                      -1, // Ano Competencia
                                      -1, // Mes Competencia
                                      StrToInt(sAnoCobranca), StrToInt(sMesCobranca),
                                      -1, // nº de parcelas remanescentes
                                      FieldByName('HMEDATAPREVISTA').AsDateTime,
                                      FieldByName('HMEDATAPREVISTA').AsDateTime,
                                      '',
                                      '',
                                      False, // mostra progresso
                                      IDHistMovEmptmo);

            for i := 0 to high(vLista) do
            begin
               if sRegistros <> '' then sRegistros := sRegistros + ',';
               sRegistros := sRegistros + IntToStr(vLista[i].IdHistMovEmptmo);
            end;

         end; // IDContratoEmptmo <> FieldByName('IDCONTRATOEMPTMO')

         qryHistMovVirtual.Next;
      end; // while not(qryHistMovVirtual.EOF)
   end; // with qryHistMovVirtual

   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------


{
      // -------------------------------------------------------------------------------------------
      // PASSO 2 - Contabilizar
      // -------------------------------------------------------------------------------------------

   sSQL :=
   'SELECT'                                                                         + #13 +
   '  H.IDHISTMOVEMPTMO,'                                                           + #13 +
   '  H.IDCONTRATOEMPTMO,'                                                          + #13 +
   '  TC.IDTIPOCONTREMPTMO,'                                                        + #13 +
   '  H.IDITEMEMPTMO,'                                                              + #13 +
   '  C.IDPLANOPREV,'                                                               + #13 +
   '  C.IDPATRO,'                                                                   + #13 +
   '  H.HMEVLRPREVISTO,'                                                            + #13 +
   '  H.HMEVLREFETIVO,'                                                             + #13 +
   '  H.HMEFORMACOBRANCA,'                                                          + #13 +
   '  ITC.TIPCODIGO'                                                                + #13 +

   'FROM'                                                                           + #13 +
   '  HISTMOVEMPTMO   H,'                                                           + #13 +
   '  TIPOCONTREMPTMO TC,'                                                          + #13 +
   '  CONTRATOEMPTMO  C,'                                                           + #13 +
   '  ITEMXTIPOCONTR  ITC,'                                                         + #13 +
   '  TIPOEMPTMO      TE'                                                           + #13 +

   'WHERE'                                                                          + #13 +
   '      TE.IDEMPRESAPROP      = ' + IntToStr(Sistema.IDEmpresa)                   + #13 +
   '  AND H.IDCONTRATOEMPTMO    = ' + IntToStr(dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.asInteger) + #13 +
   '  AND H.HMETIPOMOV          = 4'                                                + #13 +
   '  AND H.HMEORIGEM           = 7'                                                + #13 +
   '  AND H.HMEANOCOMPETENCIA   = ' + sAnoCobranca                                  + #13 +
   '  AND H.HMEMESCOMPETENCIA   = ' + sMesCobranca                                  + #13 +
   '  AND H.PLNCODIGO           IS NULL'                                            + #13 +
   '  AND ( H.HMECENTRALIZA     = 0 OR H.HMECENTRALIZA IS NULL )'                   + #13 +
   '  AND ( H.FLGESTORNADO      = 0 OR H.FLGESTORNADO IS NULL )'                    + #13 +
   '  AND TC.IDTIPOEMPTMO       = TE.IDTIPOEMPTMO'                                  + #13 +
   '  AND ITC.IDTIPOCONTREMPTMO = TC.IDTIPOCONTREMPTMO'                             + #13 +
   '  AND C.IDTIPOCONTREMPTMO   = TC.IDTIPOCONTREMPTMO'                             + #13 +
   '  AND H.IDCONTRATOEMPTMO    = C.IDCONTRATOEMPTMO'                               + #13 +

   'ORDER BY' + #13 +
   '  HMEANOCOMPETENCIA, HMEMESCOMPETENCIA, H.IDCONTRATOEMPTMO'   + #13;


   // prepara o Histórico-padrão que será passado adiante
   sMensagem  := 'Mudança de vencimento para: ' + edtDataVencimento.Text + '.';

   // chama a função de contabilização passando o SQL acima
   if not qryHistMovVirtual.IsEmpty then
      IntegraEmptmo.ContabilizaItens('C', 'N', sSQL, sMensagem, edtDataProcesso.Date, sResult, sErro, iPlanilha);
}

   // ----------------------------------------------------------------------------------------------
   // PASSO 3 - Gerar CAR
   // ----------------------------------------------------------------------------------------------

   sSQL :=
   'SELECT '                                                                                 + #13 +
   '  HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO, HME.IDITEMEMPTMO  , '                       + #13 +
   '  HME.HMEFORMACOBRANCA, HME.IDITEMCENTRALIZA, HME.HMEVLRPREVISTO, '                      + #13 +
   '  HME.HMERECPAG, HME.HMEDATAPREVISTA, HME.HMEDATAVENCTO, HME.HMESALDODEV, '              + #13 +

   '  (LTRIM(RTRIM(TO_CHAR(HME.HMEMESCOMPETENCIA, ''00'')))) '                               + #13 +
   '  || ''/'' || '                                                                          + #13 +
   '  (LTRIM(RTRIM(TO_CHAR(HME.HMEANOCOMPETENCIA, ''0000'')))) AS ANOMESCOMPETENCIA, '       + #13 +

   '  ITC.CONTABAIXA, ITC.TIPCODIGO, ITC.ITCTRATASALDODEV, CNT.IDTIPOSUSPEMPTMO, '           + #13 +
   '  CNT.IDPLANOPREV, CNT.IDPATRO, CNT.IDBENEF, CNT.IDPESSOA, '                             + #13 +
   '  CNT.CODFORMAPAG, CNT.PORTFORMAPAG, CNT.PORTFORMAREC, CNT.IDCBANCARIA, '                + #13 +
   '  TIP.IDTIPOCONTREMPTMO, IRC.ITEDESCRICAO '                                              + #13 +

   'FROM '                                                                                   + #13 +
   '  HISTMOVEMPTMO   HME, '                                                                 + #13 +
   '  CONTRATOEMPTMO  CNT, '                                                                 + #13 +
   '  ITEMXTIPOCONTR  ITC, '                                                                 + #13 +
   '  TIPOCONTREMPTMO TIP, '                                                                 + #13 +
   '  ITEMEMPTMO      IRC, '                                                                 + #13 +
   '  TIPOEMPTMO      TEM '                                                                  + #13 +

   'WHERE '                                                                                  + #13 +
   '       ( HME.HMEFORMACOBRANCA   = ''C'' ) '                                              + #13 +
   '   AND ( CNT.FLGSITUACAO        <> ''C'' ) '                                             + #13 +

   '   AND ( HME.FLGENVIO           = 0 ) '                                                  + #13 +
   '   AND ( HME.HMEVLREFETIVO      IS NULL ) '                                              + #13 +

   '   AND ( HME.HMECENTRALIZA      = 1 OR HME.HMEDESTACADO    = 1 ) '                       + #13 +
   '   AND ( HME.FLGESTORNADO       = 0 OR HME.FLGESTORNADO    IS NULL ) '                   + #13 +
   '   AND ( HME.FLGABONADO         = 1 OR HME.FLGABONADO      IS NULL ) '                   + #13 +
   '   AND ( HME.FLGQUITADO         = 1 OR HME.FLGQUITADO      IS NULL ) '                   + #13;

//   '   AND ( HME.FLGDIVERGPEND      = 0 OR HME.FLGDIVERGPEND   IS NULL ) '                   + #13;
//   '   AND ( HME.HMEANOCOBRANCA = ' + sAnoCobranca + ' ) '                                   + #13 +
//   '   AND ( HME.HMEMESCOBRANCA = ' + sMesCobranca + ' ) '                                   + #13;

   sSQL := sSQL +
   '   AND ( CNT.IDCONTRATOEMPTMO   = ' + IntToStr(rContrato.IdContratoEmptmo) + ' ) '       + #13 +
   '   AND ( TEM.IDEMPRESAPROP      = ' + IntToStr(Sistema.IDEmpresa) + ' ) '                + #13 +
   '   AND ( HME.IDCONTRATOEMPTMO   = CNT.IDCONTRATOEMPTMO  ) '                              + #13 +
   '   AND ( CNT.IDTIPOCONTREMPTMO  = TIP.IDTIPOCONTREMPTMO ) '                              + #13 +
   '   AND ( TIP.IDTIPOEMPTMO       = TEM.IDTIPOEMPTMO ) '                                   + #13 +
   '   AND ( CNT.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPTMO ) '                              + #13 +
   '   AND ( ITC.IDITEMEMPTMO       = IRC.IDITEMEMPTMO ) '                                   + #13 +
   '   AND ( ITC.IDITEMEMPTMO       = HME.IDITEMEMPTMO ) '                                   + #13;

   sSql := sSql +
   '   AND ( HME.IDHISTMOVEMPTMO IN (' + sRegistros + ')  ) '                                + #13;

   try
      sResult   := TStringList.Create;
      sErro     := TStringList.Create;

      iPlanilha := 0;

      // prepara o Histórico-padrão que será passado adiante
      sMensagem  := 'Mudança de vencimento de Parcela de Empréstimo para: ' + edtDataVencimento.Text;

      IntegraEmptmo.EnviaCAPCAR(sSql,
                                sMensagem,
                                edtDataProcesso.Date,
                                StrToInt(DBcboTipoDocRec.LookupValue),
                                Modulo.iMoedaCorrente,
                                Modulo.sCentroCusto,
                                Modulo.iPrograma,
                                iPlanilha,
                                sResult,
                                sErro);

   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------


      // -------------------------------------------------------------------------------------------
      // PASSO 4 - Fazer envio (agrupado ou individual)
      // -------------------------------------------------------------------------------------------

      // Busca os documentos gerados
      with qryAux do begin
         SQL.Clear;
         sSQL :=
         'SELECT DISTINCT CODDOCUMENTO '                                     + #13 +
         'FROM   HISTMOVEMPTMO'                                              + #13 +
         'WHERE '                                                            + #13 +
         '       ( HMEFORMACOBRANCA = ''C'' ) '                              + #13 +
         '   AND ( CODDOCUMENTO IS NOT NULL ) '                              + #13 +
         '   AND ( FLGENVIO IS NULL ) '                                      + #13 +
         '   AND ( FLGDIVERGPEND IS NULL OR FLGDIVERGPEND = 0 ) '            + #13 +
         '   AND ( HMEANOCOBRANCA    = ' + sAnoCobranca + ' ) '              + #13 +
         '   AND ( HMEMESCOBRANCA    = ' + sMesCobranca + ' ) '              + #13 +
         '   AND ( IDCONTRATOEMPTMO  = ' + IntToStr(rContrato.IDContratoEmptmo) + ' ) '     + #13;

         SQL.Text := sSQL;
         Open;
      end;
      // -------------------------------------------------------------------------------------------
      // -------------------------------------------------------------------------------------------


      // -------------------------------------------------------------------------------------------
      // -------------------------------------------------------------------------------------------
      // -------------------------------------------------------------------------------------------
      if cbxAgrupaParcela.Checked then
      begin
         // Seleção dos documentos para gerar boleto
         sSQLAgrupaDocs :=
         'SELECT ' + #13 +
         '   CODDOCUMENTO, DATAVENCTO, CODPORTFORMA, GRUPODOC '     + #13 +
         'FROM '                                                    + #13 +
         '   DOCUMENTO '                                            + #13 +
         'WHERE '                                                   + #13 +
         '       ( (EMISBLOQ <> ''S'') OR (EMISBLOQ IS NULL) ) '    + #13 +
         '   AND ( (RTRIM(STATUS) <> ''2'') OR (STATUS IS NULL) ) ' + #13 +
         '   AND ( DATAVENCTO = TO_DATE(' + QuotedStr(edtDataVencimento.Text) + ',' + QuotedStr('dd/mm/yyyy')+') )' + #13;

         with qryAux do
         begin
            sDocumentos := '';
            while not(EOF) do
            begin
               sDocumentos := sDocumentos + qryAux.FieldByname('CODDOCUMENTO').AsString;
               Next;
               if not(EOF) then sDocumentos := sDocumentos + ',';
            end;
            Close;
         end;

         with qryAgrupaDocs do
         begin
            SQL.Text := sSQLAgrupaDocs + '   AND ( CODDOCUMENTO IN (' + sDocumentos + ') )' + #13;
         end;

         // agrupa todos os documentos daquele contrato que tenham o mesmo vencimento
         // e já altera o EMISBLOQ para 'N'
         Documento.IntBanco.AgrupaDocCNAB(qryAgrupaDocs, True, True, True, True, ['DATAVENCTO']);
      end;
      // -------------------------------------------------------------------------------------------
      // -------------------------------------------------------------------------------------------
      // -------------------------------------------------------------------------------------------


      try
         // -------------------------------------------------------------------------------------
         // Log de operações
         if not(Sistema.GravaLogOperacoes('TratParc Contr ' +
                                          IntToStr(dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsInteger) +
                                          ': Alt Vencto para ' +
                                          FormatDateTime('dd/mm/yyyy', edtDataVencimento.Date))) then
         begin
            Raise Exception.Create('Falha na gravação do Log da operação.');
         end;
         // -------------------------------------------------------------------------------------


         if dtmBaseDados.dbBaseDados.InTransaction then CommitTransacao;

      except
         Raise;
         Repaint;

         if dtmBaseDados.dbBaseDados.InTransaction then RollBackTransacao;
      end;

   finally
      sResult.Free;
      sErro.Free;
   end;

   btnConfirmar.Visible   := False;
end;



procedure TfrmExecTrataParcela.btnAlteraVenctoClick(Sender: TObject);
var
   iParcela : Integer;
   iRecno   : TBookMark;
begin
   inherited;

   if qryHistMovFLGESCOLHA.Asinteger = 1 then
   begin
      qryHistMov.DisableControls;

      iParcela := qryHistMov.FieldByName('HMEPARCELA').AsInteger;
      iRecno   := qryHistMov.GetBookMark;

      qryHistMov.First;
      while not(qryHistMov.EOF) do
      begin
         if (qryHistMovHMEPARCELA.AsInteger = iParcela) and
            (qryHistMovFLGESCOLHA.AsInteger = 0) then
         begin
            qryHistMov.Edit;
            qryHistMovFLGESCOLHA.AsInteger := 1;
            qryHistMov.Post;
         end;
         qryHistMov.Next;
      end;

      qryHistMov.GotoBookMark(iRecno);
      qryHistMov.FreeBookMark(iRecno);
      qryHistMov.EnableControls;
   end;

   TipoTratamento := ttVencto;
   if VerificaPreenchimento(ttVencto) then ProcessaMudancaVencimento;

   btnConfirmar.Visible   := True;
   ntbPrincipal.PageIndex := 2;
end;



procedure TfrmExecTrataParcela.qryHistMovFLGESCOLHAChange(Sender: TField);
var
   iParcela : Integer;
   iRecno   : TBookMark;
begin
   inherited;

   if qryHistMov.FieldByName('FLGESCOLHA').Asinteger = 1 then begin
      inc(iContMarcados);
      edtVlrSelecao.Value := edtVlrSelecao.Value + qryHistMovHMEVLRPREVISTO.AsCurrency;
   end else begin
      dec(iContMarcados);
      edtVlrSelecao.Value := edtVlrSelecao.Value - qryHistMovHMEVLRPREVISTO.AsCurrency;
   end;

   // Mostra ou não Opcoes 
   if iContMarcados > 1 then begin
      DBrdgDebito.Enabled   := False;
      DBrdgDebito.ItemIndex := 2;
   end else begin
      DBrdgDebito.Enabled   := True;
   end;
end;



procedure TfrmExecTrataParcela.DBgrdHistMovExit(Sender: TObject);
begin
   inherited;
   if qryHistMov.State in dsEditModes then qryHistMov.Post;
end;



function TfrmExecTrataParcela.ContabilizaAbono: Int64;
var
   sSQL              : String;
   sMes              : String;
   sAno              : String;
   sHistoricoContab  : String;
   sResult, sErro    : TStringList;
   iPlanilhaResult   : Integer;
begin
   Result := 0;

   sSQL   :=
   'SELECT '                                                                                          + #13 +
   '  HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO, HME.IDITEMEMPTMO, '                                  + #13 +
   '  HME.HMETIPOMOV, '                                                                               + #13 +
   '  HME.HMEANOCOMPETENCIA, HME.HMEMESCOMPETENCIA, '                                                 + #13 +
   '  HME.HMEDATAPREVISTA, HME.HMEDATAEFETIVA, '                                                      + #13 +
   '  HME.HMEANOCOBRANCA, HME.HMEMESCOBRANCA, '                                                       + #13 +
   '  HME.HMEVLRPREVISTO, HME.HMEVLREFETIVO, '                                                        + #13 +
   '  HME.HMESEQCOBRANCA, '                                                                           + #13 +
   '  HME.HMEPARCELA, HME.HMESALDODEV, HME.HMETXJUROS, HME.HMEFORMACOBRANCA,'                         + #13 +
   '  HME.FLGESTORNADO, '                                                                             + #13 +
   '  TC.IDTIPOCONTREMPTMO, '                                                                         + #13 +
   '  CNT.IDPLANOPREV, '                                                                              + #13 +
   '  CNT.IDPATRO, '                                                                                  + #13 +
   '  ITC.TIPCODIGO '                                                                                 + #13 +

   'FROM '                                                                                            + #13 +
   '  HISTMOVEMPTMO HME, CONTRATOEMPTMO CNT, ITEMXTIPOCONTR ITC, '                                    + #13 +
   '  TIPOCONTREMPTMO TC, TIPOEMPTMO TE '                                                             + #13 +

   'WHERE '                                                                                           + #13 +
   '      HME.IDHISTMOVEMPTMO    = ' + IntToStr(qryHistMovIDHISTMOVEMPTMO.AsInteger)                  + #13 +
   '  AND HME.IDCONTRATOEMPTMO   = ' + IntToStr(dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.asInteger) + #13 +
   '  AND HME.IDCONTRATOEMPTMO   = CNT.IDCONTRATOEMPTMO  '                                            + #13 +
   '  AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO  '                                                + #13 +
   '  AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO  '                                           + #13 +
   '  AND CNT.IDTIPOCONTREMPTMO  = TC.IDTIPOCONTREMPTMO  '                                            + #13 +
   '  AND TC.IDTIPOEMPTMO        = TE.IDTIPOEMPTMO  '                                                 + #13;

   sMes := Copy(edtDataProcesso.Text,1,2);

   if Length(sMes) = 1 then sMes := '0' + sMes;

   sAno := FormatFloat('0000', StrToInt(Copy(edtDataProcesso.Text,7,4)));

   sHistoricoContab := 'Abono de Empréstimo - Contrato: ' + qryHistMov.FieldByname('IDCONTRATOEMPTMO').AsString + ' - Referência ' + sMes + '/' + sAno;

   IntegraEmptmo.ContabilizaItens('C',
                                  'A',
                                  sSQL,
                                  sHistoricoContab,
                                  StrToDate(edtDataProcesso.Text),
                                  sResult,
                                  sErro,
                                  iPlanilhaResult );

   Result := iPlanilhaResult;
end;



procedure TfrmExecTrataParcela.btnInverteSelecaoClick(Sender: TObject);
var
   bMostra: Boolean;
begin
   inherited;

   bMostra := False;

   if qryHistMov.RecordCount > 100 then begin

      qryHistMov.DisableControls;

      { Acerta tela de acompanhamento }
      frmAguarde.Max := qryHistMov.RecordCount;
      frmAguarde.Pos := 0;

      frmAguarde.Mostra('Processando, Aguarde...');

      bMostra := True;
   end;

   qryHistMov.First;
   while not(qryHistMov.EOF) do begin

      qryHistMov.Edit;
      if qryHistMov.FieldByName('FLGESCOLHA').AsString = '1' then begin
         qryHistMov.FieldByName('FLGESCOLHA').AsString := '0';
      end else begin
         qryHistMov.FieldByName('FLGESCOLHA').AsString := '1';
      end;

      qryHistMov.Next;

      // Atualiza tela de acompanhamento 
      if bMostra then frmAguarde.Pos := frmAguarde.Pos + 1;
   end;

   if qryHistMov.Active then qryHistMov.First;

   qryHistMov.EnableControls;

   if bMostra then frmAguarde.Apaga;
end;



procedure TfrmExecTrataParcela.btnMarcaTodosClick(Sender: TObject);
var
   Mostra: Boolean;
begin
   inherited;

   Mostra := False;

   if qryHistMov.RecordCount > 100 then begin
     qryHistMov.DisableControls;
     { Acerta tela de acompanhamento }
     frmAguarde.Max := qryHistMov.RecordCount;
     frmAguarde.Pos := 0;

     frmAguarde.Mostra('Processando, Aguarde...');

     Mostra := True;
   end;

   qryHistMov.First;
   While Not qryHistMov.EOF do begin

     qryHistMov.Edit;
     qryHistMov.FieldByName('FLGESCOLHA').AsString := '1';
     qryHistMov.Post;

     qryHistMov.Next;

     if Mostra = True then begin
       { Atualiza tela de acompanhamento }
       frmAguarde.Pos := frmAguarde.Pos + 1;
     end;

   end;

   if qryHistMov.Active then
     qryHistMov.First;

   qryHistMov.EnableControls;

   if Mostra = True then frmAguarde.Apaga;
end;



procedure TfrmExecTrataParcela.PreencheDadosContrato(const qryContrato     : TwwQuery;
                                                     var   rDadosContrato  : TDadosContrato);
begin
   LimpaRegistroContrato(rDadosContrato);

   rDadosContrato.IDContratoEmptmo  := qryContrato.FieldByName('IDCONTRATOEMPTMO').AsInteger;

   // É nulo na Concessão 
   rDadosContrato.IDContrQuitacao   := -1;

   rDadosContrato.IdPessoa          := qryContrato.FieldByName('IDPESSOA').AsInteger;
   rDadosContrato.IDTipoContrEmptmo := qryContrato.FieldByName('IDTIPOCONTREMPTMO').AsInteger;
   rDadosContrato.IDTipoEmptmo      := qryContrato.FieldByName('IDTIPOEMPTMO').AsInteger;
   rDadosContrato.IdPlanoPrev       := qryContrato.FieldByName('IDPLANOPREV').AsInteger;
   rDadosContrato.IdPatro           := qryContrato.FieldByName('IDPATRO').AsInteger;

   // Número da Inscrição
   rDadosContrato.IDInscricaoEmptmo := qryContrato.FieldByName('IDINSCRICAOEMPTMO').AsInteger;

   // É nulo
   rDadosContrato.IDVerba := -1;

   // Beneficiário do Contrato
   //   IDBENEF = IDPESSOA -> do Titular no caso de estar vivo e do Beneficiário no caso de Pensionista
   rDadosContrato.IdBenef := qryContrato.FieldByName('IDBENEF').AsInteger;

   if qryContrato.FieldByName('FLGFORMAPAG').AsString = 'C' then
   begin
      rDadosContrato.IDCBancaria := qryContrato.FieldByName('IDCBANCARIA').AsInteger;
   end else begin
      // É nulo 
      rDadosContrato.IDCBancaria := -1;
   end;

   if qryContrato.FieldByName('CODFORMAPAG').AsString <> '' then
   begin
      rDadosContrato.CodFormaPag  := qryContrato.FieldByName('CODFORMAPAG').AsInteger;
   end else begin
      rDadosContrato.CodFormaPag  := -1;
   end;

   if qryContrato.FieldByName('PORTFORMAPAG').AsString <> '' then
   begin
      rDadosContrato.PortFormaPag := qryContrato.FieldByName('PORTFORMAPAG').AsInteger;
   end else begin
      rDadosContrato.PortFormaPag := -1;
   end;

   if qryContrato.FieldByName('PORTFORMAREC').AsString <> '' then
   begin
      rDadosContrato.PortFormaRec := qryContrato.FieldByName('PORTFORMAREC').AsInteger;
   end else begin
      rDadosContrato.PortFormaRec := -1;
   end;

   rDadosContrato.Indexador      := qryContrato.FieldByName('MOECODIGO').AsInteger;
   rDadosContrato.SiglaIndexador := qryContrato.FieldByName('MOESIGLA').AsString;

   rDadosContrato.NumParcelas    := qryContrato.FieldByName('NUMPARCELAS').AsInteger;
   rDadosContrato.DataCredito    := qryContrato.FieldByName('DATACREDITO').AsDateTime;
   rDadosContrato.DataSituacao   := qryContrato.FieldByName('DATASITUACAO').AsDateTime;
   rDadosContrato.DataAssinatura := qryContrato.FieldByName('DATAASSINATURA').AsDateTime;
   rDadosContrato.DataPrimParc   := qryContrato.FieldByName('DATAPRIMPARC').AsDateTime;

   // Data nula
   rDadosContrato.DataCanc :=  -1;

   rDadosContrato.VlrContrato := qryContrato.FieldByName('VLRCONTRATO').AsCurrency;
   rDadosContrato.VlrParcela  := qryContrato.FieldByName('VLRPARCELA').AsCurrency;
   rDadosContrato.Txjuros     := qryContrato.FieldByName('TXJUROS').AsFloat;
   rDadosContrato.FlgSituacao := qryContrato.FieldByName('FLGSITUACAO').AsString;

   if qryContrato.FieldByName('VLRSALBASE').AsString <> '' then
   begin
      rDadosContrato.VlrSalBase := qryContrato.FieldByName('VLRSALBASE').AsCurrency;
   end else begin
      rDadosContrato.VlrSalBase := 0;
   end;

   if qryContrato.FieldByName('VLRMARGEM').AsString <> '' then
   begin
      rDadosContrato.VlrMargem := qryContrato.FieldByName('VLRMARGEM').AsCurrency;
   end else begin
      rDadosContrato.VlrMargem := 0;
   end;

   if qryContrato.FieldByName('VLRMAXPERMIT').AsString <> '' then
   begin
      rDadosContrato.VlrMaxPermit := qryContrato.FieldByName('VLRMAXPERMIT').AsCurrency;
   end else begin
      rDadosContrato.VlrMaxPermit := 0;
   end;

   // FLGFORMAREC = C -> indicando que o Débito é pelo Contas a Receber
   //               F -> indicando que o Débito é pela Folha 
   rDadosContrato.flgFormaRec := qryContrato.FieldByName('FLGFORMAREC').AsString;

   // FLGFORMAPAG = C -> indicando que o Crédito é pelo Contas a Pagar
   //               F -> indicando que o Crédito é pela Folha
   rDadosContrato.flgFormaPag := qryContrato.FieldByName('FLGFORMAPAG').AsString;
end;



procedure TfrmExecTrataParcela.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   dtmEmptmo.qryDadosContrato.Close;
   inherited;
end;



procedure TfrmExecTrataParcela.btnDesfazBaixaClick(Sender: TObject);
begin
   inherited;

   if MsgDlg('Deseja realmente desfazer a Baixa Manual?', 'Empréstimo', mtConfirmation, [mbYes, mbNo],0) = mrNo then Exit;
   Repaint;

   try

      if not(dtmBaseDados.dbBaseDados.InTransaction) then StartTransacao;

      try
         qryHistMov.First;
         while not(qryHistMov.EOF) do
         begin
            if (qryHistMovFLGESCOLHA.AsInteger = 1) and (qryHistMovFLGBAIXAMANUAL.AsInteger = 1) then
            begin
               with qryAux do
               begin
                  // exclui o item criado pela diferença, em caso de baixa parcial
                  SQL.Clear;
                  SQL.Text :=
                  'DELETE FROM '                                                                          + #13 +
                  '    HISTMOVEMPTMO '                                                                    + #13 +
                  'WHERE '                                                                                + #13 +
                  '    HMEANOCOMPETENCIA     = ' + qryHistMov.FieldByName('HMEANOCOMPETENCIA').AsString   + #13 +
                  'AND HMEMESCOMPETENCIA     = ' + qryHistMov.FieldByName('HMEMESCOMPETENCIA').AsString   + #13 +
                  'AND HMEPARCELA            = ' + qryHistMov.FieldByName('HMEPARCELA').AsString          + #13 +
                  'AND IDCONTRATOEMPTMO      = ' + qryHistMov.FieldByName('IDCONTRATOEMPTMO').AsString    + #13 +
                  'AND HMEORIGEM             = 7 '                                                        + #13 +
                  'AND HMEDATAEFETIVA        IS NULL '                                                    + #13 +
                  'AND NVL(HMEVLREFETIVO, 0) = 0 '                                                        + #13 +
                  'AND FLGBAIXADO            = 0 '                                                        + #13 +
                  'AND FLGRECEBIMENTO        IS NULL '                                                    + #13 +
                  'AND IDITEMEMPTMO          = ' + qryHistMov.FieldByName('IDITEMEMPTMO').AsString        + #13 +
                  'AND HMESEQCOBRANCA        > ' + qryHistMov.FieldByName('HMESEQCOBRANCA').AsString      + #13;

                  try
                     ExecSql;
                  except;
                     MsgDlg('Erro ao atualizar Histórico.', 'Empréstimo', MtError, [mbOk], 0);
                     Repaint;
                     Exit;
                  end;


                  SQL.Clear;
                  SQL.Text :=
                  'UPDATE '                    + #13 +
                  '  HISTMOVEMPTMO '           + #13 +
                  'SET '                       + #13 +
                  '  FLGBAIXADO      = 0, '    + #13 +
                  '  HMEDATAEFETIVA  = NULL, ' + #13 +
                  '  FLGDIVERGPEND   = 1, '    + #13 +
                  '  FLGBAIXAMANUAL  = NULL, ' + #13 +
                  '  FLGTIPODIVERG   = NULL, ' + #13 +
                  '  HMEVLREFETIVO   = NULL  ' + #13 +
                  'WHERE '                     + #13 +
                  '  IDHISTMOVEMPTMO = ' + qryHistMovIDHISTMOVEMPTMO.AsString;

                  try
                     ExecSql;
                  except;
                     MsgDlg('Erro ao atualizar Histórico.', 'Empréstimo', MtError, [mbOk], 0);
                     Repaint;
                     Exit;
                  end;

               end; // with qryAux

            end; // if flgEscolha and flgBaixaManual

            qryHistMov.Next;

         end; // while


         // -------------------------------------------------------------------------------------
         // Log de operações
         if not(Sistema.GravaLogOperacoes('Trat. Parc Contr ' +
                                          IntToStr(dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsInteger) +
                                          ': Desfaz Baixa ' +
                                          FormatDateTime('dd/mm/yyyy', edtDataVencimento.Date))) then
         begin
            Raise Exception.Create('Falha na gravação do Log da operação.');
         end;
         // -------------------------------------------------------------------------------------


         if dtmBaseDados.dbBaseDados.InTransaction then CommitTransacao;

      except
         Raise;
         Repaint;

         if dtmBaseDados.dbBaseDados.InTransaction then RollBackTransacao;
      end;

   finally

      qryHistMov.Close;
      qryHistMov.Open;

      qryHistMovVirtual.Close;

      iContMarcados := 0;

      edtVlrRecebido.Value    := 0;
      edtVlrSelecao.Value     := 0;

   end;
end;



procedure TfrmExecTrataParcela.FormShow(Sender: TObject);
begin
   inherited;
   dtmLookEmptmo.qryLookTipoDocRec.Open;

   ParametrosSistema;

   iPais       := dtmEmptmo.qryParamEmptmoIDPAIS.AsInteger;
   sEstado     := dtmEmptmo.qryParamEmptmoCODESTADO.AsString;
   iCidade     := dtmEmptmo.qryParamEmptmoIDCIDADES.AsInteger;

   if not(dtmEmptmo.qryParamEmptmoFLGSALDODEVANT.isNULL) then begin
      case dtmEmptmo.qryParamEmptmoFLGSALDODEVANT.AsInteger of
         0: sDiaSldDev := 'C';
         1: sDiaSldDev := 'A';
      end;
   end;

   dtmLookEmptmo.qryLookTipoDocRec.Locate('CODTIPDOC',dtmEmptmo.qryParamEmptmoTIPODOCREC.AsInteger,[]);
   DBcboTipoDocRec.LookupValue := dtmEmptmo.qryParamEmptmoTIPODOCREC.AsString;
end;



procedure TfrmExecTrataParcela.btnLiberaSuspensaoClick(Sender: TObject);
var
  iAno, iMes, iDia: Word;
begin
   inherited;

   TipoTratamento := ttLiberaSuspensao;
   if not(VerificaPreenchimento(ttLiberaSuspensao)) then Exit;

   try
      DesabilitaBotoes;

      if not(dtmBaseDados.dbBaseDados.InTransaction) then StartTransacao;

      if MsgDlg('Deseja prosseguir com a Liberação de Suspensão?', 'Empréstimo', mtConfirmation, [mbYes,mbNo], 0) = mrNo then
      begin
         Repaint;
         Exit;
      end;

      Repaint;

      with qryHistMov do
      begin
         DisableControls;
         First;
         while not(qryHistMov.EOF) do
         begin
            if qryHistMovFLGESCOLHA.AsInteger = 1 then
            begin
               try
                  with qryDesMarcaSuspensao do
                  begin
                     LimpaParametros(qryDesMarcaSuspensao);
                     ParamByName('PIDCONTRATOEMPTMO').AsInteger   := qryHistMovIDCONTRATOEMPTMO.AsInteger;
                     ParamByName('PIDHISTMOVEMPTMO').AsInteger    := qryHistMovIDHISTMOVEMPTMO.AsInteger;

                     ExecSQL;
                  end;

                  // -------------------------------------------------------------------------------
                  //    InsertLogTotalPrev();
                  // -------------------------------------------------------------------------------

               except
                  RollBackTransacao;

                  MsgDlg('Ocorreu um ERRO ao tentar suspender o item!', 'Empréstimo', mtError, [mbOK], 0);
                  Repaint;

                  PreencheTabelaVirtual(False);
                  Exit;
               end;
            end;

            PreencheTabelaVirtual(True);
            qryHistMov.Next;
         end;
         EnableControls;
      end;

      if dtmBaseDados.dbBaseDados.InTransaction then CommitTransacao;

   finally
      qryHistMov.Close;
      qryHistMov.Open;

      qryHistMovVirtual.Close;

      HabilitaBotoes;
   end;
end;



end.
