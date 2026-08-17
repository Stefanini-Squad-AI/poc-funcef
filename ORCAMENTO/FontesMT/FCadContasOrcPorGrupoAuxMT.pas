// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Alterações:
{
--------------------------------------------------------------------------------
// Rotina........: bbtnConfirmarClick
// Autor.........: Helen Bianchi / Edilaine Ferraresi
// Data..........: 15/08/2012
// Nº SOL........: 187700
// Nº KINTANA....: 1767662
// Descrição.....: Alterado parâmetro
--------------------------------------------------------------------------------
// Rotina........: CmeCadastroApplyEdit
// Autor.........: Edilaine Ferraresi
// Data..........: 11/05/2012
// Nº SOL........: 172383-9602
// Nº KINTANA....: 1661594
// Descrição.....: Adicionado parâmetro de Plano orçamentario
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
// Rotina........: Diversas (troca de Modulo.iPlanoOrc por iIdPlanoOrc)
// Autor.........: Edilaine Ferraresi
// Data..........: 23/03/2012
// Nº SOL........: 172383-7764
// Nº KINTANA....: 1556975
// Descrição.....: Adicionado parâmetro de Plano orçamentario
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Autor.........: Ricardo de Freitas Araújo Silva
Data..........: 18/08/2011
Nº SOL........: 159215
Nº KINTANA....: 1337816
Rotina........: ListaRelacionamentos
Descrição.....: Retornar campos de Programa e Tipo de Despesa
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Autor.........: Ricardo de Freitas Araújo Silva
Data..........: 17/08/2011
Nº SOL........: 159212
Nº KINTANA....: 1337867
Descrição.....: Implementação de rotinas para a gravação de códigos para o códgigo das contas, por
                Programa,Tipo de Despesa,MontaPrograma,MontaTipoDespesa;
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
// Autor......: Ricardo de Freitas Araújo
// Data.......: 08/07/2011
// Sol........: 1349788
// Kintana....: 160539/5501
// Rotina.....: ListaRelacionamentos
// Descrição..: Adicionado o Objeto qryaux(TQuery)
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 151628
Nº KINTANA..: 1115224
Data........: 28/01/2011
Responsável.: Fábio Henrique Beccaria Sampaio
Descrição...: Inclusão do Label lblRotuloCentroCusto
---------------------------------------------------------------------------------------------------}
//
// Autor......: Arnaldo V. Scarin
// Data.......: 08/09/2009
// Sol........: 123436
// Kintana....: 616983
// Descrição..: Alteração da Rotina de Centro de Custos, para desvincular a
//              obrigatoriedade de informar as contas de centro de custos quando
//              o flag de centro de custos estiver desmarcado.
//
//------------------------------------------------------------------------------
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
// Alterações:
{ --------------------------------------------------------------------------------------------------
Rotina    : Diversas
Data      : 07/11/2005
Autor     : Rodolpho da Silva
Pendencia : 18252
Descrição : Permitir criação de novas contas orçamentárias em um grupo já cadastrado
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 21/11/2003
Autor     : André Pontes
Pendencia : 10065
Descrição : Mesagem perguntando se deseja exibir o arquivo de log após o processamento
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 21/11/2003
Autor     : André Pontes
Pendencia : 10065
Descrição : Permitida escolha do caminho para gravação do arquivo de log
---------------------------------------------------------------------------------------------------}
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
   CmEventosCadastro, uCMTypes, BfDialogs, BrowseFolder,
   {$IFNDEF VER0505} uCMFileUtils, {$ENDIF}
   uProcuraDir, DBTables;

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
      Label1: TLabel;
      pnlPasta: TPanel;
      lblDiretorio: TLabel;
      btnEscolheDir: TBitBtn;
      dlgCaminho: TProcuraDirDlg;
      btnTemp: TBitBtn;
    lblRotuloCentroCusto: TLabel;
    qryAux: TQuery;
    tbsPrograma: TTabSheet;
    tbsTipoDespesa: TTabSheet;
    ltvProgramaDisponivel: TListView;
    ltvProgramaSelecionados: TListView;
    ltvTipoDespesaDisponivel: TListView;
    ltvTipoDespesaSelecionados: TListView;
    ToolBar5: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolBar6: TToolBar;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    chkTipoDespesa: TCheckBox;
    cdsPrograma: TCMClientDataSet;
    cdsProgramaSel: TCMClientDataSet;
    cdsTipoDespesa: TCMClientDataSet;
    cdsTipoDespesaSel: TCMClientDataSet;
    chkPrograma: TCheckBox;
    chkAnaliseContaOrcamen: TCheckBox;

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
      procedure btnEscolheDirClick(Sender: TObject);
      procedure btnTempClick(Sender: TObject);


   private  // Private declarations

      CtrlCadContasOrcPorGrupo   : TCtrlCadContasOrcPorGrupo;
      CtrlParamorcamento         : TCtrlParamorcamento;

      vCodigo                    : Array of TRecCodigo;

      FGrupoOrc                  : Integer;
      FCodGrupoOrc               : String;
      FContaOrc                  : String;
    FiIdPlanoOrc: integer;

      procedure PreencheVCodigo;

      procedure MontaCCusto;
      procedure MontaAtivProj;
      procedure MontaPlano;
      procedure MontaPatro;

      //Ricardo de Freitas SOL: 159212 - Kintana 1337867
      procedure MontaPrograma;

      //Ricardo de Freitas SOL: 159212 - Kintana 1337867
      procedure MontaTipoDespesa;

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
    procedure SetiIdPlanoOrc(const Value: integer);


   public   // Public declarations

      procedure Progresso(vParam : Array of Variant);

      property  GrupoOrc      : Integer   read FGrupoOrc    write SetGrupoOrc;
      property  CodGrupoOrc   : String    read FCodGrupoOrc write SetCodGrupoOrc;
      property  ContaOrc      : String    read FContaOrc    write SetContaOrc;
      property  iIdPlanoOrc   : integer   read FiIdPlanoOrc write SetiIdPlanoOrc;  // Edilaine - SOL 172383-7764 / KTN 1556975

   end;




var
  frmCadContasOrcPorGrupoAuxMT: TfrmCadContasOrcPorGrupoAuxMT;




implementation
{$R *.DFM}
uses
  uSistema, dBaseDados, uModulo, uMensErro, fProgresso, uVerificaPreenchimento, uFuncoesOrcamento,
  FCadContasOrcPorGrupoMT;




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
   Repaint;
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


   //GO - Grupo Orcamentario
   if cdsCodigo.FieldByName('TAMCOD1').AsInteger > 0 then
   begin
      inc(i);
      SetLength(vCodigo, i);

      vCodigo[i-1].Campo   := 'GO';
      vCodigo[i-1].Inicio  := i + j;
      vCodigo[i-1].Digitos := cdsCodigo.FieldByName('TAMCOD1').AsInteger;

      j := cdsCodigo.FieldByName('TAMCOD1').AsInteger;
   end;

   //CC - Centro de Custa
   if cdsCodigo.FieldByName('TAMCOD2').AsInteger > 0 then
   begin
      inc(i);
      SetLength(vCodigo, i);

      vCodigo[i-1].Campo   := 'CC';
      vCodigo[i-1].Inicio  := i + j;
      vCodigo[i-1].Digitos := cdsCodigo.FieldByName('TAMCOD2').AsInteger;

      j := cdsCodigo.FieldByName('TAMCOD2').AsInteger;
   end;

   //AP - Atividade e Projeto
   if cdsCodigo.FieldByName('TAMCOD3').AsInteger > 0 then
   begin
      inc(i);
      SetLength(vCodigo, i);

      vCodigo[i-1].Campo   := 'AP';
      vCodigo[i-1].Inicio  := i + j;
      vCodigo[i-1].Digitos := cdsCodigo.FieldByName('TAMCOD3').AsInteger;

      j := cdsCodigo.FieldByName('TAMCOD3').AsInteger;
   end;

   //PP - Plano
   if cdsCodigo.FieldByName('TAMCOD4').AsInteger > 0 then
   begin
      inc(i);
      SetLength(vCodigo, i);

      vCodigo[i-1].Campo   := 'PP';
      vCodigo[i-1].Inicio  := i + j;
      vCodigo[i-1].Digitos := cdsCodigo.FieldByName('TAMCOD4').AsInteger;

      j := cdsCodigo.FieldByName('TAMCOD4').AsInteger;
   end;

   //PT - Patrocinador
   if cdsCodigo.FieldByName('TAMCOD5').AsInteger > 0 then
   begin
      inc(i);
      SetLength(vCodigo, i);

      vCodigo[i-1].Campo   := 'PT';
      vCodigo[i-1].Inicio  := i + j;
      vCodigo[i-1].Digitos := cdsCodigo.FieldByName('TAMCOD5').AsInteger;

      j := cdsCodigo.FieldByName('TAMCOD5').AsInteger;
   end;

   //Ricardo de Freitas SOL: 159212 - Kintana 1337867

   //PR - Programa
   if cdsCodigo.FieldByName('TAMCOD7').AsInteger > 0 then
   begin
      inc(i);
      SetLength(vCodigo, i);

      vCodigo[i-1].Campo   := 'PR';
      vCodigo[i-1].Inicio  := i + j;
      vCodigo[i-1].Digitos := cdsCodigo.FieldByName('TAMCOD7').AsInteger;

      j := cdsCodigo.FieldByName('TAMCOD7').AsInteger;
   end;

   //TD - Tipo de Despesa
   if cdsCodigo.FieldByName('TAMCOD8').AsInteger > 0 then
   begin
      inc(i);
      SetLength(vCodigo, i);

      vCodigo[i-1].Campo   := 'TD';
      vCodigo[i-1].Inicio  := i + j;
      vCodigo[i-1].Digitos := cdsCodigo.FieldByName('TAMCOD8').AsInteger;

      j := cdsCodigo.FieldByName('TAMCOD8').AsInteger;
   end;
   //Ricardo de Freitas SOL: 159212 - Kintana 1337867 - fim
end;



procedure TfrmCadContasOrcPorGrupoAuxMT.MontaCCusto;
var
   i: Integer;
begin
   // Esvazia o ClientDataSet
   cdsCCSel.EmptyDataSet;

   // Alterado por Arnaldo V. Scarin em 08/09/2009
   // Sol: 123436 Kintana: 616983
   // Alteração da Rotina de Centro de Custos, para desvincular a obrigatoriedade de
   // informar as contas de centro de custos quando o flag de centro de custos estiver
   // desmarcado.
   If chkCC.checked then
   begin
     // Itera pela lista, inserindo os selecionados no ClientDataSet
     for i := 0 to (ltvCCSelecionados.Items.Count - 1) do
     begin
        cdsCCSel.Append;

        cdsCCSel.FieldByName('NOME').AsString              := ltvCCSelecionados.Items[i].Caption;
        cdsCCSel.FieldByName('CODEXTERNO').AsString        := ltvCCSelecionados.Items[i].SubItems[0];
        cdsCCSel.FieldByName('CODCENTROCUSTO').AsString    := ltvCCSelecionados.Items[i].SubItems[1];

        cdsCCSel.Post;
     end;
   end
   else
   begin
     cdsCCSel.Append;
     cdsCCSel.FieldByName('NOME').AsString              := 'Conta Generica';
     cdsCCSel.FieldByName('CODEXTERNO').AsString        := 'X';
     cdsCCSel.FieldByName('CODCENTROCUSTO').AsString    := 'X';
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
    //    Verifica a seleção dos "fatores de replicação"
    // -------------------------------------------------------------------------------------------

    // Alterado por Arnaldo V. Scarin em 08/09/2009
    // Sol: 123436 Kintana: 616983
    // Alteração da Rotina de Centro de Custos, para desvincular a obrigatoriedade de
    // informar as contas de centro de custos quando o flag de centro de custos estiver
    // desmarcado.
    // if ltvCCSelecionados.Items.Count = 0 then
    if (ltvCCSelecionados.Items.Count = 0) and chkCC.Checked then
      raise EValidacao.CreateVal('É necessário indicar pelo menos um Centro de Custo!', ltvCCSelecionados);

    if ltvAPSelecionados.Items.Count = 0 then
      raise EValidacao.CreateVal('É necessário indicar pelo menos uma Atividade/Projeto!', ltvAPSelecionados);

    if ltvPPSelecionados.Items.Count = 0 then
       raise EValidacao.CreateVal('É necessário indicar pelo menos um Plano Previdenciário!', ltvPPSelecionados);

    if ltvPTSelecionados.Items.Count = 0 then
       raise EValidacao.CreateVal('É necessário indicar pelo menos uma Patrocinadora!', ltvPPSelecionados);

    //Ricardo de Freitas SOL: 159212 - Kintana 1337867
    if (ltvProgramaSelecionados.Items.Count = 0) and chkPrograma.Checked then
      raise EValidacao.CreateVal('É necessário indicar pelo menos um Programa!', ltvCCSelecionados);

    if (ltvTipoDespesaSelecionados.Items.Count = 0) and chkTipoDespesa.Checked then
      raise EValidacao.CreateVal('É necessário indicar pelo menos um Tipo de Despesa!', ltvCCSelecionados);
    //Ricardo de Freitas SOL: 159212 - Kintana 1337867 - fim

    // -------------------------------------------------------------------------------------------


    // -------------------------------------------------------------------------------------------
    //    Verifica se todos os códigos dos "fatores de replicação" estão preenchidos
    // -------------------------------------------------------------------------------------------
    // Centro de Custo

    // Alterado por Arnaldo V. Scarin em 08/09/2009
    // Sol: 123436 Kintana: 616983
    // Alteração da Rotina de Centro de Custos, para desvincular a obrigatoriedade de
    // informar as contas de centro de custos quando o flag de centro de custos estiver
    // desmarcado.
    // if not(VerificaCodigo(ltvCCSelecionados)) then
    if chkCC.checked  and  not (VerificaCodigo(ltvCCSelecionados)) then
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

    //Ricardo de Freitas SOL: 159212 - Kintana 1337867

    // Programa
    if chkPrograma.Checked and not(VerificaCodigo(ltvProgramaSelecionados)) then
      raise EValidacao.CreateVal('Pelo menos um Programa selecionado está sem Código preenchido!', ltvProgramaSelecionados);

    // Tipo de Despesa
    if chkTipoDespesa.Checked and not(VerificaCodigo(ltvTipoDespesaSelecionados)) then
      raise EValidacao.CreateVal('Pelo menos um Tipo de Despesa selecionada está sem Código preenchido!', ltvTipoDespesaSelecionados);
    //Ricardo de Freitas SOL: 159212 - Kintana 1337867 - fim

    // -------------------------------------------------------------------------------------------

    // -------------------------------------------------------------------------------------------
    //    Verifica o tamanho dos códigos dos "fatores de replicação" contra
    //    o tamanho de cada na composição do código da conta orçamentária
    //    (antiga ValidaFormacao)
    // -------------------------------------------------------------------------------------------

    // 1) Grupo Orçamentário
    //    Esse é diferente, pois será passado pelo form anterior

    // Centro de Custo

    // Alterado por Arnaldo V. Scarin em 08/09/2009
    // Sol: 123436 Kintana: 616983
    // Alteração da Rotina de Centro de Custos, para desvincular a obrigatoriedade de
    // informar as contas de centro de custos quando o flag de centro de custos estiver
    // desmarcado.
    If chkCC.Checked then
    begin
      case ValidaTamanho('CC', ltvCCSelecionados) of
        -2: raise EValidacao.CreateVal('Não há espaço na definição da Conta Orçamentária para o código do Centro de Custo!', ltvCCSelecionados);
        -1: raise EValidacao.CreateVal('Pelo menos um Centro de Custo possui Código maior que o definido na composição da Conta Orçamentária!', ltvCCSelecionados);
      end;
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

    //Ricardo de Freitas SOL: 159212 - Kintana 1337867

    //Programa
    If chkPrograma.Checked then
    begin
      case ValidaTamanho('PR', ltvProgramaSelecionados) of
        -2: raise EValidacao.CreateVal('Não há espaço na definição da Conta Orçamentária para o código do Programa!', ltvProgramaSelecionados);
        -1: raise EValidacao.CreateVal('Pelo menos um Programa possui Código maior que o definido na composição da Conta Orçamentária!', ltvProgramaSelecionados);
      end;
    end;


    //Tipo de Despesa
    If chkTipoDespesa.Checked then
    begin
      case ValidaTamanho('TD', ltvProgramaSelecionados) of
        -2: raise EValidacao.CreateVal('Não há espaço na definição da Conta Orçamentária para o código do Programa!', ltvProgramaSelecionados);
        -1: raise EValidacao.CreateVal('Pelo menos um Programa possui Código maior que o definido na composição da Conta Orçamentária!', ltvProgramaSelecionados);
      end;
    end;
    //Ricardo de Freitas SOL: 159212 - Kintana 1337867 - fim



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
   CtrlCadContasOrcPorGrupo.pPlano           := iIdPlanoorc; {Modulo.iPlanoOrc;} // Edilaine - SOL 172383-7764 / KTN 1556975

   CtrlCadContasOrcPorGrupo.CdsAtivProj      := CdsAtivProj;
   CtrlCadContasOrcPorGrupo.CdsCentroDeCusto := CdsCentroDeCusto;
   CtrlCadContasOrcPorGrupo.CdsPlanoPrev     := CdsPlanoPrev;
   CtrlCadContasOrcPorGrupo.CdsPatro         := CdsPatro;

   CtrlCadContasOrcPorGrupo.CdsCCSel         := cdsCCSel;
   CtrlCadContasOrcPorGrupo.CdsAPSel         := cdsAPSel;
   CtrlCadContasOrcPorGrupo.CdsPPSel         := cdsPPSel;
   CtrlCadContasOrcPorGrupo.CdsPTSel         := cdsPTSel;

   //Ricardo de Freitas SOL: 159212 - Kintana 1337867
   CtrlCadContasOrcPorGrupo.CdsProgramaSel         := cdsProgramaSel;
   CtrlCadContasOrcPorGrupo.CdsTipoDespesaSel      := cdsTipoDespesaSel;
   //Ricardo de Freitas SOL: 159212 - Kintana 1337867 - fim



   CtrlCadContasOrcPorGrupo.CdsCampoSel      := CdsCampoSel;
   CtrlCadContasOrcPorGrupo.CdsParamOrc      := CdsParamOrc;

   pnlPasta.Caption := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);
   //Ádler Teodoro de Souza SOL 109421 KINTANA 496332
   lblDiretorio.Caption := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);
   //Ádler Teodoro de Souza SOL 109421 KINTANA 496332
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
      opInserir : CdsCentroDeCusto.Data := CtrlCadContasOrcPorGrupo.ListaCentroDeCusto(0, iIdPlanoOrc { Modulo.iPlanoOrc}, GrupoOrc); // Edilaine - SOL 172383-7764 / KTN 1556975

      opAlterar : begin
                      //Carrega os C.Custos JÁ USADOS pelas contas orçamentárias do grupo
                      CdsCentroDeCusto.Data := CtrlCadContasOrcPorGrupo.ListaCentroDeCusto(2, iIdPlanoOrc {Modulo.iPlanoOrc}, GrupoOrc); // Edilaine - SOL 172383-7764 / KTN 1556975
                      // É usado um segundo ClentDataSet para conter os selecionados, porém vazio agora
                      cdsCCSel.Data := CdsCentroDeCusto.Data;
                      cdsCCSel.EmptyDataSet;
                      ltvCCSelecionados.Items.Clear;
                      Carregar(CdsCentroDeCusto, ltvCCDisponiveis, 'CODEXTERNO', 'CODCENTROCUSTO');
                      btnCCDisponiveisTodos.Click;

                      //  Carrega os C.Custos que AINDA NÃO forma utilizados pelas contas orçamentárias do grupo
                      CdsCentroDeCusto.Data := CtrlCadContasOrcPorGrupo.ListaCentroDeCusto(1, iIdPlanoOrc {Modulo.iPlanoOrc}, GrupoOrc); // Edilaine - SOL 172383-7764 / KTN 1556975
                      Carregar(CdsCentroDeCusto, ltvCCDisponiveis, 'CODEXTERNO', 'CODCENTROCUSTO');
                  end;

      opApagar  : CdsCentroDeCusto.Data := CtrlCadContasOrcPorGrupo.ListaCentroDeCusto(2, iIdPlanoOrc {Modulo.iPlanoOrc}, GrupoOrc);  // Edilaine - SOL 172383-7764 / KTN 1556975

   end;


   if CmeCadastro.Operacao <> opAlterar then
   begin
      // É usado um segundo ClentDataSet para conter os selecionados, porém vazio agora
      cdsCCSel.Data := CdsCentroDeCusto.Data;
      cdsCCSel.EmptyDataSet;

      ltvCCSelecionados.Items.Clear;
      Carregar(CdsCentroDeCusto, ltvCCDisponiveis, 'CODEXTERNO', 'CODCENTROCUSTO');
   end;
end;



procedure TfrmCadContasOrcPorGrupoAuxMT.btnAPRefreshClick(Sender: TObject);
begin
   case CmeCadastro.Operacao of
      opInserir : begin
                     CdsAtivProj.Data := CtrlCadContasOrcPorGrupo.ListaAtivProj(0, iIdPlanoOrc {Modulo.iPlanoOrc}, GrupoOrc); // Edilaine - SOL 172383-7764 / KTN 1556975

                     //Ricardo de Freitas SOL: 159212 - Kintana 1337867
                     cdsPrograma.Data         :=  CtrlCadContasOrcPorGrupo.ListaPrograma(0, iIdPlanoOrc {Modulo.iPlanoOrc}, GrupoOrc); // Edilaine - SOL 172383-7764 / KTN 1556975
                     cdsProgramaSel.Data      := cdsPrograma.Data;
                     cdsProgramaSel.EmptyDataSet;
                     Carregar(cdsProgramaSel, ltvProgramaSelecionados, 'IDPROGRAMAORCAMEN', 'NOME');
                     Carregar(cdsPrograma, ltvProgramaDisponivel, 'IDPROGRAMAORCAMEN', 'NOME');

                     cdsTipoDespesa.Data       :=  CtrlCadContasOrcPorGrupo.ListaTipoDespesa(0, iIdPlanoOrc {Modulo.iPlanoOrc}, GrupoOrc);  // Edilaine - SOL 172383-7764 / KTN 1556975
                     cdsTipoDespesaSel.Data    :=  cdsTipoDespesa.Data;
                     cdsTipoDespesaSel.EmptyDataSet;
                     Carregar(cdsTipoDespesaSel, ltvTipoDespesaSelecionados, 'IDTIPO_DEPESAORCAMEN','NOME');
                     Carregar(cdsTipoDespesa, ltvTipoDespesaDisponivel , 'IDTIPO_DEPESAORCAMEN','NOME');
                     //Ricardo de Freitas SOL: 159212 - Kintana 1337867 - fim
      end;

      opAlterar : begin
                     //  Carrega A/Projeto JÁ USADOS pelas contas orçamentárias do grupo
                     CdsAtivProj.Data := CtrlCadContasOrcPorGrupo.ListaAtivProj(2, iIdPlanoOrc {Modulo.iPlanoOrc}, GrupoOrc);  // Edilaine - SOL 172383-7764 / KTN 1556975
                     // É usado um segundo ClentDataSet para conter os selecionados, porém vazio agora
                     cdsAPSel.Data := CdsAtivProj.Data;
                     cdsAPSel.EmptyDataSet;
                     ltvAPSelecionados.Items.Clear;
                     Carregar(CdsAtivProj, ltvAPSelecionados, 'UNECODIGO', 'UNIDNEGOC');

                     //Ricardo de Freitas SOL: 159212 - Kintana 1337867
                     //Programa
                     cdsPrograma.Data               :=  CtrlCadContasOrcPorGrupo.ListaPrograma(1, iIdPlanoOrc {Modulo.iPlanoOrc}, GrupoOrc);  // Edilaine - SOL 172383-7764 / KTN 1556975
                     cdsProgramaSel.Data            :=  CtrlCadContasOrcPorGrupo.ListaPrograma(2, iIdPlanoOrc {Modulo.iPlanoOrc}, GrupoOrc);  // Edilaine - SOL 172383-7764 / KTN 1556975
                     ltvProgramaSelecionados.Items.Clear;
                     Carregar(cdsProgramaSel, ltvProgramaSelecionados, 'IDPROGRAMAORCAMEN', 'NOME');
                     Carregar(cdsPrograma, ltvProgramaDisponivel, 'IDPROGRAMAORCAMEN', 'NOME');

                     //Tipo de Desepesa
                     cdsTipoDespesa.Data            :=  CtrlCadContasOrcPorGrupo.ListaTipoDespesa(1, iIdPlanoOrc {Modulo.iPlanoOrc}, GrupoOrc);  // Edilaine - SOL 172383-7764 / KTN 1556975
                     cdsTipoDespesaSel.Data         :=  CtrlCadContasOrcPorGrupo.ListaTipoDespesa(2, iIdPlanoOrc {Modulo.iPlanoOrc}, GrupoOrc);  // Edilaine - SOL 172383-7764 / KTN 1556975
                     ltvTipoDespesaSelecionados.Items.Clear;
                     Carregar(cdsTipoDespesaSel, ltvTipoDespesaSelecionados, 'IDTIPO_DEPESAORCAMEN','NOME');
                     Carregar(cdsTipoDespesa, ltvTipoDespesaDisponivel , 'IDTIPO_DEPESAORCAMEN','NOME');
                     //Ricardo de Freitas SOL: 159212 - Kintana 1337867 - fim
                                          
                     //Carrega A/Projeto que AINDA NÃO forma utilizados pelas contas orçamentárias do grupo
                     CdsAtivProj.Data := CtrlCadContasOrcPorGrupo.ListaAtivProj(1, iIdPlanoOrc {Modulo.iPlanoOrc}, GrupoOrc);  // Edilaine - SOL 172383-7764 / KTN 1556975
                     Carregar(CdsAtivProj, ltvAPDisponiveis, 'UNECODIGO', 'UNIDNEGOC');
                  end;

      opApagar  : CdsAtivProj.Data := CtrlCadContasOrcPorGrupo.ListaAtivProj(2, iIdPlanoOrc {Modulo.iPlanoOrc}, GrupoOrc);  // Edilaine - SOL 172383-7764 / KTN 1556975
   end;


   if CmeCadastro.Operacao <> opAlterar then
   begin
      // É usado um segundo ClentDataSet para conter os selecionados, porém vazio agora
      cdsAPSel.Data := CdsAtivProj.Data;
      cdsAPSel.EmptyDataSet;

      ltvAPSelecionados.Items.Clear;
      Carregar(CdsAtivProj, ltvAPDisponiveis, 'UNECODIGO', 'UNIDNEGOC');
   end;
end;




procedure TfrmCadContasOrcPorGrupoAuxMT.btnPPRefreshClick(Sender: TObject);
begin
   case CmeCadastro.Operacao of
      opInserir : CdsPlanoPrev.Data := CtrlCadContasOrcPorGrupo.ListaPlanoPrev(0, iIdPlanoOrc {Modulo.iPlanoOrc}, GrupoOrc);  // Edilaine - SOL 172383-7764 / KTN 1556975

      opAlterar : begin
                     //  Carrega Plano Prev JÁ USADOS pelas contas orçamentárias do grupo
                     CdsPlanoPrev.Data := CtrlCadContasOrcPorGrupo.ListaPlanoPrev(2, iIdPlanoOrc {Modulo.iPlanoOrc}, GrupoOrc);  // Edilaine - SOL 172383-7764 / KTN 1556975
                     // É usado um segundo ClentDataSet para conter os selecionados, porém vazio agora
                     cdsPPSel.Data := CdsPlanoPrev.Data;
                     cdsPPSel.EmptyDataSet;
                     ltvPPSelecionados.Items.Clear;
                     Carregar(CdsPlanoPrev, ltvPPDisponiveis, 'CODORCAMENTO', 'IDPLANOPREV');
                     btnPPDisponiveisTodos.Click;

                     //  Carrega Plano Prev que AINDA NÃO forma utilizados pelas contas orçamentárias do grupo
                     CdsPlanoPrev.Data := CtrlCadContasOrcPorGrupo.ListaPlanoPrev(1, iIdPlanoOrc {Modulo.iPlanoOrc}, GrupoOrc);  // Edilaine - SOL 172383-7764 / KTN 1556975
                     Carregar(CdsPlanoPrev, ltvPPDisponiveis, 'CODORCAMENTO', 'IDPLANOPREV');
                  end;


      opApagar  : CdsPlanoPrev.Data := CtrlCadContasOrcPorGrupo.ListaPlanoPrev(2, iIdPlanoOrc {Modulo.iPlanoOrc}, GrupoOrc);  // Edilaine - SOL 172383-7764 / KTN 1556975
   end;


   if CmeCadastro.Operacao <> opAlterar then
   begin
      // É usado um segundo ClentDataSet para conter os selecionados, porém vazio agora
      cdsPPSel.Data := CdsPlanoPrev.Data;
      cdsPPSel.EmptyDataSet;

      ltvPPSelecionados.Items.Clear;
      Carregar(CdsPlanoPrev, ltvPPDisponiveis, 'CODORCAMENTO', 'IDPLANOPREV');
   end;
end;




procedure TfrmCadContasOrcPorGrupoAuxMT.btnPTRefreshClick(Sender: TObject);
begin
   case CmeCadastro.Operacao of
      opInserir : CdsPatro.Data := CtrlCadContasOrcPorGrupo.ListaPatro(0, iIdPlanoOrc {Modulo.iPlanoOrc}, GrupoOrc);  // Edilaine - SOL 172383-7764 / KTN 1556975

      opAlterar : begin
                     CdsPatro.Data := CtrlCadContasOrcPorGrupo.ListaPatro(1, iIdPlanoOrc {Modulo.iPlanoOrc}, GrupoOrc); // Edilaine - SOL 172383-7764 / KTN 1556975

                     //  Carrega Plano Prev JÁ USADOS pelas contas orçamentárias do grupo
                     CdsPatro.Data := CtrlCadContasOrcPorGrupo.ListaPatro(2, iIdPlanoOrc {Modulo.iPlanoOrc}, GrupoOrc);  // Edilaine - SOL 172383-7764 / KTN 1556975
                     // É usado um segundo ClentDataSet para conter os selecionados, porém vazio agora
                     cdsPTSel.Data := CdsPatro.Data;
                     cdsPTSel.EmptyDataSet;
                     ltvPTSelecionados.Items.Clear;
                     Carregar(CdsPatro, ltvPTDisponiveis, 'CODORCAMENTO', 'IDPESSOA');
                     btnPTDisponiveisTodos.Click;

                     //  Carrega Plano Prev que AINDA NÃO forma utilizados pelas contas orçamentárias do grupo
                     CdsPatro.Data := CtrlCadContasOrcPorGrupo.ListaPatro(1, iIdPlanoOrc {Modulo.iPlanoOrc}, GrupoOrc);  // Edilaine - SOL 172383-7764 / KTN 1556975
                     Carregar(CdsPatro, ltvPTDisponiveis, 'CODORCAMENTO', 'IDPESSOA');


                     //Ricardo de Freitas SOL: 159212 - Kintana 1337867

                     //Programa
                     cdsPrograma.Data               :=  CtrlCadContasOrcPorGrupo.ListaPrograma(1, iIdPlanoOrc {Modulo.iPlanoOrc}, GrupoOrc); // Edilaine - SOL 172383-7764 / KTN 1556975
                     cdsProgramaSel.Data    :=  CtrlCadContasOrcPorGrupo.ListaPrograma(2, iIdPlanoOrc {Modulo.iPlanoOrc}, GrupoOrc);  // Edilaine - SOL 172383-7764 / KTN 1556975
                     ltvProgramaSelecionados.Items.Clear;
                     Carregar(cdsProgramaSel, ltvProgramaSelecionados, 'IDPROGRAMAORCAMEN', 'NOME');
                     Carregar(cdsPrograma, ltvProgramaDisponivel, 'IDPROGRAMAORCAMEN', 'NOME');

                     //Tipo de Desepesa
                     cdsTipoDespesa.Data            :=  CtrlCadContasOrcPorGrupo.ListaTipoDespesa(1, iIdPlanoOrc {Modulo.iPlanoOrc}, GrupoOrc); // Edilaine - SOL 172383-7764 / KTN 1556975
                     cdsTipoDespesaSel.Data :=  CtrlCadContasOrcPorGrupo.ListaTipoDespesa(2, iIdPlanoOrc {Modulo.iPlanoOrc}, GrupoOrc); // Edilaine - SOL 172383-7764 / KTN 1556975
                     ltvTipoDespesaSelecionados.Items.Clear;
                     Carregar(cdsTipoDespesaSel, ltvTipoDespesaSelecionados, 'IDTIPO_DEPESAORCAMEN','NOME');
                     Carregar(cdsTipoDespesa, ltvTipoDespesaDisponivel , 'IDTIPO_DEPESAORCAMEN','NOME');
                     //Ricardo de Freitas SOL: 159212 - Kintana 1337867 - fim

                  end;


      opApagar  : CdsPatro.Data := CtrlCadContasOrcPorGrupo.ListaPatro(2, iIdPlanoOrc {Modulo.iPlanoOrc}, GrupoOrc); // Edilaine - SOL 172383-7764 / KTN 1556975
   end;


   if CmeCadastro.Operacao <> opAlterar then
   begin
      // É usado um segundo ClentDataSet para conter os selecionados, porém vazio agora
      cdsPTSel.Data           := CdsPatro.Data;
      cdsPTSel.EmptyDataSet;

      ltvPTSelecionados.Items.Clear;
      Carregar(CdsPatro, ltvPTDisponiveis, 'CODORCAMENTO', 'IDPESSOA');
   end;
end;


procedure TfrmCadContasOrcPorGrupoAuxMT.Carregar(cdsLocal  : TClientDataSet;
                                                 lst       : TListView;
                                                 sCampoCod : String;
                                                 sCampoID  : String = ''
                                                );
begin
   Lst.Items.Clear;
   while not(cdsLocal.EOF) do
   begin
      Lst.Items.Add;
      Lst.Items[lst.Items.Count - 1].Caption := Copy(Trim(cdsLocal.FieldByName('NOME').AsString), 1, 30);
      Lst.Items[lst.Items.Count - 1].SubItems.Add(cdsLocal.FieldByName(sCampoCod).AsString);

      if sCampoID <> '' then
      begin
         Lst.Items[lst.Items.Count - 1].SubItems.Add(cdsLocal.FieldByName(sCampoID).AsString);
      end;

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
   end

   //Ricardo de Freitas SOL: 159212 - Kintana 1337867
   else if pgcCompo.ActivePage = tbsPrograma then
   begin
      MoverDePara(ltvProgramaDisponivel, ltvProgramaSelecionados);
   end

   else if pgcCompo.ActivePage = tbsTipoDespesa then
   begin
      MoverDePara(ltvTipoDespesaDisponivel, ltvTipoDespesaSelecionados);
   end;
   //Ricardo de Freitas SOL: 159212 - Kintana 1337867 - fim

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
   end
   //Ricardo de Freitas SOL: 159212 - Kintana 1337867
   else if pgcCompo.ActivePage = tbsPrograma then
   begin
      Maximo := ltvProgramaDisponivel.Items.Count - 1;
   end

   else if pgcCompo.ActivePage = tbsTipoDespesa then
   begin
      Maximo := ltvTipoDespesaDisponivel.Items.Count - 1;
   end;
   //Ricardo de Freitas SOL: 159212 - Kintana 1337867 - fim

   for Posicao := Maximo downto 0 do DisponiveisClick(Self);
end;



procedure TfrmCadContasOrcPorGrupoAuxMT.SelecionadosClick(Sender: TObject);
begin
   if pgcCompo.ActivePage = tbsCentroCusto then
   begin
      MoverDePara(ltvCCSelecionados, ltvCCDisponiveis);
   end
   else if pgcCompo.ActivePage = tbsAtividade then
   begin
      MoverDePara(ltvAPSelecionados, ltvAPDisponiveis);
   end
   else if pgcCompo.ActivePage = tbsPlanoPrev then
   begin
      MoverDePara(ltvPPSelecionados, ltvPPDisponiveis)
   end
   else if pgcCompo.ActivePage = tbsPatro then
   begin
      MoverDePara(ltvPTSelecionados, ltvPTDisponiveis)
   end
   //Ricardo de Freitas SOL: 159212 - Kintana 1337867
   else if pgcCompo.ActivePage = tbsPrograma then
   begin
      MoverDePara(ltvProgramaSelecionados,ltvProgramaDisponivel);
   end

   else if pgcCompo.ActivePage = tbsTipoDespesa then
   begin
      MoverDePara(ltvTipoDespesaSelecionados,ltvTipoDespesaDisponivel);
   end;
   //Ricardo de Freitas SOL: 159212 - Kintana 1337867 - fim
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
   end

   //Ricardo de Freitas SOL: 159212 - Kintana 1337867
   else if pgcCompo.ActivePage = tbsPrograma then
   begin
      Maximo := ltvProgramaSelecionados.Items.Count - 1
   end
   else if pgcCompo.ActivePage = tbsTipoDespesa then
   begin
      Maximo := ltvTipoDespesaSelecionados.Items.Count - 1
   end;
   //Ricardo de Freitas SOL: 159212 - Kintana 1337867 - fim

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
   sNomeArq  : String;
   iQtdeCC   : Integer;
   //Ricardo de Freitas SOL: 159212 - Kintana 1337867
   iQtdePR,iQtdeTD : Integer;
   //Ricardo de Freitas SOL: 159212 - Kintana 1337867 - fim
begin

   //Ricardo de Freitas SOL: 159212 - Kintana 1337867
   CtrlCadContasOrcPorGrupo.AnalisaContasorcamen := (chkAnaliseContaOrcamen.Checked);

   if not(VerificaPreenchimento) then Exit;

   // ----------------------------------------------------------------------------------------------

   // Alterado por Arnaldo V. Scarin em 08/09/2009
   // Sol: 123436 Kintana: 616983
   // Alteração da Rotina de Centro de Custos, para desvincular a obrigatoriedade de
   // informar as contas de centro de custos quando o flag de centro de custos estiver
   // desmarcado.
   If chkCC.Checked then
     iQtdeCC := ltvCCSelecionados.Items.Count
   else
     iQtdeCC := 1;

   //Ricardo de Freitas SOL: 159212 - Kintana 1337867
   If chkPrograma.Checked then
     iQtdePR := ltvProgramaSelecionados.Items.Count
   else
     iQtdePR := 1;

   If chkTipoDespesa.Checked then
     iQtdeTD := ltvTipoDespesaSelecionados.Items.Count
   else
     iQtdeTD := 1;
   //Ricardo de Freitas SOL: 159212 - Kintana 1337867 - fim

   //Ricardo de Freitas SOL: 159212 - Kintana 1337867
   //adicionado Programa e Tipo de Despesa

   iQuant := iQtdeCC *
             ltvAPSelecionados.Items.Count *
             ltvPPSelecionados.Items.Count *
             ltvPTSelecionados.Items.Count *
             iQtdeTD *
             iQtdePR;


   case CmeCadastro.Operacao of
      opInserir: sOperacao := ' criadas ';
      opAlterar: sOperacao := ' alteradas ';
      opApagar : sOperacao := ' excluídas ';
   end;

   //Confirmação
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

   //Ricardo de Freitas SOL: 159212 - Kintana 1337867
   MontaPrograma;
   MontaTipoDespesa;
   //Ricardo de Freitas SOL: 159212 - Kintana 1337867 - fim

   cdsContaOrc.Close;
   sqlContaOrc.Prepare;
   sqlContaOrc.ParamByName('PIDPESSOA').AsInteger       := Sistema.IDEmpresa;
   sqlContaOrc.ParamByName('PIDPLANOORCAMEN').AsInteger := iIdPlanoOrc; {Modulo.iPlanoOrc;} // Edilaine - SOL 172383-7764 / KTN 1556975
   sqlContaOrc.ParamByName('PIDCONTAORCAMEN').AsString  := ContaOrc;
   sqlContaOrc.Open;

   //Ricardo SOL: 159242/6041 KINTANA 1385831
   //Colocar rotina de desvinculação de Contas orçamentárias
   CtrlCadContasOrcPorGrupo.DesvincularContorcamen := true;


   CtrlCadContasOrcPorGrupo.CreateThreadProgresso;

   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------
   case CmeCadastro.Operacao of

      // -------------------------------------------------------------------------------------------
      // -------------------------------------------------------------------------------------------
      opInserir, opAlterar :
      if not(CtrlCadContasOrcPorGrupo.GravarGrupoOrc(GrupoOrc,  //cdsContaOrc.FieldByName('IDGRUPOORCAMEN').AsInteger,    // Helen - SOL 187700 /KTN 1767662
                                                     CodGrupoOrc,  //cdsContaOrc.FieldByName('CODGRUPOORC').AsString,     // Helen - SOL 187700 /KTN 1767662
                                                     ContaOrc,
                                                     pnlPasta.Caption,
                                                     chkCC.Checked,
                                                     chkAP.Checked,
                                                     chkPP.Checked,
                                                     chkPT.Checked,
                                                     //Ricardo de Freitas SOL: 159212 - Kintana 1337867
                                                     chkPrograma.Checked,
                                                     chkTipoDespesa.Checked,
                                                     //Ricardo de Freitas SOL: 159212 - Kintana 1337867 - fim
                                                     CtrlCadContasOrcPorGrupo.ProgressFileName,
                                                     CmeCadastro.Operacao
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

            if CmeCadastro.Operacao = opInserir then
               sOperacao := 'INSERINDO'
            else
               sOperacao := 'ALTERANDO';

            sNomeArq := pnlPasta.Caption + 'ContasOrcamen' + sOperacao + FormatDateTime('yyyy-mm-dd', Date) + '.txt';

            CopyFile(Pchar(sNomeArq), PChar(ExtractFilePath(sNomeArq) + 'Visualiza.Txt'), False);
            ShellExecuteFile(ExtractFilePath(sNomeArq) + 'Visualiza.Txt', '', '', SW_SHOW);
         end;
         Repaint;
      end;

      // -------------------------------------------------------------------------------------------
      // -------------------------------------------------------------------------------------------

      opApagar:
      begin
         CtrlCadContasOrcPorGrupo.ExclusaoNova(IntToStr(GrupoOrc),
                                               cdsContaOrc.FieldByName('CODGRUPOORC').AsString,
                                               IntToStr(Sistema.IDEmpresa),
                                               pnlPasta.Caption,
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


   //Ricardo SOl 159215 Kintana 1337816
   //Ao finalizar as operações de Inserir\Alterar\Excluir, deverá
   //realizar as consultas para atuaklizar a tela principal
   //Ricardo SOl 159215 Kintana 1337816 - fim

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

   pgcCompo.ActivePage := tbsCentroCusto;
   BtnCCRefresh.Click;

   pgcCompo.ActivePage := tbsAtividade;
   btnAPRefresh.Click;

   pgcCompo.ActivePage := tbsPlanoPrev;
   BtnPPRefresh.Click;

   pgcCompo.ActivePage := tbsPatro;
   BtnPTRefresh.Click;

   // ----------------------------------------------------------------------------------------------

   CtrlCadContasOrcPorGrupo.pPlano := iIdPlanoorc; // Edilaine - SOL 172383-9602 / KTN 1661594

   // ----------------------------------------------------------------------------------------------

   pgcCompo.ActivePage := tbsCentroCusto;

   pgcCompo.Enabled    := True;
   PreencheVCodigo;
   cdsParamOrc.Data := CtrlParamorcamento.ListaParamOrcamento(Sistema.IDEmpresa);
   pnlPasta.Caption := ExtractFilePath(Application.ExeName);
end;



// -------------------------------------------------------------------------------------------------
procedure TfrmCadContasOrcPorGrupoAuxMT.SetContaOrc(const Value: String);
begin FContaOrc := Value; end;

procedure TfrmCadContasOrcPorGrupoAuxMT.SetGrupoOrc(const Value: Integer);
begin FGrupoOrc := Value; end;

procedure TfrmCadContasOrcPorGrupoAuxMT.SetCodGrupoOrc(const Value: String);
begin FCodGrupoOrc := Value; end;

procedure TfrmCadContasOrcPorGrupoAuxMT.btnEscolheDirClick(Sender: TObject);
begin
   inherited;
   dlgCaminho.Directory := pnlPasta.Caption;
   if dlgCaminho.Execute then pnlPasta.Caption := dlgCaminho.Directory;
end;



procedure TfrmCadContasOrcPorGrupoAuxMT.btnTempClick(Sender: TObject);
begin
   inherited;
   pnlPasta.Caption := Sistema.TempDir;
end;



procedure TfrmCadContasOrcPorGrupoAuxMT.MontaPrograma;
var
   i: Integer;
begin
   // Esvazia o ClientDataSet
   cdsProgramaSel.EmptyDataSet;

   if chkPrograma.Checked then
   begin
        // Itera pela lista, inserindo os selecionados no ClientDataSet
        for i := 0 to (ltvProgramaSelecionados.Items.Count - 1) do
        begin
           cdsProgramaSel.Append;
           cdsProgramaSel.FieldByName('NOME').AsString                := ltvProgramaSelecionados.Items[i].Caption;
           cdsProgramaSel.FieldByName('IDPROGRAMAORCAMEN').AsString   := ltvProgramaSelecionados.Items[i].SubItems[0];
           //cdsProgramaSel.FieldByName('IDPESSOA').AsString            := ltvProgramaSelecionados.Items[i].SubItems[1];
           cdsProgramaSel.Post;
        end;
   end
   else
   begin
        cdsProgramaSel.Append;
        cdsProgramaSel.FieldByName('NOME').AsString                := 'Conta Generica';
        cdsProgramaSel.FieldByName('IDPROGRAMAORCAMEN').AsInteger  := 0;
        //cdsProgramaSel.FieldByName('IDPESSOA').AsString            := 'X';
        cdsProgramaSel.Post;
   end;
end;

procedure TfrmCadContasOrcPorGrupoAuxMT.MontaTipoDespesa;
var
   i: Integer;
begin
   // Esvazia o ClientDataSet
   cdsTipoDespesaSel.EmptyDataSet;

   // Itera pela lista, inserindo os selecionados no ClientDataSet
   if chkTipoDespesa.Checked then
   begin
      for i := 0 to (ltvTipoDespesaSelecionados.Items.Count - 1) do
      begin
           cdsTipoDespesaSel.Append;
           cdsTipoDespesaSel.FieldByName('NOME').AsString                   := ltvTipoDespesaSelecionados.Items[i].Caption;
           cdsTipoDespesaSel.FieldByName('IDTIPO_DEPESAORCAMEN').AsString   := ltvTipoDespesaSelecionados.Items[i].SubItems[0];
           //cdsTipoDespesaSel.FieldByName('IDPESSOA').AsString             := ltvTipoDespesaSelecionados.Items[i].SubItems[1];
           cdsTipoDespesaSel.Post;
      end;
   end
      else
   begin
        cdsTipoDespesaSel.Append;
        cdsTipoDespesaSel.FieldByName('NOME').AsString                  := 'Conta Generica';
        cdsTipoDespesaSel.FieldByName('IDTIPO_DEPESAORCAMEN').AsInteger := 0;
        //cdsProgramaSel.FieldByName('IDPESSOA').AsString            := 'X';
        cdsTipoDespesaSel.Post;
   end;
end;

procedure TfrmCadContasOrcPorGrupoAuxMT.SetiIdPlanoOrc(
  const Value: integer);
begin
  FiIdPlanoOrc := Value;
end;

end.
