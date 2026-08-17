unit FSelRelPCMSO;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCMParamRel, MAHlpBtn, StdCtrls, Buttons, ExtCtrls, TB97,
  ComCtrls, IvDictio, IvMulti, IvEMulti, TB97Tlbr, MontaSelect;

type
  TfrmSelRelPCMSO = class(TCMParamRel)
    edTituloFicha: TEdit;
    Label1: TLabel;
    edAssinante: TEdit;
    Label2: TLabel;
    MontaSelectFunc: TMontaSelect;
    bbtnBuscaCID: TBitBtn;
    rgResultado: TRadioGroup;
    procedure rbtnVisualizarClick(Sender: TObject);
    procedure rbtnImprimirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnBuscaCIDClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelRelPCMSO: TfrmSelRelPCMSO;
  bMontaSelectFunc: Boolean;

implementation

uses RPCMSO, UsoGeralRH;

{$R *.DFM}

procedure TfrmSelRelPCMSO.rbtnVisualizarClick(Sender: TObject);
begin
  inherited;
  relPCMSO := TrelPCMSO.Create(Self);
  relPCMSO.qr.Preview;
  Self.WindowState := wsNormal;
  //relPCMSO.Free;
  ModalResult := mrOK;
end;

procedure TfrmSelRelPCMSO.rbtnImprimirClick(Sender: TObject);
begin
  inherited;
  relPCMSO := TrelPCMSO.Create(Self);
  relPCMSO.qr.Print;
  Self.WindowState := wsNormal;
  //relPCMSO.Free;
  ModalResult := mrOK;
end;

procedure TfrmSelRelPCMSO.FormCreate(Sender: TObject);
begin
  inherited;
  bMontaSelectFunc := False;
  if (sUsuXccusto <> '') then
    MontaSelectFunc.Filtro.Add('FUNCIONARIO.CODCENTROCUSTO IN ' + sUsuXccusto);

  if (sUsuXfilial <> '') then
    MontaSelectFunc.Filtro.Add('FUNCIONARIO.IDESTAB IN ' + sUsuXfilial);

end;

procedure TfrmSelRelPCMSO.bbtnBuscaCIDClick(Sender: TObject);
begin
  inherited;
  MontaSelectFunc.Executar;
  if (MontaSelectFunc.ValoresChave.Count > 0) and (MontaSelectFunc.ValoresChave[0] <> '')  then
  begin
     edAssinante.Text := MontaSelectFunc.ValoresChave[1];
     bMontaSelectFunc := True;
  end;
end;

end.
