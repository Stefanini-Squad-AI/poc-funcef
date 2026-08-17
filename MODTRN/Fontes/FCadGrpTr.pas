unit fCadGrpTr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridCS, StdCtrls, Mask, DBCtrls, CmEventosCadastro, ImgList, Db,
  Wwdatsrc, MontaSelect, DBTables, IvDictio, IvMulti, IvEMulti, Wwquery,
  MAHlpBtn, Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid,
  ExtCtrls;

type
  TfrmCadGrpTr = class(TFrmCadastroGridCS)
    pnlCargos: TPanel;
    Label5: TLabel;
    dbGridCargos: TwwDBGrid;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    qryCargo: TwwQuery;
    dsCargo: TwwDataSource;
    ToolbarSep972: TToolbarSep97;
    bbtnCargos: TToolbarButton97;
    procedure CmeCadastroFind(Sender: TObject);
    procedure qryAfterScroll(DataSet: TDataSet);
    procedure bbtnCargosClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure ListaCargos(CodGrpFunc: string);
  end;

var
  frmCadGrpTr: TfrmCadGrpTr;

implementation

{$R *.DFM}

procedure TfrmCadGrpTr.FormCreate(Sender: TObject);
begin
  inherited;
  bbtnCargos.Enabled := not(qry.IsEmpty);
end;

procedure TfrmCadGrpTr.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
    qry.Locate ('CODGRPTREIN', MontaSelect.ValoresChave[0], []);
end;

procedure TfrmCadGrpTr.qryAfterScroll(DataSet: TDataSet);
begin
  inherited;
  bbtnCargos.Enabled := not(qry.IsEmpty) or not(qry.State in [dsInsert,dsEdit]);
  ListaCargos (qry.FieldByName('CODGRPTREIN').asString);
end;

procedure TfrmCadGrpTr.bbtnCargosClick(Sender: TObject);
begin
  inherited;
  pnlCargos.Visible := not(pnlCargos.Visible);
  ListaCargos (qry.FieldByName('CODGRPTREIN').asString);
end;

procedure TfrmCadGrpTr.ListaCargos(CodGrpFunc: string);
begin
  if not(qry.IsEmpty) and (pnlCargos.Visible) then
  begin
    qryCargo.Close;
    qryCargo.ParamByName('CODGRPFUNC').asString := CodGrpFunc;
    qryCargo.Open;
  end;
end;

end.
