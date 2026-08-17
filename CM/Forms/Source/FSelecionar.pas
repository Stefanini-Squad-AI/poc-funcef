unit FSelecionar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, DB, Wwdatsrc, DBTables,
  CMFRMPROP, FPai, FOkCancelar, MAHlpBtn, TB97, TB97Tlbr, IvDictio,
  IvMulti, IvEMulti;

type
  TCMSelecionar = class(TfrmOkCancelar)
    dsSelec: TDataSource;
    Panel1: TPanel;
    dbgrdSelec: TDBGrid;
    procedure dbgrdSelecDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelecionar: TCMSelecionar;

function Selecionar(tbl: TTable; const sTitulo: string): Boolean;

implementation

{$R *.DFM}


function Selecionar(tbl: TTable; const sTitulo: string): Boolean;
var
   iTam, i, W: Integer;
   TM : TTextMetric;

begin
   with frmSelecionar do begin
      Caption := sTitulo;

      dsSelec.DataSet := tbl;

      iTam := 0;
      for i := 0 to dbgrdSelec.FieldCount - 1 do begin
         { Calcula o width da coluna }
         dbgrdSelec.Canvas.Font := dbgrdSelec.Font;
         GetTextMetrics(dbgrdSelec.Canvas.Handle, TM);
         W := dbgrdSelec.Fields[i].DisplayWidth*(dbgrdSelec.Canvas.TextWidth('0')
              - TM.tmOverhang) + TM.tmOverhang + 4;

         iTam := iTam + W;
      end;

      iTam := iTam + Panel1.BevelWidth*2 +
               Panel1.BorderWidth*4 + IndicatorWidth + 16 +
               dbgrdSelec.FieldCount + 2;

      ClientWidth := iTam;

      Result := ShowModal = mrOk;
   end; { with }
end;

procedure TCMSelecionar.dbgrdSelecDblClick(Sender: TObject);
begin
  inherited;
  bbtnConfirmar.Click;
end;

end.
