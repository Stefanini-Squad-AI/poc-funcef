unit FSelRelFicha;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCMParamRel, MAHlpBtn, StdCtrls, Buttons, ExtCtrls, Db,
  DBTables, Wwquery, wwdblook, TB97, ComCtrls, TB97Tlbr, IvDictio, IvMulti,
  IvEMulti;
  
type
  TfrmSelRelFicha = class(TCMParamRel)
    qryFuncionario: TwwQuery;
    TabSheet1: TTabSheet;
    dblcFunc: TwwDBLookupCombo;
    rgSelecao: TRadioGroup;
    rgImprDescr: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure rbtnImprimirClick(Sender: TObject);
    procedure rbtnVisualizarClick(Sender: TObject);
    procedure rgSelecaoClick(Sender: TObject);
  private
    procedure ChamarRelat;
  public
    { Public declarations }
  end;

var
  frmSelRelFicha: TfrmSelRelFicha;
  Imprime: boolean;

implementation

uses fTelaAut, rFichaFun, fSelRelFicha2, UsoGeralRH;

{$R *.DFM}

procedure TfrmSelRelFicha.FormCreate(Sender: TObject);
begin
  inherited;
  qryFuncionario.Close;
  with (qryFuncionario.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  PF.IDPESSOA, PF.NOME');
    Add('FROM');
    Add('  PESSOA PF, FUNCIONARIO F');
    Add('WHERE');

    if (sUsuXccusto <> '') then
      Add('  (F.CODCENTROCUSTO IN ' +sUsuXccusto+ ') AND');

    if (sUsuXfilial <> '') then
      Add('  (F.IDESTAB        IN ' +sUsuXfilial+ ') AND');

    Add('  (F.IDPESSOA        = PF.IDPESSOA)');
    Add('ORDER BY UPPER(PF.NOME)');
  end;
  qryFuncionario.Open;

  dblcFunc.Text := qryFuncionario.FieldByName('NOME').asString;
end;

procedure TfrmSelRelFicha.rbtnImprimirClick(Sender: TObject);
begin
  inherited;
  Imprime := true;  
  ChamarRelat;
end;

procedure TfrmSelRelFicha.rbtnVisualizarClick(Sender: TObject);
begin
  inherited;
  Imprime := false;
  ChamarRelat;
end;

procedure TfrmSelRelFicha.rgSelecaoClick(Sender: TObject);
begin
  inherited;
  dblcFunc.Visible := (rgSelecao.ItemIndex = 0);
end;

procedure TfrmSelRelFicha.ChamarRelat;
begin
  if (rgSelecao.ItemIndex = 0) then
  begin
    relFichaFun := TrelFichaFun.Create(Self);

    if (Imprime) then
      relFichaFun.qr.Print
    else
      relFichaFun.qr.Preview;

    Self.WindowState := wsNormal;
  end
  else
    AbrirForm(frmSelRelFicha2, TfrmSelRelFicha2, false);

  relFichaFun.Free;
end;

end.
