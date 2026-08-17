unit FDemoSalario;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Buttons, Grids, MAHlpBtn, StdCtrls, TB97Tlbr, TB97, ExtCtrls,
  IvDictio, IvMulti, IvEMulti, ComCtrls;

type
  TfrmDemoSalario = class(TfrmOkCancelar)
    stgridresult: TStringGrid;
    RichEdAdaptacao: TRichEdit;
    BitBtn1: TBitBtn;
    procedure bbtnSairClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    function  MultiplicaPlic(nVezes : Integer) : String;
    procedure stgridresultSelectCell(Sender: TObject; Col, Row: Integer;
      var CanSelect: Boolean);
    procedure stgridresultKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
     bSel : Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDemoSalario: TfrmDemoSalario;


implementation

{$R *.DFM}

procedure TfrmDemoSalario.bbtnSairClick(Sender: TObject);
begin
  //inherited;
  Close;
end;

procedure TfrmDemoSalario.BitBtn1Click(Sender: TObject);
var i : Integer;
begin

  RichEdAdaptacao.Lines.Clear;
  RichEdAdaptacao.Lines.Add('Demonstrativo de Salários');
  RichEdAdaptacao.Lines.Add('_________________________');
  RichEdAdaptacao.Lines.Add('');

  for i := 0 to stgridresult.RowCount -1 do
  begin
     RichEdAdaptacao.Lines.Add(copy(stgridresult.Cells[0,i],1,30)+
                               MultiplicaPlic(30-length(copy(stgridresult.Cells[0,i],1,30)))+'   '+
                               stgridresult.Cells[1,i]+'   '+
                               stgridresult.Cells[2,i]+'   '+stgridresult.Cells[3,i]+'   '+
                               stgridresult.Cells[4,i]+'   '+stgridresult.Cells[5,i]+'   '+
                               stgridresult.Cells[6,i]+'   '+stgridresult.Cells[7,i]+'   '+
                               stgridresult.Cells[8,i]+'   '+stgridresult.Cells[9,i]+'   '+
                               stgridresult.Cells[10,i]+'   '+stgridresult.Cells[11,i]);
  end;

end;

function TfrmDemoSalario.MultiplicaPlic(nVezes : Integer) : String;
var i : Integer;
begin
   result := '';

   for i := 1 to nVezes do
   begin
      result := result+' ';
   end;

end;

procedure TfrmDemoSalario.stgridresultSelectCell(Sender: TObject; Col,
  Row: Integer; var CanSelect: Boolean);
begin
  inherited;
  if (bSel)  then
  begin
     try
        if row-1 = 0 then exit;
        stgridresult.Cells[col,row] :=  stgridresult.Cells[col,row-1];
     except end;
  end;
end;

procedure TfrmDemoSalario.stgridresultKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;

  if (ssShift in Shift) and (Key = 40) then
  begin
     bSel := true;
  end
  else bSel := false;
  

end;

end.
