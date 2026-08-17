unit RSimula;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FSairAjuda, Grids, Wwdbigrd, Wwdbgrid, IvDictio, IvMulti, IvEMulti,
   MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, Wwdatsrc,
   DBTables, Wwquery, DBGrids;

type
   TFrmRelSimula = class(TfrmSairAjuda)
      bbtnConfirmar: TBitBtn;
      dbGrd: TDBGrid;
      qry: TwwQuery;
      ds: TwwDataSource;
      ToolbarSep971: TToolbarSep97;
      ToolbarSep972: TToolbarSep97;
      ToolbarSep973: TToolbarSep97;

      procedure FormShow(Sender: TObject);
      procedure bbtnConfirmarClick(Sender: TObject);


   private { Private declarations }

      FSql : String;

      procedure SetSQL(NewSql : String);


  public { Public declarations }

    property SQL: String read FSql write SetSQL;


  end;



var
  FrmRelSimula: TFrmRelSimula;



implementation
{$R *.DFM}
uses
   FCadInscricao;



procedure TFrmRelSimula.SetSQL(NewSql: String);
begin
   qry.SQL.Clear;

   FSql           := NewSql;
   qry.SQL.Text   := FSql;
end;



procedure TFrmRelSimula.FormShow(Sender: TObject);
var
   i : integer;
begin
   inherited;
   qry.Open;

   dbGrd.Columns.Items[0].Alignment := taCenter;
   dbGrd.Columns.Items[0].Title.Alignment := taCenter;
   dbGrd.Columns.Items[0].Width := 40;
   for i := 1 to dbGrd.Columns.Count -1 do begin
      dbGrd.Columns.Items[i].Title.Alignment := taCenter;
      if (dbGrd.Fields[i] is TFloatField) then (dbGrd.Fields[i] as TFloatField).DisplayFormat := '#,##0.00';
   end;
end;



procedure TFrmRelSimula.bbtnConfirmarClick(Sender: TObject);
begin
    frmCadInscricao.NumParcelas := qry.Fields[0].AsInteger;
    frmCadInscricao.VlrSolic    := qry.Fields[1].AsFloat;

    inherited;

    Close;
end;



end.
