unit Fpht;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, StdCtrls, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, Db, Wwdatsrc,
  DBTables, Wwquery;

type
  TfrmPHT = class(TfrmOkCancelar)
    mem: TMemo;
    Splitter1: TSplitter;
    wwDBGrid1: TwwDBGrid;
    qry: TwwQuery;
    ds: TwwDataSource;
    lbl: TLabel;
    BitBtn1: TBitBtn;
    ToolbarSep972: TToolbarSep97;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPHT: TfrmPHT;

implementation

Uses uDataBAse, UMensErro,  DBaseDados;

{$R *.DFM}

procedure TfrmPHT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  
  If dtmBaseDados.dbBaseDados.InTransaction
  then dtmBaseDados.dbBaseDados.Rollback;

  action := cafree;
end;

procedure TfrmPHT.bbtnCancelarClick(Sender: TObject);
begin
  inherited;

  If dtmBaseDados.dbBaseDados.InTransaction
  then
  begin
     dtmBaseDados.dbBaseDados.Rollback;
     dtmBaseDados.dbBaseDados.StartTransaction;
  end;


end;

procedure TfrmPHT.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;


  If dtmBaseDados.dbBaseDados.InTransaction
  then
  begin
     dtmBaseDados.dbBaseDados.Commit;
     dtmBaseDados.dbBaseDados.StartTransaction;
  end;
end;

procedure TfrmPHT.FormCreate(Sender: TObject);
begin
  inherited;
   If Not dtmBaseDados.dbBaseDados.InTransaction
   Then  dtmBaseDados.dbBaseDados.StartTransaction;
end;

procedure TfrmPHT.BitBtn1Click(Sender: TObject);
var ssql : String;
begin
  inherited;
  qry.close;

  if trim(mem.SelText) <> '' then  sSql :=  mem.SelText
  else sSql :=  mem.Text;

  qry.sql.text := sSql;

  if ((pos('UPDATE',uppercase(sSql)) > 0)  OR
     (pos('DELETE',uppercase(sSql)) > 0)  OR
     (pos('INSERT',uppercase(sSql)) > 0)) then
  begin
     try
        qry.execsql;
        lbl.caption := 'Reg. Afetados.: '+inttostr(qry.rowsaffected);
     except
        lbl.caption := 'Erro no SQL';
     end;
  end
  else
  begin
     try
        qry.RequestLive := false;
        qry.open;
        try qry.RequestLive := true except end;
        lbl.caption := 'Num. de Reg.: '+inttostr(qry.recordcount);
     except
        lbl.caption := 'Erro no SQL';
     end;
  end


end;

end.
