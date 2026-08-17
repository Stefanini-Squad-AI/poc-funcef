// Alterações:
{ --------------------------------------------------------------------------------------------------
Rotina    : -
Data      : até 26/09/2003
Autor     : André Pontes
Pendencia : 10065
Descrição : Novo form criado, com alterações para cadastrar contas por Grupo Orçamentário
---------------------------------------------------------------------------------------------------}

unit FCadContasOrcPorGrupoAuxMT;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FOkCancelar, ComCtrls, ToolWin, StdCtrls, Wwdbspin, Mask, wwdbedit,
   Wwdotdot, Wwdbcomb, CMProcuraMask, Db, Wwdatsrc, uCmSqlParams, DBClient,
   uCMClientDataSet, TB97Ctls, ImgList, IvDictio, IvMulti, IvEMulti,
   MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls, 
   uCtrlCadContasOrcPorGrupo, uCtrlParamOrcamento,
   FAguarde, MontaSelect, TREdit, Grids, DBGrids, Math, uRecCodigo,
   CmEventosCadastro, uCMTypes;

type
   TfrmCadContasOrcPorGrupoAuxMT = class(TfrmOkCancelar)
      ImlPadrao: TImageList;
      imgBotoes: TImageList;
      CdsCentroDeCusto: TCMClientDataSet;
      CdsAtivProj: TCMClientDataSet;
      CdsPlanoPrev: TCMClientDataSet;
      CdsPatro: TCMClientDataSet;
      pgcCompo: TPageControl;
      tbsCentroCusto: TTabSheet;
      ltvCCDisponiveis: TListView;
      ltvCCSelecionados: TListView;
      ToolBar1: TToolBar;
      btnCCDisponiveis: TToolButton;
      btnCCSelecionados: TToolButton;
      btnCCDisponiveisTodos: TToolButton;
      btnCCSelecionadosTodos: TToolButton;
      BtnCCRefresh: TToolButton;
      tbsAtividade: TTabSheet;
      ltvAPDisponiveis: TListView;
      ltvAPSelecionados: TListView;
      ToolBar2: TToolBar;
      btnAPDisponiveis: TToolButton;
      btnAPSelecionados: TToolButton;
      btnAPDisponiveisTodos: TToolButton;
      btnAPSelecionadosTodos: TToolButton;
      btnAPRefresh: TToolButton;
      tbsPlanoPrev: TTabSheet;
      ltvPPDisponiveis: TListView;
      ltvPPSelecionados: TListView;
      ToolBar3: TToolBar;
      btnPPDisponiveis: TToolButton;
      btnPPSelecionados: TToolButton;
      btnPPDisponiveisTodos: TToolButton;
      btnPPSelecionadosTodos: TToolButton;
      btnPPRefresh: TToolButton;
      tbsPatro: TTabSheet;
      ltvPTDisponiveis: TListView;
      ltvPTSelecionados: TListView;
      ToolBar4: TToolBar;
      btnPTDisponiveis: TToolButton;
      btnPTSelecionados: TToolButton;
      btnPTDisponiveisTodos: TToolButton;
      btnPTSelecionadosTodos: TToolButton;
      btnPTRefresh: TToolButton;
      MontaSelect: TMontaSelect;
      ToolbarSep972: TToolbarSep97;
      ToolbarSep973: TToolbarSep97;
      sqlCodigo: TCMSqlParams;
      cdsCodigo: TCMClientDataSet;
      cdsCCSel: TCMClientDataSet;
      cdsAPSel: TCMClientDataSet;
      cdsPPSel: TCMClientDataSet;
      cdsPTSel: TCMClientDataSet;
      cdsCampoSel: TCMClientDataSet;
      sqlCampo: TCMSqlParams;
      cdsParamOrc: TCMClientDataSet;
      sqlContaOrc: TCMSqlParams;
      cdsContaOrc: TCMClientDataSet;
      Panel1: TPanel;
      GroupBox1: TGroupBox;
      chkCC: TCheckBox;
      chkAP: TCheckBox;
      chkPP: TCheckBox;
      chkPT: TCheckBox;
      CmeCadastro: TCmEventosCadastro;
      chkCompContas: TCheckBox;

      procedure FormCreate(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure BtnCCRefreshClick(Sender: TObject);
      procedure btnAPRefreshClick(Sender: TObject);
      procedure btnPPRefreshClick(Sender: TObject);
      procedure btnPTRefreshClick(Sender: TObject);

      procedure DisponiveisClick(Sender: TObject);
      procedure DisponiveisTodosClick(Sender: TObject);
      procedure SelecionadosClick(Sender: TObject);
      procedure SelecionadosTodosClick(Sender: TObject);
      procedure bbtnConfirmarClick(Sender: TObject);
      procedure ltvDisponiveisDblClick(Sender: TObject);
      procedure ltvSelecionadosDblClick(Sender: TObject);
      procedure FormShow(Sender: TObject);


   private  // Private declarations

      CtrlCadContasOrcPorGrupo   : TCtrlCadContasOrcPorGrupo;
      CtrlParamorcamento         : TCtrlParamorcamento;

      vCodigo                    : Array of TRecCodigo;

//      FPlanoOrc                  : Integer;
      FGrupoOrc                  : Integer;
      FCodGrupoOrc               : String;
      FContaOrc                  : String;
//      FCentroCusto               : String;
//      FUnidNegoc                 : Integer;
//      FPlano                     : Integer;
//      FPatro                     : Integer;

      procedure PreencheVCodigo;

      procedure MontaCCusto;
      procedure MontaAtivProj;
      procedure MontaPlano;
      procedure MontaPatro;

//      procedure MontaCampos;

      function  VerificaPreenchimento: Boolean;
      function  VerificaCodigo(var lst: TListView): Boolean;
      function  ValidaTamanho(const sTipo: String;
                              var   lst  : TListView
                             ): Integer;

      procedure MoverDePara(ltvDisp  : TListView;
                            ltvSelec : TListView
                           );

      procedure Carregar(cdsLocal  : TClientDataSet;
                         lst       : TListView;
                         sCampoCod : String;
                         sCampoID  : String = ''
                        );

      procedure IncluirEm(pLtvDestino : TListView;
                          pCaption    : String;
                          pSubItems0  : String;
                          pSubItems1  : String
                         );

      procedure RetirarDe(pLtvDestino : TListView;
                          pPosicao    : Integer
                         );


      // André Pontes - pendência 10065 - 01/10/2003
      procedure SetContaOrc(const Value: String);
      procedure SetGrupoOrc(const Value: Integer);
      procedure SetCodGrupoOrc(const Value: String);

//      procedure SetPlanoOrc(const Value: Integer);
//      procedure SetCentroCusto(const Value: String);
//      procedure SetUnidNegoc(const Value: Integer);
//      procedure SetPlano(const Value: Integer);
//      procedure SetPatro(const Value: Integer);
      // FIM André Pontes - pendência 10065 - 01/10/2003


   public   // Public declarations

      procedure Progresso(vParam : Array of Variant);

      // André Pontes - pendência 10065 - 01/10/2003
//      property  PlanoOrc      : Integer   read FPlanoOrc    write SetPlanoOrc;
      property  GrupoOrc      : Integer   read FGrupoOrc    write SetGrupoOrc;
      property  CodGrupoOrc   : String    read FCodGrupoOrc write SetCodGrupoOrc;
      property  ContaOrc      : String    read FContaOrc    write SetContaOrc;

//      property  CentroCusto   : String    read FCentroCusto write SetCentroCusto;
//      property  UnidNegoc     : Integer   read FUnidNegoc   write SetUnidNegoc;
//      property  Plano         : Integer   read FPlano       write SetPlano;
//      property  Patro         : Integer   read FPatro       write SetPatro;
      // FIM André Pontes - pendência 10065 - 01/10/2003

   end;




var
  frmCadContasOrcPorGrupoAuxMT: TfrmCadContasOrcPorGrupoAuxMT;




implementation
{$R *.DFM}
uses
  uSistema, dBaseDados, uModulo, uMensErro, fProgresso, uVerificaPreenchimento, uFuncoesOrcamento;




procedure TfrmCadContasOrcPorGrupoAuxMT.Progresso(vParam : Array of Variant);
begin
//   vParam[0] :  BILHETE
//   vParam[1] :  Tipo da operação (0 = mostra, 1 = anda, 2 = esconde)
//   vParam[2] :  Mínimo de Registros
//   vParam[3] :  Total de Registros
//   vParam[4] :  Registro Atual
//   vParam[5] :  mensagem
//   vParam[6] :  ?

   case vParam[1] of
      0: MostraFormProgresso(vParam[5], vParam[2], vParam[3], False, False);
      1: AndaFormProgresso(vParam[4]);
      2: EscondeFormProgresso;
   end;

   Application.ProcessMessages;
end;



procedure TfrmCadContasOrcPorGrupoAuxMT.PreencheVCodigo;
var
   i, j     : Integer;
   iPosicao : Integer;
begin
   i := 0;
   j := 0;

   with sqlCodigo do
   begin
      Prepare;
      ParamByName('PIDPESSOA').AsInteger := Sistema.IDEmpresa;
      Open;
   end;


   if cdsCodigo.FieldByName('TAMCOD1').AsInteger > 0 then
   begin
      inc(i);
      SetLength(vCodigo, i);

      vCodigo[i-1].Campo   := 'GO';
      vCodigo[i-1].Inicio  := i + j;
      vCodigo[i-1].Digitos := cdsCodigo.FieldByName('TAMCOD1').AsInteger;

      j := cdsCodigo.FieldByName('TAMCOD1').AsInteger;
   end;

   if cdsCodigo.FieldByName('TAMCOD2').AsInteger > 0 then
   begin
      inc(i);
      SetLength(vCodigo, i);

      vCodigo[i-1].Campo   := 'CC';
      vCodigo[i-1].Inicio  := i + j;
      vCodigo[i-1].Digitos := cdsCodigo.FieldByName('TAMCOD2').AsInteger;

      j := cdsCodigo.FieldByName('TAMCOD2').AsInteger;
   end;

   if cdsCodigo.FieldByName('TAMCOD3').AsInteger > 0 then
   begin
      inc(i);
      SetLength(vCodigo, i);

      vCodigo[i-1].Campo   := 'AP';
      vCodigo[i-1].Inicio  := i + j;
      vCodigo[i-1].Digitos := cdsCodigo.FieldByName('TAMCOD3').AsInteger;

      j := cdsCodigo.FieldByName('TAMCOD3').AsInteger;
   end;

   if cdsCodigo.FieldByName('TAMCOD4').AsInteger > 0 then
   begin
      inc(i);
      SetLength(vCodigo, i);

      vCodigo[i-1].Campo   := 'PP';
      vCodigo[i-1].Inicio  := i + j;
      vCodigo[i-1].Digitos := cdsCodigo.FieldByName('TAMCOD4').AsInteger;

      j := cdsCodigo.FieldByName('TAMCOD4').AsInteger;
   end;

   if cdsCodigo.FieldByName('TAMCOD5').AsInteger > 0 then
   begin
      inc(i);
      SetLength(vCodigo, i);

      vCodigo[i-1].Campo   := 'PT';
      vCodigo[i-1].Inicio  := i + j;
      vCodigo[i-1].Digitos := cdsCodigo.FieldByName('TAMCOD5').AsInteger;

      j := cdsCodigo.FieldByName('TAMCOD5').AsInteger;
   end;
end;



procedure TfrmCadContasOrcPorGrupoAuxMT.MontaCCusto;
var
   i: Integer;
begin
   // Esvazia o ClientDataSet
   cdsCCSel.EmptyDataSet;

   // Itera pela lista, inserindo os selecionados no ClientDataSet
   for i := 0 to (ltvCCSelecionados.Items.Count - 1) do
   begin
      cdsCCSel.Append;

      cdsCCSel.FieldByName('NOME').AsString              := ltvCCSelecionados.Items[i].Caption;
      cdsCCSel.FieldByName('CODCENTROCUSTO').AsString    := ltvCCSelecionados.Items[i].SubItems[0];

      cdsCCSel.Post;
   end;
end;



procedure TfrmCadContasOrcPorGrupoAuxMT.MontaAtivProj;
var
   i: Integer;
begin
   // Esvazia o ClientDataSet
   cdsAPSel.EmptyDataSet;

   // Itera pela lista, inserindo os selecionados no ClientDataSet
   for i := 0 to (ltvAPSelecionados.Items.Count - 1) do
   begin
      cdsAPSel.Append;

      cdsAPSel.FieldByName('NOME').AsString        := ltvAPSelecionados.Items[i].Caption;
      cdsAPSel.FieldByName('UNECODIGO').AsString   := ltvAPSelecionados.Items[i].SubItems[0];
      cdsAPSel.FieldByName('UNIDNEGOC').AsString   := ltvAPSelecionados.Items[i].SubItems[1];

      cdsAPSel.Post;
   end;
end;



procedure TfrmCadContasOrcPorGrupoAuxMT.MontaPlano;
var
   i: Integer;
begin
   // Esvazia o ClientDataSet
   cdsPPSel.EmptyDataSet;

   // Itera pela lista, inserindo os selecionados no ClientDataSet
   for i := 0 to (ltvPPSelecionados.Items.Count - 1) do
   begin
      cdsPPSel.Append;

      cdsPPSel.FieldByName('NOME').AsString           := ltvPPSelecionados.Items[i].Caption;
      cdsPPSel.FieldByName('CODORCAMENTO').AsString   := ltvPPSelecionados.Items[i].SubItems[0];
      cdsPPSel.FieldByName('IDPLANOPREV').AsString    := ltvPPSelecionados.Items[i].SubItems[1];

      cdsPPSel.Post;
   end;
end;



procedure TfrmCadContasOrcPorGrupoAuxMT.MontaPatro;
var
   i: Integer;
begin
   // Esvazia o ClientDataSet
   cdsPTSel.EmptyDataSet;

   // Itera pela lista, inserindo os selecionados no ClientDataSet
   for i := 0 to (ltvPTSelecionados.Items.Count - 1) do
   begin
      cdsPTSel.Append;

      cdsPTSel.FieldByName('NOME').AsString           := ltvPTSelecionados.Items[i].Caption;
      cdsPTSel.FieldByName('CODORCAMENTO').AsString   := ltvPTSelecionados.Items[i].SubItems[0];
      cdsPTSel.FieldByName('IDPESSOA').AsString       := ltvPTSelecionados.Items[i].SubItems[1];

      cdsPTSel.Post;
   end;
end;



function TfrmCadContasOrcPorGrupoAuxMT.VerificaPreenchimento: Boolean;
begin
	Result := False;

	try
      // -------------------------------------------------------------------------------------------
      //    Verificações "desnecessárias"
      // -------------------------------------------------------------------------------------------
//      if CmeCadastro.Operacao <> opInserir and opAlterar then
//         raise EValidacao.CreateVal('É necessário indicar uma operação!', ltvCCDisponiveis);

//      if ltvCpSelecionados.Items.Count = 0 then
//         raise EValidacao.CreateVal('É necessário indicar pelo menos um campo!', ltvCpSelecionados);
      // -------------------------------------------------------------------------------------------

      // -------------------------------------------------------------------------------------------
      //    Verifica a seleção dos "fatores de replicação"
      // -------------------------------------------------------------------------------------------
      if ltvCCSelecionados.Items.Count = 0 then
         raise EValidacao.CreateVal('É necessário indicar pelo menos um Centro de Custo!', ltvCCSelecionados);

      if ltvAPSelecionados.Items.Count = 0 then
         raise EValidacao.CreateVal('É necessário indicar pelo menos uma Atividade/Projeto!', ltvAPSelecionados);

      if ltvPPSelecionados.Items.Count = 0 then
         raise EValidacao.CreateVal('É necessário indicar pelo menos um Plano Previdenciário!', ltvPPSelecionados);

      if ltvPTSelecionados.Items.Count = 0 then
         raise EValidacao.CreateVal('É necessário indicar pelo menos uma Patrocinadora!', ltvPPSelecionados);
      // -------------------------------------------------------------------------------------------

      // -------------------------------------------------------------------------------------------
      //    Verifica se todos os códigos dos "fatores de replicação" estão preenchidos
      // -------------------------------------------------------------------------------------------
      // Centro de Custo
      if not(VerificaCodigo(ltvCCSelecionados)) then
         raise EValidacao.CreateVal('Pelo menos um Centro de Custo selecionado está sem Código preenchido!', ltvCCSelecionados);

      // Atividade / Projeto
      if not(VerificaCodigo(ltvAPSelecionados)) then
         raise EValidacao.CreateVal('Pelo menos uma Atividade/Projeto selecionada está sem Código preenchido!', ltvAPSelecionados);

      // Plano
      if not(VerificaCodigo(ltvPPSelecionados)) then
         raise EValidacao.CreateVal('Pelo menos um Plano Previdenciário selecionado está sem Código preenchido!', ltvPPSelecionados);

      // Patro
      if not(VerificaCodigo(ltvPTSelecionados)) then
         raise EValidacao.CreateVal('Pelo menos uma Patrocinadora selecionada está sem Código preenchido!', ltvPTSelecionados);
      // -------------------------------------------------------------------------------------------

      // -------------------------------------------------------------------------------------------
      //    Verifica o tamanho dos códigos dos "fatores de replicação" contra
      //    o tamanho de cada na composição do código da conta orçamentária
      //    (antiga ValidaFormacao)
      // -------------------------------------------------------------------------------------------

      // 1) Grupo Orçamentário
      //    Esse é diferente, pois será passado pelo form anterior

      // Centro de Custo
      case ValidaTamanho('CC', ltvCCSelecionados) of
         -2: raise EValidacao.CreateVal('Não há espaço na definição da Conta Orçamentária para o código do Centro de Custo!', ltvCCSelecionados);
         -1: raise EValidacao.CreateVal('Pelo menos um Centro de Custo possui Código maior que o definido na composição da Conta Orçamentária!', ltvCCSelecionados);
      end;

      // Atividade / Projeto
      case ValidaTamanho('AP', ltvAPSelecionados) of
         -2: raise EValidacao.CreateVal('Não há espaço na definição da Conta Orçamentária para o código da Atividade/Projeto!', ltvAPSelecionados);
         -1: raise EValidacao.CreateVal('Pelo menos uma Atividade/Projeto possui Código maior que o definido na composição da Conta Orçamentária!', ltvAPSelecionados);
      end;

      // Plano
      case ValidaTamanho('PP', ltvPPSelecionados) of
         -2: raise EValidacao.CreateVal('Não há espaço na definição da Conta Orçamentária para o código do Plano Previdenciário!', ltvPPSelecionados);
         -1: raise EValidacao.CreateVal('Pelo menos um Plano Previdenciário possui Código maior que o definido na composição da Conta Orçamentária!', ltvPPSelecionados);
      end;

      // Patro
      case ValidaTamanho('PT', ltvPTSelecionados) of
         -2: raise EValidacao.CreateVal('Não há espaço na definição da Conta Orçamentária para o código da Patrocinadora!', ltvPTSelecionados);
         -1: raise EValidacao.CreateVal('Pelo menos uma Patrocinadora possui Código maior que o definido na composição da Conta Orçamentária!', ltvPTSelecionados);
      end;

      // -------------------------------------------------------------------------------------------

   except

      on ev : EValidacao do
      begin
		   if ev.Show then MsgDlg(ev.message, 'Orçamento', mtWarning, [mbOk], 0);
			Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;

   end;

   Result := True;
end;



function  TfrmCadContasOrcPorGrupoAuxMT.VerificaCodigo(var lst: TListView): Boolean;
var
   i    : Integer;
begin
   Result := True;
   for i := 0 to (lst.Items.Count - 1) do
   begin
      if length(lst.Items[i].SubItems[0]) <= 0 then
      begin
         Result := False;
         Break;
      end;
   end;
end;



function  TfrmCadContasOrcPorGrupoAuxMT.ValidaTamanho(const sTipo: String;
                                                      var   lst  : TListView
                                                     ): Integer;
var
   i    : Integer;
   iTam : Integer;
begin
   Result := 0;
   i      := 0;

   while (i < length(vCodigo)) and (vCodigo[i].Campo <> sTipo) do inc(i);

   if i = length(vCodigo) then
   begin
      if lst.Items.Count > 0 then Result := -1;
   end
   else
   begin
      iTam := vCodigo[i].Digitos;

      for i := 0 to (lst.Items.Count - 1) do
      begin
         if length(lst.Items[i].SubItems[0]) > iTam then
         begin
            Result := -2;
            Break;
         end;
      end;
   end;
end;



procedure TfrmCadContasOrcPorGrupoAuxMT.FormCreate(Sender: TObject);
begin
   inherited;

   CtrlCadContasOrcPorGrupo   := TCtrlCadContasOrcPorGrupo.Create;
   CtrlParamOrcamento         := TCtrlParamOrcamento.Create;

   CtrlCadContasOrcPorGrupo.Initialize(DtmBaseDados.dbBaseDados,
                                       True,
                                       Sistema.ConnectionType,
                                       Sistema.ConnectionSide,
                                       Sistema.AppRemoteServer,
                                       True, nil, nil, False
                                      );

   CtrlParamOrcamento.InitializeAs(CtrlCadContasOrcPorGrupo);

   CtrlCadContasOrcPorGrupo.Progresso        := Progresso;

   CtrlCadContasOrcPorGrupo.pIdEmpresa       := Sistema.IdEmpresa;
   CtrlCadContasOrcPorGrupo.pPlano           := Modulo.iPlanoOrc;

   CtrlCadContasOrcPorGrupo.CdsAtivProj      := CdsAtivProj;
   CtrlCadContasOrcPorGrupo.CdsCentroDeCusto := CdsCentroDeCusto;
   CtrlCadContasOrcPorGrupo.CdsPlanoPrev     := CdsPlanoPrev;
   CtrlCadContasOrcPorGrupo.CdsPatro         := CdsPatro;

   CtrlCadContasOrcPorGrupo.CdsCCSel         := cdsCCSel;
   CtrlCadContasOrcPorGrupo.CdsAPSel         := cdsAPSel;
   CtrlCadContasOrcPorGrupo.CdsPPSel         := cdsPPSel;
   CtrlCadContasOrcPorGrupo.CdsPTSel         := cdsPTSel;

   CtrlCadContasOrcPorGrupo.CdsCampoSel      := CdsCampoSel;
   CtrlCadContasOrcPorGrupo.CdsParamOrc      := CdsParamOrc;
end;



procedure TfrmCadContasOrcPorGrupoAuxMT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;

   // Exclui a conta (-1)
   CtrlCadContasOrcPorGrupo.ExcluiContaEspelho;

   CtrlCadContasOrcPorGrupo.Free;
end;



procedure TfrmCadContasOrcPorGrupoAuxMT.BtnCCRefreshClick(Sender: TObject);
begin
   case CmeCadastro.Operacao of
      opInserir: CdsCentroDeCusto.Data := CtrlCadContasOrcPorGrupo.ListaCentroDeCusto(0, Modulo.iPlanoOrc, GrupoOrc);
      opAlterar: CdsCentroDeCusto.Data := CtrlCadContasOrcPorGrupo.ListaCentroDeCusto(2, Modulo.iPlanoOrc, GrupoOrc);
   end;

   // É usado um segundo ClentDataSet para conter os selecionados, porém vazio agora
   cdsCCSel.Data           := CdsCentroDeCusto.Data;
   cdsCCSel.EmptyDataSet;

   ltvCCSelecionados.Items.Clear;
   Carregar(CdsCentroDeCusto, ltvCCDisponiveis, 'CODCENTROCUSTO', 'CODCENTROCUSTO');
end;



procedure TfrmCadContasOrcPorGrupoAuxMT.btnAPRefreshClick(Sender: TObject);
begin
   case CmeCadastro.Operacao of
      opInserir: CdsAtivProj.Data := CtrlCadContasOrcPorGrupo.ListaAtivProj(0, Modulo.iPlanoOrc, GrupoOrc);
      opAlterar: CdsAtivProj.Data := CtrlCadContasOrcPorGrupo.ListaAtivProj(2, Modulo.iPlanoOrc, GrupoOrc);
   end;

   // É usado um segundo ClentDataSet para conter os selecionados, porém vazio agora
   cdsAPSel.Data           := CdsAtivProj.Data;
   cdsAPSel.EmptyDataSet;

   ltvAPSelecionados.Items.Clear;
   Carregar(CdsAtivProj, ltvAPDisponiveis, 'UNECODIGO', 'UNIDNEGOC');
end;



procedure TfrmCadContasOrcPorGrupoAuxMT.btnPPRefreshClick(Sender: TObject);
begin
   case CmeCadastro.Operacao of
      opInserir: CdsPlanoPrev.Data := CtrlCadContasOrcPorGrupo.ListaPlanoPrev(0, Modulo.iPlanoOrc, GrupoOrc);
      opAlterar: CdsPlanoPrev.Data := CtrlCadContasOrcPorGrupo.ListaPlanoPrev(2, Modulo.iPlanoOrc, GrupoOrc);
   end;

   // É usado um segundo ClentDataSet para conter os selecionados, porém vazio agora
   cdsPPSel.Data           := CdsPlanoPrev.Data;
   cdsPPSel.EmptyDataSet;

   ltvPPSelecionados.Items.Clear;
   Carregar(CdsPlanoPrev, ltvPPDisponiveis, 'CODORCAMENTO', 'IDPLANOPREV');
end;



procedure TfrmCadContasOrcPorGrupoAuxMT.btnPTRefreshClick(Sender: TObject);
begin
   case CmeCadastro.Operacao of
      opInserir: CdsPatro.Data := CtrlCadContasOrcPorGrupo.ListaPatro(0, Modulo.iPlanoOrc, GrupoOrc);
      opAlterar: CdsPatro.Data := CtrlCadContasOrcPorGrupo.ListaPatro(2, Modulo.iPlanoOrc, GrupoOrc);
   end;

   // É usado um segundo ClentDataSet para conter os selecionados, porém vazio agora
   cdsPTSel.Data           := CdsPatro.Data;
   cdsPTSel.EmptyDataSet;

   ltvPTDisponiveis.Items.Clear;
   Carregar(CdsPatro, ltvPTDisponiveis, 'CODORCAMENTO', 'IDPESSOA');
end;



procedure TfrmCadContasOrcPorGrupoAuxMT.Carregar(cdsLocal  : TClientDataSet;
                                                 lst       : TListView;
                                                 sCampoCod : String;
                                                 sCampoID  : String = ''
                                                );
begin
   lst.Items.Clear;

   while not(cdsLocal.EOF) do
   begin
      lst.Items.Add;
      lst.Items[lst.Items.Count - 1].Caption := Copy(Trim(cdsLocal.FieldByName('NOME').AsString), 1, 30);
      lst.Items[lst.Items.Count - 1].SubItems.Add(cdsLocal.FieldByName(sCampoCod).AsString);

      // André Pontes - pendência 10065 - 23/09/2003
      if sCampoID <> '' then
      begin
         lst.Items[lst.Items.Count - 1].SubItems.Add(cdsLocal.FieldByName(sCampoID).AsString);
      end;
      // FIM André Pontes - pendência 10065 - 23/09/2003

      cdsLocal.Next;
   end;
end;



procedure TfrmCadContasOrcPorGrupoAuxMT.DisponiveisClick(Sender: TObject);
begin
   if pgcCompo.ActivePage = tbsCentroCusto then
   begin
      MoverDePara(ltvCCDisponiveis, ltvCCSelecionados);
   end
   else if pgcCompo.ActivePage = tbsAtividade then
   begin
      MoverDePara(ltvAPDisponiveis, ltvAPSelecionados);
   end
   else if pgcCompo.ActivePage = tbsPlanoPrev then
   begin
      MoverDePara(ltvPPDisponiveis, ltvPPSelecionados);
   end
   else if pgcCompo.ActivePage = tbsPatro then
   begin
      MoverDePara(ltvPTDisponiveis, ltvPTSelecionados);
   end;
end;



procedure TfrmCadContasOrcPorGrupoAuxMT.DisponiveisTodosClick(Sender: TObject);
var
   Posicao : Integer;
   Maximo  : Integer;
begin
   Maximo  := 0;

   if pgcCompo.ActivePage = tbsCentroCusto then
   begin
      Maximo := ltvCCDisponiveis.Items.Count - 1;
   end
   else if pgcCompo.ActivePage = tbsAtividade then
   begin
      Maximo := ltvAPDisponiveis.Items.Count - 1;
   end
   else if pgcCompo.ActivePage = tbsPlanoPrev then
   begin
      Maximo := ltvPPDisponiveis.Items.Count - 1;
   end
   else if pgcCompo.ActivePage = tbsPatro then
   begin
      Maximo := ltvPTDisponiveis.Items.Count - 1;
   end;

   for Posicao := Maximo downto 0 do DisponiveisClick(Self);
end;



procedure TfrmCadContasOrcPorGrupoAuxMT.SelecionadosClick(Sender: TObject);
begin
   if pgcCompo.ActivePage = tbsCentroCusto then
   begin
      MoverDePara(ltvCCSelecionados, ltvCCDisponiveis)
   end
   else if pgcCompo.ActivePage = tbsAtividade then
   begin
      MoverDePara(ltvAPSelecionados, ltvAPDisponiveis)
   end
   else if pgcCompo.ActivePage = tbsPlanoPrev then
   begin
      MoverDePara(ltvPPSelecionados, ltvPPDisponiveis)
   end
   else if pgcCompo.ActivePage = tbsPatro then
   begin
      MoverDePara(ltvPTSelecionados, ltvPTDisponiveis)
   end;
end;



procedure TfrmCadContasOrcPorGrupoAuxMT.SelecionadosTodosClick(Sender: TObject);
var
   Posicao : Integer;
   Maximo  : Integer;
begin
   Maximo  := 0;

   if pgcCompo.ActivePage = tbsCentroCusto then
   begin
      Maximo := ltvCCSelecionados.Items.Count - 1
   end
   else if pgcCompo.ActivePage = tbsAtividade then
   begin
      Maximo := ltvAPSelecionados.Items.Count - 1
   end
   else if pgcCompo.ActivePage = tbsPlanoPrev then
   begin
      Maximo := ltvPPSelecionados.Items.Count - 1
   end
   else if pgcCompo.ActivePage = tbsPatro then
   begin
      Maximo := ltvPTSelecionados.Items.Count - 1
   end;

   for Posicao := Maximo downto 0 do SelecionadosClick(Self);
end;



procedure TfrmCadContasOrcPorGrupoAuxMT.MoverDePara(ltvDisp  : TListView;
                                                    ltvSelec : TListView
                                                   );
var
   Posicao : Integer;
begin
   if (ltvDisp.Items.Count > 0) then
   begin
      if (ltvDisp.Selected = nil) then
      begin
         Posicao := 0;
      end
      else
      begin
         Posicao := ltvDisp.Selected.Index;
      end;

      IncluirEm(ltvSelec,
                ltvDisp.Items[Posicao].Caption,
                ltvDisp.Items[Posicao].SubItems[0],
                ltvDisp.Items[Posicao].SubItems[1]
               );

      RetirarDe(ltvDisp, Posicao);
   end;
end;



procedure TfrmCadContasOrcPorGrupoAuxMT.IncluirEm(pLtvDestino : TListView;
                                                  pCaption    : String;
                                                  pSubItems0  : String;
                                                  pSubItems1  : String
                                                 );
begin
   pltvDestino.Items.Add;
   pltvDestino.Items[pltvDestino.Items.Count - 1].Caption := pCaption;
   pltvDestino.Items[pltvDestino.Items.Count - 1].SubItems.Add(pSubItems0);
   pltvDestino.Items[pltvDestino.Items.Count - 1].SubItems.Add(pSubItems1);
end;



procedure TfrmCadContasOrcPorGrupoAuxMT.RetirarDe(pLtvDestino : TListView;
                                                  pPosicao    : Integer
                                                 );
begin
   pLtvDestino.Items.Delete(pPosicao);
end;



procedure TfrmCadContasOrcPorGrupoAuxMT.bbtnConfirmarClick(Sender: TObject);
var
   Posicao   : Integer;
   iQuant    : Integer;
   sOperacao : String;
begin
   if not(VerificaPreenchimento) then Exit;

   // ----------------------------------------------------------------------------------------------

   iQuant   := ltvCCSelecionados.Items.Count *
               ltvAPSelecionados.Items.Count *
               ltvPPSelecionados.Items.Count *
               ltvPTSelecionados.Items.Count;

   case CmeCadastro.Operacao of
      opInserir: sOperacao := ' criadas ';
      opAlterar: sOperacao := ' alteradas ';
   end;

   if MsgDlg('Serão' + sOperacao + IntToStr(iQuant) + ' Contas Orçamentárias. ' + #13 +
             'Deseja prosseguir? ', 'Orçamento', mtConfirmation, [mbyes, mbNo], 0) = mrNo then
   begin
      Repaint;
      Exit;
   end;
   Repaint;

   // ----------------------------------------------------------------------------------------------

   // Preenche os campos de replicação
   MontaCCusto;
   MontaAtivProj;
   MontaPlano;
   MontaPatro;

   cdsContaOrc.Close;
   sqlContaOrc.Prepare;
   sqlContaOrc.ParamByName('PIDPESSOA').AsInteger       := Sistema.IDEmpresa;
   sqlContaOrc.ParamByName('PIDPLANOORCAMEN').AsInteger := Modulo.iPlanoOrc;
   sqlContaOrc.ParamByName('PIDCONTAORCAMEN').AsString  := ContaOrc;
   sqlContaOrc.Open;

   CtrlCadContasOrcPorGrupo.CreateThreadProgresso;

   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------
   case CmeCadastro.Operacao of
      // -------------------------------------------------------------------------------------------
      opInserir:
      if not(CtrlCadContasOrcPorGrupo.InclusaoNova(cdsContaOrc.FieldByName('IDGRUPOORCAMEN').AsInteger,
                                                   cdsContaOrc.FieldByName('CODGRUPOORC').AsString,
                                                   '-1',
                                                   Sistema.TempDir,
                                                   chkCC.Checked,
                                                   chkAP.Checked,
                                                   chkPP.Checked,
                                                   chkPT.Checked,
                                                   CtrlCadContasOrcPorGrupo.ProgressFileName
                                                  )) then
      begin
         CtrlCadContasOrcPorGrupo.FreeThreadProgresso;

         MsgDlg(CtrlCadContasOrcPorGrupo.MessageInfo, 'Orçamento', mtError, [mbOK], 0);
         Repaint;
         Exit;
      end
      else
      begin
         CtrlCadContasOrcPorGrupo.FreeThreadProgresso;

         MsgDlg('Processo concluído. Favor verificar o log na pasta temporária.', 'Orçamento', mtInformation, [mbOK], 0);
         Repaint;
      end;

      // -------------------------------------------------------------------------------------------

      opAlterar:
      if CtrlCadContasOrcPorGrupo.AlteracaoNova(ContaOrc,
                                                IntToStr(GrupoOrc),
                                                cdsContaOrc.FieldByName('CODGRUPOORC').AsString,
                                                IntToStr(Sistema.IDEmpresa),
                                                Sistema.TempDir,
                                                chkCompContas.Checked,
                                                chkCC.Checked,
                                                chkAP.Checked,
                                                chkPP.Checked,
                                                chkPT.Checked,
                                                CtrlCadContasOrcPorGrupo.ProgressFileName
                                               ) then
      begin
         CtrlCadContasOrcPorGrupo.FreeThreadProgresso;

         MsgDlg('Contas Orçamentárias atualizadas.', 'Orçamento', mtInformation, [mbOk], 0);
         Repaint;
      end
      else  // if CtrlCadContasOrcPorGrupo.AlteracaoNova(...
      begin
         CtrlCadContasOrcPorGrupo.FreeThreadProgresso;

         MsgDlg('Ocorreu um Erro na atualização das Contas Orçamentárias!' + #13 + #13 +
                'Alterações revertidas.', 'Orçamento', mtError, [mbOk], 0);
         Repaint;
      end;  // if CtrlCadContasOrcPorGrupo.AlteracaoNova(...

      // -------------------------------------------------------------------------------------------
   end;
   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------

   Close;
end;



procedure TfrmCadContasOrcPorGrupoAuxMT.ltvDisponiveisDblClick(Sender: TObject);
begin
   DisponiveisClick(Self);
end;



procedure TfrmCadContasOrcPorGrupoAuxMT.ltvSelecionadosDblClick(Sender: TObject);
begin
   SelecionadosClick(Self);
end;



procedure TfrmCadContasOrcPorGrupoAuxMT.FormShow(Sender: TObject);
begin
   inherited;

   frmAguarde.Mostra('Lendo Centro de Custo       ');
   BtnCCRefreshClick(Self);

   frmAguarde.Mostra('Lendo Atividade/Projeto     ');
   BtnAPRefreshClick(Self);

   frmAguarde.Mostra('Lendo Plano Previdenciário  ');
   BtnPPRefreshClick(Self);

   frmAguarde.Mostra('Lendo Patrocinadora         ');
   BtnPTRefreshClick(Self);

   // ----------------------------------------------------------------------------------------------
   // Habilita / Desabilita a opção de alterar a Composição das Contas
   case CmeCadastro.Operacao of

      opInserir:
      begin
         chkCompContas.Checked := True;
         chkCompContas.Enabled := False;
      end;

      opAlterar:
      begin
         chkCompContas.Checked := False;
         chkCompContas.Enabled := True;
      end;

   end;
   // ----------------------------------------------------------------------------------------------

   // ----------------------------------------------------------------------------------------------
   // Se for alteração, já marca todos os previamente utilizados
   if CmeCadastro.Operacao = opAlterar then
   begin
      pgcCompo.ActivePage := tbsCentroCusto;
      DisponiveisTodosClick(self);

      pgcCompo.ActivePage := tbsAtividade;
      DisponiveisTodosClick(self);

      pgcCompo.ActivePage := tbsPlanoPrev;
      DisponiveisTodosClick(self);

      pgcCompo.ActivePage := tbsPatro;
      DisponiveisTodosClick(self);
   end;
   // ----------------------------------------------------------------------------------------------

   pgcCompo.ActivePage := tbsCentroCusto;

   frmAguarde.Apaga;

   pgcCompo.Enabled    := True;

   PreencheVCodigo;

   cdsParamOrc.Data := CtrlParamorcamento.ListaParamOrcamento(Sistema.IDEmpresa);
end;



// -------------------------------------------------------------------------------------------------
procedure TfrmCadContasOrcPorGrupoAuxMT.SetContaOrc(const Value: String);
begin FContaOrc := Value; end;

procedure TfrmCadContasOrcPorGrupoAuxMT.SetGrupoOrc(const Value: Integer);
begin FGrupoOrc := Value; end;

procedure TfrmCadContasOrcPorGrupoAuxMT.SetCodGrupoOrc(const Value: String);
begin FCodGrupoOrc := Value; end;

//procedure TfrmCadContasOrcPorGrupoAuxMT.SetPlanoOrc(const Value: Integer);
//begin FPlanoOrc := Value; end;

//procedure TfrmCadContasOrcPorGrupoAuxMT.SetCentroCusto(const Value: String);
//begin FCentroCusto := Value; end;
//
//procedure TfrmCadContasOrcPorGrupoAuxMT.SetPatro(const Value: Integer);
//begin FPatro := Value; end;
//
//procedure TfrmCadContasOrcPorGrupoAuxMT.SetPlano(const Value: Integer);
//begin FPlano := Value; end;
//
//procedure TfrmCadContasOrcPorGrupoAuxMT.SetUnidNegoc(const Value: Integer);
//begin FUnidNegoc := Value; end;
// -------------------------------------------------------------------------------------------------



end.
