{-----------------------------------------------------------------------------------------
Rotina......: .dfm, bbtnConfirmarClick
Nº SOL......: 136203
Nº KINTANA..: 813205
Data........: 16/06/2014
Responsável.: Edilaine Ferraresi
Descrição...: Nova funcionalidade para Fluxo de Caixa (incluir campo Grau)
{========================================================================================
 Data      : 11/07/2007
 Pendência : 25449
 Autor     : Rodolpho da Silva
 Descrição : Permitir que a variação financeira atenda os TRD analíticos, ao invés de
             toda a linha.
 =========================================================================================
 Analista : Marcus Oliveira
 Data     : 4/1/2007 a 10/01/2007
 Pendencia: 22033
 Tela     : Inclui tb a FOrdenaFluxoMT
 ========================================================================================}

unit FCadMontaFluxoMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, FSairAjuda, IvDictio, IvMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, DBCtrls, Mask,
  wwdbedit, ComCtrls, fcTreeView, FOkCancelar, Menus, DB, DBClient,
  uCMClientDataSet, Wwdatsrc, uCmSqlParams, uCtrlMontaFluxo, uCtrlListTercFinanc,
  uCtrlPadroes, DBGrids, ImgList, IvEMulti, Wwdbspin;

type
  //Estrutura dos nós do Mapa de Tipos de Rec./Des.
  PTRD = ^TPRD;
  TPRD = record
            sTipoRD : String;
         end;


  //Estrutura dos nós do Mapa do Fluxo
  TDadosNo = class
  public
     constructor Create;
  private
     sTipoLinha: String;
     sCodTipRecDes: String;
     sSubComposicao: String;
     rIDFluxoCaixa: Double;
     rCodLinhaFluxo: Double;
     rCodTipDoc: Double;
     sFlgAnaSint: string;
     iNivel : byte;    // edilaine - SOL 136203 / KTN 813205
  end;


  TfrmCadMontaFluxoMT = class(TfrmOkCancelar)
    pnlMapaFluxo: TPanel;
    pnlTituloMapaFluxo: TPanel;
    tvMapaFluxo: TfcTreeView;
    Splitter1: TSplitter;
    PgcMontaFluxo: TPageControl;
    tbsLinhaFluxo: TTabSheet;
    dbrgTipoCalculo: TDBRadioGroup;
    gbAcumula: TGroupBox;
    dbcAcumula: TDBCheckBox;
    dbrgPosicaoTotal: TDBRadioGroup;
    tbsComposicaoLinhaFluxo: TTabSheet;
    pnlDisponiveis: TPanel;
    pnlTituloDisponiveis: TPanel;
    tvTiposRD: TfcTreeView;
    dbgTiposDocumento: TwwDBGrid;
    pnlBotoes: TPanel;
    btnIncluirComposicao: TSpeedButton;
    btnExcluirComposicao: TSpeedButton;
    pnlSelecionados: TPanel;
    pnlTituloSelecionados: TPanel;
    dbgSelecionados: TwwDBGrid;
    popFluxo: TPopupMenu;
    mnuIncluir: TMenuItem;
    mnuAlterar: TMenuItem;
    mnuEcluir: TMenuItem;
    dsCompTRD: TwwDataSource;
    cdsCompTRD: TCMClientDataSet;
    dsCompTipDoc: TwwDataSource;
    cdsCompTipDoc: TCMClientDataSet;
    dsCompLinhaFlx: TwwDataSource;
    cdsCompLinhaFlx: TCMClientDataSet;
    dsComposicaoLinha: TwwDataSource;
    spTeste: TCMSqlParams;
    cdsLinhaFluxo: TCMClientDataSet;
    dsLinhaFluxo: TwwDataSource;
    dbgLinhas: TwwDBGrid;
    cdsFluxoCaixa: TCMClientDataSet;
    dsFluxoCaixa: TwwDataSource;
    tbsFluxoCaixa: TTabSheet;
    lblDescricao: TLabel;
    dbeDescricaoLinhaFluxo: TwwDBEdit;
    Label1: TLabel;
    dbeDescricaoFluxo: TwwDBEdit;
    tbsDetCompFluxo: TTabSheet;
    cdsComposicaoLinha: TCMClientDataSet;
    iIconesMenu: TImageList;
    N1: TMenuItem;
    mnuVerificar: TMenuItem;
    mnuOrdenar: TMenuItem;
    gbComposicao: TGroupBox;
    chkCompFluxoBaseDisp: TCheckBox;
    CdsComposicaoLinhaAux: TCMClientDataSet;
    dbrgGrau: TGroupBox;
    lblGrau: TLabel;
    seGrau: TwwDBSpinEdit;

    procedure FormCreate(Sender: TObject);
    procedure mnuIncluirClick(Sender: TObject);
    procedure mnuAlterarClick(Sender: TObject);
    procedure mnuEcluirClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure btnIncluirComposicaoClick(Sender: TObject);
    procedure btnExcluirComposicaoClick(Sender: TObject);
    procedure dbrgTipoCalculoClick(Sender: TObject);
    procedure tvMapaFluxoMouseDown(TreeView: TfcCustomTreeView; Node: TfcTreeNode; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure dbeDescricaoChange(Sender: TObject);
    procedure tvTiposRDChanging(TreeView: TfcCustomTreeView; Node: TfcTreeNode; var AllowChange: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure tvMapaFluxoChange(TreeView: TfcCustomTreeView; Node: TfcTreeNode);
    procedure tvMapaFluxoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mnuVerificarClick(Sender: TObject);
    procedure mnuOrdenarClick(Sender: TObject);
    procedure dsFluxoCaixaStateChange(Sender: TObject);
    procedure dsLinhaFluxoStateChange(Sender: TObject);
    procedure dbrgTipoCalculoChange(Sender: TObject);
    procedure dsComposicaoLinhaDataChange(Sender: TObject; Field: TField);
    procedure PgcMontaFluxoChange(Sender: TObject);


  private { Private declarations }

    sMascaraCap       : String;
    sMascaraCar       : String;
    bExcluindo        : Boolean;
    bMontandoMapa     : Boolean;
    CtrlMontaFluxo    : TCtrlMontaFluxo;
    CtrlListTerceiros : TCtrlListTercFinanc;
    rIDFluxoCaixaAux  : Double;
    rCodLinhaFluxoAux : Double;

    procedure MontaTreeViewTRD;
    procedure CarregaCds(No: TfcTreeNode); overload;
    procedure CarregaCds(rIDFluxoCaixa, rCodLinhaFluxo: Double); overload;
    procedure CarregaCdsAux(No: TfcTreeNode); overload;
    procedure CarregaCdsAux(rIDFluxoCaixa, rCodLinhaFluxo: Double; sTipoCalculo: String); overload;
    procedure ExcluiNo(No: TfcTreeNode);
    procedure ExcluiRegistros;
    procedure MontaArvoreMapaFluxo(NoCorrente: TfcTreeNode);
    procedure FocaTreeViewRecDes; //Marcus Oliveira Serve pra obrigar o focus quando ele não existir


  public  { Public declarations }


  end;




const
   sNovoFluxo = 'Novo Fluxo';
   sNovaLinhaFluxo = 'Nova Linha de Fluxo';

var
  frmCadMontaFluxoMT: TfrmCadMontaFluxoMT;



implementation
{$R *.dfm}
uses
  uSistema, uMensErro, FVerificaFluxoMT, FOrdenaFluxoMT;



constructor TDadosNo.Create;
begin
   sTipoLinha:='';
   sCodTipRecDes:='';
   sSubComposicao:='N';
   rIDFluxoCaixa:=0;
   rCodLinhaFluxo:=0;
   rCodTipDoc:=0;
   sFlgAnaSint:='';   // edilaine - SOL 136203 / KTN 813205
   iNivel := 0;       // edilaine - SOL 136203 / KTN 813205
end;


procedure TfrmCadMontaFluxoMT.FormCreate(Sender: TObject);
var
   cdsAux: TCMClientDataSet;
begin
   inherited;
   bExcluindo        := False;
   bMontandoMapa     := False;
   rIDFluxoCaixaAux  := 0;
   rCodLinhaFluxoAux := 0;

   PgcMontaFluxo.ActivePageIndex   := 0;
   tbsFluxoCaixa.Enabled           := False;
   tbsLinhaFluxo.Enabled           := False;
   tbsComposicaoLinhaFluxo.Enabled := False;

   //Inicializa CtrlMontaFluxo
   CtrlMontaFluxo:=TCtrlMontaFluxo.Create(Sistema.IdEmpresa,Sistema.IdModulo,Sistema.IdUsuario);
   CtrlMontaFluxo.InitializeAs(Padroes);

   //Associa ClientDataSets
   CtrlMontaFluxo.CdsFluxoCaixa:=cdsFluxoCaixa;
   CtrlMontaFluxo.CdsMontaFluxo:=cdsLinhaFluxo;
   CtrlMontaFluxo.CdsCompFluxo:=cdsComposicaoLinha;

   //Abre cds de Fluxos de Caixa, Linhas de Fluxo e omposição das Linhas de Fluxo (Todos vazios)
   CarregaCds(-1,-1);

   //Carrega cds de Linhas de Fluxo (Disponíveis)
   cdsCompLinhaFlx.Data:=CtrlMontaFluxo.ListMontaFluxo(0,0,False);
   cdsCompLinhaFlx.Filter:='TIPOCALCULO<>''T'' OR TIPOCALCULO=''''';
   cdsCompLinhaFlx.Filtered:=True;

   //Inicializa CtrlListTerceiros
   CtrlListTerceiros:=TCtrlListTercFinanc.Create;
   CtrlListTerceiros.InitializeAs(Padroes);

   //Carrega cds de Tipos de Documento
   cdsCompTipDoc.Data:=CtrlListTerceiros.ListTipDocFaltantesFluxo(Sistema.IdEmpresa,-1);

   //Carrega cds de Tipos de Rec/Des
   cdsCompTRD.Data:=CtrlListTerceiros.ListTipoRDFaltantesFluxo(Sistema.IdEmpresa,False,-1);

   //dbgLinhas.BringToFront;
   dbgLinhas.Visible:=True;
   dbgTiposDocumento.Visible:=False;
   tvTiposRD.Visible:=False;

   //Busca máscara dos tipos de Rec. e Des.
   cdsAux:=TCMClientDataSet.Create(nil);
   cdsAux.Data:=CtrlListTerceiros.ListParamCAP(Sistema.IdEmpresa,'');
   try
      cdsAux.Filtered:=False;
      cdsAux.Filter:='RECPAG=''R''';
      cdsAux.Filtered:=True;
      sMascaraCar:=cdsAux.FieldByName('MASCARADESEMB').AsString;
      cdsAux.Filtered:=False;
      cdsAux.Filter:='RECPAG=''P''';
      cdsAux.Filtered:=True;
      sMascaraCap:=cdsAux.FieldByName('MASCARADESEMB').AsString;
      cdsAux.Close;
   finally
      cdsAux.Free;
   end;

   //Ajusta tempo de exibição de hint do Treeview
   Application.HintHidePause:=3500;
   tvMapaFluxo.Hint:='Inclusão/Alteração/Exclusão: '+#13+
                     ' - Clique com botão direito do '+#13+
                     '   mouse na linha do fluxo'+#13+#13+
                     'Teclas de Atalho: '+#13+
                     ' - Inclusão:  Insert'+#13+
                     ' - Alteração: Espaço'+#13+
                     ' - Exclusão:  Delete ';

   //Monta mapa do fluxo
   MontaArvoreMapaFluxo(nil);

   //Desabilita Tabs
   tbsFluxoCaixa.TabVisible:=False;
   tbsLinhaFluxo.TabVisible:=False;
   tbsComposicaoLinhaFluxo.TabVisible:=False;
end;



procedure TfrmCadMontaFluxoMT.FormResize(Sender: TObject);
begin
   inherited;
   pnlDisponiveis.Width:=(tbsComposicaoLinhaFluxo.Width-pnlBotoes.Width) div 2;
end;



procedure TfrmCadMontaFluxoMT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   Application.HintHidePause:=2500;
end;



procedure TfrmCadMontaFluxoMT.mnuIncluirClick(Sender: TObject);
var
   sDescricao : String;
begin
   //Define descrição de novo Fluxo ou nova Linha
   case (TDadosNo(tvMapaFluxo.Selected.Data).sTipoLinha[1]) of
      'E': sDescricao:=sNovoFluxo;
      'F': sDescricao:=sNovaLinhaFluxo;
   end;

   //Cria novo nó
   bMontandoMapa:=True;
   try
      tvMapaFluxo.Selected:=tvMapaFluxo.Items.AddChildObject(tvMapaFluxo.Selected,sDescricao,
                                                             TDadosNo.Create);
   finally
      bMontandoMapa:=False;
   end;

   //Cria novo registro
   case (TDadosNo(tvMapaFluxo.Selected.Parent.Data).sTipoLinha[1]) of
      'E': begin
              TDadosNo(tvMapaFluxo.Selected.Data).sTipoLinha:='F';
              cdsFluxoCaixa.EmptyDataSet;
              cdsFluxoCaixa.Append;
              //Associa ícone
              tvMapaFluxo.Selected.ImageIndex:=8;
              tvMapaFluxo.Selected.SelectedIndex:=8;
              tvMapaFluxo.Refresh;
           end;
      'F': begin
              //Atribui ID do fluxo
              TDadosNo(tvMapaFluxo.Selected.Data).rIDFluxoCaixa:=
                      TDadosNo(tvMapaFluxo.Selected.Parent.Data).rIDFluxoCaixa;
              cdsLinhaFluxo.EmptyDataSet;
              cdsComposicaoLinha.EmptyDataSet;
              cdsLinhaFluxo.Append;
           end;
   end;
end;



procedure TfrmCadMontaFluxoMT.mnuAlterarClick(Sender: TObject);
begin
   FocaTreeViewRecDes;

   if (TDadosNo(tvMapaFluxo.Selected.Data).sTipoLinha='F') then
      cdsFluxoCaixa.Edit;
   if (Pos(TDadosNo(tvMapaFluxo.Selected.Data).sTipoLinha,'LR LP LC LD LL LT')<>0) then
      cdsLinhaFluxo.Edit;

   if (Pos(TDadosNo(tvMapaFluxo.Selected.Data).sTipoLinha,'CR CP CC CD')<>0) then
   begin
      //Habilita/Desabilita controles
      tvMapaFluxo.Enabled     := false;
      bbtnConfirmar.Enabled   := true;
      bbtnCancelar.Enabled    := true;
      tbsDetCompFluxo.Enabled := true;
   end;
end;



procedure TfrmCadMontaFluxoMT.mnuEcluirClick(Sender: TObject);
var
   sMensagem : String;
   NoCorrenteAux: TfcTreeNode;
begin
   if (TDadosNo(tvMapaFluxo.Selected.Data).sTipoLinha='F') then
       sMensagem:='Confirma a EXCLUSÃO do Fluxo e de sua composição ?';

   if (Pos(TDadosNo(tvMapaFluxo.Selected.Data).sTipoLinha,'LR LP LC LD LL LT')<>0) then
       sMensagem:='Confirma a EXCLUSÃO da Linha de Fluxo e de sua composição ?';

   //Exclui nós
   if MsgDlg(sMensagem,'Atenção',mtConfirmation,[mbYes,mbNo],0) = mrYes then
   begin
      //Exclui todos os registros ligados ao nó
      Excluiregistros;

      //Aplica a Exclusão
      if not(CtrlMontaFluxo.ExcluiFluxo) then
      begin
         MsgDlg(CtrlMontaFluxo.MessageInfo,'Erro',mtError,[mbOK],0);
         MontaArvoreMapaFluxo(nil);
      end
      else
      begin
         tvMapaFluxo.SetFocus;

         //Armazena nó corrente
         NoCorrenteAux:=tvMapaFluxo.Selected;

         //Posiciona no nó anterior
         tvMapaFluxo.Selected:=tvMapaFluxo.Selected.GetPrevVisible;

         //Exclui nó e seus filhos
         ExcluiNo(NoCorrenteAux);
      end;
   end;
end;



procedure TfrmCadMontaFluxoMT.mnuVerificarClick(Sender: TObject);
var
   sTipoLinha        : String;
   iModoAux          : Integer;
   iIndice           : Integer;
   rCodLinFlxAux     : Double;
   rIDFluxoCaixa     : Double;
   bCancelado        : Boolean;
   cdsAux            : TClientDataSet;
   NoAux             : TfcTreeNode;
   Mr                : Integer;
begin
   NoAux:=nil;
   iModoAux:=0;
   bCancelado:=False;
   rCodLinFlxAux:=0;

   cdsAux:=TClientDataSet.Create(nil);
   try
      //Carrega cdsAux (vazio)
      cdsAux.Data:=CtrlMontaFluxo.ListFaltantes;

      //Aramazena linha corrente
      rIDFluxoCaixa:=TDadosNo(tvMapaFluxo.Selected.Data).rIDFluxoCaixa;

      //Exibição da tela de verificação
      with TfrmVerificaFluxoMT.Create(Self,Trunc(rIDFluxoCaixa)) do
      try
         //Passa código do Fluxo para a tela de verificação
         rCodLinhaFluxoAux:=0;

         //Exibe tela de verificação
         Mr:=ShowModal;

         if (Mr = mrOk) and (iNumMarcados<>0) then
         begin
            //Associa Tipo de linha
            case rgFaltantes.ItemIndex of
               0: begin
                     case rgOpRecPag.ItemIndex of
                        0: sTipoLinha:='R';
                        1: sTipoLinha:='P';
                     end;
                  end;
               1: begin
                     case rgOpRecPag.ItemIndex of
                        0: sTipoLinha:='C';
                        1: sTipoLinha:='D';
                     end;
                  end;
            end;

            //Carrega cds com linhas a serem incluídas
            CdsTRDFaltantes.First;
            while not(CdsTRDFaltantes.Eof) do
            begin
               if (CdsTRDFaltantes.FieldByName('SELECIONADO').AsString='S') Then
                begin
                   cdsAux.Append;
                   cdsAux.FieldByName('RECPAG').AsString:=
                                         CdsTRDFaltantes.FieldByName('RECPAG').AsString;
                   cdsAux.FieldByName('DESCRICAO').AsString:=
                                         CdsTRDFaltantes.FieldByName('DESCRICAO').AsString;
                   cdsAux.FieldByName('CODIGO').AsString:=
                                         CdsTRDFaltantes.FieldByName('CODIGO').AsString;
                   cdsAux.Post;
                   Dec(iNumMarcados);
                end;

               if iNumMarcados=0 then Break;

               CdsTRDFaltantes.Next;
            end;
         end
         else
          bCancelado:=True;
      finally;
         Free;
      end;

      if bCancelado then Exit;

      case iModoAux of
         0: begin
               //Tipos de Rec/Des - Doc em Nova Linha
               mnuIncluirClick(nil);

               case sTipoLinha[1] of
                  'R': dbrgTipoCalculo.ItemIndex:=0;
                  'P': dbrgTipoCalculo.ItemIndex:=1;
                  'C': dbrgTipoCalculo.ItemIndex:=2;
                  'D': dbrgTipoCalculo.ItemIndex:=3;
               end;
            end;

         1: begin
               //Localiza linha de fluxo no Treeview
               for iIndice:=0 to tvMapaFluxo.Items.Count-1 do
               begin
                  if (Pos(TDadosNo(tvMapaFluxo.Items[iIndice].Data).sTipoLinha,'LR LP LC LD')<>0) and
                     (TDadosNo(tvMapaFluxo.Items[iIndice].Data).rCodLinhaFluxo=rCodLinFlxAux) then
                   begin
                      NoAux:=tvMapaFluxo.Items[iIndice];
                      Break;
                   end;
               end;

               //Altera a linha
               NoAux.Selected:=True;
               tvMapaFluxoMouseDown(tvMapaFluxo,NoAux,mbLeft,[],0,0);
               mnuAlterarClick(nil);
            end;
      end;

      //Adiciona registros a linha do fluxo
      if not(bCancelado) then
      begin
         cdsAux.First;
         while not(cdsAux.Eof) do
         begin
            CdsComposicaoLinha.Append;
            CdsComposicaoLinha.FieldByName('RECPAG').AsString:=
                                  cdsAux.FieldByName('RECPAG').AsString;
            CdsComposicaoLinha.FieldByName('IDPESSOA').AsInteger:=Sistema.IdEmpresa;
            CdsComposicaoLinha.FieldByName('DESCLINHA').AsString:=
                                  cdsAux.FieldByName('DESCRICAO').AsString;

            CdsComposicaoLinha.FieldByName('DESCCODIGO').AsString :=
                                  cdsAux.FieldByName('CODIGO').AsString;

            if (sTipoLinha='R') or (sTipoLinha='P') then
               CdsComposicaoLinha.FieldByName('CODTIPRECDES').AsString:=
                                  cdsAux.FieldByName('CODIGO').AsString
            else
               cdsComposicaoLinha.FieldByName('CODTIPDOC').AsFloat:=
                                  cdsAux.FieldByName('CODIGO').AsFloat;

            cdsComposicaoLinha.FieldByName('IDFLUXOCAIXA').AsFloat:=rIDFluxoCaixa;
            CdsComposicaoLinha.FieldByName('CODLINHAFLUXO').AsFloat:=rCodLinFlxAux;
            CdsComposicaoLinha.Post;
            cdsAux.Next;
         end;
      end;

      cdsAux.Close;
   finally
      cdsAux.Free;
   end;
end;



procedure TfrmCadMontaFluxoMT.mnuOrdenarClick(Sender: TObject);
begin
   with TfrmOrdenaFluxoMT.Create(Self,TDadosNo(tvMapaFluxo.Selected.Data).rIDFluxoCaixa ) do
   try
      rIDFluxoCaixaAux:=TDadosNo(tvMapaFluxo.Selected.Data).rIDFluxoCaixa;
      ShowModal;
   finally
      Free;
   end;
   MontaArvoreMapaFluxo(nil);
end;



procedure TfrmCadMontaFluxoMT.tvMapaFluxoMouseDown(TreeView: TfcCustomTreeView; Node: TfcTreeNode;
                                                   Button: TMouseButton; Shift: TShiftState;
                                                   X, Y: Integer);
var
   Posicao : TPoint;
begin
   if (Node=nil) then Exit;

   //Habilita/Desabilita itens do pop
   mnuIncluir.Visible   := (Pos(TDadosNo(Node.Data).sTipoLinha,'E F')<>0);
   mnuAlterar.Visible   := (Pos(TDadosNo(Node.Data).sTipoLinha,'F LR LP LC LD LL LT CR CP CC CD')<>0);

   mnuEcluir.Visible    := (Pos(TDadosNo(Node.Data).sTipoLinha,'F LR LP LC LD LL LT')<>0);
   mnuVerificar.Visible := (TDadosNo(Node.Data).sTipoLinha='F') and (Node.Count>0);
   mnuOrdenar.Visible   := (TDadosNo(Node.Data).sTipoLinha='F') and (Node.Count>1);

   //Esconde/Exibe Tabs
   tbsFluxoCaixa.TabVisible           := (TDadosNo(Node.Data).sTipoLinha='F');
   tbsLinhaFluxo.TabVisible           := (Pos(TDadosNo(Node.Data).sTipoLinha,'LR LP LC LD LL LT')<>0);
   tbsComposicaoLinhaFluxo.TabVisible := (Pos(TDadosNo(Node.Data).sTipoLinha,'LR LP LC LD LL')<>0);

   tbsDetCompFluxo.TabVisible := ((Pos(TDadosNo(Node.Data).sTipoLinha,'CR CP CC CD')<>0) and
                                  (TDadosNo(Node.Data).sFlgAnaSint = 'A'));

   if tbsDetCompFluxo.TabVisible then
   begin
      tbsDetCompFluxo.Enabled      := false;
      gbComposicao.Caption         := Node.Text;
      chkCompFluxoBaseDisp.Checked := ((CdsComposicaoLinhaAux.Locate('CODTIPRECDES',TDadosNo(Node.Data).sCodTipRecDes,[])) and
                                       (CdsComposicaoLinhaAux.FieldByName('FLGDISPBASE').AsString = 'S'));
   end;


   //Poisciona Tab
   if (tbsFluxoCaixa.TabVisible) then PgcMontaFluxo.ActivePage := tbsFluxoCaixa;
   if (tbsLinhaFluxo.TabVisible) then PgcMontaFluxo.ActivePage := tbsLinhaFluxo;

   //Seleciona nó clicado
   tvMapaFluxo.Selected:=Node;

   //Testa se o clique foi dado com o botão direito. Caso seja exibe popup
   if (Button=mbRight) then
   begin
      GetCursorPos(Posicao);
      popFluxo.Popup(Posicao.X,Posicao.Y);
   end;
end;



procedure TfrmCadMontaFluxoMT.tvMapaFluxoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   if (key = VK_UP) or (Key = VK_DOWN) then
       tvMapaFluxoMouseDown(tvMapaFluxo,tvMapaFluxo.Selected,mbLeft,[],0,0);
   if (Key = VK_DELETE) or (Key = VK_SUBTRACT) then mnuEcluir.Click;
   if ((Key = VK_INSERT) or (Key = VK_ADD)) and (tvMapaFluxo.Selected.Level < 2) then mnuIncluir.Click;
   if (Key = VK_SPACE) then mnuAlterar.Click;
end;



procedure TfrmCadMontaFluxoMT.tvMapaFluxoChange(TreeView: TfcCustomTreeView; Node: TfcTreeNode);
begin
   if (tvMapaFluxo.Selected=nil) or (bMontandoMapa) or (bExcluindo) then Exit;

   //Abre e Filtra os Cds's do Fluxo
   if ((rIDFluxoCaixaAux<>TDadosNo(Node.Data).rIDFluxoCaixa) or
       (rCodLinhaFluxoAux<>TDadosNo(Node.Data).rCodLinhaFluxo)) and
      (Pos(TDadosNo(Node.Data).sTipoLinha,'E CL')=0) then
   begin
      CarregaCds(Node);
      CarregaCdsAux(Node);
   end;
end;



procedure TfrmCadMontaFluxoMT.dbrgTipoCalculoClick(Sender: TObject);
var
   NoAux: TfcTreeNode;
begin
   if not(cdsLinhaFluxo.Active) then Exit;

   NoAux:=tvMapaFluxo.Selected;

   //carrega cds´s auxiliares
   if (dbrgTipoCalculo.ItemIndex<>5) then
   begin
      CarregaCdsAux(cdsLinhaFluxo.FieldByName('IDFLUXOCAIXA').AsFloat,
                    cdsLinhaFluxo.FieldByName('CODLINHAFLUXO').AsFloat,
                    dbrgTipoCalculo.Values[dbrgTipoCalculo.ItemIndex]);
      dbrgTipoCalculoChange(nil);
   end;

   //Associa ícone e parêmtro de tipo de linha
   case dbrgTipoCalculo.ItemIndex of
      0: begin
            NoAux.ImageIndex:=9;
            NoAux.SelectedIndex:=9;
         end;

      1: begin
            NoAux.ImageIndex:=10;
            NoAux.SelectedIndex:=10;
         end;

      2: begin
            NoAux.ImageIndex:=11;
            NoAux.SelectedIndex:=11;
         end;

      3: begin
            NoAux.ImageIndex:=12;
            NoAux.SelectedIndex:=12;
         end;

      4: begin
            NoAux.ImageIndex:=13;
            NoAux.SelectedIndex:=13;
         end;

      5: begin
            NoAux.ImageIndex:=14;
            NoAux.SelectedIndex:=14;
         end;
   end;

   //Associa tipo de linha
   TDadosNo(tvMapaFluxo.Selected.Data).sTipoLinha:='L'+dbrgTipoCalculo.Values[dbrgTipoCalculo.ItemIndex];

   tvMapaFluxo.Refresh;
end;



procedure TfrmCadMontaFluxoMT.dbrgTipoCalculoChange(Sender: TObject);
begin
   if not(cdsLinhaFluxo.Active) then Exit;

   //Habilita/Desabilita componentes
   tbsComposicaoLinhaFluxo.TabVisible:=(dbrgTipoCalculo.ItemIndex<>5);

   dbrgPosicaoTotal.Visible:=(dbrgTipoCalculo.ItemIndex in [0,1,2,3,4]);
   gbAcumula.Visible:=dbrgPosicaoTotal.Visible;

   dbrgGrau.Visible:=(dbrgTipoCalculo.ItemIndex in [0,1,2,3,4]);   // edilaine.ferraresi - SOL 136203 / KTN 813205   

   dbgLinhas.Visible:=(dbrgTipoCalculo.ItemIndex=4);
   dbgTiposDocumento.Visible:=(dbrgTipoCalculo.ItemIndex in [2,3]);
   tvTiposRD.Visible:=(dbrgTipoCalculo.ItemIndex in [0,1]);

   case dbrgTipoCalculo.ItemIndex of
      0,1: begin
              pnlTituloDisponiveis.Font.Size:=12;
              pnlTituloSelecionados.Font.Size:=12;
              pnlTituloDisponiveis.Caption:=Translate('Tipos Disponíveis');
              pnlTituloSelecionados.Caption:=Translate('Tipos Selecionados');
           end;

      2,3: begin
              pnlTituloDisponiveis.Font.Size:=8;
              pnlTituloSelecionados.Font.Size:=8;
              pnlTituloDisponiveis.Caption:=Translate('Tipos de Documento Disponíveis');
              pnlTituloSelecionados.Caption:=Translate('Tipos de Documento Selecionados');
           end;

      4: begin
            pnlTituloDisponiveis.Font.Size:=12;
            pnlTituloSelecionados.Font.Size:=12;
            pnlTituloDisponiveis.Caption:=Translate('Linhas Disponíveis');
            pnlTituloSelecionados.Caption:=Translate('Linhas Selecionadas');
         end;
   end;
end;



procedure TfrmCadMontaFluxoMT.tvTiposRDChanging(TreeView: TfcCustomTreeView; Node: TfcTreeNode;
                                                var AllowChange: Boolean);
begin
   //Posiciona o ponteiro da tabela
   cdsCompTRD.Locate('CODTIPRECDES', PTRD(Node.Data)^.sTipoRD ,[]);
end;



procedure TfrmCadMontaFluxoMT.btnIncluirComposicaoClick(Sender: TObject);
var
   ProximoNo: TfcTreeNode;
begin
   case dbrgTipoCalculo.ItemIndex of
      0,1 : begin
            if cdsCompTRD.IsEmpty then Exit;

               if (cdsComposicaoLinha.Locate('CODTIPRECDES',
                                             cdsCompTRD.FieldByName('CODTIPRECDES').AsString,
                                             [])) then
               begin
                  MsgDlg('Tipo de Rec/Des já cadastrado','Atenção',mtWarning,[mbOK],0);
                  Exit;
               end;

               cdsComposicaoLinha.Append;

               cdsComposicaoLinha.FieldByName('IDPESSOA').AsFloat      := Sistema.IdEmpresa;
               cdsComposicaoLinha.FieldByName('CODTIPRECDES').AsString := cdsCompTRD.FieldByName('CODTIPRECDES').AsString;
               cdsComposicaoLinha.FieldByName('RECPAG').AsString       := cdsCompTRD.FieldByName('RECPAG').AsString;
               CdsComposicaoLinha.FieldByName('DESCCODIGO').AsString   := cdsCompTRD.FieldByName('CODTIPRECDES').AsString;
               cdsComposicaoLinha.FieldByName('DESCLINHA').AsString    := cdsCompTRD.FieldByName('DESCRICAO').AsString;
               cdsComposicaoLinha.FieldByName('IDFLUXOCAIXA').AsFloat  := cdsLinhaFluxo.FieldByName('IDFLUXOCAIXA').AsFloat;
               cdsComposicaoLinha.FieldByName('CODLINHAFLUXO').AsFloat := cdsLinhaFluxo.FieldByName('CODLINHAFLUXO').AsFloat;

               cdsComposicaoLinha.Post;

               cdsCompTRD.Delete;

               ProximoNo:=tvTiposRD.Selected.GetNextVisible;
               if (ProximoNo<>nil) then tvTiposRD.Selected:=ProximoNo;
               MontaTreeViewTRD;
            end;

      2,3 : begin
               if cdsCompTipDoc.IsEmpty then
                  Exit;

               cdsComposicaoLinha.Append;
               cdsComposicaoLinha.FieldByName('IDPESSOA').AsFloat:=Sistema.IdEmpresa;
               cdsComposicaoLinha.FieldByName('CODTIPDOC').AsString:=
                                  cdsCompTipDoc.FieldByName('CODIGO').AsString;

               cdsComposicaoLinha.FieldByName('RECPAG').AsString:=
                                  cdsCompTipDoc.FieldByName('RECPAG').AsString;

               CdsComposicaoLinha.FieldByName('DESCCODIGO').AsString :=
                                     cdsCompTipDoc.FieldByName('CODIGO').AsString;

               cdsComposicaoLinha.FieldByName('DESCLINHA').AsString:=
                                  cdsCompTipDoc.FieldByName('DESCRICAO').AsString;
               cdsComposicaoLinha.FieldByName('IDFLUXOCAIXA').AsFloat:=
                                  cdsLinhaFluxo.FieldByName('IDFLUXOCAIXA').AsFloat;
               cdsComposicaoLinha.FieldByName('CODLINHAFLUXO').AsFloat:=
                                  cdsLinhaFluxo.FieldByName('CODLINHAFLUXO').AsFloat;

               cdsComposicaoLinha.Post;
               cdsCompTipDoc.Delete;
            end;

        4 : begin
               cdsComposicaoLinha.Append;
               cdsComposicaoLinha.FieldByName('IDPESSOA').AsFloat:=Sistema.IdEmpresa;
               cdsComposicaoLinha.FieldByName('CODCOMPLINHA').AsFloat:=
                                  cdsCompLinhaFlx.FieldByName('CODLINHAFLUXO').AsFloat;
               cdsComposicaoLinha.FieldByName('DESCLINHA').AsString:=
                                  cdsCompLinhaFlx.FieldByName('DESCRICAO').AsString;
               cdsComposicaoLinha.FieldByName('IDFLUXOCAIXA').AsFloat:=
                                  cdsLinhaFluxo.FieldByName('IDFLUXOCAIXA').AsFloat;
               cdsComposicaoLinha.FieldByName('CODLINHAFLUXO').AsFloat:=
                                  cdsLinhaFluxo.FieldByName('CODLINHAFLUXO').AsFloat;
               cdsComposicaoLinha.Post;
               cdsCompLinhaFlx.Delete;
            end;

   end;
   FocaTreeViewRecDes;


end;



procedure TfrmCadMontaFluxoMT.btnExcluirComposicaoClick(Sender: TObject);
begin
   case dbrgTipoCalculo.ItemIndex of

      0,1 : if not(cdsComposicaoLinha.IsEmpty) then
             begin
                cdsCompTRD.Append;
                cdsCompTRD.FieldByName('CODTIPRECDES').AsString:=
                                   cdsComposicaoLinha.FieldByName('CODTIPRECDES').AsString;
                cdsCompTRD.FieldByName('RECPAG').AsString:=
                                   cdsComposicaoLinha.FieldByName('RECPAG').AsString;
                cdsCompTRD.FieldByName('DESCRICAO').AsString:=
                                   cdsComposicaoLinha.FieldByName('DESCLINHA').AsString;
                cdsCompTRD.Post;

                cdsComposicaoLinha.Delete;

                MontaTreeViewTRD;
             end;

      2,3 : begin
               if cdsComposicaoLinha.IsEmpty then Exit;

               cdsCompTipDoc.Append;
               cdsCompTipDoc.FieldByName('CODIGO').AsString:=
                          cdsComposicaoLinha.FieldByName('CODTIPDOC').AsString;
               cdsCompTipDoc.FieldByName('RECPAG').AsString:=
                          cdsComposicaoLinha.FieldByName('RECPAG').AsString;
               cdsCompTipDoc.FieldByName('DESCRICAO').AsString:=
                          cdsComposicaoLinha.FieldByName('DESCLINHA').AsString;
               cdsCompTipDoc.Post;

               cdsComposicaoLinha.Delete;
            end;

        4 : begin
               if cdsComposicaoLinha.IsEmpty then Exit;

               cdsCompLinhaFlx.Append;
               cdsCompLinhaFlx.FieldByName('CODLINHAFLUXO').AsFloat:=
                                  cdsComposicaoLinha.FieldByName('CODCOMPLINHA').AsFloat;
               cdsCompLinhaFlx.FieldByName('DESCRICAO').AsString:=
                                  cdsComposicaoLinha.FieldByName('DESCLINHA').AsString;
               cdsCompLinhaFlx.Post;

               cdsComposicaoLinha.Delete;
            end;
   end;

   FocaTreeViewRecDes;
end;



procedure TfrmCadMontaFluxoMT.dbeDescricaoChange(Sender: TObject);
begin
   if not((cdsFluxoCaixa.State in [dsInsert,dsEdit]) or
          (cdsLinhaFluxo.State in [dsInsert,dsEdit])) then  Exit;
   tvMapaFluxo.Selected.Text:=TwwDBEdit(Sender).Text;
end;



procedure TfrmCadMontaFluxoMT.bbtnConfirmarClick(Sender: TObject);
var
  sDescricao : string;     // edilaine - SOL 136203 / KTN 813205
begin
   inherited;

   //Critica falta de dados
   if (cdsFluxoCaixa.State in [dsInsert,dsEdit]) then
   begin
      if (Trim(dbeDescricaoFluxo.Text)='') then
      begin
         MsgDlg('É obrigatório o preenchimento da Descrição do Fluxo','Erro',mtError,[mbOK],0);
         dbeDescricaoFluxo.SetFocus;
         Exit;
      end;
   end;

   if (cdsLinhaFluxo.State in [dsInsert,dsEdit]) then
   begin
      if (Trim(dbeDescricaoLinhaFluxo.Text)='') then
      begin
         MsgDlg('É obrigatório o preenchimento da Descrição da Linha de Fluxo','Erro',mtError,[mbOK],0);
         PgcMontaFluxo.ActivePageIndex:=1;
         dbeDescricaoLinhaFluxo.SetFocus;
         Exit;
      end;

      if (dbrgTipoCalculo.ItemIndex<5) and (cdsComposicaoLinha.IsEmpty) then
      begin
         MsgDlg('A Composição da Linha de Fluxo não foi informada','Erro',mtError,[mbOK],0);
         PgcMontaFluxo.ActivePageIndex:=2;
         PgcMontaFluxo.OnChange(self);
         Exit;
      end;

      // edilaine - SOL 136203 / KTN 813205 - inicio
      if ((seGrau.Value = 0) or (cdsLinhaFluxo.FieldByName('FLGGRAU').AsString = '')) and (dbrgTipoCalculo.ItemIndex in [0,1,2,3,4]) then
      begin
        MsgDlg('É obrigatório informar o grau.','Erro',mtError,[mbOK],0);
        PgcMontaFluxo.ActivePageIndex:=1;
        PgcMontaFluxo.OnChange(self);
        Exit;
      end
      else if not (dbrgTipoCalculo.ItemIndex in [0,1,2,3,4]) then  // é linha de titulo
        cdsLinhaFluxo.FieldByName('FLGGRAU').AsInteger := 0;

      sDescricao := Trim(cdsLinhaFluxo.FieldByName('DESCRICAO').AsString);
      if ((seGrau.Value = 1) and (not CtrlMontaFluxo.VerificaLinhaSintetica( cdsLinhaFluxo.FieldByName('CODLINHAFLUXO').AsInteger ))) or
         ((seGrau.Value > 1) and (CtrlMontaFluxo.VerificaLinhaSintetica( cdsLinhaFluxo.FieldByName('CODLINHAFLUXO').AsInteger ))) then
      begin
         MsgDlg('É obrigatório informar o Grau = 1 para linhas sintéticas.','Erro',mtError,[mbOK],0);
         PgcMontaFluxo.ActivePageIndex:=1;
         PgcMontaFluxo.OnChange(self);
         Exit;
      end;
      // edilaine - SOL 136203 / KTN 813205 - fim

   end;

   if (cdsFluxoCaixa.State in [dsInsert,dsEdit]) then cdsFluxoCaixa.Post;
   if (cdsLinhaFluxo.State in [dsInsert,dsEdit]) then cdsLinhaFluxo.Post;

   if PgcMontaFluxo.ActivePage = tbsDetCompFluxo then
   begin
      // Tipo de recebimento, desembolso
      if (Pos(TDadosNo(tvMapaFluxo.Selected.Data).sTipoLinha,'CR CP')<>0) then
      begin
         // Se o usuário estiver informando a dispersão para a linha e esta já
         //existir na base, atualiza a mesma
         if CdsComposicaoLinha.Locate('CODTIPRECDES',TDadosNo(tvMapaFluxo.Selected.Data).sCodTipRecDes,[]) then
         begin
            cdsComposicaoLinha.Edit;
            if chkCompFluxoBaseDisp.Checked then
               cdsComposicaoLinha.FieldByName('FLGDISPBASE').AsString := 'S'
            else
               cdsComposicaoLinha.FieldByName('FLGDISPBASE').AsString := 'N';
            cdsComposicaoLinha.Post;
         end
         else
         // Se não existir, cria a mesma com o flg marcado
         begin
            // Só cria o registro se o flg estiver marcado
            if chkCompFluxoBaseDisp.Checked then
            begin
               CdsComposicaoLinha.Append;
               cdsComposicaoLinha.FieldByName('CODLINHAFLUXO').AsFloat := TDadosNo(tvMapaFluxo.Selected.Data).rCodLinhaFluxo;
               cdsComposicaoLinha.FieldByName('CODTIPRECDES').AsString := TDadosNo(tvMapaFluxo.Selected.Data).sCodTipRecDes;
               cdsComposicaoLinha.FieldByName('RECPAG').AsString       := TDadosNo(tvMapaFluxo.Selected.Data).sTipoLinha[2];
               cdsComposicaoLinha.FieldByName('IDPESSOA').AsInteger    := Sistema.IdEmpresa;
               cdsComposicaoLinha.FieldByName('CODCOMPLINHA').AsFloat  := TDadosNo(tvMapaFluxo.Selected.Data).rCodLinhaFluxo;
               cdsComposicaoLinha.FieldByName('IDFLUXOCAIXA').AsFloat  := TDadosNo(tvMapaFluxo.Selected.Data).rIDFluxoCaixa;
               cdsComposicaoLinha.FieldByName('FLGDISPBASE').AsString  := 'S';
               cdsComposicaoLinha.Post;
            end;
         end;
      end;
      tvMapaFluxo.Enabled     := true;
      tbsDetCompFluxo.Enabled := false;
      bbtnConfirmar.Enabled   := false;
      bbtnCancelar.Enabled    := false;
   end;

   
   //Aplica inclusões/alterações
   if not(CtrlMontaFluxo.IncluiAlteraFluxo) then
      MsgDlg(CtrlMontaFluxo.MessageInfo,'Erro',mtError,[mbOK],0)
   else
   begin
      cdsFluxoCaixa.EmptyDataSet;
      cdsLinhaFluxo.EmptyDataSet;
      cdsComposicaoLinha.EmptyDataSet;

      MontaArvoreMapaFluxo(tvMapaFluxo.Selected);
      tvMapaFluxo.SetFocus;
   end;
end;




procedure TfrmCadMontaFluxoMT.bbtnCancelarClick(Sender: TObject);
var
   NoAux: TfcTreeNode;
begin
   if (cdsFluxoCaixa.State in [dsInsert,dsEdit]) then
   begin
      if (cdsFluxoCaixa.State in [dsInsert]) then
      begin
         cdsFluxoCaixa.Cancel;
         NoAux:=tvMapaFluxo.Selected.GetPrevVisible;
         tvMapaFluxo.Selected.Delete;
         tvMapaFluxo.SetFocus;
         NoAux.Selected:=True;
         tvMapaFluxoMouseDown(tvMapaFluxo,NoAux,mbLeft,[],0,0);
      end
      else
         cdsFluxoCaixa.Cancel;

      CarregaCds(tvMapaFluxo.Selected);
      CarregaCdsAux(tvMapaFluxo.Selected);
   end;

   if (cdsLinhaFluxo.State in [dsInsert,dsEdit]) then
   begin
      if (cdsLinhaFluxo.State in [dsInsert]) then
      begin
         cdsLinhaFluxo.Cancel;
         NoAux:=tvMapaFluxo.Selected.GetPrevVisible;
         tvMapaFluxo.Selected.Delete;
         tvMapaFluxo.SetFocus;
         NoAux.Selected:=True;
         tvMapaFluxoMouseDown(tvMapaFluxo,NoAux,mbLeft,[],0,0);
      end
      else
      begin
         cdsLinhaFluxo.Cancel;
         cdsComposicaoLinha.EmptyDataSet;
      end;
      CarregaCds(tvMapaFluxo.Selected);
      CarregaCdsAux(tvMapaFluxo.Selected);
   end;

   if PgcMontaFluxo.ActivePage = tbsDetCompFluxo then
   begin
      tvMapaFluxo.Enabled     := true;
      tbsDetCompFluxo.Enabled := false;
      bbtnConfirmar.Enabled   := false;
      bbtnCancelar.Enabled    := false;
   end;
end;

//==============================================================================
// Funções e Procedures de Montagem e Manutenção do cadastro
//==============================================================================


procedure TfrmCadMontaFluxoMT.MontaArvoreMapaFluxo(NoCorrente: TfcTreeNode);
var
   NoInicial         : TfcTreeNode;
   NoFluxo           : TfcTreeNode;
   NoPai             : TfcTreeNode;
   NoCorrenteAux     : TfcTreeNode;
   NoLinhaFluxo      : TfcTreeNode;
   iNumObj           : Integer;
   iNumTotObj        : Integer;
   rFluxoCorrente    : Double;
   rLinhaCorrente    : Double;
   sMascara          : String;
   cdsMapaFluxo      : TCMClientDataSet;

   rFluxoAux         : Double;
   sDescAux          : String;
   sTipoLinhaAux     : String;


   function VerificaNo(No: TfcTreeNode): Boolean;
   begin
      Result:=((rIDFluxoCaixaAux=0) or
               (TDadosNo(No.Data).rIDFluxoCaixa=rFluxoAux)) and
              (TDadosNo(No.Data).sTipoLinha=sTipoLinhaAux) and
              (No.Text=sDescAux);
   end;

begin
   if (NoCorrente<>nil) then
   begin
      rFluxoAux:=TDadosNo(NoCorrente.Data).rIDFluxoCaixa;
      sDescAux:=NoCorrente.Text;
      sTipoLinhaAux:=TDadosNo(NoCorrente.Data).sTipoLinha;
   end;

   NoCorrenteAux:=nil;
   bMontandoMapa:=True;
   cdsMapaFluxo:=TCMClientDataSet.Create(nil);
   try
      //Carrega Cds do Mapa do Fluxo
      cdsMapaFluxo.Data:=CtrlMontaFluxo.ListMapaFluxo;

      //Exclui os nós e
      //Destrói objetos relacionados a cada linha do TreeView
      if (tvMapaFluxo.Items.Count>0) then ExcluiNo(tvMapaFluxo.Items[0]);

      //Cria nó Inicial
      NoInicial:=tvMapaFluxo.Items.AddObject(nil,Sistema.NomeEmpresa,TDadosNo.Create);
      NoInicial.ImageIndex:=7;
      NoInicial.SelectedIndex:=7;

      //Carregar parâmetros do Nó (Empresa)
      TDadosNo(NoInicial.Data).sTipoLinha:='E';
      TDadosNo(NoInicial.Data).rIDFluxoCaixa:=0;
      TDadosNo(NoInicial.Data).rCodLinhaFluxo:=0;

      rFluxoCorrente:=0;
      rLinhaCorrente:=0;
      cdsMapaFluxo.First;
      while not(cdsMapaFluxo.Eof) do
      begin
         //---------------------------------------------------------------------
         //Cria nó de novo Fluxo
         //---------------------------------------------------------------------
         if (rFluxoCorrente<>cdsMapaFluxo.FieldByName('IDFLUXOCAIXA').AsFloat) then
         begin
            NoFluxo:=tvMapaFluxo.Items.AddChildObject(NoInicial,
                                 cdsMapaFluxo.FieldByName('NOMEFLUXO').AsString,
                                 TDadosNo.Create);

            //Carregar parâmetros do Nó (Fluxo de Caixa)
            TDadosNo(NoFluxo.Data).sTipoLinha:='F';
            TDadosNo(NoFluxo.Data).rIDFluxoCaixa:=cdsMapaFluxo.FieldByName('IDFLUXOCAIXA').AsFloat;

            rFluxoCorrente:=cdsMapaFluxo.FieldByName('IDFLUXOCAIXA').AsFloat;

            NoFluxo.ImageIndex:=8;
            NoFluxo.SelectedIndex:=8;

            if (NoCorrente<>nil) and (VerificaNo(NoFluxo)) then NoCorrenteAux:=NoFluxo;
         end;

         //---------------------------------------------------------------------
         //Cria nó de nova Linha de Fluxo
         //---------------------------------------------------------------------
         if (rLinhaCorrente<>cdsMapaFluxo.FieldByName('CODLINHAFLUXO').AsFloat) and
            (Pos(cdsMapaFluxo.FieldByName('TIPOCALCULO').AsString,'R P C D T L')<>0) then
         begin
            NoLinhaFluxo:=tvMapaFluxo.Items.AddChildObject(NoFluxo,
                                      cdsMapaFluxo.FieldByName('LINHAFLUXO').AsString,
                                      TDadosNo.Create);

            //Carregar parâmetros do Nó (Linha de Fluxo)
            TDadosNo(NoLinhaFluxo.Data).sTipoLinha:='L'+cdsMapaFluxo.FieldByName('TIPOCALCULO').AsString;
            TDadosNo(NoLinhaFluxo.Data).rIDFluxoCaixa:=cdsMapaFluxo.FieldByName('IDFLUXOCAIXA').AsFloat;
            TDadosNo(NoLinhaFluxo.Data).rCodLinhaFluxo:=cdsMapaFluxo.FieldByName('CODLINHAFLUXO').AsFloat;

            TDadosNo(NoLinhaFluxo.Data).iNivel := cdsMapaFluxo.FieldByName('NIVEL').AsInteger;   // edilaine - SOL 136203 / KTN 813205

            //Associa nó pai
            NoPai:=NoLinhaFluxo;

            //Associa parâmetros do nó
            rLinhaCorrente:=cdsMapaFluxo.FieldByName('CODLINHAFLUXO').AsFloat;

            //Associa ícone
            case (cdsMapaFluxo.FieldByName('TIPOCALCULO').AsString[1]) of

               'L': begin
                       NoLinhaFluxo.ImageIndex:=13;
                       NoLinhaFluxo.SelectedIndex:=13;
                    end;

               'T': begin
                       NoLinhaFluxo.ImageIndex:=14;
                       NoLinhaFluxo.SelectedIndex:=14;
                    end;

               'R',
               'P': begin
                       sMascara:=sMascaraCAR+';0; ';
                       NoLinhaFluxo.ImageIndex:=9;
                       NoLinhaFluxo.SelectedIndex:=9;
                       if (cdsMapaFluxo.FieldByName('TIPOCALCULO').AsString='P') then
                       begin
                          sMascara:=sMascaraCAP+';0; ';
                          NoLinhaFluxo.ImageIndex:=10;
                          NoLinhaFluxo.SelectedIndex:=10;
                       end;
                    end;

               'C',
               'D': begin
                       NoLinhaFluxo.ImageIndex:=11;
                       NoLinhaFluxo.SelectedIndex:=11;
                       if (cdsMapaFluxo.FieldByName('TIPOCALCULO').AsString='D') then
                       begin
                          NoLinhaFluxo.ImageIndex:=12;
                          NoLinhaFluxo.SelectedIndex:=12;
                       end;
                    end;
            end;

            if (NoCorrente<>nil) and (VerificaNo(NoLinhaFluxo)) then NoCorrenteAux:=NoLinhaFluxo;
         end;

         //---------------------------------------------------------------------
         //Cria nós de composição da linha do fluxo
         //---------------------------------------------------------------------
         if (Pos(cdsMapaFluxo.FieldByName('TIPOCALCULO').AsString,'R P C D L')<>0) then
         begin
            //Adiciona Linha
            case (cdsMapaFluxo.FieldByName('TIPOCALCULO').AsString[1]) of
               'R',
               'P': begin
                       //Posiciona no nó pai correto
                       if NoPai<>NoLinhaFluxo then
                          while (Trim(Copy(cdsMapaFluxo.FieldByName('CODTIPRECDES').AsString,1,
                                           Length(Trim(TDadosNo(NoPai.Data).sCodTipRecDes)))) <>
                                 Trim(TDadosNo(NoPai.Data).sCodTipRecDes)) and (NoPai<>NoLinhaFluxo) do
                             NoPai:=NoPai.Parent;

                       NoPai:=tvMapaFluxo.Items.AddChildObject(NoPai,
                                          FormatMaskText(sMascara,
                                          Trim(cdsMapaFluxo.FieldByName('CODTIPRECDES').AsString))
                                          +' - '+cdsMapaFluxo.FieldByName('TIPORECDES').AsString,
                                          TDadosNo.Create);
                    end;

               'C',
               'D': begin
                       NoPai:=tvMapaFluxo.Items.AddChildObject(NoPai,
                              FormatFloat('#####',cdsMapaFluxo.FieldByName('CODTIPDOC').AsFloat)+
                              ' - '+cdsMapaFluxo.FieldByName('TIPODOC').AsString, TDadosNo.Create);
                    end;

               'L': begin
                       NoPai:=tvMapaFluxo.Items.AddChildObject(NoPai,
                                                cdsMapaFluxo.FieldByName('TIPORECDES').AsString,
                                                TDadosNo.Create);
                       //Associa ícone
                       case cdsMapaFluxo.FieldByName('RECPAG').AsString[1] of
                          'R': begin
                                  NoPai.ImageIndex:=9;
                                  NoPai.SelectedIndex:=9;
                               end;
                          'P': begin
                                  NoPai.ImageIndex:=10;
                                  NoPai.SelectedIndex:=10;
                               end;
                          'C': begin
                                  NoPai.ImageIndex:=11;
                                  NoPai.SelectedIndex:=11;
                               end;
                          'D': begin
                                  NoPai.ImageIndex:=12;
                                  NoPai.SelectedIndex:=12;
                               end;
                          'L': begin
                                  NoPai.ImageIndex:=13;
                                  NoPai.SelectedIndex:=13;
                               end;
                       end;
                    end;
            end;

            //Carregar parâmetros do Nó
            TDadosNo(NoPai.Data).sTipoLinha     := 'C'+cdsMapaFluxo.FieldByName('TIPOCALCULO').AsString;
            TDadosNo(NoPai.Data).sCodTipRecDes  := cdsMapaFluxo.FieldByName('CODTIPRECDES').AsString;
            TDadosNo(NoPai.Data).rIDFluxoCaixa  := cdsMapaFluxo.FieldByName('IDFLUXOCAIXA').AsFloat;
            TDadosNo(NoPai.Data).rCodLinhaFluxo := cdsMapaFluxo.FieldByName('CODLINHAFLUXO').AsFloat;
            TDadosNo(NoPai.Data).rCodTipDoc     := cdsMapaFluxo.FieldByName('CODTIPDOC').AsFloat;

            TDadosNo(NoPai.Data).sFlgAnaSint := cdsMapaFluxo.FieldByName('ANASINT').AsString;

            TDadosNo(NoLinhaFluxo.Data).iNivel := cdsMapaFluxo.FieldByName('NIVEL').AsInteger;   // edilaine - SOL 136203 / KTN 813205

            if (NoPai.Parent<>NoLinhaFluxo) then TDadosNo(NoPai.Data).sSubComposicao:='S';

            //Associa ícone
            if (cdsMapaFluxo.FieldByName('TIPOCALCULO').AsString<>'L') then
            begin
               NoPai.ImageIndex:=-1;
               NoPai.SelectedIndex:=-1;
            end;

            //Reatribui valor ao nó pai
            if (cdsMapaFluxo.FieldByName('TIPOCALCULO').AsString='C') or
               (cdsMapaFluxo.FieldByName('TIPOCALCULO').AsString='D') or
               (cdsMapaFluxo.FieldByName('TIPOCALCULO').AsString='L') then NoPai:=NoLinhaFluxo;
         end;

         cdsMapaFluxo.Next;
      end;
   finally
      cdsMapaFluxo.Free;
      bMontandoMapa:=False;
   end;

   //Posiciona no corrente
   if (NoCorrenteAux=nil) then
      tvMapaFluxo.Selected:=NoInicial
   else
      tvMapaFluxo.Selected:=NoCorrenteAux;

   tvMapaFluxoMouseDown(tvMapaFluxo,tvMapaFluxo.Selected,mbLeft,[],0,0);
end;




procedure TfrmCadMontaFluxoMT.MontaTreeViewTRD;
var
   Grupo          : array [1..50] of TfcTreeNode;
   sRadical       : array [1..50] of String;
   iNo            : Integer;
   bMesmoGrupo    : Boolean;
   bInicio        : Boolean;
   PTipoRD        : PTRD;
   sMascara       : String;
begin
   cdsCompTRD.DisableControls;
   try
      tvTiposRD.Items.Clear;
      if cdsCompTRD.IsEmpty then Exit;

      //Formata o Tipo de R/D
      if cdsCompTRD.FieldByName('RECPAG').AsString='R' then
         sMascara:=Trim(sMascaraCAR)+';0; '
      else
         sMascara:=Trim(sMascaraCAP)+';0; ';

      bInicio:=True;
      cdsCompTRD.First;
      iNo:=0;
      while not(cdsCompTRD.Eof) do
      begin
         //Exibe Primeiro Registro
         if bInicio then
         begin
            iNo:=1;
            sRadical[iNo]:=Trim(cdsCompTRD.FieldByName('CODTIPRECDES').AsString);
            New(PTipoRD);
            PTipoRD^.sTipoRD:=cdsCompTRD.FieldByName('CODTIPRECDES').AsString;
            Grupo[iNo]:=tvTiposRD.Items.AddObject(nil,
                        FormatMaskText(sMascara,
                                       Trim(cdsCompTRD.FieldByName('CODTIPRECDES').AsString))+
                                       ' - '+cdsCompTRD.FieldByName('DESCRICAO').AsString,PTipoRD);
            cdsCompTRD.Next;
            if (cdsCompTRD.Eof) then Break;
            bInicio:=False;
         end;


         //Testa se o Registro Corrente faz parte da mesma família do TRD anterior
         if Pos(sRadical[iNo],Trim(cdsCompTRD.FieldByName('CODTIPRECDES').AsString))=1 then
         begin
            Inc(iNo);
            sRadical[iNo]:=Trim(cdsCompTRD.FieldByName('CODTIPRECDES').AsString);

            New(PTipoRD);
            PTipoRD^.sTipoRD:=cdsCompTRD.FieldByName('CODTIPRECDES').AsString;
            Grupo[iNo]:=tvTiposRD.Items.AddChildObject(Grupo[iNo-1],
                        FormatMaskText(sMascara,
                                       Trim(cdsCompTRD.FieldByName('CODTIPRECDES').AsString))+' - '+
                                       cdsCompTRD.FieldByName('DESCRICAO').AsString,PTipoRD);
         end
         else
         begin
            //Testa se o Registro faz parte de alguma família de TRDs anteriores
            bMesmoGrupo:=False;
            while not(bMesmoGrupo) do
            begin
               Dec(iNo);
               if (iNo<1) then  //Caso não faça parte de nenhuma família inicia a sua própria
               begin
                  iNo:=1;
                  bMesmoGrupo:=True;
                  sRadical[iNo]:=Trim(cdsCompTRD.FieldByName('CODTIPRECDES').AsString);

                  New(PTipoRD);
                  PTipoRD^.sTipoRD:=cdsCompTRD.FieldByName('CODTIPRECDES').AsString;
                  Grupo[iNo]:=tvTiposRD.Items.AddObject(nil,
                              FormatMaskText(sMascara,
                              Trim(cdsCompTRD.FieldByName('CODTIPRECDES').AsString))+' - '+
                              cdsCompTRD.FieldByName('DESCRICAO').AsString,PTipoRD);
               end
               else
                  if Pos(sRadical[iNo],Trim(cdsCompTRD.FieldByName('CODTIPRECDES').AsString))=1 then
                  begin
                     bMesmoGrupo:=True;
                     Inc(iNo);
                     sRadical[iNo]:=Trim(cdsCompTRD.FieldByName('CODTIPRECDES').AsString);

                     New(PTipoRD);
                     PTipoRD^.sTipoRD:=cdsCompTRD.FieldByName('CODTIPRECDES').AsString;
                     Grupo[iNo]:=tvTiposRD.Items.AddChildObject(Grupo[iNo-1],
                                 FormatMaskText(sMascara,
                                 Trim(cdsCompTRD.FieldByName('CODTIPRECDES').AsString))+' - '+
                                 cdsCompTRD.FieldByName('DESCRICAO').AsString,PTipoRD);
                  end;
            end;
         end;

         cdsCompTRD.Next;
      end;
   finally
      tvTiposRD.FullExpand;
      tvTiposRD.FullCollapse;
      cdsCompTRD.EnableControls;
   end;
end;




procedure TfrmCadMontaFluxoMT.ExcluiNo(No: TfcTreeNode);
var
   NoAux: TfcTreeNode;
begin
   //Exclui sub-nós
   while (No.Count<>0) do
   begin
      NoAux:=No.GetLastChild;
      if (NoAux.Count>0) then
         ExcluiNo(NoAux)
      else
      begin
         //Exclui nó e objeto associado
         TDadosNo(NoAux.Data).Free;
         NoAux.Delete;
      end;
   end;

   //Exclui nó e objeto associado
   TDadosNo(No.Data).Free;
   No.Delete;
end;



procedure TfrmCadMontaFluxoMT.ExcluiRegistros;
begin
   //Exclui Fluxo
   if (TDadosNo(tvMapaFluxo.Selected.Data).sTipoLinha='F') then
   begin
      //Exclui Fluxo
      cdsFluxoCaixa.Delete;

      //Exclui Linhas do Fluxo
      while not(cdsLinhaFluxo.IsEmpty) do
      begin
         cdsLinhaFluxo.First;
         cdsLinhaFluxo.Delete;
      end;

      //Exclui composição da Linha
      while not(cdsComposicaoLinha.IsEmpty) do
      begin
         cdsCompLinhaFlx.First;
         cdsComposicaoLinha.Delete;
      end;
   end;

   //Exclui Linha do Fluxo
   if (Pos(TDadosNo(tvMapaFluxo.Selected.Data).sTipoLinha,'LR LP LC LD LL LT')<>0) then
   begin
      //Exclui linha
      cdsLinhaFluxo.Delete;

      //Exclui composição da Linha
      while not(cdsComposicaoLinha.IsEmpty) do
      begin
         cdsComposicaoLinha.First;
         cdsComposicaoLinha.Delete;
      end;
   end;
end;




procedure TfrmCadMontaFluxoMT.CarregaCds(No: TfcTreeNode);
begin
   CarregaCds(TDadosNo(No.Data).rIDFluxoCaixa,TDadosNo(No.Data).rCodLinhaFluxo);
end;



procedure TfrmCadMontaFluxoMT.CarregaCds(rIDFluxoCaixa, rCodlinhaFluxo: Double);
begin
   //Abre cds de Fluxos de Caixa
   cdsFluxoCaixa.Data:=CtrlMontaFluxo.ListFluxoCaixa(rIDFluxoCaixa);

   //Abre cds de Linhas de Fluxo
   cdsLinhaFluxo.Data:=CtrlMontaFluxo.ListMontaFluxo(rIDFluxoCaixa,rCodlinhaFluxo,False);

   //Abre cds de Composição das Linhas de Fluxo
   cdsComposicaoLinha.Data:=CtrlMontaFluxo.ListCompFluxo(rIDFluxoCaixa,rCodlinhaFluxo);

   CdsComposicaoLinhaAux.Data := CtrlMontaFluxo.ListaCompLinhaFluxo(Sistema.IdEmpresa,trunc(rIDFluxoCaixa),trunc(rCodlinhaFluxo));
end;




procedure TfrmCadMontaFluxoMT.CarregaCdsAux(No: TfcTreeNode);
var
   sTipoCalculoAux : String;
   rIDFluxoCaixa   : Double;
   rCodLinhaFluxo  : Double;
begin
   sTipoCalculoAux:=TDadosNo(No.Data).sTipoLinha;
   rIDFluxoCaixa:=TDadosNo(No.Data).rIDFluxoCaixa;
   rCodLinhaFluxo:=TDadosNo(No.Data).rCodLinhaFluxo;

   if (Length(sTipoCalculoAux)=2) then sTipoCalculoAux:=Copy(sTipoCalculoAux,2,1);

   CarregaCdsAux(rIDFluxoCaixa,rCodLinhaFluxo,sTipoCalculoAux);
end;




procedure TfrmCadMontaFluxoMT.CarregaCdsAux(rIDFluxoCaixa, rCodLinhaFluxo: Double;
                                            sTipoCalculo: String);
begin
   cdsCompTRD.EmptyDataSet;
   cdsCompTipDoc.EmptyDataSet;
   cdsCompLinhaFlx.EmptyDataSet;

   //Carrega cdsTiposRD
   if (sTipoCalculo='R') or (sTipoCalculo='P') then
   begin
      cdsCompTRD.Data:=CtrlListTerceiros.ListTipoRDFaltantesFluxo(Sistema.IdEmpresa,
                                                                  False,Trunc(rIDFluxoCaixa),
                                                                  true, true);  // edilaine - SOL 136203 / KTN 813205
      tvTiposRD.Visible:=False;
      try
         case sTipoCalculo[1] of
           'R': begin
                   //Filtra os Tipos de Recebimento Possíveis
                   cdsCompTRD.Filtered:=False;
                   cdsCompTRD.Filter:='RECPAG = ''R''';
                   cdsCompTRD.Filtered:=True;
                end;
           'P': begin
                   //Filtra os Tipos de Desembolso Possíveis
                   cdsCompTRD.Filtered:=False;
                   cdsCompTRD.Filter:='RECPAG = ''P''';
                   cdsCompTRD.Filtered:=True;
                end;
         end;
         MontaTreeViewTRD;
      finally
         tvTiposRD.Visible:=True;
      end;
   end;

   //Carrega cdsTiposDocumento
   if (sTipoCalculo='C') or (sTipoCalculo='D') then
   begin
      cdsCompTipDoc.Data:=CtrlListTerceiros.ListTipDocFaltantesFluxo(Sistema.IdEmpresa,Trunc(rIDFluxoCaixa));
      case sTipoCalculo[1] of
        'C': begin
                //Filtra os Tipos de Documento de Recebimento Possíveis
                cdsCompTipDoc.Filtered:=False;
                cdsCompTipDoc.Filter:='RECPAG = ''R''';
                cdsCompTipDoc.Filtered:=True;
             end;
        'D': begin
                //Filtra os Tipos de Documento de Desembolso Possíveis
                cdsCompTipDoc.Filtered:=False;
                cdsCompTipDoc.Filter:='RECPAG = ''P''';
                cdsCompTipDoc.Filtered:=True;
             end;
      end;
   end;

   //Carrega cdsLinhasFluxo
   if (sTipoCalculo='L') then
      cdsCompLinhaFlx.Data:=CtrlMontaFluxo.ListMontaFluxo(rIDFluxoCaixa,rCodLinhaFluxo,True);
end;



//------------------------------------------------------------------------------
//Eventos dos cds´s
//------------------------------------------------------------------------------

procedure TfrmCadMontaFluxoMT.dsFluxoCaixaStateChange(Sender: TObject);
begin
   if not(cdsFluxoCaixa.Active) then Exit;

   //Habilita/Desabilita Tabs
   tbsFluxoCaixa.Enabled:=(cdsFluxoCaixa.State in [dsInsert,dsEdit]);
   tbsLinhaFluxo.Enabled:=False;
   tbsComposicaoLinhaFluxo.Enabled:=False;

   //Carrega campos do cdsFluxoCaixa (Inclusão)
   if (cdsFluxoCaixa.State in [dsInsert]) then
   begin
      //Esconde/Exibe Tabs
      tbsComposicaoLinhaFluxo.TabVisible:=False;
      tbsLinhaFluxo.TabVisible:=False;
      tbsFluxoCaixa.TabVisible:=True;

      //Posiciona Cursor
      PgcMontaFluxo.ActivePage:=tbsFluxoCaixa;
      dbeDescricaoFluxo.SetFocus;

      //Carrega campos
      cdsFluxoCaixa.FieldByName('IDPESSOA').AsFloat:=Sistema.IdEmpresa;
      cdsFluxoCaixa.FieldByName('DESCRICAO').AsString:=sNovoFluxo;

      //Atribui parâmetro de nó
      TDadosNo(tvMapaFluxo.Selected.Data).sTipoLinha:='F';
   end;

   //Habilita/Desabilita Treeview de Mapa
   tvMapaFluxo.Enabled:=not(cdsFluxoCaixa.State in [dsInsert,dsEdit]);

   //Habilita/Desabilita Botões
   bbtnConfirmar.Enabled:=(cdsFluxoCaixa.State in [dsInsert,dsEdit]);
   bbtnCancelar.Enabled:=(cdsFluxoCaixa.State in [dsInsert,dsEdit]);
end;



procedure TfrmCadMontaFluxoMT.dsLinhaFluxoStateChange(Sender: TObject);
begin
   if not(cdsLinhaFluxo.Active) then Exit;

   //Habilita/Desabilita Tabs
   tbsFluxoCaixa.Enabled:=False;
   tbsLinhaFluxo.Enabled:=(cdsLinhaFluxo.State in [dsInsert,dsEdit]);
   tbsComposicaoLinhaFluxo.Enabled:=(cdsLinhaFluxo.State in [dsInsert,dsEdit]);

   //Carrega campos do cdsLinhaFluxo
   if (cdsLinhaFluxo.State in [dsInsert]) then
   begin
      //Esconde/Exibe Tabs
      tbsComposicaoLinhaFluxo.TabVisible:=False;
      tbsLinhaFluxo.TabVisible:=False;
      tbsFluxoCaixa.TabVisible:=False;
      tbsLinhaFluxo.TabVisible:=True;
      tbsComposicaoLinhaFluxo.TabVisible:=True;

      //Posiciona cursor
      PgcMontaFluxo.ActivePage:=tbsLinhaFluxo;
      dbeDescricaoLinhaFluxo.SetFocus;

      //Carrega campos
      cdsLinhaFluxo.FieldByName('IDFLUXOCAIXA').AsFloat:=
                    TDadosNo(tvMapaFluxo.Selected.Data).rIDFluxoCaixa;
      cdsLinhaFluxo.FieldByName('CODLINHAFLUXO').AsFloat:=0;
      cdsLinhaFluxo.FieldByName('IDPESSOA').AsFloat:=Sistema.IdEmpresa;
      cdsLinhaFluxo.FieldByName('DESCRICAO').AsString:=sNovaLinhaFluxo;
      cdsLinhaFluxo.FieldByName('TIPOCALCULO').AsString:='R';
      cdsLinhaFluxo.FieldByName('POSICAOTOTAL').AsString:='I';
      cdsLinhaFluxo.FieldByName('FLGACUMULA').AsString:='N';

      //Atribui parâmetro de nó
      TDadosNo(tvMapaFluxo.Selected.Data).sTipoLinha:='LR';

      //Carrega cds's auxiliares
      dbrgTipoCalculoClick(nil);
   end;

   //Habilita/Desabilita Treeview de Mapa
   tvMapaFluxo.Enabled:=not(cdsLinhaFluxo.State in [dsInsert,dsEdit]);

   //Habilita/Desabilita Botões
   bbtnConfirmar.Enabled:=(cdsLinhaFluxo.State in [dsInsert,dsEdit]);
   bbtnCancelar.Enabled:=(cdsLinhaFluxo.State in [dsInsert,dsEdit]);

   //Habilita/Desabilita controles
   dbrgTipoCalculo.Enabled:=((cdsLinhaFluxo.State in [dsInsert,dsEdit]) and
                             (cdsComposicaoLinha.RecordCount=0)) or
                            (cdsLinhaFluxo.FieldByName('TIPOCALCULO').AsString='T');
end;




procedure TfrmCadMontaFluxoMT.dsComposicaoLinhaDataChange(Sender: TObject; Field: TField);
begin
   //Habilita/Desabilita controles
   dbrgTipoCalculo.Enabled:=((cdsLinhaFluxo.State in [dsInsert,dsEdit]) and
                             (cdsComposicaoLinha.RecordCount=0)) or
                            (cdsLinhaFluxo.FieldByName('TIPOCALCULO').AsString='T');
   btnExcluirComposicao.Enabled:=(cdsComposicaoLinha.RecordCount>0);

   //Posiciona no Registro inicial
   if (not(btnExcluirComposicao.Enabled) and (Self.Visible) and not (cdsComposicaoLinha.State in [dsInsert, dsEdit])) then
   begin
      if (tvTiposRD.Focused) then tvTiposRD.SetFocus;
      if (dbgTiposDocumento.Focused) then dbgTiposDocumento.SetFocus;
      if (dbgLinhas.Focused) then dbgLinhas.SetFocus;

      cdsCompTRD.First;
      cdsCompTipDoc.First;
      cdsCompLinhaFlx.First;
   end;
end;




procedure TfrmCadMontaFluxoMT.FocaTreeViewRecDes;
begin
   if PgcMontaFluxo.ActivePageIndex = 2 then
   begin
      if dbrgTipoCalculo.ItemIndex in [0,1] then
      begin
         tvTiposRD.SetFocus;
         tvTiposRD.Items.GetFirstNode.Selected := true;
         tvTiposRD.SetFocus;
      end;
   end;
end;




procedure TfrmCadMontaFluxoMT.PgcMontaFluxoChange(Sender: TObject);
begin
  inherited;

  case dbrgTipoCalculo.ItemIndex of
     0,1: begin
             if not CtrlMontaFluxo.ValidaTipoCalculo(cdsLinhaFluxo.FieldByName('IDFLUXOCAIXA').AsInteger,'''C'',''D''') then
             begin
                MsgDlg('Não será possível utilizar este tipo de cálculo, pois ' +
                       'já existe um linha de Tipo de Documento Receber/Pagar para este fluxo','Aviso',mtWarning,[mbOK],0);
                dbrgTipoCalculo.ItemIndex     := 5;
                PgcMontaFluxo.ActivePageIndex := 1;
             end;
          end;

     2,3: begin
             if not CtrlMontaFluxo.ValidaTipoCalculo(cdsLinhaFluxo.FieldByName('IDFLUXOCAIXA').AsInteger,'''R'',''P''') then
             begin
                MsgDlg('Não será possível utilizar este tipo de cálculo, pois ' +
                       'já existe um linha de Tipo de Recebimento/Desembolso para este fluxo','Aviso',mtWarning,[mbOK],0);
                dbrgTipoCalculo.ItemIndex     := 5;
                PgcMontaFluxo.ActivePageIndex := 1;
             end;
          end;
  end;
end;



end.
