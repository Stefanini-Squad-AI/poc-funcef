//------------------------------------------------------------------
// Sistema   .: RAD
// Objetivo  .: Formulario de Entrada de Senha para Aprovação e Reprovação da
//              Etapa do Processo ...
//              Form - FrmSenha  Unit - FSenha
// Data      .: 05/09/1998
// Autor     .: Alexandre Ramos
//------------------------------------------------------------------
unit FSenha;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, wwdbedit, Db, DBTables, Wwquery, Wwdatsrc,
  ExtCtrls, DBCtrls, TB97Tlbr, TB97;

type
  TFrmSenha = class(TForm)
    Dock971: TDock97;
    tb97Fundo: TToolbar97;
    ToolbarSep971: TToolbarSep97;
    ToolbarSep973: TToolbarSep97;
    ToolbarSep975: TToolbarSep97;
    ToolbarSep977: TToolbarSep97;
    ToolbarSep974: TToolbarSep97;
    BtAlterar: TBitBtn;
    BtSair: TBitBtn;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Image1: TImage;
    DbSenha: TwwDBEdit;
    MEMO1: TMemo;
    DsUsuarios: TwwDataSource;
    QryUsuarios: TwwQuery;
    QryAux: TwwQuery;
    Bevel1: TBevel;
    procedure BtSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtAlterarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    wIdUsuario:Integer;
    wIdAuto   :Integer;
    wTipo     :String; 
    wResult   :Boolean;
    wSenhaUsada:String;
  end;

var
  FrmSenha: TFrmSenha;

implementation

Uses UCripto,CompoRAD;
{$R *.DFM}
//----------------------------------------------
// Botao Sair
procedure TFrmSenha.BtSairClick(Sender: TObject);
begin
// Fecha Formulario
  Close;
end;

procedure TFrmSenha.FormShow(Sender: TObject);
begin
  DbSenha.SetFocus;
end;

//-----------------------------------------------------------------------
// Fecha Formulario
procedure TFrmSenha.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  QryUsuarios.Close;
end;

//-----------------------------------------------------------------------
// Confere Senha
procedure TFrmSenha.BtAlterarClick(Sender: TObject);
begin
// Busca Senha do Usuario
  QryUsuarios.ParamByName('wIdUsuario').AsInteger:=wIdUsuario;
  QryUsuarios.Close;
  QryUsuarios.Open;
// Senha Não Confere com a Atual

// Senha Confere
  ExecutarQuery(QryAux,'UPDATE PESSXAUTOETAPA SET OBSAUTORIZPESSOA = '''+Memo1.Text+
                      ''' WHERE IDAUTO = '+IntToStr(wIdAuto));
 wResult    :=True;
 Close;
end;

end.
