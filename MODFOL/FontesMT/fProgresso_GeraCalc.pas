unit fProgresso_GeraCalc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, fcLabel, Gauges, StdCtrls;

type
  TfrmProgresso_GeraCalc = class(TForm)
    pnlFundo: TPanel;
    lblTempoDecorr: TLabel;
    gagTotal: TGauge;
    lblQtdeFunc: TLabel;
    lblPessoa: TLabel;
    fclblTitulo: TfcLabel;
    Bevel11: TBevel;
    lblProcesso: TLabel;
    lblHoraIni: TLabel;
    Label18: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    FTitulo: string;
    FProcesso: string;
    FPessoa: string;
    FHoraIni: TTime;
    FQtdeFunc: integer;
    FTempoDecorr: string;
    FProgresso: integer;
    FMaxProgresso: integer;
  public
    procedure Mostrar;

    property Titulo: string read FTitulo write FTitulo;
    property Processo: string read FProcesso write FProcesso;
    property Pessoa: string read FPessoa write FPessoa;
    property HoraIni: TTime read FHoraIni write FHoraIni;
    property QtdeFunc: integer read FQtdeFunc write FQtdeFunc;
    property TempoDecorr: string read FTempoDecorr write FTempoDecorr;
    property Progresso: integer read FProgresso write FProgresso;
    property MaxProgresso: integer read FMaxProgresso write FMaxProgresso;
  end;

var
  frmProgresso_GeraCalc: TfrmProgresso_GeraCalc;

implementation

{$R *.DFM}

procedure TfrmProgresso_GeraCalc.FormCreate(Sender: TObject);
begin
  gagTotal.MinValue := 0;
end;

procedure TfrmProgresso_GeraCalc.Mostrar;
begin
  fclblTitulo.Caption := FTitulo;
  lblProcesso.Caption := FProcesso;

  lblPessoa.Visible := (FPessoa <> '');
  lblPessoa.Caption := FPessoa;
  
  lblHoraIni.Caption := 'Hora de Início: ' + TimeToStr(FHoraIni);

  //lblQtdeFunc.Visible := (FQtdeFunc > -1);
  lblQtdeFunc.Visible := (FQtdeFunc > 0);
  lblQtdeFunc.Caption := 'Qtde: ' + IntToStr(FQtdeFunc);

  lblTempoDecorr.Visible := (FTempoDecorr <> '');
  Label18.Visible := lblTempoDecorr.Visible;
  lblTempoDecorr.Caption := FTempoDecorr;

  if (FProgresso = 0) then
    gagTotal.Progress := 0
  else
  if (FProgresso > 0) then
  begin
    gagTotal.AddProgress(FProgresso);
    FProgresso := -1;
  end;  

  gagTotal.MaxValue := FMaxProgresso;

  if (Self.Showing) then
    Self.Update
  else  
    Self.Show;

  Application.ProcessMessages;
end;

end.
