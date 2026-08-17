// Alterações:
{ --------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 25/11/2003
Autor     : André Pontes
Pendencia : 15700
Descrição : Criado novo form, baseado no frmCadContasOrcPorGrupoAuxMT
---------------------------------------------------------------------------------------------------}

unit FCadContasOrcPorGrupoCentResponAuxMT;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FOkCancelar, ComCtrls, ToolWin, StdCtrls, Wwdbspin, Mask, wwdbedit,
   Wwdotdot, Wwdbcomb, CMProcuraMask, Db, Wwdatsrc, uCmSqlParams, DBClient,
   uCMClientDataSet, TB97Ctls, ImgList, IvDictio, IvMulti, IvEMulti,
   MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls,
   uCtrlCadContasOrcPorGrupo, uCtrlParamOrcamento,
   FAguarde, MontaSelect, TREdit, Grids, DBGrids, Math, uRecCodigo,
   CmEventosCadastro, uCMTypes, BfDialogs, BrowseFolder,
   {$IFNDEF VER0505} uCMFileUtils, {$ENDIF}
   uProcuraDir;

type
   TfrmCadContasOrcPorGrupoCentResponAuxMT = class(TfrmOkCancelar)
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
      btnCCRefresh: TToolButton;
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
      Label1: TLabel;
      pnlPasta: TPanel;
      lblDiretorio: TLabel;
      btnEscolheDir: TBitBtn;
      dlgCaminho: TProcuraDirDlg;
      btnTemp: TBitBtn;
      tbsCentroRespon: TTabSheet;
      ToolBar5: TToolBar;
      ToolButton1: TToolButton;
      ToolButton2: TToolButton;
      ToolButton3: TToolButton;
      ToolButton4: TToolButton;
      btnCRRefresh: TToolButton;
      ltvCRDisponiveis: TListView;
      ltvCRSelecionados: TListView;
      cdsCentRespon: TCMClientDataSet;
      cdsCRSel: TCMClientDataSet;
      chkCR: TCheckBox;

      procedure FormCreate(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure btnCCRefreshClick(Sender: TObject);
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
      procedure btnEscolheDirClick(Sender: TObject);
      procedure btnTempClick(Sender: TObject);
      procedure btnCRRefreshClick(Sender: TObject);


   private  // Private declarations

      CtrlCadContasOrcPorGrupo   : TCtrlCadContasOrcPorGrupo;
      CtrlParamorcamento         : TCtrlParamorcamento;

      vCodigo                    : Array of TRecCodigo;

      FGrupoOrc                  : Integer;
      FCodGrupoOrc               : String;
      FContaOrc                  : String;

      procedure PreencheVCodigo;

      procedure MontaCRespon;
      procedure MontaCCusto;
      procedure MontaAtivProj;
      procedure MontaPlano;
      procedure MontaPatro;

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


      procedure SetContaOrc(const Value: String);
      procedure SetGrupoOrc(const Value: Integer);
      procedure SetCodGrupoOrc(const Value: String);


   public   // Public declarations

      procedure Progresso(vParam : Array of Variant);

      property  GrupoOrc      : Integer   read FGrupoOrc    write SetGrupoOrc;
      property  CodGrupoOrc   : String    read FCodGrupoOrc write SetCodGrupoOrc;
      property  ContaOrc      : String    read FContaOrc    write SetContaOrc;


   end;




var
  frmCadContasOrcPorGrupoCentResponAuxMT: TfrmCadContasOrcPorGrupoCentResponAuxMT;




implementation
{$R *.DFM}
uses
  uSistema, dBaseDados, uModulo, uMensErro, fProgresso, uVerificaPreenchimento, uFuncoesOrcamento;




procedure TfrmCadContasOrcPorGrupoCentResponAuxMT.Progresso(vParam : Array of Variant);
begin
   //   vParam[0] :  BILHETE
   //   vParam[1] :  Tipo da operação (0 = mostra, 1 = anda, 2 = esconde)
   //   vParam[2] :  Mínimo de Registros
   //   vParam[3] :  Total de Registros
   //   vParam[4] :  Registro Atual
   //   vParam[5] :  mensagem
   //   vParam[6] :  ?

   case vParam[1] of
      0: frmProgresso.MostraFormProgresso(vParam[5],  // Legenda
                                          False,      // Botão Visivel
                                          False,      // Botão Habilitado
                                          True,       // Barra Visível
                                          vParam[2],  // Mínimo
                                          vParam[3]   // Máximo
                                         );

      1: frmProgresso.AndaFormProgresso(vParam[4]);
      2: frmProgresso.EscondeFormProgresso;
   end;

   Application.ProcessMessages;
end;



procedure TfrmCadContasOrcPorGrupoCentResponAuxMT.PreencheVCodigo;
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

      case cdsCodigo.FieldByName('FLGTIPOCOD1').AsInteger of
         1: vCodigo[i-1].Campo   := 'GO';
         2: vCodigo[i-1].Campo   := 'CC';
         3: vCodigo[i-1].Campo   := 'AP';
         4: vCodigo[i-1].Campo   := 'PP';
         5: vCodigo[i-1].Campo   := 'PT';
         6: vCodigo[i-1].Campo   := 'CR';
      end;

      vCodigo[i-1].Inicio  := j + 1;
      vCodigo[i-1].Digitos := cdsCodigo.FieldByName('TAMCOD1').AsInteger;

      j := j + cdsCodigo.FieldByName('TAMCOD1').AsInteger;
   end;

   if cdsCodigo.FieldByName('TAMCOD2').AsInteger > 0 then
   begin
      inc(i);
      SetLength(vCodigo, i);

      case cdsCodigo.FieldByName('FLGTIPOCOD2').AsInteger of
         1: vCodigo[i-1].Campo   := 'GO';
         2: vCodigo[i-1].Campo   := 'CC';
         3: vCodigo[i-1].Campo   := 'AP';
         4: vCodigo[i-1].Campo   := 'PP';
         5: vCodigo[i-1].Campo   := 'PT';
         6: vCodigo[i-1].Campo   := 'CR';
      end;

      vCodigo[i-1].Inicio  := j + 1;
      vCodigo[i-1].Digitos := cdsCodigo.FieldByName('TAMCOD2').AsInteger;

      j := j + cdsCodigo.FieldByName('TAMCOD2').AsInteger;
   end;

   if cdsCodigo.FieldByName('TAMCOD3').AsInteger > 0 then
   begin
      inc(i);
      SetLength(vCodigo, i);

      case cdsCodigo.FieldByName('FLGTIPOCOD3').AsInteger of
         1: vCodigo[i-1].Campo   := 'GO';
         2: vCodigo[i-1].Campo   := 'CC';
         3: vCodigo[i-1].Campo   := 'AP';
         4: vCodigo[i-1].Campo   := 'PP';
         5: vCodigo[i-1].Campo   := 'PT';
         6: vCodigo[i-1].Campo   := 'CR';
      end;

      vCodigo[i-1].Inicio  := j + 1;
      vCodigo[i-1].Digitos := cdsCodigo.FieldByName('TAMCOD3').AsInteger;

      j := j + cdsCodigo.FieldByName('TAMCOD3').AsInteger;
   end;

   if cdsCodigo.FieldByName('TAMCOD4').AsInteger > 0 then
   begin
      inc(i);
      SetLength(vCodigo, i);

      case cdsCodigo.FieldByName('FLGTIPOCOD4').AsInteger of
         1: vCodigo[i-1].Campo   := 'GO';
         2: vCodigo[i-1].Campo   := 'CC';
         3: vCodigo[i-1].Campo   := 'AP';
         4: vCodigo[i-1].Campo   := 'PP';
         5: vCodigo[i-1].Campo   := 'PT';
         6: vCodigo[i-1].Campo   := 'CR';
      end;

      vCodigo[i-1].Inicio  := j + 1;
      vCodigo[i-1].Digitos := cdsCodigo.FieldByName('TAMCOD4').AsInteger;

      j := j + cdsCodigo.FieldByName('TAMCOD4').AsInteger;
   end;

   if cdsCodigo.FieldByName('TAMCOD5').AsInteger > 0 then
   begin
      inc(i);
      SetLength(vCodigo, i);

      case cdsCodigo.FieldByName('FLGTIPOCOD5').AsInteger of
         1: vCodigo[i-1].Campo   := 'GO';
         2: vCodigo[i-1].Campo   := 'CC';
         3: vCodigo[i-1].Campo   := 'AP';
         4: vCodigo[i-1].Campo   := 'PP';
         5: vCodigo[i-1].Campo   := 'PT';
         6: vCodigo[i-1].Campo   := 'CR';
      end;

      vCodigo[i-1].Inicio  := j + 1;
      vCodigo[i-1].Digitos := cdsCodigo.FieldByName('TAMCOD5').AsInteger;

      j := j + cdsCodigo.FieldByName('TAMCOD5').AsInteger;
   end;


   if cdsCodigo.FieldByName('TAMCOD6').AsInteger > 0 then
   begin
      inc(i);
      SetLength(vCodigo, i);

      case cdsCodigo.FieldByName('FLGTIPOCOD6').AsInteger of
         1: vCodigo[i-1].Campo   := 'GO';
         2: vCodigo[i-1].Campo   := 'CC';
         3: vCodigo[i-1].Campo   := 'AP';
         4: vCodigo[i-1].Campo   := 'PP';
         5: vCodigo[i-1].Campo   := 'PT';
         6: vCodigo[i-1].Campo   := 'CR';
      end;

      vCodigo[i-1].Inicio  := j;
      vCodigo[i-1].Digitos := cdsCodigo.FieldByName('TAMCOD6').AsInteger;

      j := j + cdsCodigo.FieldByName('TAMCOD6').AsInteger;
   end;
end;



procedure TfrmCadContasOrcPorGrupoCentResponAuxMT.MontaCRespon;
var
   i: Integer;
begin
   // Esvazia o ClientDataSet
   cdsCRSel.EmptyDataSet;

   // Itera pela lista, inserindo os selecionados no ClientDataSet
   for i := 0 to (ltvCRSelecionados.Items.Count - 1) do
   begin
      cdsCRSel.Append;

      cdsCRSel.FieldByName('NOME').AsString              := ltvCRSelecionados.Items[i].Caption;
      cdsCRSel.FieldByName('CODEXTERNO').AsString        := ltvCRSelecionados.Items[i].SubItems[0];
      cdsCRSel.FieldByName('CODCENTRORESPON').AsString   := ltvCRSelecionados.Items[i].SubItems[1];

      cdsCRSel.Post;
   end;
end;



procedure TfrmCadContasOrcPorGrupoCentResponAuxMT.MontaCCusto;
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
      cdsCCSel.FieldByName('CODEXTERNO').AsString        := ltvCCSelecionados.Items[i].SubItems[0];
      cdsCCSel.FieldByName('CODCENTROCUSTO').AsString    := ltvCCSelecionados.Items[i].SubItems[1];

      cdsCCSel.Post;
   end;
end;



procedure TfrmCadContasOrcPorGrupoCentResponAuxMT.MontaAtivProj;
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



procedure TfrmCadContasOrcPorGrupoCentResponAuxMT.MontaPlano;
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



procedure TfrmCadContasOrcPorGrupoCentResponAuxMT.MontaPatro;
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



function TfrmCadContasOrcPorGrupoCentResponAuxMT.VerificaPreenchimento: Boolean;
begin
	Result := False;

	try
      // -------------------------------------------------------------------------------------------
      //    Verifica a seleção dos "fatores de replicação"
      // -------------------------------------------------------------------------------------------
      if (ltvCRSelecionados.Items.Count = 0) then
         raise EValidacao.CreateVal('É necessário indicar pelo menos um Centro de Responsabilidade!', ltvCRSelecionados);
      // -------------------------------------------------------------------------------------------

      // -------------------------------------------------------------------------------------------
      //    Verifica se todos os códigos dos "fatores de replicação" estão preenchidos
      // -------------------------------------------------------------------------------------------

      // Centro de Responsabilidade
      if not(VerificaCodigo(ltvCRSelecionados)) then
         raise EValidacao.CreateVal('Pelo menos um Centro de Responsabilidade selecionado está sem Código preenchido!', ltvCRSelecionados);

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

      // Centro de Responsabilidade
      case ValidaTamanho('CR', ltvCRSelecionados) of
         -2: raise EValidacao.CreateVal('Não há espaço na definição da Conta Orçamentária para o código do Centro de Responsabilidade!', ltvCRSelecionados);
         -1: raise EValidacao.CreateVal('Pelo menos um Centro de Responsabilidade possui Código maior que o definido na composição da Conta Orçamentária!', ltvCRSelecionados);
      end;

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



function  TfrmCadContasOrcPorGrupoCentResponAuxMT.VerificaCodigo(var lst: TListView): Boolean;
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



function  TfrmCadContasOrcPorGrupoCentResponAuxMT.ValidaTamanho(const sTipo: String;
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



procedure TfrmCadContasOrcPorGrupoCentResponAuxMT.FormCreate(Sender: TObject);
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

   CtrlCadContasOrcPorGrupo.CdsCentRespon    := CdsCentRespon;
   CtrlCadContasOrcPorGrupo.CdsCentroDeCusto := CdsCentroDeCusto;
   CtrlCadContasOrcPorGrupo.CdsAtivProj      := CdsAtivProj;
   CtrlCadContasOrcPorGrupo.CdsPlanoPrev     := CdsPlanoPrev;
   CtrlCadContasOrcPorGrupo.CdsPatro         := CdsPatro;

   CtrlCadContasOrcPorGrupo.CdsCRSel         := cdsCRSel;
   CtrlCadContasOrcPorGrupo.CdsCCSel         := cdsCCSel;
   CtrlCadContasOrcPorGrupo.CdsAPSel         := cdsAPSel;
   CtrlCadContasOrcPorGrupo.CdsPPSel         := cdsPPSel;
   CtrlCadContasOrcPorGrupo.CdsPTSel         := cdsPTSel;

   CtrlCadContasOrcPorGrupo.CdsCampoSel      := CdsCampoSel;
   CtrlCadContasOrcPorGrupo.CdsParamOrc      := CdsParamOrc;
end;



procedure TfrmCadContasOrcPorGrupoCentResponAuxMT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;

   // Exclui a conta (-1)
   CtrlCadContasOrcPorGrupo.ExcluiContaEspelho;

   CtrlCadContasOrcPorGrupo.Free;
end;



procedure TfrmCadContasOrcPorGrupoCentResponAuxMT.btnCRRefreshClick(Sender: TObject);
begin
   case CmeCadastro.Operacao of
      opInserir            : CdsCentRespon.Data := CtrlCadContasOrcPorGrupo.ListaCentRespon(0, Modulo.iPlanoOrc, GrupoOrc);
      opAlterar, opApagar  : CdsCentRespon.Data := CtrlCadContasOrcPorGrupo.ListaCentRespon(2, Modulo.iPlanoOrc, GrupoOrc);
   end;

   // É usado um segundo ClentDataSet para conter os selecionados, porém vazio agora
   cdsCRSel.Data           := CdsCentRespon.Data;
   cdsCRSel.EmptyDataSet;

   ltvCRSelecionados.Items.Clear;
   Carregar(CdsCentRespon, ltvCRDisponiveis, 'CODEXTERNO', 'CODCENTRORESPON');
end;



procedure TfrmCadContasOrcPorGrupoCentResponAuxMT.btnCCRefreshClick(Sender: TObject);
begin
   case CmeCadastro.Operacao of
      opInserir            : CdsCentroDeCusto.Data := CtrlCadContasOrcPorGrupo.ListaCentroDeCusto(0, Modulo.iPlanoOrc, GrupoOrc);
      opAlterar, opApagar  : CdsCentroDeCusto.Data := CtrlCadContasOrcPorGrupo.ListaCentroDeCusto(0, Modulo.iPlanoOrc, GrupoOrc);
   end;

   // É usado um segundo ClentDataSet para conter os selecionados, porém vazio agora
   cdsCCSel.Data           := CdsCentroDeCusto.Data;
   cdsCCSel.EmptyDataSet;

   ltvCCSelecionados.Items.Clear;
   Carregar(CdsCentroDeCusto, ltvCCDisponiveis, 'CODEXTERNO', 'CODCENTROCUSTO');
end;



procedure TfrmCadContasOrcPorGrupoCentResponAuxMT.btnAPRefreshClick(Sender: TObject);
begin
   case CmeCadastro.Operacao of
      opInserir            : CdsAtivProj.Data := CtrlCadContasOrcPorGrupo.ListaAtivProj(0, Modulo.iPlanoOrc, GrupoOrc);
      opAlterar, opApagar  : CdsAtivProj.Data := CtrlCadContasOrcPorGrupo.ListaAtivProj(0, Modulo.iPlanoOrc, GrupoOrc);
   end;

   // É usado um segundo ClentDataSet para conter os selecionados, porém vazio agora
   cdsAPSel.Data           := CdsAtivProj.Data;
   cdsAPSel.EmptyDataSet;

   ltvAPSelecionados.Items.Clear;
   Carregar(CdsAtivProj, ltvAPDisponiveis, 'UNECODIGO', 'UNIDNEGOC');
end;



procedure TfrmCadContasOrcPorGrupoCentResponAuxMT.btnPPRefreshClick(Sender: TObject);
begin
   case CmeCadastro.Operacao of
      opInserir            : CdsPlanoPrev.Data := CtrlCadContasOrcPorGrupo.ListaPlanoPrev(0, Modulo.iPlanoOrc, GrupoOrc);
      opAlterar, opApagar  : CdsPlanoPrev.Data := CtrlCadContasOrcPorGrupo.ListaPlanoPrev(0, Modulo.iPlanoOrc, GrupoOrc);
   end;

   // É usado um segundo ClentDataSet para conter os selecionados, porém vazio agora
   cdsPPSel.Data           := CdsPlanoPrev.Data;
   cdsPPSel.EmptyDataSet;

   ltvPPSelecionados.Items.Clear;
   Carregar(CdsPlanoPrev, ltvPPDisponiveis, 'CODORCAMENTO', 'IDPLANOPREV');
end;



procedure TfrmCadContasOrcPorGrupoCentResponAuxMT.btnPTRefreshClick(Sender: TObject);
begin
   case CmeCadastro.Operacao of
      opInserir            : CdsPatro.Data := CtrlCadContasOrcPorGrupo.ListaPatro(0, Modulo.iPlanoOrc, GrupoOrc);
      opAlterar, opApagar  : CdsPatro.Data := CtrlCadContasOrcPorGrupo.ListaPatro(0, Modulo.iPlanoOrc, GrupoOrc);
   end;

   // É usado um segundo ClentDataSet para conter os selecionados, porém vazio agora
   cdsPTSel.Data           := CdsPatro.Data;
   cdsPTSel.EmptyDataSet;

   ltvPTDisponiveis.Items.Clear;
   Carregar(CdsPatro, ltvPTDisponiveis, 'CODORCAMENTO', 'IDPESSOA');
end;



procedure TfrmCadContasOrcPorGrupoCentResponAuxMT.Carregar(cdsLocal  : TClientDataSet;
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

      if sCampoID <> '' then
      begin
         lst.Items[lst.Items.Count - 1].SubItems.Add(cdsLocal.FieldByName(sCampoID).AsString);
      end;

      cdsLocal.Next;
   end;
end;



procedure TfrmCadContasOrcPorGrupoCentResponAuxMT.DisponiveisClick(Sender: TObject);
begin
   if pgcCompo.ActivePage = tbsCentroRespon then
   begin
      MoverDePara(ltvCRDisponiveis, ltvCRSelecionados);
   end
   else if pgcCompo.ActivePage = tbsCentroCusto then
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



procedure TfrmCadContasOrcPorGrupoCentResponAuxMT.DisponiveisTodosClick(Sender: TObject);
var
   Posicao : Integer;
   Maximo  : Integer;
begin
   Maximo  := 0;

   if pgcCompo.ActivePage = tbsCentroRespon then
   begin
      Maximo := ltvCRDisponiveis.Items.Count - 1;
   end
   else if pgcCompo.ActivePage = tbsCentroCusto then
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



procedure TfrmCadContasOrcPorGrupoCentResponAuxMT.SelecionadosClick(Sender: TObject);
begin
   if pgcCompo.ActivePage = tbsCentroRespon then
   begin
      MoverDePara(ltvCRSelecionados, ltvCRDisponiveis)
   end
   else if pgcCompo.ActivePage = tbsCentroCusto then
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



procedure TfrmCadContasOrcPorGrupoCentResponAuxMT.SelecionadosTodosClick(Sender: TObject);
var
   Posicao : Integer;
   Maximo  : Integer;
begin
   Maximo  := 0;

   if pgcCompo.ActivePage = tbsCentroRespon then
   begin
      Maximo := ltvCRSelecionados.Items.Count - 1
   end
   else if pgcCompo.ActivePage = tbsCentroCusto then
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



procedure TfrmCadContasOrcPorGrupoCentResponAuxMT.MoverDePara(ltvDisp  : TListView;
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



procedure TfrmCadContasOrcPorGrupoCentResponAuxMT.IncluirEm(pLtvDestino : TListView;
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



procedure TfrmCadContasOrcPorGrupoCentResponAuxMT.RetirarDe(pLtvDestino : TListView;
                                                            pPosicao    : Integer
                                                           );
begin
   pLtvDestino.Items.Delete(pPosicao);
end;



procedure TfrmCadContasOrcPorGrupoCentResponAuxMT.bbtnConfirmarClick(Sender: TObject);
var
   Posicao   : Integer;
   sOperacao : String;
   sNomeArq  : String;

   iQuant    : Integer;
   iQuantCR  : Integer;
   iQuantCC  : Integer;
   iQuantAP  : Integer;
   iQuantPP  : Integer;
   iQuantPT  : Integer;
begin
   if not(VerificaPreenchimento) then Exit;

   // ----------------------------------------------------------------------------------------------

   iQuantCR := ltvCRSelecionados.Items.Count;
   iQuantCC := 1;
   iQuantAP := 1;
   iQuantPP := 1;
   iQuantPT := 1;

   if ltvCCSelecionados.Items.Count > 0 then iQuantCC := ltvCCSelecionados.Items.Count;
   if ltvAPSelecionados.Items.Count > 0 then iQuantAP := ltvAPSelecionados.Items.Count;
   if ltvPPSelecionados.Items.Count > 0 then iQuantPP := ltvPPSelecionados.Items.Count;
   if ltvPTSelecionados.Items.Count > 0 then iQuantPT := ltvPTSelecionados.Items.Count;

   iQuant   := iQuantCR * iQuantCC * iQuantAP * iQuantPP * iQuantPT;

   case CmeCadastro.Operacao of
      opInserir: sOperacao := ' criadas ';
      opAlterar: sOperacao := ' alteradas ';
      opApagar : sOperacao := ' excluídas ';
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
   MontaCRespon;
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
      // -------------------------------------------------------------------------------------------
      opInserir:
      if not(CtrlCadContasOrcPorGrupo.InclusaoNovaCR(cdsContaOrc.FieldByName('IDGRUPOORCAMEN').AsInteger,
                                                     cdsContaOrc.FieldByName('CODGRUPOORC').AsString,
                                                     '-1',
                                                     pnlPasta.Caption,
                                                     chkCR.Checked,
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

         if MsgDlg('Processo concluído. Deseja visualizar o arquivo de log?', 'Orçamento', mtConfirmation, [mbNo, mbYes], 0) = mrYes then
         begin
            Repaint;

            sNomeArq := pnlPasta.Caption + 'ContasOrcamenINCLUSAO' + FormatDateTime('yyyy-mm-dd', Date) + '.txt';

            CopyFile(Pchar(sNomeArq), PChar(ExtractFilePath(sNomeArq) + 'Visualiza.Txt'), False);
            ShellExecuteFile(ExtractFilePath(sNomeArq) + 'Visualiza.Txt', '', '', SW_SHOW);
         end;
         Repaint;
      end;

      // -------------------------------------------------------------------------------------------
      // -------------------------------------------------------------------------------------------

      opAlterar:
      if CtrlCadContasOrcPorGrupo.AlteracaoNovaCR(ContaOrc,
                                                  IntToStr(GrupoOrc),
                                                  cdsContaOrc.FieldByName('CODGRUPOORC').AsString,
                                                  IntToStr(Sistema.IDEmpresa),
                                                  pnlPasta.Caption,
                                                  chkCompContas.Checked,
                                                  chkCR.Checked,
                                                  chkCC.Checked,
                                                  chkAP.Checked,
                                                  chkPP.Checked,
                                                  chkPT.Checked,
                                                  CtrlCadContasOrcPorGrupo.ProgressFileName
                                                 ) then
      begin
         CtrlCadContasOrcPorGrupo.FreeThreadProgresso;

         if MsgDlg('Contas Orçamentárias atualizadas. Deseja visualizar o arquivo de log?', 'Orçamento', mtConfirmation, [mbNo, mbYes], 0) = mrYes then
         begin
            Repaint;

            sNomeArq := pnlPasta.Caption + 'ContasOrcamenALTERACAO' + FormatDateTime('yyyy-mm-dd', Date) + '.txt';

            CopyFile(Pchar(sNomeArq), PChar(ExtractFilePath(sNomeArq) + 'Visualiza.Txt'), False);
            ShellExecuteFile(ExtractFilePath(sNomeArq) + 'Visualiza.Txt', '', '', SW_SHOW);
         end;
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
      // -------------------------------------------------------------------------------------------

      opApagar:
      begin
         CtrlCadContasOrcPorGrupo.ExclusaoNovaCR(IntToStr(GrupoOrc),
                                                 cdsContaOrc.FieldByName('CODGRUPOORC').AsString,
                                                 IntToStr(Sistema.IDEmpresa),
                                                 pnlPasta.Caption,
                                                 chkCR.Checked,
                                                 chkCC.Checked,
                                                 chkAP.Checked,
                                                 chkPP.Checked,
                                                 chkPT.Checked,
                                                 CtrlCadContasOrcPorGrupo.ProgressFileName
                                                );

         CtrlCadContasOrcPorGrupo.FreeThreadProgresso;

         if MsgDlg('Contas Orçamentárias atualizadas. Deseja visualizar o arquivo de log?', 'Orçamento', mtConfirmation, [mbNo, mbYes], 0) = mrYes then
         begin
            Repaint;

            sNomeArq := pnlPasta.Caption + 'ContasOrcamenEXCLUSAO' + FormatDateTime('yyyy-mm-dd', Date) + '.txt';

            CopyFile(Pchar(sNomeArq), PChar(ExtractFilePath(sNomeArq) + 'Visualiza.Txt'), False);
            ShellExecuteFile(ExtractFilePath(sNomeArq) + 'Visualiza.Txt', '', '', SW_SHOW);
         end;
         Repaint;
      end;
      // -------------------------------------------------------------------------------------------
      // -------------------------------------------------------------------------------------------

   end;
   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------

   Close;
end;



procedure TfrmCadContasOrcPorGrupoCentResponAuxMT.ltvDisponiveisDblClick(Sender: TObject);
begin
   DisponiveisClick(Self);
end;



procedure TfrmCadContasOrcPorGrupoCentResponAuxMT.ltvSelecionadosDblClick(Sender: TObject);
begin
   SelecionadosClick(Self);
end;



procedure TfrmCadContasOrcPorGrupoCentResponAuxMT.FormShow(Sender: TObject);
begin
   inherited;

   frmAguarde.Mostra('Lendo Centro de Responsabilidade ');
   BtnCRRefreshClick(Self);

   frmAguarde.Mostra('Lendo Centro de Custo            ');
   BtnCCRefreshClick(Self);

   frmAguarde.Mostra('Lendo Atividade/Projeto          ');
   BtnAPRefreshClick(Self);

   frmAguarde.Mostra('Lendo Plano Previdenciário       ');
   BtnPPRefreshClick(Self);

   frmAguarde.Mostra('Lendo Patrocinadora              ');
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
         chkCompContas.Checked := True;
         chkCompContas.Enabled := True;
      end;

      opApagar:
      begin
         chkCC.Checked         := True;
         chkCC.Enabled         := False;
         chkAP.Checked         := True;
         chkAP.Enabled         := False;
         chkPP.Checked         := True;
         chkPP.Enabled         := False;
         chkPT.Checked         := True;
         chkPT.Enabled         := False;

         chkCompContas.Checked := True;
         chkCompContas.Enabled := False;
      end;

   end;
   // ----------------------------------------------------------------------------------------------

   // ----------------------------------------------------------------------------------------------
   // Se for alteração, já marca todos os previamente utilizados
   if CmeCadastro.Operacao in [opAlterar, opApagar] then
   begin
      pgcCompo.ActivePage := tbsCentroRespon;
      DisponiveisTodosClick(self);

      pgcCompo.ActivePage := tbsCentroCusto;

      pgcCompo.ActivePage := tbsAtividade;

      pgcCompo.ActivePage := tbsPlanoPrev;

      pgcCompo.ActivePage := tbsPatro;
   end;
   // ----------------------------------------------------------------------------------------------

   pgcCompo.ActivePage := tbsCentroRespon;

   frmAguarde.Apaga;

   pgcCompo.Enabled    := True;

   PreencheVCodigo;

   cdsParamOrc.Data := CtrlParamorcamento.ListaParamOrcamento(Sistema.IDEmpresa);

   pnlPasta.Caption := ExtractFilePath(Application.ExeName);
end;



// -------------------------------------------------------------------------------------------------
procedure TfrmCadContasOrcPorGrupoCentResponAuxMT.SetContaOrc(const Value: String);
begin FContaOrc := Value; end;

procedure TfrmCadContasOrcPorGrupoCentResponAuxMT.SetGrupoOrc(const Value: Integer);
begin FGrupoOrc := Value; end;

procedure TfrmCadContasOrcPorGrupoCentResponAuxMT.SetCodGrupoOrc(const Value: String);
begin FCodGrupoOrc := Value; end;

procedure TfrmCadContasOrcPorGrupoCentResponAuxMT.btnEscolheDirClick(Sender: TObject);
begin
   inherited;
   dlgCaminho.Directory := pnlPasta.Caption;
   if dlgCaminho.Execute then pnlPasta.Caption := dlgCaminho.Directory;
end;



procedure TfrmCadContasOrcPorGrupoCentResponAuxMT.btnTempClick(Sender: TObject);
begin
   inherited;
   pnlPasta.Caption := Sistema.TempDir;
end;



end.
