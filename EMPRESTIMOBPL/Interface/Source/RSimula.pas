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
      btnImprimir: TBitBtn;
      ToolbarSep974: TToolbarSep97;

      procedure FormShow(Sender: TObject);
      procedure bbtnConfirmarClick(Sender: TObject);
      procedure btnImprimirClick(Sender: TObject);


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
   FCadInscricao, fImpressaoSimulacao, USistema;



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

   for i := 1 to dbGrd.Columns.Count -1 do
   begin
      dbGrd.Columns.Items[i].Title.Alignment := taCenter;
      if (dbGrd.Fields[i] is TFloatField) then (dbGrd.Fields[i] as TFloatField).DisplayFormat := '#,##0.00';
   end;
end;



procedure TFrmRelSimula.bbtnConfirmarClick(Sender: TObject);
begin
    //Pendência 24901
    if (Sistema.TipoCliente = 19981) then
    begin
       frmCadInscricao.VlrMargem   := qry.Fields[3].AsFloat;
       frmCadInscricao.VlrMaxPermit:= qry.Fields[1].AsFloat;
    end;
    //Pendência 24901
    frmCadInscricao.NumParcelas := qry.Fields[0].AsInteger;
    frmCadInscricao.VlrSolic    := qry.Fields[1].AsFloat;
    frmCadInscricao.WindowState := wsMaximized;

    inherited;

    Close;
end;



procedure TFrmRelSimula.btnImprimirClick(Sender: TObject);
begin
   inherited;

   frmImpressaoSimulacao                := TfrmImpressaoSimulacao.Create(Application);
   frmImpressaoSimulacao.QryDados       := qry;
   frmImpressaoSimulacao.sNomeRelat     := 'Simulacao';
   frmImpressaoSimulacao.bbtnConfirmarClick(Self);
   frmCadInscricao.WindowState          := wsMaximized;
end;



end.
