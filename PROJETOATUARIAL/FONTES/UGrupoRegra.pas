//------------------------------------------------------------------
// Sistema   .: Sistema de Cálculos Atuariais
// Objetivo  .: Formulário de Grupos de Regras 
//              Form - FrmGrupoRegra  /  Unit - UGrupoRegra
// Data      .: 10/07/1998
// Autor     .: Alexandre Ramos
//------------------------------------------------------------------
unit UGrupoRegra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastro, StdCtrls, Buttons, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
  DBCtrls, Mask, cmseldlg, wwidlg, Db, Wwdatsrc, TB97, MAHlpBtn, ExtCtrls,
  DBTables, Wwquery, wwdblook, TB97Ctls, TB97Tlbr, IvDictio, IvMulti,
  IvEMulti;

type
  TFrmGrupoRegra = class(TfrmCadastro)
    DBEdit1: TDBEdit;
    DBMemo1: TDBMemo;
    pgctrlDetalhe: TPageControl;
    tbshDetalhe: TTabSheet;
    DbGrdDet: TwwDBGrid;
    PnlDetalhe: TPanel;
    pnlBarraDetalhe: TPanel;
    BtProc: TSpeedButton;
    BtExcl: TSpeedButton;
    btAlt: TSpeedButton;
    BtIns: TSpeedButton;
    bbtnOkDet: TBitBtn;
    bbtnCancelarDet: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    QryPrincipal: TwwQuery;
    QryAux: TwwQuery;
    QryDetalhe: TwwQuery;
    DsDet: TwwDataSource;
    Label5: TLabel;
    DBMemo2: TDBMemo;
    DBEdit3: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit4: TDBEdit;
    QryPrincipalIDGRUPOREGRA: TFloatField;
    QryPrincipalDESCRICAO: TStringField;
    QryPrincipalOBSERVACAO: TStringField;
    DbEdit2: TwwDBLookupCombo;
    DsBuscaRegra: TwwDataSource;
    QryBuscaRegra: TwwQuery;
    QryDetalheNOMEREGRA: TStringField;
    QryDetalheIDREGRA: TFloatField;
    QryDetalheDESCRICAO: TStringField;
    QryDetalheIDGRUPOREGRA: TFloatField;
    QryDetalheSEQUENCIA: TFloatField;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryPrincipalBeforePost(DataSet: TDataSet);
    procedure QryDetalheBeforePost(DataSet: TDataSet);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure dbnavClick(Sender: TObject; Button: TNavigateBtn);
    procedure BtExclClick(Sender: TObject);
    procedure BtInsClick(Sender: TObject);
    procedure btAltClick(Sender: TObject);
    procedure BtProcClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure DbGrdDetDblClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure DbEdit2NotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
    procedure SairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  function SePublicada: boolean;    
  end;

var
  FrmGrupoRegra: TFrmGrupoRegra;

implementation

uses UBibliotecaAtuarial,UDataBase,Usistema;

{$R *.DFM}

procedure TFrmGrupoRegra.FormShow(Sender: TObject);
begin
  inherited;
// Abre As Querys
  QryPrincipal.Open;
  QryDetalhe.Open;
  QryBuscaRegra.Open;
// Mostra Grid
  PnlDetalhe.Visible:=False;
  DbGrdDet.Visible:=True;

end;

procedure TFrmGrupoRegra.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
// Fecha As Querys
  QryPrincipal.Close;
  QryDetalhe.Close;
  QryBuscaRegra.Close;

end;

procedure TFrmGrupoRegra.QryPrincipalBeforePost(DataSet: TDataSet);
begin
  inherited;
// Caso Botao Incluir Cria Novo Registro
  If SBtnInserir.Down Then
    QryPrincipal.FieldByName('IDGRUPOREGRA').AsInteger :=
        LeUltRegistro(qryAux,'GRUPOSDEREGRAS');

end;

procedure TFrmGrupoRegra.QryDetalheBeforePost(DataSet: TDataSet);
begin
  inherited;
// Caso Botao Incluir Cria Novo Registro
  If BtIns.Down = True Then Begin
// Campo de Grupo = Principal
    QryDetalhe.FieldByName('IDGRUPOREGRA').AsInteger :=
        QryPrincipal.FieldByName('IDGRUPOREGRA').AsInteger;
// Sequencia
    QryDetalhe.FieldByName('SEQUENCIA').AsInteger :=
        QryDetalhe.RecordCount + 1;
  End;
end;

procedure TFrmGrupoRegra.bbtnOkDetClick(Sender: TObject);
begin
  inherited;
// Baixa na Tabela
  QryDetalhe.Post;
// Caso Inclusao Ja Inclui Outro
  If BtIns.Down=True Then Begin
    QryDetalhe.Append;
    DbEdit2.SetFocus;
  End Else Begin 
// Alterar Registro
    QryDetalhe.Edit;
  End;
end;

procedure TFrmGrupoRegra.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
// Cancela Operacao
  QryDetalhe.Cancel;
// Levanta Botoes
  BtIns.Down :=False;
  BtAlt.Down :=False;
// Inabilita Botoes
  BtIns.Enabled :=True;
  BtAlt.Enabled :=True;
  BtProc.Enabled:=True;
  BtExcl.Enabled:=True;
// ReExecuta a Query
  QryDetalhe.Close;
  QryDetalhe.Open;
// Mostra Grid
  PnlDetalhe.Visible:=False;
  DbGrdDet.Visible:=True;
// Mostra Incluidos
  DbGrdDet.ApplySelected;

end;

procedure TFrmGrupoRegra.dbnavClick(Sender: TObject;
  Button: TNavigateBtn);
begin
  inherited;
// Executa query de Detalhe
  With QryDetalhe Do Begin
    Close;
    Open;
  End;
end;

function TFrmGrupoRegra.SePublicada: boolean;
var
 num,elemento,pesquisa : string;
 pub : boolean;
begin
 pub := false;
 pesquisa := 'SELECT A.IDSIMULACAO,A.IDGRUPOREGRA,A.PUBLICADA FROM '+
             sistema.PrefixoServidor+'SIMULACOES A, '+
             sistema.PrefixoServidor+'GRUPOSDEREGRAS B '+
             'WHERE B.IDGRUPOREGRA  = '+IntToStr(qryprincipal['IDGRUPOREGRA'])+' AND '+
             'A.IDGRUPOREGRA = B.IDGRUPOREGRA';
 FazQuery(QryAux,pesquisa);
 if not QryAux.eof then begin
   elemento := '';
   pub := false;
   num := '';
   while not QryAux.eof do begin
    if QryAux['PUBLICADA'] = 'S' then begin
     pub := true;
     num := inttostr(QryAux['IDSIMULACAO']);
    end;
    elemento := elemento + inttostr(QryAux['IDSIMULACAO'])+', ';
    QryAux.next;
   end;
   elemento := copy(elemento,1,length(elemento) - 2)+'.';
   showmessage('Esta regra é usada na simulação de número : '+elemento);
   if pub then
    showmessage('Este registro não pode ser excluído, pois a regra é usada'+ #10+#13+ 'pela simulação PUBLICADA de número : '+num);
 end;
 if pub then
  SePublicada := True
 else
  SePublicada := false;
end;

//-------------------------------------------------------------------
// Botao de Excluir
procedure TFrmGrupoRegra.BtExclClick(Sender: TObject);

begin
  inherited;

 if not SePublicada then begin
// Executa query de Detalhe
  With QryDetalhe Do Begin
// Se Nao Houverem Registros de Detalhe, Sai
    If QryDetalhe.RecordCount=0 then begin
      Exit;
    End;
// Se Confirmar, Exclui Registro Posicionado
    If MessageBox(0,'Confirma ?','Mensagem do Sistema ',1) = IdOk Then Begin
      Delete;
      Close;
      Open;
    End
  End;
 end
 else
   exit; 

end;
//-------------------------------------------------
// Incluir Detalhe
procedure TFrmGrupoRegra.BtInsClick(Sender: TObject);
begin
  inherited;

 if not SePublicada then begin
// Abaixa Botao
  BtIns.Down    :=True;
// Inabilita Botoes de Detalhe
  BtAlt.Enabled :=False;
  BtProc.Enabled:=False;
  BtExcl.Enabled:=False;
// Esconde Grid Mostra Painel
  DbGrdDet.Visible  :=False;
  PnlDetalhe.Visible:=True;
  DbEdit2.SetFocus;
// Inclui Novo Registro
  QryDetalhe.Append;
 end
 else begin
  BtIns.Down    := false; 
  exit;
 end;
end;

procedure TFrmGrupoRegra.btAltClick(Sender: TObject);
begin
  inherited;

 if not SePublicada then begin
// Se Nao Houverem Registros de Detalhe, Sai
  If QryDetalhe.RecordCount=0 then begin
    BtAlt.Down    :=False;
    Exit;
  End;
// Abaixa Botao
  BtAlt.Down    :=True;
// Inabilita Botoes de Detalhe
  BtIns.Enabled :=False;
  BtProc.Enabled:=False;
  BtExcl.Enabled:=False;
// Esconde Grid Mostra Painel
  DbGrdDet.Visible  :=False;
  PnlDetalhe.Visible:=True;
  DbEdit2.SetFocus;
// Altera Registro
  QryDetalhe.Edit;
 end
 else begin
  BtAlt.Down    :=False;
  exit;
 end; 

end;

procedure TFrmGrupoRegra.BtProcClick(Sender: TObject);
begin
  inherited;
// Muda Base de Dados e Executa Componente de Pesquisa
  SelDlgProcuraQry.DataSet:=QryDetalhe;
  SelDlgProcuraQry.Execute;
  SelDlgProcuraQry.DataSet:=QryPrincipal;
end;

//----------------------------------------------
// Incluir Grupo
procedure TFrmGrupoRegra.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  DbEdit1.SetFocus;
// Inabilita Botoes de Detalhe
  BtIns.Enabled :=False;
  BtAlt.Enabled :=False;
  BtProc.Enabled:=False;
  BtExcl.Enabled:=False;
end;

//----------------------------------------------
// Confirma  a Inclusao do Grupo
procedure TFrmGrupoRegra.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  DbEdit1.SetFocus;
// Abilita Botoes de Detalhe
  BtIns.Enabled :=True;
  BtAlt.Enabled :=True;
  BtProc.Enabled:=True;
  BtExcl.Enabled:=True;
end;

//----------------------------------------------
// Cancela Inclusao do Grupo
procedure TFrmGrupoRegra.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
// Abilita Botoes de Detalhe
  BtIns.Enabled  :=True;
  BtAlt.Enabled  :=True;
  BtProc.Enabled :=True;
  BtExcl.Enabled :=True;
end;

procedure TFrmGrupoRegra.DbGrdDetDblClick(Sender: TObject);
begin
  inherited;
// Se Nao Houverem Registros de Detalhe, Sai
  If QryDetalhe.RecordCount=0 then begin
    BtAlt.Down    :=False;
    Exit;
  End;
// Abaixa Botao
  BtAlt.Down    :=True;
// Inabilita Botoes de Detalhe
  BtIns.Enabled :=False;
  BtProc.Enabled:=False;
  BtExcl.Enabled:=False;
// Esconde Grid Mostra Painel
  DbGrdDet.Visible  :=False;
  PnlDetalhe.Visible:=True;
  DbEdit2.SetFocus;
// Inclui Novo Registro
  QryDetalhe.Edit;

end;

procedure TFrmGrupoRegra.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
// Seta Focus na Descricao
  DbEdit1.SetFocus;

end;

procedure TFrmGrupoRegra.DbEdit2NotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
  inherited;
// Caso Digitado Nao Esteja na Lista
  ShowMessage('Regra não Encontrada !!!');
  Accept:=False;
end;

procedure TFrmGrupoRegra.SairClick(Sender: TObject);
begin
  inherited BbtnSairClick(Sender);
end;

end.
