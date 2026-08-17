//------------------------------------------------------------------
// Sistema   .: RAD
// Objetivo  .: Formulário de Criação Senhas de Autorização para o Usuário
//              Form - FrmManutSenha /  Unit - FManutSenha
// Data      .: 12/08/1998
// Autor     .: Alexandre Ramos
//------------------------------------------------------------------
unit FManutSenha;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, StdCtrls, wwdblook, MontaSelect, DBTables, Db, Wwdatsrc,
  Wwquery, TB97, MAHlpBtn, Buttons, ExtCtrls, Mask, wwdbedit, Wwdotdot,
  Wwdbcomb, Grids, DBGrids, TB97Ctls, TB97Tlbr, IvDictio, IvMulti, IvEMulti,
  CmEventosCadastro, ImgList;

type
  TFrmManutSenha = class(TfrmCadastroCS)
    Label1: TLabel;
    LkcUsuarios: TwwDBLookupCombo;
    DbSenhaNova: TwwDBEdit;
    Label2: TLabel;
    DbSenhaConfirma: TwwDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    DbSenhaAtual: TwwDBEdit;
    Label5: TLabel;
    SpeedButton1: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LkcUsuariosNotInList(Sender: TObject;
      LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FazerConfirma;override;
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmManutSenha: TFrmManutSenha;

implementation

uses DBaseDados,USistema, UCripto, UDataBase;

{$R *.DFM}

procedure TFrmManutSenha.FormShow(Sender: TObject);
begin
  inherited;
// Abre as Querys
  Qry.Open;
// Busca Usuario do Sistema e Mostra 
  LkcUsuarios.Value:=IntToStr(Sistema.IDUSUARIO);
  SbtnAlterar.Enabled:=True; 
// Inabilita Botoes
  BbtnConfirmar.Enabled:=False;
  BbtnCancelar.Enabled :=False;
end;

procedure TFrmManutSenha.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
// Fecha  as Querys
  Qry.Close;
end;

//---------------------------------------------------------
// Usuario escolhido não esta na Lista
Procedure TFrmManutSenha.LkcUsuariosNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
Begin
  Inherited;
  ShowMessage('Usuário não Encontrado !!!');
  Accept:=False;
End;

//---------------------------------------------------------
// Confirma alteração de Senha
Procedure TFrmManutSenha.bbtnConfirmarClick(Sender: TObject);
Begin
// usuario não Selecionado
  If LkcUsuarios.Text = '' Then Begin
    Showmessage('Usuário não Selecionado !!!!');
    DbSenhaNova.SetFocus;
    Exit;
  End;
// Senha Nova ou Confirmada Vazias
  If (DbSenhaNova.Text = '') Or (DbSenhaConfirma.Text = '')  Then Begin
    Showmessage('Senhas, Nova e Confirmação tem que ser Preenchidas !!!!');
    DbSenhaNova.SetFocus;
    Exit;
  End;
// Senha Nova não corresponde a Confirmação
  If (DbSenhaNova.Text <> DbSenhaConfirma.Text) Then Begin
    Showmessage('Senha Confirmada diferente da Nova !!!!');
    DbSenhaNova.SetFocus;
    Exit;
  End;
// Altera Senha na Tabela
  Try
    Qry.Edit;

    Inherited;
    Showmessage('Alteração de Senha Confirmada !!!!');
  Except
    Showmessage('Alteração não Confirmada  !!!!');
  End;
End;

//-----------------------------------------------------------------------------
// Procedures do Padrão \\

//----------------------------------------------
// Confirmar
procedure TFrmManutSenha.FazerConfirma;
Begin
  ds.DataSet.CheckBrowseMode;
  dtmBaseDados.dbBaseDados.ApplyUpdates([qry]);
end;

// Fim Procedures do Padrao \\
//-------------------------------------------------------------------------


//----------------------------------------------
// Restaura Senha Original (mude sua senha)
procedure TFrmManutSenha.SpeedButton1Click(Sender: TObject);
begin
  inherited;
// Altera Senha na Tabela para "mude sua senha"
  Try
    Qry.Edit;
    FazerConfirma;
    Showmessage('Alteração Confirmada, Sua nova senha é " mudesuasenha " ');
  Except
    Showmessage('Alteração não Confirmada  !!!!');
  End;
end;

end.
