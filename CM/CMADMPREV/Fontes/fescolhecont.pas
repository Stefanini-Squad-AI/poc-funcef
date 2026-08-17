unit FEscolheCont;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97, ExtCtrls, checklst, Db,
  DBTables, Wwquery, TB97Tlbr, IvDictio, IvMulti, IvEMulti;

type
  TfrmEscolheCont = class(TfrmOkCancelar)
    Panel1: TPanel;
    Label1: TLabel;
    edreserva: TEdit;
    lblValores: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    chklstCont: TCheckListBox;
    procedure FormActivate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
  private
    procedure CriaLista(chkListX : TCheckListBox; qryLista : TwwQuery);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEscolheCont: TfrmEscolheCont;

implementation

uses FEventoTransfReserva, UAdmPrev, UDataBase, FTelaAut, UMensErro;

procedure TfrmEscolheCont.CriaLista(chkListX : TCheckListBox; qryLista : TwwQuery);
begin
  chkListX.Items.Clear;
  qrylista.first;
  with qryLista do
  begin
     while not eof do
     begin
        chkListX.Items.Add(FieldByName('Nome').AsString);
        Next;
     end;
  end;
end;

{$R *.DFM}

procedure TfrmEscolheCont.FormActivate(Sender: TObject);
begin
  inherited;
edReserva.text :=  frmEventoTransfReserva.edreservadest.text ;
CriaLista(chklstcont,frmEventoTransfReserva.qryaux) ;
end;

procedure TfrmEscolheCont.bbtnConfirmarClick(Sender: TObject);
begin

sCont :=PegaidCheck(chklstcont,'IDCONTRIBUICAO','NOME', frmEventoTransfReserva.qryaux );

if sCont = '' then
begin
   MsgDlg('É preciso selecionar alguma das contribuições.','Erro',mtError,[mbok],0);
   exit;
end;

close;

end;

procedure TfrmEscolheCont.SpeedButton1Click(Sender: TObject);
var i : integer;
begin
  inherited;
for i := 0 to chklstcont.Items.Count - 1 do
begin
   chklstcont.Checked[i] := True ;
end;
end;

procedure TfrmEscolheCont.SpeedButton2Click(Sender: TObject);
var i : integer;
begin
  inherited;
for i := 0 to chklstcont.Items.Count - 1 do
begin
   chklstcont.Checked[i] := False ;
end; 
end;

procedure TfrmEscolheCont.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
Sai := true;
close;
end;

procedure TfrmEscolheCont.bbtnSairClick(Sender: TObject);
begin
Sai := true;
  inherited;

end;

end.
