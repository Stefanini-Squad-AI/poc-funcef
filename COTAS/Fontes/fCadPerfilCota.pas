//******************************************************************************
// Data      : 12/02/2007
// Código    : AL_1
// Pendencia : 24831
//******************************************************************************

unit fCadPerfilCota;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, ComCtrls, StdCtrls, Mask, wwdbedit, MontaSelect, Db,
  DBClient, uCMClientDataSet, CmEventosCadastro, ImgList, Wwdatsrc,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97Ctls, TB97,
  ExtCtrls, uCtrlPerfilCota, uCmSqlParams, Menus, uMensErro, uCtrlCarteiraSPC,
  dBaseDados, FProgresso, FProgressoDuplo, uVerificaPreenchimento, uSistema, DBCtrls,
  uCtrlGeral, uctrlsegregacao, uCMTypes, Grids, DBGrids, TREdit;

type
  TItem = record
     IDAtivoCota       : Integer;
     IDNoPerfilCota    : Integer;
     IdNoPerfilXAtivo  : Integer;
     IdCarteiraSPC     : Integer;
     NoPerfil          : TTreeNode;
     NoAtivo           : TTreeNode;
     CodHierarquico    : String;
     sDescAtivo        : String;
  end;
  pItem = ^TItem;

  TfrmCadPerfilCota = class(TFrmCadastroMT)
    Panel1          : TPanel;
    Label1          : TLabel;
    EditDescricaoPerfil: TwwDBEdit;
    PnlSelecao      : TPanel;
    pnlPortfolio    : TPanel;
    trvAtivo        : TTreeView;
    pnlTipoInvestimento: TPanel;
    pnlBotoes       : TPanel;
    btnPassaUm      : TToolbarButton97;
    btnVoltaUm      : TToolbarButton97;
    btnPassaTodos   : TToolbarButton97;
    btnVoltaTodos   : TToolbarButton97;
    imgTreeView     : TImageList;
    cdsEmprestimo   : TCMClientDataSet;
    CdsRFRV         : TCMClientDataSet;
    cdsFundosRFRV   : TCMClientDataSet;
    cdsImobiliario  : TCMClientDataSet;
    mnuPerfil       : TPopupMenu;
    mnuIncluirItem  : TMenuItem;
    mnuAlterar      : TMenuItem;
    mnuExcluir      : TMenuItem;
    trvPerfil       : TTreeView;
    mnuIncluirPasta : TMenuItem;
    CdsPerfilSPC    : TCMClientDataSet;
    cdsCotas        : TCMClientDataSet;
    grpPerfilAtivo  : TDBRadioGroup;
    CdsNoPerfilCota : TCMClientDataSet;
    CdsNoPerfilXAtivo: TCMClientDataSet;
    Panel3: TPanel;
    Panel2: TPanel;
    Panel4: TPanel;
    procedure mnuIncluirItemClick(Sender: TObject);
    procedure mnuAlterarClick(Sender: TObject);
    procedure mnuIncluirPastaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure grpPerfilAtivoClick(Sender: TObject);
    procedure mnuPerfilPopup(Sender: TObject);
    procedure btnVoltaUmClick(Sender: TObject);
    procedure btnPassaUmClick(Sender: TObject);
    procedure trvAtivoDblClick(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure btnVoltaTodosClick(Sender: TObject);
    procedure mnuExcluirClick(Sender: TObject);
    procedure btnPassaTodosClick(Sender: TObject);
    procedure trvPerfilEdited(Sender: TObject; Node: TTreeNode;
      var S: String);
    procedure sbtnProcurarClick(Sender: TObject);

  private
    { Private declarations }

    CtrlCarteiraSpc: TCtrlCarteiraSPC;
    CtrlPerfilCota : TCtrlPerfilCota;
    CtrlGeral      : TCtrlGeral;
    CtrlSegregacao : TCtrlSegregacao;

    // Variáveis Globais
    ProgressoTotal : integer;

    Procedure MontarAtivos       (const Arvore: TTreeView; iIdPerfilCota : Integer = -1);
    Procedure MontarAtivosSPC    (const Arvore: TTreeView; iIdPerfilCota : integer = -1);
    Procedure MontarInvestimento (const Arvore: TTreeView; const nTreeNode: TTreeNode; iIdPerfilCota : Integer);
    Procedure MontarEmprestimo   (const Arvore: TTreeView; const nTreeNode: TTreeNode; iIdPerfilCota : Integer);
    Procedure MontarImobiliario  (const Arvore: TTreeView; const nTreeNode: TTreeNode; iIdPerfilCota : Integer);
    Procedure MontarCotas        (const Arvore: TTreeView; const nTreeNode: TTreeNode; iIdPerfilCota : Integer);
    Procedure MontaNoRFRV        (const Arvore: TTreeView; const sRFRV : string; nTreeNodePai : TTreeNode; iIdPerfilCOta : Integer);
    Procedure MontaNoFundos      (const Arvore: TTreeView; const sFundo: string; nTreeNodePai : TTreeNode; iIdPerfilCOta : Integer);


    Procedure Update;
    Procedure MensErroMt                         ( sMsgInfo: string);
    procedure MontaPastaAtivoSelecionado;
    procedure HabilitaPainelParaNavegacao;
    procedure DeshabilitaPainelParaNavegacao;
    procedure seleciona (const iIdPerfilCota: integer);
    procedure RetornaAtivoNo(NoOrigem: TTreeNode);
    procedure MarcaModificado(const sCodHierarquico: string);
    procedure IniciaAlteracao;
    procedure FinalizaAlteracao;
    procedure RefazCodHierarquico(Arvore: TTreeView);
    procedure DeletarPastaSelecionada;
    procedure InserePapel(Arvore: TTreeView; NoDestino: TTreeNode; pDesc: pItem);
    procedure InsereTodosPasta;
    procedure InsereTodosGeral(NoOrigem,NoDestino: TTreeNode);

    //  Funções
    function  Delete                             : Boolean;
    function  VerificaPreenchimento              : Boolean;
    function  RetornaCodHierarqPai (const codhierarquico : string): string;
    function  VefificaInsereAtivoNovo: boolean;
    function  VerificaInsereAtivosNovos: Boolean;
    function  VerificaExcluiAtivo: Boolean;
    function  VerificaNivelMascara: Integer;
    function  VerificaPassaTodos: Boolean;
    function  InserePasta(EumaPasta: Boolean; Arvore: TTreeView; NoDestino: TTreeNode; pDesc: pItem): TTreeNode;
    function  RetornaNivelMaxNo(No: TTreeNode): Integer;


  public
    { Public declarations }
     function  RetornaNivelCodHierarquico         ( const codhierarquico : string): integer;
     function  RetornaCodHierarquico(const Arvore: TTreeView; No: TTreeNode): string;

  end;


const
  sMascaraHierarquica: string = '99.99.99.99';


var
  frmCadPerfilCota: TfrmCadPerfilCota;
  MensagemCota: function (Msg: string; DlgType: TMsgDlgType; sCaption: string;
                          Buttons: TMsgDlgButtons; ButtonsCaptions: String): Word;


implementation

uses uCotaComum;
{$R *.DFM}

procedure TfrmCadPerfilCota.MontarAtivos(const Arvore: TTreeView; iIdPerfilCota : Integer);
{ PROCEDIMENTO - 01
  Este procedimento tem a função de criar as pastas e preenchê-las
  com os ativos cadastrados}
var
  nNodeInvestimento, nNodeCotas,
  nNodeEmprestimo, nNodeImobiliario: TTreeNode;
  wItem : pItem;

begin

  FrmProgressoDuplo.MostraFormProgressoDuplo('Progresso Total','Aguarde, montando árvore de Ativos Origem',0,0,11,100,false,false);
  ProgressoTotal := 0;

  //Pasta Investimento
  new(wItem);
  wItem.sDescAtivo                := 'Investimento';
  wItem.IDAtivoCota               := 0;
  nNodeInvestimento               := nil;
  nNodeInvestimento               := InserePasta(true,Arvore,nNodeInvestimento,wItem);


  //Pasta Imobiliário
  new(wItem);
  wItem.sDescAtivo                := 'Imobiliário';
  wItem.IDAtivoCota               := 0;
  nNodeImobiliario                := nil;
  nNodeImobiliario                := InserePasta(true,Arvore,nNodeImobiliario,wItem);


  //Pasta Empréstimo
  new(wItem);
  wItem.sDescAtivo                := 'Empréstimo';
  wItem.IDAtivoCota               := 0;
  nNodeEmprestimo                 := nil;
  nNodeEmprestimo                 := InserePasta(true,Arvore,nNodeEmprestimo,wItem);


  //Pasta Cotas
  new(wItem);
  wItem.sDescAtivo                := 'Cotas Manuais';
  wItem.IDAtivoCota               := 0;
  nNodeCotas                      := nil;
  nNodeCotas                      := InserePasta(true,Arvore,nNodeCotas,wItem);


  {Procedimentos que preenchem as pastas com os seus devidos valores}
  MontarInvestimento(Arvore,nNodeInvestimento,iIdPerfilCota); // => 04

  MontarImobiliario(Arvore,nNodeImobiliario,iIdPerfilCota);// => 03

  MontarEmprestimo(Arvore,nNodeEmprestimo,iIdPerfilCota); // => 02

  MontarCotas(Arvore,nNodeCotas,iIDPerfilCota); // => 07
  {FIM DO PROCEDIMENTO - 01}

  frmProgressoDuplo.EscondeFormProgressoDuplo;
end;


procedure TfrmCadPerfilCota.MontarEmprestimo(const Arvore: TTreeView; const nTreeNode: TTreeNode; iIdPerfilCota : Integer);
{ PROCEDIMENTO - 02
  Este procedimento tem como função de preencher a
  pasta Empréstimo com os seus respectivos valores}
var
  wItem: pItem;
  Posicao1 : integer;
begin
  inherited;
  //Lista os ativos do empréstimo
  cdsEmprestimo.Data             := CtrlPerfilCota.ListaAtivosEmprestimo(iIdPerfilCota);
  frmProgressoDuplo.Max2         := CdsEmprestimo.RecordCount;
  frmProgressoDuplo.Legenda      := 'Montando Empréstimo';
  Posicao1                       := 0;

  //Insere os dados obtidos no cds para pasta já criada
  while not cdsEmprestimo.Eof do begin
    new(wItem);
    wItem.IDAtivoCota            := cdsEmprestimo.FieldByName ('IDATIVOCOTA').AsInteger;
    wItem.sDescAtivo             := cdsEmprestimo.FieldByName ('TCEDESCRICAO').AsString;
    InserePapel(Arvore,nTreeNode,wItem);
    Posicao1                     := Posicao1 + 1;
    frmProgressoDuplo.AndaFormProgressoDuplo(ProgressoTotal,Posicao1);
    cdsEmprestimo.Next;
  end;

  ProgressoTotal := 10;
  cdsEmprestimo.Close;
{ Fim do PROCEDIMENTO - 02}
end;


procedure TfrmCadPerfilCota.MontarImobiliario(const Arvore: TTreeView; const nTreeNode: TTreeNode; iIdPerfilCota : Integer);
//==============================================================================
{ PROCEDIMENTO - 03
  Este procedimento tem como função de preencher a
  pasta Imobiliário com os seus respectivos valores}
//==============================================================================
var
  wItem: pItem;
  nTreeNodeImovelMestre, nTreeNodeTipoImovel: TTreeNode;
  sCodTipImovel: string;
  iIdImovelMestre,Posicao1 : integer;

begin
  inherited;
  //Monta a qry de ativos imobiliário
  CdsImobiliario.Data    := CtrlPerfilCota.ListaAtivosImobiliario(iIdPerfilCota);
  frmProgressoDuplo.Max2 := cdsImobiliario.RecordCount;
  frmProgressoDuplo.Legenda := 'Montando Imobiliário';
  Posicao1 := 0;

  while not cdsImobiliario.Eof do begin
    // Fazer um loop para inserir as árvores com os tipos de imóveis
    sCodTipImovel                := cdsImobiliario.FieldByName('CODTIPIMOVEL').AsString;

    // Cria uma pasta referente ao campo CODTIPIMOVEL
    new(wItem);
    wItem.IDAtivoCota            := 0;
    wItem.sDescAtivo             := sCodTipImovel;
    nTreeNodeTipoImovel          := InserePasta(false,Arvore,nTreeNode,wItem);

    //
    while (sCodTipImovel = cdsImobiliario.FieldByName('CODTIPIMOVEL').AsString) and
          not (cdsImobiliario.Eof) do begin

      // Fazer um loop para inserir imóveis mestres
      iIdImovelMestre            := cdsImobiliario.FieldByName('IDIMOVELMESTRE').AsInteger;
      new(wItem);
      wItem.IDAtivoCota          := 0;
      wItem.sDescAtivo           := cdsImobiliario.FieldByName('MESTRE').AsString;
      nTreeNodeImovelMestre      := InserePasta(false,Arvore,nTreeNodeTipoImovel,wItem);

      while (sCodTipImovel = cdsImobiliario.FieldByName('CODTIPIMOVEL').AsString) and
            (iIdImovelMestre = cdsImobiliario.FieldByName('IDIMOVELMESTRE').AsInteger) and
            not (cdsImobiliario.Eof) do begin

        new(wItem);
        wItem.IDAtivoCota        := cdsImobiliario.FieldByName('IDATIVOCOTA').AsInteger;
        wItem.sDescAtivo         := cdsImobiliario.FieldByName('IMONOME').AsString;
        InserePapel(Arvore,nTreeNodeImovelMestre,wItem);
        Inc(Posicao1);
        FrmProgressoDuplo.AndaFormProgressoDuplo(ProgressoTotal,Posicao1);
        cdsImobiliario.Next;
      end;
      ProgressoTotal             := 9;
    end;
  end;
  cdsImobiliario.Close;
{ Fim do PROCEDIMENTO - 03}
end;


procedure TfrmCadPerfilCota.MontarInvestimento(const Arvore: TTreeView; const nTreeNode: TTreeNode;iIdPerfilCOta : Integer);
//==============================================================================
{ PROCEDIMENTO - 04
  Este procedimento tem como função de montar toda a pasta
  de ativos Investimento}
//==============================================================================
var
  wItem: pItem;
  nTreeNodeFundos : TTreeNode;

begin
  inherited;
  // Cria e monta a pasta de RF, dentro da pasta Investimento
  MontaNoRFRV(Arvore,'RF',nTreeNode,iIdPerfilCOta); // => 08
  ProgressoTotal := 1;

  // Cria e monta a pasta de RV, dentro da pasta Investimento
  MontaNoRFRV(Arvore,'RV',nTreeNode,iIdPerfilCOta);  // => 08
  ProgressoTotal := 2;

  // Cria e monta a pasta de BMF, dentro da pasta Investimento
  MontaNoRFRV(Arvore,'BMF',nTreeNode,iIdPerfilCOta); // => 08
  ProgressoTotal := 3;

  // Cria a pasta Fundos, dentro da pasta Investimento
  new(wItem);
  wItem.IDAtivoCota  := 0;
  wItem.sDescAtivo   := 'Fundos';
  nTreeNodeFundos    := InserePasta(false,Arvore,nTreeNode,wItem);

  ProgressoTotal     := 4;

  {*****Preenche a pasta Fundos*********}
  // Cria e monta a pasta RF dentro da pasta Fundos
  MontaNoFundos(Arvore,'RF',nTreeNodeFundos,iIdPerfilCOta); // => 09
  ProgressoTotal := 5;

  // Cria e monta a pasta RV dentro da pasta Fundos
  MontaNoFundos(Arvore,'RV',nTreeNodeFundos,iIdPerfilCOta); // => 09
  ProgressoTotal := 6;

  // Cria e monta a pasta FDC dentro da pasta Fundos
  MontaNoFundos(Arvore,'FDC',nTreeNodeFundos,iIdPerfilCOta); // => 09
  ProgressoTotal := 7;

  // Cria e monta a pasta Imobiliário dentro da pasta Fundos
  MontaNoFundos(Arvore,'Imobiliário',nTreeNodeFundos,iIdPerfilCOta); // => 09
  ProgressoTotal := 8;

{ FIM DO PROCEDIMENTO - -04}
end;


procedure TfrmCadPerfilCota.mnuIncluirItemClick(Sender: TObject);
var
pSubPasta: pItem;

begin
  inherited;
  //   Inclui uma nova subpasta
 try
   // Analiza o nível da subpasta que está sendo criada...
   if trvPerfil.Selected.Level = VerificaNivelMascara then
     MsgDlg('Nível de nós esgotado',sistema.NomeAplicativo,mtWarning,[mbOk],0)
   else begin
     new(pSubPasta);
     pSubPasta.IDAtivoCota   := -1;
     pSubPasta.IdCarteiraSPC := -1;
     pSubPasta.IDNoPerfilCota:= -1;
     pSubPasta.IdNoPerfilXAtivo:= -1;
     pSubPasta.sDescAtivo := 'Nova SubPasta';
     pSubPasta.NoAtivo  := nil;
     pSubPasta.NoPerfil := trvPerfil.Selected;
     // Inserindo a subpasta...
     InserePasta(false,trvPerfil,pSubPasta.NoPerfil,pSubPasta).Selected := true;
     //  Inserindo código hierárquico da subpasta...
     pItem(trvPerfil.Selected.Data)^.CodHierarquico := RetornaCodHierarquico(trvPerfil,trvPerfil.Selected);

     //  Inserindo no Cds a subpasta criada...
     CdsNoPerfilCota.Append;
     CdsNoPerfilCota.FieldByName('CODHIERARQUICO').AsString := pSubPasta.CodHierarquico;
     CdsNoPerfilCota.FieldByName('DESCRICAO').AsString := pSubPasta.sDescAtivo;
     CdsNoPerfilCota.FieldByName('CODHIERARQPAI').AsString := RetornaCodHierarqPai(CdsNoPerfilCota.FieldByName('CODHIERARQUICO').AsString);
     CdsNoPerfilCota.Post;
     Update;
    end;
 except
   MsgDlg('Não é possível inserir uma pasta com o mesmo nome, no mesmo nível!',Sistema.NomeAplicativo,mtWArning,[mbOk],0);
   CdsNoPerfilCota.Cancel;
   trvPerfil.Selected.Delete;
   trvPerfil.ReadOnly := True;
 end;
end;


procedure TfrmCadPerfilCota.mnuAlterarClick(Sender: TObject);
begin
  inherited;
  // Só abre para edição se o objeto selecionado for uma pasta/subpasta...
  if trvPerfil.Selected.ImageIndex = 0 then
    Update;
end;


procedure TfrmCadPerfilCota.Update;
begin
  inherited;
  //  Se achar a pasta/subpasta, abre a árvore e o Cds para edição
  if CdsNoPerfilCota.Locate('CODHIERARQUICO',PItem(trvPerfil.Selected.data)^.CodHierarquico, []) then begin
    CdsNoPerfilCota.Edit;
    trvPerfil.ReadOnly := False;
    trvPerfil.Selected.EditText;
  end;
end;


function TfrmCadPerfilCota.Delete: Boolean;
//==============================================================================
//      Este procedimento tem como função de excluir a
//    pasta selecionada e exportar os ativos inseridos nesta pasta e subpastas
//    para a árvore dos ativos
//
//==============================================================================
var
NoEmFoco : TTreeNode;
Nivel : Integer;
pPapel: pItem;

begin
  Result := False;

  //============================================================================
  //
  //               Exclusões em modo de insert do CmeCadastro
  //============================================================================

  if CmeCadastro.Operacao = opInserir then begin
    if VerificaExcluiAtivo then begin
      //  Verifica se o objeto selecionado é um papel(ativo)...
      if trvPerfil.Selected.ImageIndex = 2 then begin
        //  Passa todos os dados do papel para a variável...
        pPapel := trvPerfil.Selected.Data;
        //  Se encontrado o papel no cds, exclui o mesmo...
        if CdsNoPerfilXAtivo.Locate('IDATIVOCOTA',pPapel.IDAtivoCota,[]) then begin
          CdsNoPerfilXAtivo.Delete;
          InserePapel(trvAtivo,pPapel.NoAtivo,pPapel);
          trvPerfil.Selected.Delete;
        end;

      //  Caso o objeto selecionado seja uma pasta/subpasta...
      end else begin
        //  Verifica se o nó selecionado tem filhos...
        if trvPerfil.Selected.HasChildren then begin
          NoEmFoco := trvPerfil.Selected.getFirstChild;
          Nivel    := trvPerfil.Selected.Level;
          //  Varre todo o nó selecionado
          while NoEmFoco.Level <> Nivel do begin
            //  Se o objeto encontrado for um papel...
            if NoEmFoco.ImageIndex = 2 then  begin
              pPapel := NoEmFoco.Data;
              //  Se encontrado o ativo no cds,exclui o próprio...
              if CdsNoPerfilXAtivo.Locate('IDATIVOCOTA',pPapel.IDAtivoCota,[]) then begin
                CdsNoPerfilXAtivo.Delete;
                //  Retorna o ativo ao nó original
                InserePapel(trvAtivo,pPapel.NoAtivo,pPapel);
                NoEmFoco := NoEmFoco.GetNext;
                if NoEmFoco = nil then begin
                   DeletarPastaSelecionada;
                   Break;
                end;
              end;
            //  Se o objeto encontrado for uma pasta/subpasta...
            end else begin
              if CdsNoPerfilCota.Locate('CODHIERARQUICO',pItem(NoEmFoco.Data)^.CodHierarquico,[]) then
              CdsNoPerfilCota.Delete;
              NoEmFoco := NoEmFoco.GetNext;
            end;
          end;
        //  Caso não tenha filhos...
        end else begin
          if CdsNoPerfilCota.Locate('CODHIERARQUICO',pItem(trvPerfil.Selected.Data)^.CodHierarquico,[]) then
            CdsNoPerfilCota.Delete;
        end;
        trvPerfil.Selected.Delete;
      end;
      trvAtivo.Refresh;
      Result := True;
    end;



  //============================================================================
  //
  //               Exclusões em modo de update do CmeCadastro
  //============================================================================
  end else begin
    //  Verifica se o objeto selecionado é um papel...
    if trvPerfil.Selected.ImageIndex = 2 then begin
      //  Faz a pergunta...
      if MsgDlg('Deseja realmente excluir este ativo?','Cotas Gerenciais',mtConfirmation,[mbYes,mbNo],0) = mrYes then begin
        if CdsNoPerfilXAtivo.Locate('IDATIVOCOTA',pItem(trvPerfil.Selected.Data)^.IDAtivoCota,[]) then
          CdsNoPerfilXAtivo.Delete;
        trvPerfil.Selected.Delete;
        MarcaModificado (Pitem(trvPerfil.Selected.Data)^.CodHierarquico) ;
      end;
    //  Caso o objeto selecionado seja uma pasta/subpasta...
    end else begin
      if VerificaExcluiAtivo then begin
       //   Faz a exclusão de todos os ativos cadastrados e suas respectivas pastas
       // caso o o nó selecionado seja uma pasta e o Cds esteja em EDIÇÃO
         NoEmFoco := trvPerfil.Selected;
         Nivel    := NoEmFoco.Level;


         //   Faz um loop enquanto não muda de nó...
         if NoEmFoco.HasChildren then begin
           NoEmFoco := NoEmFoco.GetNext;
           while NoEmFoco.Level >  Nivel do begin

             //  Exclui do Cds se for uma pasta...
             if NoEmFoco.ImageIndex = 0 then begin

               //    Faz um filtro para achar todos os ativos dependentes da pasta
               // selecionada, pois é necessário excluir primeiro, os ativos do Cds
               CdsNoPerfilXAtivo.Filter   := 'CODHIERARQUICO = ' + QuotedStr(pItem(NoEmFoco.Data)^.CodHierarquico);
               CdsNoPerfilXAtivo.Filtered := true;
               CdsNoPerfilXAtivo.First;
               while not CdsNoPerfilXAtivo.Eof do
                 CdsNoPerfilXAtivo.Delete;
               CdsNoPerfilXAtivo.Filtered := false;

               //  Excluir a pasta do Cds
               if CdsNoPerfilCota.Locate('CODHIERARQUICO',pItem(NoEmFoco.Data)^.CodHierarquico,[]) then
                 CdsNoPerfilCota.Delete;
             end;
             NoEmFoco := NoEmFoco.GetNext;
             //   Verfica se o nó em foco é nill, pois sem esta verificação
             // surgirá um erro. Isto ocorre quando o usuário tenta excluir
             // a última pasta da árvore
             if NoEmFoco = nil then begin
               DeletarPastaSelecionada;
               Break;
             end;
           end;
         end;

           CdsNoPerfilXAtivo.Filter   := 'CODHIERARQUICO = ' + QuotedStr(pItem(trvPerfil.Selected.Data)^.CodHierarquico);
           CdsNoPerfilXAtivo.Filtered := true;
           CdsNoPerfilXAtivo.First;
           while not CdsNoPerfilXAtivo.Eof do
             CdsNoPerfilXAtivo.Delete;
           CdsNoPerfilXAtivo.Filtered := false;

           if CdsNoPerfilCota.Locate('CODHIERARQUICO',pItem(trvPerfil.Selected.Data)^.CodHierarquico,[]) then
             CdsNoPerfilCota.Delete;

         //   Finalizando a exlusão, deleta o nó selecionado
         trvPerfil.Selected.Delete;
         Result := True;
      end;
    end;
  end;
end;








procedure TfrmCadPerfilCota.mnuIncluirPastaClick(Sender: TObject);
var
pPasta : pItem;

begin
  inherited;
   try
     new(pPasta);
     pPasta.sDescAtivo := 'Nova Pasta';
     pPasta.NoPerfil   := nil;
     pPasta.NoAtivo    := nil;
     pPasta.IDAtivoCota:= -1;
     pPasta.IdCarteiraSPC := -1;
     pPasta.IDNoPerfilCota:= -1;
     pPasta.IdNoPerfilXAtivo:= -1;

     //  Inserindo pasta...
     InserePasta(True,trvPerfil,pPasta.NoPerfil,pPasta).Selected := True;
     //  Inserindo código hierárquico na pasta criada...
     pItem(trvPerfil.Selected.Data)^.CodHierarquico := RetornaCodHierarquico(trvPerfil,trvPerfil.Selected);
     //  Inclui a descrição da pasta no Cds...
     CdsNoPerfilCota.Append;
     CdsNoPerfilCota.FieldByName('CODHIERARQUICO').AsString := pPasta.CodHierarquico;
     CdsNoPerfilCota.FieldByName('DESCRICAO').AsString      := pPasta.sDescAtivo;
     CdsNoPerfilCota.FieldByName('CODHIERARQPAI').AsString  := RetornaCodHierarqPai(CdsNoPerfilCota.FieldByName('CODHIERARQUICO').AsString);
     CdsNoPerfilCota.Post;
     Update;
   except
     MsgDlg('Não é possível inserir uma pasta com o mesmo nome, no mesmo nível!',Sistema.NomeAplicativo,mtWArning,[mbOk],0);
     CdsNoPerfilCota.Cancel;
     trvPerfil.Selected.Delete;
     trvPerfil.ReadOnly := True;
   end;
end;


Procedure TfrmCadPerfilCota.MontarAtivosSPC(const Arvore: TTreeView; iIdPerfilCota : integer);
//==============================================================================
{ PROCEDIMENTO - 06
  Este procedimento tem como função de montar
  a lista de ativos SPC}
//==============================================================================
var
  nNodeSegmento, nNodeImovelMestre, nNodeCarteira: TTreeNode;
  wItem : pItem;
  iCodSegmento,Posicao : integer;
  DescCarteira : string;
  CodTipImovel : string;
  ImovelMestre : string;

begin
  nNodeSegmento := nil;
  nNodeCarteira := nil;
  nNodeImovelMestre := nil;

  // Habilita o painel de seleção
  PnlSelecao.Enabled := true;
  // Limpa a árvore de ativos
  trvAtivo.Items.Clear;

  // Carrega  os dados dos ativos, baseados na carteira SPC
  CdsPerfilSPC.Data :=  CtrlCarteiraSpc.ListaCarteiraSPCAtivos(iIdPerfilCota);
  FrmProgresso.MostraFormProgresso('Aguarde, montando árvore ativos SPC',false,false,true,0,100);

  // Define um valor às variáveis
  iCodSegmento := -1;
  DescCarteira := '';
  CodTipImovel := '';
  ImovelMestre := '';
  Posicao      := 0;

  { Inicia o loop, onde vai inserir todas as pastas e subpastas
   de acordo com o resultado obtido do CdsPerfilSPC}
  while not CdsPerfilSPC.Eof do begin

    { Verifica se a variável iCodSegemnto, é diferente do valor do campo
    CODSEGMENTO, pois caso seja, é criado uma nova pasta com o nome referente
    a descrição do segmento encontrado}
    if iCodSegmento <> CdsPerfilSPC.FieldByName('CODSEGMENTO').AsInteger then begin
      iCodSegmento               := CdsPerfilSPC.FieldByName('CODSEGMENTO').AsInteger;
      new(wItem);
      wItem.sDescAtivo           := CdsPerfilSPC.FieldByName('DESCRICAO').AsString;
      wItem.IdCarteiraSPC        := -1;
      nNodeSegmento              := nil;
      nNodeSegmento              := InserePasta(true,Arvore,nNodeSegmento,wItem);
    end;


    { Verifica se a variável DescCarteira, é diferente do valor do campo
    DESCARTEIRASPC, pois caso seja, é criado uma nova pasta dentro
    da pasta SEGMENTO com o nome referente a descrição da carteira encontrada}
    if  DescCarteira <> CdsPerfilSPC.FieldByName('DESCARTEIRASPC').AsString then begin
      DescCarteira               := CdsPerfilSPC.FieldByName('DESCARTEIRASPC').AsString;
      new(wItem);
      wItem.IDAtivoCota          := 0;
      wItem.IdCarteiraSPC        := CdsPerfilSPC.FieldByName('IDCARTEIRASPC').AsInteger;
      wItem.sDescAtivo           := CdsPerfilSPC.FieldByName('DESCARTEIRASPC').AsString;
      nNodeCarteira              := InserePasta(false,Arvore,nNodeSegmento,wItem);
    end;



    { Verifica se a variável ImovelMestre, é nula ou diferente do valor encontrado
    a cada passo do loop, pois caso seja diferente, é criado uma nova pasta
    dentro da pasta CARTEIRA, com o nome referente ao valor encontrado
    no campo MESTRE }
    if  (ImovelMestre <> CdsPerfilSPC.FieldByName('MESTRE').AsString)
    and (CdsPerfilSPC.FieldByName('MESTRE').AsString <> '') then begin
      ImovelMestre               := CdsPerfilSPC.FieldByName('MESTRE').AsString;
      new(wItem);
      wItem.IDAtivoCota          := 0;
      wItem.sDescAtivo           :=  CdsPerfilSPC.FieldByName('MESTRE').AsString;
      wItem.IdCarteiraSPC        := -1;
      nNodeImovelMestre          := InserePasta(false,Arvore,nNodeCarteira,wItem);
    end;


    { Verifica se o campo MESTREL está vazio, pois com este campo nulo,
    é ignorado a verificação o mesmo, junto com o campo MESTRE, criando assim um objeto
    dentro da pasta CARTEIRA. Caso não esteja, é criado um objeto dentro
    da pasta MESTRE, com o nome semelhante ao encontrado no campo DESCINVESTIMENTO}
    if CdsPerfilSPC.FieldByName('MESTRE').AsString <> ''   then begin
      new(wItem);
      wItem.IDAtivoCota               := CdsPerfilSPC.FieldByName('IDATIVOCOTA').AsInteger;
      wItem.sDescAtivo                := CdsPerfilSPC.FieldByName('DESCINVESTIMENTO').AsString;
      wItem.IdCarteiraSPC             := CdsPerfilSPC.FieldByName('IDCARTEIRASPC').AsInteger;
      InserePapel(Arvore,nNodeImovelMestre,wItem);

    end else if CdsPerfilSPC.FieldByName('DESCINVESTIMENTO').AsString <> '' then  begin
      new(wItem);
      wItem.IDAtivoCota               := CdsPerfilSPC.FieldByName('IDATIVOCOTA').AsInteger;
      wItem.sDescAtivo                := CdsPerfilSPC.FieldByName('DESCINVESTIMENTO').AsString;
      wItem.IdCarteiraSPC             := CdsPerfilSPC.FieldByName('IDCARTEIRASPC').AsInteger;
      InserePapel(Arvore,nNodeCarteira,wItem);
    end;


    // Move o cursor para o próximo registro
    Posicao := Posicao + 1;
    FrmProgresso.AndaFormProgresso(Posicao,CdsPerfilSPC.RecordCount);
    CdsPerfilSPC.Next;
  end;

  FrmProgresso.EscondeFormProgresso;
{ FIM DO PROCEDIMENTO - 06}
end;


procedure TfrmCadPerfilCota.FormCreate(Sender: TObject);
begin
  inherited;

  //AL_1 - Assinala a rotina de mensagem
  MensagemCota := uCotaComum.MsgDlgCota;

  //  Cria os Control's Object's
  CtrlCarteiraSPC :=  TCtrlCarteiraSPC.Create;
  CtrlCarteiraSPC.Initialize (dtmBaseDados.dbBaseDados, true,
                              Sistema.ConnectionType, Sistema.ConnectionSide,
                              Sistema.AppRemoteServer, true, MensErroMT);

  CtrlPerfilCota  :=  TCtrlPerfilCota.Create;
  CtrlPerfilCota.InitializeAs(CtrlCarteiraSPC);


  CtrlGeral := TCtrlGeral.Create;
  CtrlGeral.InitializeAs(CtrlCarteiraSPC);

  CtrlSegregacao  := TCtrlSegregacao.Create;  // utilizado apenas para retornar o grau pai
  CtrlSegregacao.InitializeAs(CtrlCarteiraSpc);

  //  Define os Cds's do Control como Cds's inseridos no Form
  CtrlPerfilCota.cdsPerfilCota      := Cds;
  CtrlPerfilCota.CdsNoPerfilCota    := CdsNoPerfilCota;
  CtrlPerfilCota.CdsNoPerfilXATivo  := CdsNoPerfilXAtivo;

  seleciona (-1);

end;


procedure TfrmCadPerfilCota.MensErroMt(sMsgInfo: string);
begin
  MsgDlg (sMsgInfo, Sistema.NomeAplicativo, mtWarning, [mbok], 0);
end;


procedure TfrmCadPerfilCota.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil (CtrlCarteiraSPC);
  FreeAndNil (CtrlPerfilCota);
  FreeAndNil (CtrlGeral);
  FreeAndNil (CtrlSegregacao);
end;


procedure TfrmCadPerfilCota.grpPerfilAtivoClick(Sender: TObject);
begin
  inherited;

  if grpPerfilAtivo.ItemIndex = 0 then begin
    PnlSelecao.Enabled := true;
    trvAtivo.Items.Clear;
    MontarAtivosSPC(trvAtivo)
  end else
    MontarAtivos(trvAtivo);
  trvAtivo.SetFocus;
  grpPerfilAtivo.Enabled := false;


end;


procedure TfrmCadPerfilCota.mnuPerfilPopup(Sender: TObject);
begin
  inherited;
  { Críticas de habilitação de sub-menu
  na árvore Perfil de Ativos}
  if CmeCadastro.Operacao in [opInserir, opAlterar] then begin
    mnuIncluirPasta.Enabled := True;
    if trvPerfil.Items.Count > 0 then begin
      case trvPerfil.Selected.ImageIndex of
        0 : begin
              if trvPerfil.Selected.Count > 0 then
                mnuIncluirItem.Enabled := (trvPerfil.Selected.getFirstChild.ImageIndex = 0)
              else
              mnuIncluirItem.Enabled := True;
              mnuExcluir.Enabled     := true;
              mnuAlterar.Enabled     := true;
            end;
        2 : begin
              mnuExcluir.Enabled     := true;
              mnuAlterar.Enabled     := false;
              mnuIncluirItem.Enabled := false;
            end;
      end;
    end else begin
      mnuIncluirPasta.Enabled := True;
      mnuExcluir.Enabled      := False;
      mnuAlterar.Enabled      := false;
      mnuIncluirItem.Enabled  := false;
    end;
   end else mnuPerfil.Items.Enabled := false;
end;


procedure TfrmCadPerfilCota.MontarCotas(const Arvore: TTreeView; const nTreeNode: TTreeNode; iIdPerfilCota : Integer );
//==============================================================================
{ PROCEDIMENTO - 07
  Este procedimento tem como função de montar a pasta Cotas,
  exibindo todos os ativos lançados manualmente}
//==============================================================================
var
  wItem: pItem;
  Posicao1 : integer;

begin

  cdsCotas.Data                  := CtrlPerfilCota.ListaCotas(iIdPerfilCota);
  frmProgressoDuplo.Max2         := CdsCotas.RecordCount;
  frmProgressoDuplo.Legenda      := 'Montando Cotas Manuais';
  Posicao1 := 0;

  while not cdsCotas.Eof do begin
    new(wItem);
    wItem.IDAtivoCota := cdsCotas.FieldByName('IDATIVOCOTA').AsInteger;
    wItem.sDescAtivo  := cdsCotas.FieldByName ('DESCRICAO').AsString;
    InserePapel(Arvore,nTreeNode,wItem);
    Posicao1          := Posicao1 + 1;
    FrmProgressoDuplo.AndaFormProgressoDuplo(ProgressoTotal,Posicao1);
    cdsCotas.Next;
  end;

  ProgressoTotal                 := 11;
  cdsCotas.Close;
{ FIM DO PROCEDIMENTO - 07}
end;


procedure TfrmCadPerfilCota.MontaNoRFRV(const Arvore: TTreeView;const sRFRV: string; nTreeNodePai : TTreeNode; iIdPerfilCOta : Integer);
//==============================================================================
{ PROCEDIMENTO - 08
  Este procedimento tem como função de montar o
  nó das pastas de Renda Fixa e Renda Variável}
//==============================================================================

var
 wItem: pItem;
 nTreeNodeRFRV: TTreeNode;
 Posicao1 : integer;
 CmCdsRFRV: TCMClientDataSet;

begin
 try
   { Zera a variável somente quando for usada pela 1ª vez para controle
   de progresso, pois este procedimento é chamado várias vezes}
   if Posicao1 < 0 then
     Posicao1 := 0;
   CmCdsRFRV := TCMClientDataSet.Create(nil);

  // Cria as pastas Rendas Fixas/Variáveis
  new(wItem);
  wItem.IDAtivoCota           := 0;
  wItem.sDescAtivo            := sRFRV;
  nTreeNodeRFRV               := InserePasta(false,Arvore,nTreeNodePai,wItem);



  {Verifica o tipo de renda, se é Fixa/Variável/BMG, e monta a qry
   de acordo com o resultado}
  if sRFRV = 'RF' then begin
    CmCdsRFRV.Data         := CtrlPerfilCota.ListaAtivosRFRV(1,iIdPerfilCOta);
    frmProgressoDuplo.Legenda := 'Montando RF';
  end else if sRFRV = 'RV' then begin
    CmCdsRFRV.Data         := CtrlPerfilCota.ListaAtivosRFRV(2,iIdPerfilCOta);
    frmProgressoDuplo.Legenda := 'Montando RV';
  end else if sRFRV = 'BMF' then begin
    CmCdsRFRV.Data         := CtrlPerfilCota.ListaAtivosRFRV(8,iIdPerfilCOta);
    frmProgressoDuplo.Legenda := 'Montando BM&&F';
  end;

  frmProgressoDuplo.Max2 := CmCdsRFRV.RecordCount;


 //Faz o loop, inserindo na pasta, comforme resultado da qry

  while not CmCdsRFRV.Eof do begin
    new(wItem);
    wItem.IDAtivoCota            := CmCdsRFRV.FieldByName('IDATIVOCOTA').AsInteger;
    wItem.sDescAtivo             := CmCdsRFRV.FieldByName ('DESCINVESTIMENTO').AsString;
    InserePapel(Arvore,nTreeNodeRFRV,wItem);
    Inc(Posicao1);
    frmProgressoDuplo.AndaFormProgressoDuplo(ProgressoTotal,Posicao1);
    CmCdsRFRV.Next;
  end;

  // Passa o valor da variável local Posicao2 para a variável global ProgressoTotal
  CdsRFRV.Close;
 finally
   FreeAndNil(CmCdsRFRV);

 end;


{ FIM DO PROCEDIMENTO - 08}
end;


procedure TfrmCadPerfilCota.MontaNoFundos(const Arvore: TTreeView; const sFundo: string; nTreeNodePai : TTreeNode; iIdPerfilCOta : Integer);
{ PROCEDIMENTO - 09
  Este procedimento tem como função de montar o nó da pasta
  \Investimento\Fundos }
var
wItem : pItem;
nTreeNodeFundos: TTreeNode;
Posicao1 : integer;

begin
   nTreeNodeFundos := nil;

   { Zera a variável somente quando for usada pela 1ª vez para controle
   de progresso, pois este procedimento é chamado várias vezes}
   if Posicao1 < 0 then
     Posicao1 := 0;

  {Verifica o tipo de renda e cria as suas respectivas pastas
  dentro da pasta \Investimento\Fundo}

  // Se for renda fixa...
  if sFundo = 'RF' then begin
    new(wItem);
    wItem.sDescAtivo             := sFundo;
    nTreeNodeFundos              := InserePAsta(false,Arvore,nTreeNodePai,wItem);
    cdsFundosRFRV.Data           :=  CtrlPerfilCota.ListaFundos(3,2,iIdPerfilCota);
    frmProgressoDuplo.Legenda := 'Montando Fundo RF';

  // Se for outro tipo de valor...
  end else begin
    if sFundo = 'RV' then begin
      new(wItem);
      wItem.sDescAtivo           := sFundo;
      nTreeNodeFundos            := InserePasta(false,Arvore,nTreeNodePai,wItem);
      cdsFundosRFRV.Data         := CtrlPerfilCota.ListaFundos(4,0,iIDPerfilCota);
      frmProgressoDuplo.Legenda := 'Montando Fundo RV';


    end else if sFundo = 'FDC' then begin
      new(wItem);
      wItem.sDescAtivo           := sFundo;
      nTreeNodeFundos            := InserePasta(false,Arvore,nTreeNodePai,wItem);
      cdsFundosRFRV.Data         := CtrlPerfilCota.ListaFundos(5,0,iIDPerfilCota);
      frmProgressoDuplo.Legenda := 'Montando Fundo FDC';

    end else if sFundo = 'Imobiliário' then begin
      new(wItem);
      wItem.sDescAtivo           := sFundo;
      nTreeNodeFundos            := InserePasta(false,Arvore,nTreeNodePai,wItem);
      cdsFundosRFRV.Data         := CtrlPerfilCota.ListaFundos(1,0,iIDPerfilCota);
      frmProgressoDuplo.Legenda := 'Montando Fundo Imobiliário';
    end;
  end;

  frmProgressoDuplo.Max2         :=CdsFundosRFRV.RecordCount;


  // Faz um loop para preencher a pasta
  while not cdsFundosRFRV.Eof do begin
    new(wItem);
    wItem.IDAtivoCota            := cdsFundosRFRV.FieldByName('IDATIVOCOTA').AsInteger;
    wItem.sDescAtivo             := cdsFundosRFRV.FieldByName ('DESCFUNDOINVEST').AsString;
    InserePapel(Arvore,nTreeNodeFundos,wItem);
    Inc(Posicao1);
    frmProgressoDuplo.AndaFormProgressoDuplo(ProgressoTotal,Posicao1);
    cdsFundosRFRV.Next;
  end;

  cdsFundosRFRV.Close;
{ FIM DO PROCEDIMENTO - 09}
end;


function TfrmCadPerfilCota.VefificaInsereAtivoNovo: boolean;
begin
//Críticas  antes de inserir o registro
  Result := False;
  try

    if trvAtivo.Items.Count = 0 then
      raise EValidacao.CreateVal ('Selecione um perfil do ativo para prosseguir com esta operação', grpPerfilAtivo);

    if trvPerfil.Items.Count = 0 then
      raise EValidacao.CreateVal ('É necessário criar uma pasta para poder inserir um ativo', trvPerfil);

    if trvAtivo.Selected.ImageIndex = 0 then
      raise EValidacao.CreateVal ('Somente ativos podem ser movidos!', trvAtivo);

    if trvPerfil.Selected.ImageIndex = 2 then
      raise EValidacao.CreateVal ('Para mover ativos selecione uma pasta!', trvPerfil);

   except
    on ev : EValidacao do begin
      if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
      Repaint;
      if ev.Control.CanFocus then ev.Control.SetFocus;
      Exit;
    end;
  end;
  Result := True;

end;



procedure TfrmCadPerfilCota.btnVoltaUmClick(Sender: TObject);
var
pPapel: pItem;
//==============================================================================
//                           PROCEDIMENTO - 10
//  Este procedimento tem como função de inserir os ativos selecionados
//  nas pastas de perfil definido pelo o usuário
//
//==============================================================================
begin
  inherited;
  // Críticas
  if not VefificaInsereAtivoNovo then exit;
  //  Verifica se o conteúdo selecionado da árvore Perfil tem filhos
  if trvPerfil.Selected.HasChildren then begin
    //  Verifica se o primeiro filho do conteúdo selecionado da árvore Perfil
    // é uma pasta
    if trvPerfil.Selected.getFirstChild.ImageIndex = 0 then begin
      MsgDlg('Só é permitido inserir um ativo no final de cada nó da árvore','Cotas Gerenciais',mtWarning,[mbOk],0);
      exit;
    end;
  end;

  MarcaModificado(Pitem(trvPerfil.Selected.Data)^.CodHierarquico);
  pPapel := trvAtivo.Selected.Data;
  pPapel.NoAtivo  := trvAtivo.Selected.Parent;
  pPapel.NoPerfil := trvPerfil.Selected;
  pPapel.CodHierarquico := pItem(trvPerfil.Selected.Data)^.CodHierarquico;
  InserePapel(trvPerfil,pPapel.NoPerfil,pPapel);
  CdsNoPerfilXAtivo.Append;
  CdsNoPerfilXAtivo.FieldByName('CODHIERARQUICO').AsString := pPapel.CodHierarquico;
  CdsNoPerfilXAtivo.FieldByName('IDATIVOCOTA').AsInteger   := pPapel.IDAtivoCota;
  CdsNoPerfilXAtivo.Post;
  trvAtivo.Selected.Delete;


end;



procedure TfrmCadPerfilCota.btnPassaUmClick(Sender: TObject);
begin
  inherited;
  trvPerfil.SetFocus;
  if Delete then begin
    //  Faz essa verificação, pois se o nó deletado for o último item da árvore,
    // não há possibilidade de refazer o cód. hierarquico, gerando assim um erro.
    if trvPerfil.Items.Count > 0 then
    RefazCodHierarquico(trvPerfil);
  end;

  //  Faz essa verificação, pois quando é feito a exclusão do nó, a árvore
  // perde seu foco, selecionando assim, o 1º nó da árvore e focando-a, em seguida
  if trvPerfil.Items.Count > 0 then begin
    trvPerfil.Items.GetFirstNode.Selected := true;
  end;

end;



procedure TfrmCadPerfilCota.trvAtivoDblClick(Sender: TObject);
begin
  inherited;
  if pnlBotoes.Enabled then
  btnVoltaUm.Click;
end;



procedure TfrmCadPerfilCota.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
   grpPerfilAtivo.Enabled := true;
   trvPerfil.Items.Clear;
   trvAtivo.Items.Clear;
   trvPerfil.Items.Clear;
   seleciona(-1);
   btnPassaUm.Enabled    := True;
   btnPassaTodos.Enabled := True;
   DeshabilitaPainelParaNavegacao;
end;


function TfrmCadPerfilCota.VerificaPreenchimento: Boolean;
var
  iIdPerfilCota: integer;
begin
//Críticas  antes de inserir o registro
  Result := False;
  try
    if EditDescricaoPerfil.Text = ''          then
      raise EValidacao.CreateVal              ('O campo ''DESCRIÇÃO'' não pode estar em branco', EditDescricaoPerfil)
    else if EditDescricaoPerfil.Text[1] = ' ' then
      raise EValidacao.createVal              ('O campo ''DESCRIÇÃO'' não pode estar com o primeiro caráctere nulo',EditDescricaoPerfil)
    else if grpPerfilAtivo.Value = ''         then
      raise EValidacao.createVal              ('O item ''Perfil do Ativo'' tem que estar selecionado',grpPerfilAtivo)
    else if trvPerfil.Items.Count = 0         then
      raise EValidacao.createVal              ('A árvore de ''Perfil'' tem que estar preenchida',trvPerfil)
    else begin
      if CmeCadastro.Operacao = opInserir then iIdPerfilCota := -1
      else iIdPerfilCota := Cds.FieldByName('IDPERFILCOTA').AsInteger;

      if CtrlPerfilCota.VerifPerfilCadastrado(EditDescricaoPerfil.Text, iIdPerfilCota) then
        raise EValidacao.createVal ('Já existe um perfil cadastrado com esta descrição',EditDescricaoPerfil);
    end;
  except
    on ev : EValidacao do begin
      if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
      Repaint;
      if ev.Control.CanFocus then ev.Control.SetFocus;
      Exit;
    end;
  end;
  Result := True;
end;


procedure TfrmCadPerfilCota.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);

begin
  inherited;
  Accept := VerificaPreenchimento;
end;


procedure TfrmCadPerfilCota.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
    Accept                  :=  CtrlPerfilCota.GravaPerfilCota;
    FinalizaAlteracao;
    trvAtivo.Items.Clear;
    trvPerfil.Items.Clear;
    seleciona(-1);
    trvPerfil.Items.Clear;
    EditDescricaoPerfil.SetFocus;
end;



procedure TfrmCadPerfilCota.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  seleciona (-1);
  DeshabilitaPainelParaNavegacao;
  trvPerfil.Items.Clear;
  trvAtivo.Items.Clear;
  trvPerfil.Items.Clear;
end;


procedure TfrmCadPerfilCota.CmeCadastroFind(Sender: TObject);
var
  iIdPerfilCota : Integer;
  iResp : Word;
  bDeletou: Boolean;

begin
   inherited;
   if MontaSelect.RetornouValor then
   begin
      //AL_1 - Inicio
      try
         iIdPerfilCota  := StrToInt(MontaSelect.ValoresChave[0]);
         trvPerfil.Items.Clear;
         CdsNoPerfilCota.IndexName := '';
         seleciona (iIdPerfilCota);
         MontaPastaAtivoSelecionado;
         CdsNoPerfilCota.IndexName := 'IndCod';

         CdsNoPerfilCota.IndexDefs.Update;

         if Cds.FieldByName('TIPOPERFIL').AsString = 'S' then
            MontarAtivosSPC(trvAtivo,iIDPerfilCOta)
         else
            MontarAtivos(trvAtivo,iIdPerfilCota);
         HabilitaPainelParaNavegacao;
      except
         on E: Exception do
         begin
            // Chama a rotina de mensagem assinalada no create do form
            iResp := mrNone;
            if Assigned(MensagemCota) then
               iResp := MensagemCota('Este perfil está incorreto e não poderá ser exibido',
                                     mtConfirmation, 'Mensagem do Sistema',
                                     [mbYes, mbNo], 'Exclui;Continua')
            else
               MensErroMt('Este perfil está incorreto e não poderá ser exibido' + #13 +
                          'Mensagem: ' + E.Message);

            if iResp = mrYes then
            begin
               // Exclui o Perfil com problemas
               Cds.Delete;
               CtrlPerfilCota.ExcluiPerfilCota;
            end;
            trvPerfil.Items.Clear;
            trvAtivo.Items.Clear;
            Seleciona (-1);
            CdsNoPerfilCota.IndexName := 'IndCod';
            DeshabilitaPainelParaNavegacao;
         end;
      end;
      //AL_1 - Fim
   end
   else
      pnlFundo.Enabled := False;

end;

procedure TfrmCadPerfilCota.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  DeshabilitaPainelParaNavegacao;
  IniciaAlteracao;
  trvAtivo.Items.GetFirstNode.Selected := true;
end;


procedure TfrmCadPerfilCota.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlPerfilCota.ExcluiPerfilCota;
  trvPerfil.Items.Clear;
  trvAtivo.Items.Clear;
  trvPerfil.Items.Clear;
end;



procedure TfrmCadPerfilCota.MontaPastaAtivoSelecionado;
//==============================================================================
//
//  Esta função monta as pastas do perfil de ativo criado pelo usuário, baseado
// na tabela NOPERFILATIVO.
//
//
//==============================================================================

var
sCodHierarqPai  : string;
pPasta,pPapel: pItem;
bPasta : boolean;
NoEmFoco : TTreeNode;
Arvore : TTreeView;
Nivel,PosicaoReg,TotalReg : integer;

begin

  frmProgresso.MostraFormProgresso('Aguarde, montando árvore de perfil cadastrado...',False,False,True,0,100);
  TotalReg   := CdsNoPerfilCota.RecordCount + CdsNoPerfilXAtivo.RecordCount;
  PosicaoReg := 0;
  Arvore     := trvPerfil;
  NoEmFoco   := nil;

    //**************************************************************************
    //                      INSERINDO PASTAS / SUBPASTAS
    //**************************************************************************


  while not CdsNoPerfilCota.Eof do begin

    // montar o ramo da árvore
    new(pPasta);
    pPasta.CodHierarquico   := CdsNoPerfilCota.FieldByName('CODHIERARQUICO').AsString;
    pPasta.IDAtivoCota      := -1;
    pPasta.IdNoPerfilXAtivo := -1;
    pPasta.IDNoPerfilCota   := CdsNoPerfilCota.FieldByName('IDNOPERFILCOTA').AsInteger;
    pPasta.NoPerfil         := nil;
    pPasta.sDescAtivo       := CdsNoPerfilCota.FieldByName('DESCRICAO').AsString;


    sCodHierarqPai :=  RetornaCodHierarqPai(pPasta.CodHierarquico);
    Nivel          :=  RetornaNivelCodHierarquico(pPasta.CodHierarquico);
    bPasta         :=  (Nivel = 0);


     if not bPasta then begin
       //  Caso seja uma subpasta
       if Nivel > NoEmFoco.Level then
         pPasta.NoPerfil :=  NoEmFoco;
       if Nivel < NoEmFoco.Level then begin
         repeat
           NoEmFoco := NoEmFoco.Parent;
         until Nivel > NoEmFoco.Level;
         pPasta.NoPerfil := NoEmFoco;
       end;
       if Nivel = NoEmFoco.Level then begin
         NoEmFoco := NoEmFoco.Parent;
         pPasta.NoPerfil := NoEmFoco;
       end;
     end;


    //  Insere a Pasta/Subpasta na árvore
    NoEmFoco := InserePasta(bPasta,Arvore,pPasta.NoPerfil,pPasta);


   //**************************************************************************
    //                         INSERINDO PAPÉIS
    //**************************************************************************

    //  Agora, é feito uma filtragem no CdsNoPerfilxAtivo através do cod. hierárquico,
    //para selecionar todos os papéis (ativos) referentes à pasta/subpasta criada
    CdsNoPerfilXAtivo.Filter   := 'CODHIERARQUICO = ' + QuotedStr(pPasta.CodHierarquico);
    CdsNoPerfilXAtivo.Filtered := true;

    //  Faz um Loop e insere os ativos dentro da pasta/subpasta criada
    while not CdsNoPerfilXAtivo.Eof do begin
      new(pPapel);
      pPapel.CodHierarquico   := CdsNoPerfilXAtivo.FieldByName('CODHIERARQUICO').AsString;
      pPapel.IDAtivoCota      := CdsNoPerfilXAtivo.FieldByName('IDATIVOCOTA').AsInteger;
      pPapel.IdNoPerfilXAtivo := CdsNoPerfilXAtivo.FieldByName('IDNOPERFILXATIVO').AsInteger;
      pPapel.IDNoPerfilCota   := CdsNoPerfilCota.FieldByName('IDNOPERFILCOTA').AsInteger;
      pPapel.NoPerfil         := NoEmFoco;
      pPapel.sDescAtivo       := CdsNoPerfilXAtivo.FieldByName('ATIVO').AsString;

      InserePapel(trvPerfil,NoEmFoco,pPapel);
      Inc(PosicaoReg);
      frmProgresso.AndaFormProgresso(PosicaoReg,TotalReg);
      CdsNoPerfilXAtivo.Next;
    end;

    CdsNoPerfilXAtivo.Filtered := false;
    CdsNoPerfilCota.Next;
    Inc(PosicaoReg);
    frmProgresso.AndaFormProgresso(PosicaoReg,TotalReg);
  end;

  CdsNoPerfilXAtivo.Filtered  := false;
  frmProgresso.EscondeFormProgresso;
end;




procedure TfrmCadPerfilCota.btnVoltaTodosClick(Sender: TObject);
begin
  inherited;
  if VerificaInsereAtivosNovos then begin
    //  Verifica se o primeiro filho do nó selecionado é uma pasta
    if trvAtivo.Selected.getFirstChild.ImageIndex = 0 then begin
      //InsereTodosGeral(trvAtivo.Selected,trvPerfil.Selected);
    //  Caso o primeiro filho do nó selecionado não seja uma pasta...
    end else begin
      InsereTodosPasta;
    end;


  
  end;
end;


procedure TfrmCadPerfilCota.seleciona(const iIdPerfilCota: integer);
begin
  //  Abre os Cds's do form, conforme critérios estabelecidos
  //em qry's do Control Object
  Cds.Data               := CtrlPerfilCota.ListaPerfilCota(iIdPerfilCota);
  CdsNoPerfilCota.Data   := CtrlPerfilCota.ListaNoPerfilCota(iIdPerfilCota);
  CdsNoPerfilXAtivo.Data := CtrlPerfilCota.ListaNOPERFILXATIVO(iIdPerfilCota);
end;


function TfrmCadPerfilCota.RetornaCodHierarquico(const Arvore: TTreeView;No: TTreeNode): string;
//==============================================================================
//
//   Esta função retorna o código hierarquico da pasta que está sendo
// criada/editada
//
//==============================================================================
var
Nivel  : Integer;
CodHierarquico : string;

begin
  inherited;

  if Arvore.Items.Count <> 0 then begin
    Nivel := No.Level;
    CodHierarquico := Format('%.2d',[No.Index + 1]);

    while No <> nil  do begin
      if No.Level < Nivel then begin
        CodHierarquico := Format('%.2d.',[No.Index + 1]) + CodHierarquico;
        Nivel          := No.Level;
      end;
      No := No.GetPrev;
    end;

  end else CodHierarquico := '01';
  Result := CodHierarquico;
end;




function TfrmCadPerfilCota.RetornaCodHierarqPai(
  const codhierarquico: string): string;
var
i : integer;
sCodhierarquicoAux : string;
AchouPai : Boolean;

begin
  AchouPai := False;
  sCodhierarquicoAux := '';
  for i := Length(codhierarquico) downto 1 do begin
    if codhierarquico[i] <> '.' then begin
      if AchouPai then
        sCodhierarquicoAux := codhierarquico[i] + sCodhierarquicoAux;
    end else begin
    if (codhierarquico[i] = '.') and (AchouPai = True) then
      sCodhierarquicoAux := codhierarquico[i] + sCodhierarquicoAux;
    AchouPai := True;
    end;
  end;
  if sCodhierarquicoAux = '' then sCodhierarquicoAux := '0';

  Result := sCodhierarquicoAux;
end;



function TfrmCadPerfilCota.RetornaNivelCodHierarquico(
  const codhierarquico: string): integer;
var
i, Nivel : integer;
begin
  Nivel := -1;
  for i := 1 to Length(codhierarquico) do begin
    if codhierarquico[i] = '.' then
    Inc(Nivel);
  end;
  Nivel := Nivel + 1;
  Result := Nivel;

end;


procedure TfrmCadPerfilCota.HabilitaPainelParaNavegacao;
begin
  pnlBotoes.Enabled       := False;
  Panel1.Enabled          := False;
  mnuIncluirPasta.Enabled := False;
  mnuIncluirItem.Enabled  := false;
  mnuAlterar.Enabled      := false;
  mnuExcluir.Enabled      := false;
end;

procedure TfrmCadPerfilCota.DeshabilitaPainelParaNavegacao;
begin
  pnlFundo.Enabled        := False;
  pnlBotoes.Enabled       := True;
  Panel1.Enabled          := True;
end;

procedure TfrmCadPerfilCota.mnuExcluirClick(Sender: TObject);
begin
  inherited;
  btnPassaUm.Click;
end;



procedure TfrmCadPerfilCota.RetornaAtivoNo(NoOrigem: TTreeNode);
var
pPapel : pItem;
begin

 pPapel := NoOrigem.Data;


 InserePapel(trvAtivo,pPapel.NoAtivo,pPapel);
 if CdsNoPerfilXAtivo.Locate('IDATIVOCOTA',pItem(trvPerfil.Selected.Data)^.IDAtivoCota,[]) then
   CdsNoPerfilXAtivo.Delete;
 trvPerfil.Selected.Delete;
end;


function TfrmCadPerfilCota.VerificaExcluiAtivo: Boolean;
begin
//Críticas  antes de deletar o registro
  Result := False;
  try
    if trvAtivo.Items.Count = 0 then
      raise EValidacao.CreateVal ('Selecione um perfil do ativo para prosseguir com esta operação', grpPerfilAtivo);
    if trvPerfil.Items.Count = 0 then
      raise EValidacao.CreateVal ('É necessário criar um perfil pasta para poder prosseguir com esta operação', trvPerfil);
    if trvPerfil.Selected.HasChildren then begin
      if MsgDlg('Existem filhos dentro desta pasta e que possam conter '   + #13 +
                'ativos, que serão retornados à lista de ativos. Tem certeza '     + #13 +
                'que deseja removê-los?','Cotas Gerenciais',mtConfirmation,[mbYes,mbNo],0) = mrYes then begin
     end else Exit;
    end;
   except
    on ev : EValidacao do begin
      if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
      Repaint;
      if ev.Control.CanFocus then ev.Control.SetFocus;
      Exit;
    end;
  end;
  Result := True;
end;


procedure TfrmCadPerfilCota.btnPassaTodosClick(Sender: TObject);
var
i, TotalAtivosNo : integer;

begin
  inherited;
  if VerificaPassaTodos then begin
    TotalAtivosNo := trvPerfil.Selected.Count;
    trvPerfil.Selected.getFirstChild.Selected := true;
    for i := 1 to TotalAtivosNo do
      RetornaAtivoNo(trvPerfil.Selected);
  end;
end;

procedure TfrmCadPerfilCota.MarcaModificado(const sCodHierarquico: string);
begin
  if CdsNoPerfilCota.Locate('CODHIERARQUICO', sCodHierarquico, []) then begin
    if CmeCadastro.Operacao = opAlterar then begin
      CdsNoPerfilCota.Edit;
      CdsNoPerfilCota.FieldByName('MODIFICADO').AsString := 'S';
      CdsNoPerfilCota.Post;
    end;
  end;
end;

procedure TfrmCadPerfilCota.FinalizaAlteracao;
begin
  btnPassaUm.Enabled     := True;
  btnPassaTodos.Enabled  := True;
  grpPerfilAtivo.Enabled := True;
end;


procedure TfrmCadPerfilCota.IniciaAlteracao;
begin
  btnPassaUm.Enabled     := False;
  btnPassaTodos.Enabled  := False;
  grpPerfilAtivo.Enabled := False;
end;


procedure TfrmCadPerfilCota.RefazCodHierarquico(Arvore: TTreeView);
var
Nivel: Integer;
No: TTreeNode;

begin

  No    := Arvore.Selected;
  Nivel := No.Level;

  while No.Level >= Nivel do begin
    if No.ImageIndex = 0 then begin
      if CdsNoPerfilCota.Locate('CODHIERARQUICO',pItem(No.Data)^.CodHierarquico,[]) then begin
        CdsNoPerfilCota.Edit;
        CdsNoPerfilCota.FieldByName('CODHIERARQUICO').AsString := RetornaCodHierarquico(trvPerfil,No);
        CdsNoPerfilCota.Post;
        pItem(No.Data)^.CodHierarquico := CdsNoPerfilCota.FieldByName('CODHIERARQUICO').AsString;
      end;
    end else begin
      if CdsNoPerfilXAtivo.Locate('CODHIERARQUICO', pItem(No.Data)^.CodHierarquico,[]) then begin
        CdsNoPerfilXAtivo.Edit;
        CdsNoPerfilXAtivo.FieldByName('CODHIERARQUICO').AsString := pItem(No.Parent.Data)^.CodHierarquico;
        CdsNoPerfilXAtivo.Post;
        pItem(No.Data)^.CodHierarquico := pItem(No.Parent.Data)^.CodHierarquico;
      end;
    end;
    No := No.GetNext;
    if No = nil then Exit;
  end;
end;


function TfrmCadPerfilCota.VerificaInsereAtivosNovos: Boolean;
begin
  //Críticas  antes de inserir os registros
  Result := False;
  try
    if trvAtivo.Items.Count = 0 then
      raise EValidacao.CreateVal ('Selecione um perfil do ativo para prosseguir com esta operação', grpPerfilAtivo)
    else if trvPerfil.Items.Count = 0 then
      raise EValidacao.CreateVal ('É necessário criar uma pasta no perfil para poder prosseguir com esta operação', trvPerfil)
    else if trvPerfil.Selected.ImageIndex <> 0 then
      raise EValidacao.CreateVal ('Selecione uma pasta ou subpasta de perfil para poder continuar esta operação!', trvPerfil)
    else if trvAtivo.Selected.ImageIndex <> 0 then
      raise EValidacao.CreateVal ('Selecione uma pasta ou subpasta de ativos para poder continuar esta operação!', trvAtivo)
    else if trvPerfil.Selected.HasChildren then begin
      if trvPerfil.Selected.getFirstChild.ImageIndex = 0 then
        raise EValidacao.createVal ('Só é permitido inserir um ativo no final de cada nó da árvore',trvPerfil);
    end;

   except
    on ev : EValidacao do begin
      if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
      Repaint;
      if ev.Control.CanFocus then ev.Control.SetFocus;
      Exit;
    end;
  end;
  Result := True;
end;


function TfrmCadPerfilCota.VerificaNivelMascara: Integer;
var
i,Nivel: integer;
begin

  Nivel  := 0;
  for i  := 1 to Length(sMascaraHierarquica) do begin
    if sMascaraHierarquica[i] = '.' then
    Inc(Nivel);
  end;
  Result := Nivel;
end;


function TfrmCadPerfilCota.VerificaPassaTodos: Boolean;
begin
    //Críticas  antes de inserir os registros
  Result := False;
  try
    if trvAtivo.Items.Count = 0 then
      raise EValidacao.CreateVal ('Selecione um perfil do ativo para prosseguir com esta operação', grpPerfilAtivo);
    if trvPerfil.Items.Count = 0 then
      raise EValidacao.CreateVal ('É necessário criar uma pasta no perfil para poder prosseguir com esta operação', trvPerfil);
    if trvPerfil.Selected.HasChildren then begin
      if trvPerfil.Selected.getFirstChild.ImageIndex = 0 then
        raise EValidacao.CreateVal ('Selecione uma pasta de perfil cujo contenha somente ativos!', trvPerfil);
    end;
    if trvAtivo.Selected.HasChildren then begin
      if trvAtivo.Selected.getFirstChild.ImageIndex = 0 then
        raise EValidacao.CreateVal ('Selecione uma pasta onde contenha ativos para prosseguir esta operação!!', trvAtivo);
    end;
    if trvPerfil.Selected.ImageIndex <> 0 then
      raise EValidacao.CreateVal ('Selecione uma pasta ou subpasta de perfil para poder continuar esta operação!', trvPerfil);
    if trvAtivo.Selected.ImageIndex <> 0 then
      raise EValidacao.CreateVal ('Selecione uma pasta ou subpasta de ativos para poder continuar esta operação!', trvAtivo);
   except
    on ev : EValidacao do begin
      if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
      Repaint;
      if ev.Control.CanFocus then ev.Control.SetFocus;
      Exit;
    end;
  end;
  Result := True;
end;


procedure TfrmCadPerfilCota.trvPerfilEdited(Sender: TObject; Node: TTreeNode;
  var S: String);
var
ValorAnterior : string;

begin
  inherited;
   try
     //  Após a edição da pasta/subpasta, é gravado a alteração no cds...
     ValorAnterior := trvPerfil.Selected.Text;
     CdsNoPerfilCota.FieldByName('DESCRICAO').AsString := S;
     CdsNoPerfilCota.Post;
     //  Retorna a árvore para somente leitura
     trvPerfil.ReadOnly := True;
   except
     //  Em caso de duplicidade de pastas/subpastas em um mesmo nível, é cancelada
     //retornada ao cds o texto anterior à edição...
     S := ValorAnterior;
     MsgDlg('Não é possível inserir uma pasta com o mesmo nome, no mesmo nível!',Sistema.NomeAplicativo,mtWArning,[mbOk],0);
     CdsNoPerfilCota.FieldByName('DESCRICAO').AsString := ValorAnterior;
     CdsNoPerfilCota.Post;
     //  Retorna a árvore para somente leitura
     trvPerfil.ReadOnly := True;
   end;

   // Obs: Verificação de duplicidade de pastas/subpastas feita através de índice no Cds.
end;


procedure TfrmCadPerfilCota.DeletarPastaSelecionada;
begin
  if CdsNoPerfilCota.Locate('CODHIERARQUICO',pItem(trvPerfil.Selected.Data)^.CodHierarquico,[]) then
    CdsNoPerfilCota.Delete;
  end;
procedure TfrmCadPerfilCota.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
   pnlFundo.Enabled := true;
end;


procedure TfrmCadPerfilCota.InserePapel(Arvore: TTreeView;
  NoDestino: TTreeNode; pDesc: pItem);
var
No: TTreeNode;

begin
  No := Arvore.Items.AddChildObject(NoDestino,pDesc.sDescAtivo,pDesc);
  No.ImageIndex    := 2;
  No.SelectedIndex := 3;

end;

function TfrmCadPerfilCota.InserePasta(EumaPasta: Boolean; Arvore: TTreeView;
  NoDestino: TTreeNode; pDesc: pItem): TTreeNode;
var
No: TTreeNode;

begin
  if EumaPasta then
    No := Arvore.Items.AddObject(NoDestino,pDesc.sDescAtivo,pDesc)
  else
    No := Arvore.Items.AddChildObject(NoDestino,pDesc.sDescAtivo,pDesc);
  No.ImageIndex    := 0;
  No.SelectedIndex := 1;
  Result := No;
end;



procedure TfrmCadPerfilCota.InsereTodosPasta;
var
TotalAtivosNo,i: integer;
pPapel: pItem;

begin
  TotalAtivosNo := trvAtivo.Selected.Count;
    trvAtivo.Selected.getFirstChild.Selected := true;
    for i := 1 to TotalAtivosNo do begin
      pPapel := trvAtivo.Selected.Data;
      pPapel.NoAtivo  := trvAtivo.Selected.Parent;
      pPapel.NoPerfil := trvPerfil.Selected;
      pPapel.CodHierarquico := pItem(trvPerfil.Selected.Data)^.CodHierarquico;
      InserePapel(trvPerfil,pPapel.NoPerfil,pPapel);
      CdsNoPerfilXAtivo.Append;
      CdsNoPerfilXAtivo.FieldByName('CODHIERARQUICO').AsString := pPapel.CodHierarquico;
      CdsNoPerfilXAtivo.FieldByName('IDATIVOCOTA').AsInteger   := pPapel.IDAtivoCota;
      CdsNoPerfilXAtivo.Post;
      trvAtivo.Selected.Delete;
    end;
end;


procedure TfrmCadPerfilCota.InsereTodosGeral(NoOrigem, NoDestino: TTreeNode);
Var
Indice, Nivel: Integer;
pObjeto: pItem;
NoPapel: TTreeNode;

begin
  Nivel   := NoOrigem.Level;
  Indice  := NoOrigem.Index;
  NoPapel := nil;



  //  Verifica se a quantidade de nós dentro do nó selecionado está dentro do limite
  //estabelecido pela máscara hierárquica, para o nó onde se deseja inserir ativos.
  if (trvPerfil.Selected.Level + 1 + RetornaNivelMaxNo(trvAtivo.Selected)) > RetornaNivelCodHierarquico(sMascaraHierarquica) then begin
    MsgDlg('Nível dos nós fora do limite',Sistema.NomeAplicativo,mtWarning,[mbOk],0);
  end else begin


    //  Agora, é feito um loop no nó de origem e passado para o nó de destino todas as
    //pastas e ativos encontrados no loop...
    while NoOrigem <> nil do begin

      //  Verifica se o nó mudou de posição...
      if (NoOrigem.Index <> Indice) and (NoOrigem.Level = Nivel) then Break
      else if (NoOrigem.Level < Nivel) then Break
      else begin

        //  Caso o objeto encontrado seja uma pasta...
        if NoOrigem.ImageIndex = 0 then begin
          pObjeto := NoOrigem.Data;
          if NoPapel = nil then
            pObjeto.NoPerfil := NoDestino
          else
            pObjeto.NoPerfil := NoOrigem;
          Nopapel := InserePasta(False,trvPerfil,pObjeto.NoPerfil,pObjeto);
        end else begin

        //  Caso o objeto encontrado seja um papel...
          pObjeto := NoOrigem.Data;
          pObjeto.NoPerfil := NoPapel;
          InserePapel(trvPerfil,pObjeto.NoPerfil,pObjeto);
        end;
      end;

      NoOrigem := NoOrigem.GetNext;
    end;

  end;



end;




function TfrmCadPerfilCota.RetornaNivelMaxNo(No: TTreeNode): Integer;
var
Indice, Nivel, NivelMaior, NiveldoNo: integer;

begin
  Indice := No.Index;
  Nivel  := No.Level;
  NivelMaior := 0;
  NiveldoNo  := 0;

  while No <> nil do begin
    if (No.Index <> Indice) and (No.Level = Nivel) then Break
    else if (No.Level < Nivel) then Break
    else begin
      if No.ImageIndex = 0 then begin
        if No.Level > NivelMaior then begin
          NivelMaior := No.Level;
          Inc(NiveldoNo);
        end;
      end;
    end;

    No := No.GetNext;
  end;

  Result := NiveldoNo;
end;

end.

