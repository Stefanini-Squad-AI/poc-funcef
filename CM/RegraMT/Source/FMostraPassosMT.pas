unit FMostraPassosMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Wwdatsrc, DBTables, Wwquery, Grids, Wwdbigrd, Wwdbgrid, StdCtrls,
  DBClient, uCMClientDataSet;

type
  TFrmMostraPassosMT = class(TForm)
    DsLocal: TwwDataSource;
    DbGridPassos: TwwDBGrid;
    CdsLocal: TCMClientDataSet;
    DbGridDados: TwwDBGrid;
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
  FrmMostraPassosMT: TFrmMostraPassosMT;


implementation

{$R *.DFM}

Uses FPAssoAPassoMT;

procedure TFrmMostraPassosMT.FormShow(Sender: TObject);
begin
  DbGridPassos.Visible  := False;
  DbGridDados.Visible   := False;

  {----------------------------------------------------------------------------}
  { Caso Mostre os Passoa da Regra }
  If TipoInformacao = 'P' Then Begin
    FrmPassoAPassoMT.BtPassos.Enabled := False;
    DbGridPassos.Visible  := True;
    DbGridPassos.DataSource := DsLocal;
    DbGridDados.DataSource  := Nil;

// Localiza o Passo Atual
    CdsLocal.Locate('IDALGORITMODAREG',CodStrPassoAtual,[]);

// Atualiza Cabecalho do Formulario
    FrmMostraPassosMT.Caption := 'Passos da Regra, '+IdStrRegra+' - '+
                                                   CdsLocal.FieldByName('NOMEREGRA').AsString;

//------------------------------------------------------------------------------
// Caso Mostre o SQL da Regra
  End Else If TipoInformacao = 'Q' Then Begin
    FrmPassoAPassoMT.BtSQL.Enabled   := False;
    DbGridDados.Visible := True;

    DbGridPassos.DataSource := Nil;
    DbGridDados.DataSource  := DsLocal;
    

    FrmMostraPassosMT.Caption := 'Dados da Regra ';

  End;

end;

procedure TFrmMostraPassosMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  If TipoInformacao = 'P' Then Begin
    FrmPassoAPassoMT.BtPassos.Enabled := True;
  End Else Begin
    FrmPassoAPassoMT.BtSQL.Enabled    := True;
  End;
  Action := CaFree;
end;

end.