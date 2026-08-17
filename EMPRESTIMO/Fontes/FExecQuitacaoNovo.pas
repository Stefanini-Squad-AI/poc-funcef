unit FExecQuitacaoNovo;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FWizard, IvDictio, IvMulti, IvEMulti, ComCtrls, StdCtrls, MAHlpBtn,
   Buttons, TB97Tlbr, TB97, fcLabel, ExtCtrls, Db, Wwdatsrc, DBTables,
   Wwquery, wwdbdatetimepicker, CMDateTimePicker, TREdit, Mask, DBCtrls,
   Grids, Wwdbigrd, Wwdbgrid, fcButton, fcImgBtn, fcShapeBtn, wwdblook,
   UCalcEmptmo, FSairAjudaImob, MontaSelect;

type
   TfrmExecQuitacaoNovo = class(TfrmSairAjudaImob)
      ntbPrincipal: TNotebook;
      btnContinuaSelecao: TfcShapeBtn;
      DBgrdHistMov: TwwDBGrid;
      btnCancelaEncerra: TfcShapeBtn;
      btnContinuaEncerra: TfcShapeBtn;
      Panel4: TPanel;
      Panel9: TPanel;
      btnCancelaAltera: TfcShapeBtn;
      btnConfirmar: TfcShapeBtn;
      Label27: TLabel;
      Label29: TLabel;
      Label42: TLabel;
      Label8: TLabel;
      Label13: TLabel;
      Label21: TLabel;
      Label43: TLabel;
      Label12: TLabel;
      DBedtCodInsc: TDBEdit;
      DBedtPlanoPrev: TDBEdit;
      DBedtSituacao: TDBEdit;
      DBedtParticipante: TDBEdit;
      DBedtNumContrato: TDBEdit;
      btnBuscaContrato: TBitBtn;
      DBedtTipoContrato: TDBEdit;
      DBedtDataInsc: TCMDateTimePicker;
      DBedtDataCredito: TCMDateTimePicker;
      Label4: TLabel;
      Label34: TLabel;
      Label41: TLabel;
      Label1: TLabel;
      Label18: TLabel;
      Label14: TLabel;
      Label17: TLabel;
      Label38: TLabel;
      Label39: TLabel;
      DBedtPatro: TDBEdit;
      DBedtInscricao: TDBEdit;
      DBedtMtrEmpresa: TDBEdit;
      DBedtSitPart: TDBEdit;
      DBedtBeneficiario: TDBEdit;
      DBedtTipoEmptmo: TDBEdit;
      DBedtParcelas: TDBEdit;
      dts: TwwDataSource;
      dtsHistMov: TwwDataSource;
      DBrdgDebito: TRadioGroup;
      pnlCAR: TPanel;
      Label30: TLabel;
      DBcboFormaRecebimento: TwwDBLookupCombo;
      dtsHistMovVirtual: TwwDataSource;
      DBgrdHistMovVirtual: TwwDBGrid;
      lblTitulo: TfcLabel;
      Label3: TLabel;
      DBedtDataPrimParcela: TCMDateTimePicker;
      Label2: TLabel;
      edtDataQuitacao: TCMDateTimePicker;
      Bevel2: TBevel;
      Bevel3: TBevel;
      Bevel1: TBevel;
      rdgTipoQuitacao: TRadioGroup;
      qryUpdateSitFormaFolha: TwwQuery;
      qryUpdateSitFormaCaR: TwwQuery;
      qryUpdateSitFormaPatro: TwwQuery;

      procedure btnContinuaSelecaoClick(Sender: TObject);
      procedure btnBuscaContratoClick(Sender: TObject);
      procedure btnContinuaEncerraClick(Sender: TObject);
      procedure btnCancelaEncerraClick(Sender: TObject);
      procedure btnCancelaAlteraClick(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure DBrdgDebitoClick(Sender: TObject);
      procedure DBgrdVlrAtualizadosCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
      procedure DBgrdVlrAtualizadosTopRowChanged(Sender: TObject);
      procedure FormActivate(Sender: TObject);
      procedure btnConfirmarClick(Sender: TObject);
      procedure FormShow(Sender: TObject);


   private { Private declarations }

      sMes, sAno : String;

      rContrato  : TDadosContrato;
      vLista     : TListaItem;

      procedure Sel(i: Int64);

      function VerificaPreenchimento: Boolean;

      procedure HabilitaBotoes;
      procedure DesabilitaBotoes;

      function  AtualizaSitPart(var sMsgErro: String): Boolean;


   public { Public declarations }

   end;



var
  frmExecQuitacaoNovo: TfrmExecQuitacaoNovo;



implementation
{$R *.DFM}
uses
   UFuncoesEmptmo, (* LimpaParametros, AtualizaConjunto *)
   UMensErro,      (* MsgDlg *)
   dEmptmo,        (* qryParamEmptmo *)
   DLookEmptmo,    (* qryLookPortadorFormaR *)
   FProgresso,     (* FrmProgresso *)
   uDataBase,
   DBaseDados,
   uVerificaPreenchimento,
   dMS,
   DQuitacao;



procedure TfrmExecQuitacaoNovo.FormCreate(Sender: TObject);
begin
   inherited;
   ntbPrincipal.PageIndex  := 0;
end;



procedure TfrmExecQuitacaoNovo.FormActivate(Sender: TObject);
begin
   inherited;
   edtDataQuitacao.ButtonWidth      := 21;
   DBedtDataCredito.ButtonWidth     := 21;
   DBedtDataInsc.ButtonWidth        := 21;
   DBedtDataPrimParcela.ButtonWidth := 21;
end;



procedure TfrmExecQuitacaoNovo.HabilitaBotoes;
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



procedure TfrmExecQuitacaoNovo.DesabilitaBotoes;
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



procedure TfrmExecQuitacaoNovo.Sel(i: Int64);
begin
   (* abre a query principal com os parâmetros passados *)
   with dtmQuitacao.qry do begin
      (* Procedure da unit UFuncoesEmptmo que fecha a query e limpa todos os parâmetros *)
      LimpaParametros(dtmQuitacao.qry);
      ParamByName('PIDCONTRATOEMPTMO').AsInteger := i;
      Open;
   end;
end;



function TfrmExecQuitacaoNovo.VerificaPreenchimento: Boolean;
begin
   Result := False;

   try

      if edtDataQuitacao.Text = '' then
         raise EValidacao.CreateVal('É necessário indicar a Data da Quitação!', edtDataQuitacao);

      if edtDataQuitacao.Date <= rContrato.DataCredito then
         raise EValidacao.CreateVal('A Data da Quitação precisa ser posterior à Data de Crédito do Empréstimo!', edtDataQuitacao);

      (* a Quitação recisa ser após a PRIMEIRA atualização do saldo devedor (a da concessão) *)
      if edtDataQuitacao.Date < dtmQuitacao.qryDATAULTATUALIZA.AsDateTime then
         raise EValidacao.CreateVal('A Data da Quitação precisa ser posterior à primeira atualização do saldo devedor (Concessão)!', edtDataQuitacao);

      (* se a amortização for antes da data de última atualização, verifica quantas atualizações
         posteriores à data de amortizção existem: THERE CAN BE ONLY ONE !!! *)
      if not(dtmQuitacao.VerificaAtualizacaoPosterior(rContrato.IDCONTRATOEMPTMO, edtDataQuitacao.Date)) then
         raise EValidacao.CreateVal('Há mais de uma atualização do Saldo Devedor posterior à data de Quitação!', edtDataQuitacao);


   except

      on ev : EValidacao do begin
         Screen.Cursor := crDefault;
         if ev.Show then MsgDlg(ev.message, 'Empréstimo', mtWarning, [mbOk], 0);
         Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;

   end;

   Result := True;
end;



procedure TfrmExecQuitacaoNovo.btnBuscaContratoClick(Sender: TObject);
begin
   dtmMS.MS_ContratoQuitacao.Executar;

	(* redesenha o form na volta do dtmMS.MS_ContratoQuitacao *)
	Repaint;

	if dtmMS.MS_ContratoQuitacao.RetornouValor then begin

      Screen.Cursor := crHourGlass;

      (* abre a query principal com o participante escolhido *)
      Sel(StrToInt(dtmMS.MS_ContratoQuitacao.ValoresChave[0]));

      rContrato := dtmQuitacao.PreencheDadosContrato;

      (* Verifica se o Participante já recebeu o Crédito do Empréstimo *)
      if dtmQuitacao.VerificaBaixa(rContrato.IDCONTRATOEMPTMO) then begin

         btnContinuaSelecao.Enabled := True;

      end else begin

         btnContinuaSelecao.Enabled := False;
         MsgDlg('Crédito do Empréstimo NÃO efetivado.' + #13 +
                'Utilize o Cancelamento de Concessão', 'Empréstimo', mtWarning, [mbOk], 0);

      end; (* if *)

      Screen.Cursor := crDefault;

   end;(* if ontaSelect.RetornouValor *)
end;



procedure TfrmExecQuitacaoNovo.btnContinuaSelecaoClick(Sender: TObject);
begin
   inherited;

   if not(VerificaPreenchimento) then Exit;

   (* abre a query HistMov com os parâmetros passados *)
   with dtmQuitacao.qryHistMov do begin
      (* Procedure da unit UFuncoesEmptmo que fecha a query e limpa todos os parâmetros *)
      LimpaParametros(dtmQuitacao.qryHistMov);
      ParamByName('PIDCONTRATOEMPTMO').AsInteger  := dtmQuitacao.qryIDCONTRATOEMPTMO.AsInteger;
      ParamByName('PIDTIPOCONTREMPTMO').AsInteger := dtmQuitacao.qryIDTIPOCONTREMPTMO.AsInteger;
      Open;
   end;

   HabilitaBotoes;

   ntbPrincipal.PageIndex := 1;
end;



procedure TfrmExecQuitacaoNovo.btnContinuaEncerraClick(Sender: TObject);
var
   iTipoQuitacao : Integer;
begin
   inherited;

   try
      DesabilitaBotoes;

      sMes := FormatDateTime('MM', edtDataQuitacao.Date);
      sAno := FormatDateTime('YYYY', edtDataQuitacao.Date);

      if rdgTipoQuitacao.ItemIndex = 0 then begin
         iTipoQuitacao := 3; (* quitação antecipada *)
      end else begin
         iTipoQuitacao := 8; (* quitação por morte *)
      end;

      (* Procedure que abre as queries utilizadas quando o Débito do Empréstimo será pelo CAR *)
      dtmQuitacao.AbreQueriesDebito;

      (* Chama a função ParametrosSistema da unit UFuncoesEmptmo que abre a tabela
        PARAMEMPTMO. Esta função retorna False se a tabela estiver vazia *)
      if ParametrosSistema then begin
         (* Serão utilizados os Parâmetros definidos no Sistema *)

         if dtmEmptmo.qryParamEmptmoFLGFORMAREC.AsString = 'C' then begin

            DBrdgDebito.ItemIndex := 0;
            DBcboFormaRecebimento.LookupValue := dtmEmptmo.qryParamEmptmoPORTFORMARECTO.AsString;

            (* Procedimento da unit UFuncoesEmptmo que recebe como parâmetro um componente
               Container (Panel, GroupBox, etc.) e habilita/desabilita o próprio componente
               e os componentes dentro dele, trocando inclusive a cor de Edits e Combobox *)
            AtualizaConjunto(True, pnlCAR);

         end else begin

            DBrdgDebito.ItemIndex := 1;

            (* Procedimento da unit UFuncoesEmptmo que recebe como parâmetro um componente
               Container (Panel, GroupBox, etc.) e habilita/desabilita o próprio componente
               e os componentes dentro dele, trocando inclusive a cor de Edits e Combobox *)
            AtualizaConjunto(False, pnlCAR);

         end;

      end else begin
         (* A tabela Parâmetros do Sistema está vazia *)
         MsgDlg('Favor preencher os Parâmetros do Sistema.', 'Empréstimo', mtWarning, [mbOk], 0);
         Repaint;

         DBrdgDebito.ItemIndex := 0;

      end;(*if ParametrosSistema *)

      (* Configurando o Form com a Barra de Progresso que será usado na função
         CalculaItensAtualiza *)
      with frmProgresso do begin
         BotaoVisivel    := True;
         BotaoHabilitado := True;
      end;(* frmProgresso *)

      if not(dtmQuitacao.CalculaValoresItensQuitacao(rContrato,
                                                     3,
                                                     iTipoQuitacao,
                                                     edtDataQuitacao.Date,
                                                     edtDataQuitacao.Date,
                                                     vLista,
                                                     True,
                                                     True) ) then begin
         (* Não foi possível atualizar os itens, ou por problemas no Cálculo, ou
            por Cancelamento do Usuário, logo o procedimento será abortado *)
         Exit;
      end;

      dtmQuitacao.PreencheTabelaVirtual(rContrato.IDCONTRATOEMPTMO,
                                        sMes,
                                        sAno);

      ntbPrincipal.PageIndex := 2;

   finally
      HabilitaBotoes;
   end;
end;



procedure TfrmExecQuitacaoNovo.btnConfirmarClick(Sender: TObject);
var
   bErro             : Boolean;
   sMensErro         : String;
   iResult           : Integer;
   iPlanilha, iPlanilhaResult   : Integer;
   sResult, sErro    : TStringList;
begin
   inherited;

   bErro       := False;
   sMensErro   := '';
   sResult     := TStringList.Create;
   sErro       := TStringList.Create;

   DesabilitaBotoes;

   (* Inicia uma transação *)
   if not dtmBaseDados.dbBaseDados.InTransaction then StartTransacao;

   try

     (*******************************************************************************
      |               HISTÓRICO  DO  EMPRÉSTIMO  A SER QUITADO                      |
      |                                                                             |
      | função que varre a lista de itens de um contrato e se for o caso,           |
      |  chama a função que grava o Histórico do Movimento na tabela HISTMOVEMPTMO. |
      |  A saída será True se a operação foi bem sucedida e False caso negativo     |
      *******************************************************************************)

      if not dtmQuitacao.GravaMovimento(rContrato,
                                        vLista,
                                        3,                                                          (* Evento 3 - Quitação *)
                                        dtmQuitacao.qryHistMovVirtualHMEPARCELA.AsInteger,          (* Parcela *)
                                        dtmQuitacao.qryHistMovVirtualHMEANOCOMPETENCIA.AsInteger,   (* Ano Competência - Ano do Item *)
                                        dtmQuitacao.qryHistMovVirtualHMEMESCOMPETENCIA.AsInteger,   (* Mês Competência - Mês do Item *)
                                        StrToInt(sAno),                                             (* Ano Cobrança - Ano da Data de Quitação *)
                                        StrToInt(sMes),                                             (* Mês Cobranca - Mês da Data de Quitação *)
                                        0,                                                          (* Parcelas Remanescentes *)
                                        edtDataQuitacao.Date,                                       (* DataPrevista -> Data de Quitação *)
                                        edtDataQuitacao.Date,                                       (* dDataUltAtualiza -> Data de Quitação *)
                                        True                                                        (* Mostra o Form de Progresso *)
                                       ) then begin
         (* Gravação do Histórido com Erro *)
         bErro := True;
         sMensErro := '[ Gravação do Histórido dos Itens de Contrato ]';
         Exit;
      end;

     (*****************************************************************
      |       CONTABILIZAÇÃO  -  EMPRÉSTIMO  A  SER  QUITADO          |
      *****************************************************************)
      iResult := 0;
      
      if ( (ParametrosSistema) and (dtmEmptmo.qryParamEmptmoFLGINTEGRACONTAB.AsInteger = 1) ) then
         iResult :=  dtmQuitacao.ContabilizaItensQuitacao(rContrato.IDContratoEmptmo,
                                                          edtDataQuitacao.Date,
                                                          iPlanilhaResult,
                                                          sResult,
                                                          sErro);

      if iResult <> 0  then begin
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
      end;(* if *)

     (**************************************************************
      |                    ENVIO CAR ou FOLHA                      |
      **************************************************************)

      if DBrdgDebito.ItemIndex = 0 then begin
      (* o Débito é pelo Contas a Receber *)

         iResult := dtmQuitacao.EnviaQuitacaoCAPCAR(rContrato.IDCONTRATOEMPTMO,
                                                    'C',
                                                    edtDataQuitacao.Date,
                                                    iPlanilha,
                                                    sResult,
                                                    sErro);

         if iResult <> 0 then begin

            (* Envio CAP com Erro *)
            bErro := True;

            case iResult of
            (* Códigos de retorno (controle de erro):
                0 : Envio(s) realizados com sucesso *)
               -1 : sMensErro := '[ ERRO ao tentar selecionar os itens a enviar ao CAP/CAR ]';
               -2 : sMensErro := '[ Query não retornou itens a Enviar ao CAP/CAR ]';
               -3 : sMensErro := '[ ERRO ao inserir Documento no CAP/CAR ]';
               -4 : sMensErro := '[ ERRO no Rateio do Documento no CAP/CAR ]';
               -5 : sMensErro := '[ ERRO ao Lançar Documento no CAP/CAR ]';
               -6 : sMensErro := '[ ERRO ao inserir Mensagens no Documento ]';
               -7 : sMensErro := '[ ERRO ao Atualizar Histórico com o Documento no CAP/CAR ]';
               -8 : sMensErro := '[ Processo interrompido pelo usuário sem envio ao CAP/CAR ]';
            end;(* case *)

            if sErro.Count > 0 then begin
               sMensErro := sMensErro + #13 + sErro.Strings[sErro.Count - 1];
            end;

            Exit;
         end;(* if Result CAP *)

      end else begin
         (* o Débito é pela Folha
            NADA é feito na Quitação.  A Quitação será enviado para TMPDESC
            pela rotina do ENVIO *)

      end;(* if FlgFormaPag *)

      (* Atualiza a Situação do Contrato
         (FLGSITUACAO) = 'K' -> 'Pend. de Quitação' -> Envio p/ cobrança *)
      if not CalcEmptmo.AtualizaFlgSituacao(rContrato.IDInscricaoEmptmo,
                                            'CONTRATOEMPTMO',
                                            'K',
                                            sMensErro) then begin
         (* Atualização da Situação do Contrato com Erro *)
         bErro := True;
         sMensErro := '[ Atualização da Situação do Contrato ]' + #13 + sMensErro;
         Exit;
      end;(* if Atualiza Flag Situação do Contrato *)

   finally

      if bErro then begin
      (* Houve erro *)

         (* Desfaz a transação *)
         if dtmBaseDados.dbBaseDados.InTransaction then RollbackTransacao;

         MsgDlg('Erro na Quitação do Contrato' + #13 + sMensErro, 'Empréstimo', mtError, [mbOk], 0);

      end else begin
         (* Não Houve erro *)

         (* Finaliza a transação *)
         if dtmBaseDados.dbBaseDados.InTransaction then CommitTransacao;

         (* fecha a qry *)
         LimpaParametros(dtmQuitacao.qry);

         (* volta para primeira página *)
         ntbPrincipal.PageIndex  := 0;

         MsgDlg('Quitação realizada com Sucesso.', 'Empréstimo', mtInformation, [mbOk], 0);

      end;(* if bErro *)

      HabilitaBotoes;
      sResult.Free;
      sErro.Free;

   end; (* try..finally *)
end;



function TfrmExecQuitacaoNovo.AtualizaSitPart(var sMsgErro: String): Boolean;
begin
   Result := True;

   try

      try

         (* Contas a Receber - MA, MP, MS *)
         with qryUpdateSitFormaCaR do begin
            LimpaParametros(qryUpdateSitFormaCaR);
            ParamByName('PIDCONTRATOEMPTMO').AsInteger := dtmQuitacao.qryIDCONTRATOEMPTMO.AsInteger;
            ExecSQL;
         end;

         (* Folha de Benefícios - AS, CA *)
         with qryUpdateSitFormaFolha do begin
            LimpaParametros(qryUpdateSitFormaFolha);
            ParamByName('PIDCONTRATOEMPTMO').AsInteger := dtmQuitacao.qryIDCONTRATOEMPTMO.AsInteger;
            ExecSQL;
         end;

         (* Folha da Patrocinadora - AT *)
         with qryUpdateSitFormaPatro do begin
            LimpaParametros(qryUpdateSitFormaPatro);
            ParamByName('PIDCONTRATOEMPTMO').AsInteger := dtmQuitacao.qryIDCONTRATOEMPTMO.AsInteger;
            ExecSQL;
         end;

      except
      end;

   finally
//      EscondeEspera;
   end;
end;



procedure TfrmExecQuitacaoNovo.btnCancelaEncerraClick(Sender: TObject);
begin
   inherited;
   ntbPrincipal.PageIndex := 0;
end;



procedure TfrmExecQuitacaoNovo.btnCancelaAlteraClick(Sender: TObject);
begin
   inherited;
   ntbPrincipal.PageIndex := 1;
end;



procedure TfrmExecQuitacaoNovo.DBrdgDebitoClick(Sender: TObject);
begin
  inherited;

  if DBrdgDebito.ItemIndex = 0 then begin

      DBcboFormaRecebimento.LookupValue := dtmEmptmo.qryParamEmptmoPORTFORMARECTO.AsString;

      (* Procedimento da unit UFuncoesEmptmo que recebe como parâmetro um componente
         Container (Panel, GroupBox, etc.) e habilita/desabilita o próprio componente
         e os componentes dentro dele, trocando inclusive a cor de Edits e Combobox *)
      AtualizaConjunto(True,pnlCAR);


   end else begin

      (* Procedimento da unit UFuncoesEmptmo que recebe como parâmetro um componente
         Container (Panel, GroupBox, etc.) e habilita/desabilita o próprio componente
         e os componentes dentro dele, trocando inclusive a cor de Edits e Combobox *)
      AtualizaConjunto(False,pnlCAR);

   end;
end;



procedure TfrmExecQuitacaoNovo.DBgrdVlrAtualizadosCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
   inherited;

   (* faz com que as linhas do grid tenham cores alternadas *)
   if State <> [gdSelected] then begin
      if not Highlight then begin
         (* linhas ímpares = amarelo, linhas pares = branco *)
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
            ABrush.Color := $00C0FFFF; (* amarelo bebê *)
         end else begin
            ABrush.Color := clWhite;
         end;
      end;
   end else begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
end;



procedure TfrmExecQuitacaoNovo.DBgrdVlrAtualizadosTopRowChanged(Sender: TObject);
begin
   inherited;
   (* acerta as cores quando muda a linha da grid *)
   (Sender as TwwDBGrid).Invalidate;
end;



procedure TfrmExecQuitacaoNovo.FormShow(Sender: TObject);
begin
	inherited;

	edtDataQuitacao.Date       := Date;
   btnContinuaSelecao.Enabled := False;
end;



end.
