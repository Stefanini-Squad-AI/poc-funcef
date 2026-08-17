unit FSelRelNeces;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCMParamRel, MAHlpBtn, StdCtrls, Buttons, ExtCtrls, TB97,
  ComCtrls, Db, DBTables, Wwtable, IvDictio, IvMulti, IvEMulti, TB97Tlbr;

type
  TfrmSelRelNeces = class(TCMParamRel)
    TabSheet1: TTabSheet;
    rgFormaRel: TRadioGroup;
    rgTipoRel: TRadioGroup;
    rgPrograma: TRadioGroup;
    rgTipoCargo: TRadioGroup;
    tblParam: TwwTable;
    procedure rbtnVisualizarClick(Sender: TObject);
    procedure rbtnImprimirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelRelNeces: TfrmSelRelNeces;
  Imprime : Boolean;

implementation

uses FTelaAut, RNecesPess, RNecesCurso;

{$R *.DFM}

procedure TfrmSelRelNeces.rbtnVisualizarClick(Sender: TObject);
begin
  inherited;
  Imprime := False;
  if  rgFormaRel.ItemIndex = 0  then begin
      AbrirForm{Modal}(RelNecesPess, TRelNecesPess, False);
      //RelNecesPess.Free;
  end
  else begin
      relNecesCurso := TrelNecesCurso.Create(Self);
      //relNecesCurso.qr.Preview;
      relNecesCurso.Show;
      Self.WindowState := wsNormal;
  end;
end;

procedure TfrmSelRelNeces.rbtnImprimirClick(Sender: TObject);
begin
  inherited;
  Imprime := True;
  if  rgFormaRel.ItemIndex = 0  then begin
      AbrirForm{Modal}(RelNecesPess, TRelNecesPess, False);
      //RelNecesPess.Free;
  end
  else begin
      relNecesCurso := TrelNecesCurso.Create(Self);
      relNecesCurso.Show;
      //relNecesCurso.qr.Print;
      Self.WindowState := wsNormal;
  end;
end;


procedure TfrmSelRelNeces.FormCreate(Sender: TObject);
begin
  inherited;
  tblParam.Open;
  rgTipoCargo.Enabled := tblParam.FieldByName('FLGDOISCARGOS').AsInteger = 1;
  tblParam.Close;
end;

end.
