unit FMostraPassos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Wwdatsrc, DBTables, Wwquery, Grids, Wwdbigrd, Wwdbgrid, StdCtrls;

type
  TFrmMostraPassos = class(TForm)
    QryPassosRegra: TwwQuery;
    DsPassosRegra: TwwDataSource;
    DdGrid: TwwDBGrid;
    MemoSQL: TMemo;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    IdStrRegra, CodStrPassoAtual, SQL:String;
    TipoInformacao:Char;
  end;

var
  FrmMostraPassos: TFrmMostraPassos;


implementation

{$R *.DFM}

Uses FPAssoAPasso;

procedure TFrmMostraPassos.FormShow(Sender: TObject);
begin
  DdGrid.Visible  := False;
  MemoSQL.Visible := False;

//------------------------------------------------------------------------------
// Caso Mostre os Passoa da Regra
  If TipoInformacao = 'P' Then Begin
    FrmPassoAPasso.BtPassos.Enabled := False;
    DdGrid.Visible  := True;
// Busca os Passos da Regra
    QryPassosRegra.Close;
    QryPassosRegra.ParamByName('IDREGRA').AsString := IdStrRegra;
    QryPassosRegra.Open;
// Localiza o Passo Atual
    QryPassosRegra.Locate('IDALGORITMODAREG',CodStrPassoAtual,[]);

// Atualiza Cabecalho do Formulario
    FrmMostraPassos.Caption := 'Passos da Regra, '+IdStrRegra+' - '+
                                                   QryPassosRegra.FieldByName('NOMEREGRA').AsString;

//------------------------------------------------------------------------------
// Caso Mostre o SQL da Regra
  End Else If TipoInformacao = 'Q' Then Begin
    FrmPassoAPasso.BtSQL.Enabled   := False;
    MemoSQL.Visible := True;
    MemoSQL.Text    := SQL;
// Atualiza Cabecalho do Formulario
    FrmMostraPassos.Caption := 'SQL da Regra ';
  End;

end;

procedure TFrmMostraPassos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  If TipoInformacao = 'P' Then Begin
    FrmPassoAPasso.BtPassos.Enabled := True;
  End Else Begin
    FrmPassoAPasso.BtSQL.Enabled    := True;
  End;
end;



end.