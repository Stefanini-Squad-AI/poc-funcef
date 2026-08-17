unit FGeraSenhaValia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Buttons, StdCtrls, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  TB97Tlbr, TB97, ExtCtrls, IniFiles, uCripto;

type
  TfrmGeraSenhaValia = class(TfrmOkCancelar)
    Label1: TLabel;
    edtArquivo: TEdit;
    SpeedButton1: TSpeedButton;
    OpenDialog: TOpenDialog;
    Label2: TLabel;
    Label3: TLabel;
    edtSenhaAnt: TEdit;
    edtNovaSenha: TEdit;
    procedure SpeedButton1Click(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    ArquivoIni : TIniFile;
    sSenhaAnt  : String;
  public
    { Public declarations }
  end;

var
  frmGeraSenhaValia: TfrmGeraSenhaValia;

implementation

{$R *.DFM}

procedure TfrmGeraSenhaValia.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  if OpenDialog.Execute then
  begin
     edtArquivo.Text  := OpenDialog.FileName;
     ArquivoIni       := TIniFile.Create(edtArquivo.Text);
     sSenhaAnt        := ArquivoIni.ReadString('Conexao','SenhaUserUnico','');
     edtSenhaAnt.Text := DeCriptografarString(ArquivoIni.ReadString('Conexao','SenhaUserUnico',''),CKEYCRIPTO);
  end;
end;



procedure TfrmGeraSenhaValia.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   ArquivoIni.WriteString('Conexao','SenhaUserUnico',CriptoGrafarString(edtNovaSenha.Text,CKEYCRIPTO));
   ArquivoIni.WriteString('Conexao','SenhaUserOld',sSenhaAnt);
   ArquivoIni.Free;
end;



end.
