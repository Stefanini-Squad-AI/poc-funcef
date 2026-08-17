//------------------------------------------------------------------
// Sistema   .: Sistema de Cálculos Atuariais
// Objetivo  .: Formulário de Criação de Tabelas
//              Form - FrmCriaTabela  /  Unit - UCriaTabela
// Data      .: 06/06/1998
// Autor     .: Alexandre Ramos
//------------------------------------------------------------------
unit UCriaTabela;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97, ExtCtrls, ComCtrls,
  Grids, Wwdbigrd, Wwdbgrid, Db, DBTables, Wwquery, Wwdatsrc, DBGrids,
  TB97Tlbr, IvDictio, IvMulti, IvEMulti, ImgList;

type
  TFrmCriaTabela = class(TfrmOkCancelar)
    ListaBanco: TTreeView;
    Imagens: TImageList;
    Label1: TLabel;
    Label2: TLabel;
    QryBancoDeDados: TwwQuery;
    Panel1: TPanel;
    Label3: TLabel;
    QrySelecionados: TwwQuery;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    QrySelecionaCampo: TwwQuery;
    QryMostraCampos: TwwQuery;
    Panel2: TPanel;
    PrgBar1: TProgressBar;
    Label7: TLabel;
    QryBancoDeDadosENTIDADE: TStringField;
    QryMostraCamposDESCRICAODOCAMPO: TStringField;
    procedure FormActivate(Sender: TObject);
    procedure ListaBancoDblClick(Sender: TObject);
    procedure ListaBancoChange(Sender: TObject; Node: TTreeNode);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCriaTabela: TFrmCriaTabela;wTabCria:String; wCampo:string;
  wTabela:String; wTabIndex:Integer;

implementation

{$R *.DFM}

procedure TFrmCriaTabela.FormActivate(Sender: TObject);
Var
wTabela:String;
Item:Integer;
PbCont:Integer;
begin
  inherited;

  PbCont:=0;
  Label7.UpDate;
// Inclui Tabelas no TreeView
  While Not QryBancoDeDados.Eof Do
    Begin
// Inclui Tabela no TreeView
      ListaBanco.Items.Add
                (ListaBanco.Items[0],QryBancoDeDadosEntidade.Value);
      ListaBanco.Items.Item[0].Expanded:=True;
      wTabela := QryBancoDeDadosEntidade.Value;
      Item    := ListaBanco.Items.Count - 1;
// Proximo Registro
      QryBancoDeDados.Next;
      PbCont:=PbCont+1;
      PrgBar1.Position:=PbCont;
    End;
// Fecha Query
    Panel2.Visible:=False;
    QryBancoDeDados.Close;
    PrgBar1.Position:=0;
End;

procedure TFrmCriaTabela.ListaBancoDblClick(Sender: TObject);
Var
wIndex,wPbCont:Integer;

begin
  Inherited;
  // Caso wTabela (TABELA) # Vazio
  If wTabela <> '' Then
    Begin
// Caso Campo Vazio
      If wCampo = '' Then
        Begin
// Caso Campos Já Incluidos
          If ListaBanco.Items.Item[wTabIndex].Count <> 0
            Then Exit;
// Inclui campos da Tabela no TreeView
// Abre a Query
          QryMostraCampos.ParamByName('TABELA').AsString:=wTabela;
          QryMostraCampos.Open;
          wIndex:=0;
          wPbCont:=0;
          Panel2.Visible:=True;
          Label7.UpDate;
          PrgBar1.Max:=QryMostraCampos.RecordCount;
          While Not QryMostraCampos.Eof Do
            Begin
// Inclui Campos da Tabela no TreeView
              ListaBanco.Items.AddChild
                (ListaBanco.Items[wTabIndex],
                 QryMostraCamposDescricaoDoCampo.Value);
              ListaBanco.Items.Item[wTabIndex].Item[wIndex].ImageIndex:=2;
              ListaBanco.Items.Item[wTabIndex].Item[wIndex].SelectedIndex:=2;
              wIndex:=wIndex+1;
              wPbCont:=wPbCont+1;
              PrgBar1.Position:=wPbCont;
// Proximo Registro
              QryMostraCampos.Next;
              If QryMostraCampos.Eof Then Break;
            End;
            ListaBanco.Items.Item[wTabIndex].ImageIndex:=1;
            ListaBanco.Items.Item[wTabIndex].SelectedIndex:=1;
            ListaBanco.Items.Item[wTabIndex].Expanded:=True;
            QryMostraCampos.Close;
            Panel2.Visible:=False;
            PrgBar1.Position:=0;
        End
      Else
// Escolheu um Campo
        Begin
        QrySelecionaCampo.Close;
        QrySelecionaCampo.ParamByName('TABELA').AsString:=wTabela;
        QrySelecionaCampo.ParamByName('CAMPO').AsString:=wCampo;
        QrySelecionaCampo.Open;
        End;
    End;
end;

procedure TFrmCriaTabela.ListaBancoChange(Sender: TObject;
  Node: TTreeNode);
begin
  Inherited;
// Guarda o caminho do Item Selecionado (TABELA+CAMPO)
//---------------------------------------------------------
// Caso Item Selecionado Guarda Caminho caso Nivel > 1 (Campo)
  If Node.Level > 0 Then
    Begin
      wTabela   :=Node.Parent.Text;
      wCampo    :=Node.Text;
      wTabIndex :=Node.AbsoluteIndex;
    End
  Else
    Begin
      wTabela   :=Node.Text;
      wCampo    :='';
      wTabIndex :=Node.AbsoluteIndex;
    End;
end;

procedure TFrmCriaTabela.FormShow(Sender: TObject);
begin
  inherited;
//---------------------------------------
// Lista Campos do Banco de Dados e
// Inlcui numa nova Tabela os Campos
// Desejados, para se Criar outra Tabela
//---------------------------------------
// Inclui dados do Banco de dados no TreeView
// Abre a Query
  QryBancoDeDados.Open;
  PrgBar1.Max:=QryBancoDeDados.RecordCount;
end;

procedure TFrmCriaTabela.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
// Fecha Querys
  QryMostraCampos.Close;
  QryBancoDeDados.Close;
  QrySelecionaCampo.Close;
  QrySelecionados.Close;
end;

procedure TFrmCriaTabela.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
// Testa se Algum Campo foi Selecionado
  If QrySelecionados.RecordCount=0 Then
    Begin
      ShowMessage('Nenhum Campo foi Selecionado');
      BbtnSair.Click;
      Exit;
    End;
// Pede Nome da Tabela a Ser Criada
  wTabCria:=InputBox('Sistema Atuarial','Nome da nova Tabela ','');
  If wTabCria = '' Then
    BbtnSair.Click;


end;

End.









