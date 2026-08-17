unit fCadGrupoFunc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fCadastroGridCS,
  fcLabel, wwdblook, StdCtrls, Mask, DBCtrls, IvDictio, IvMulti, IvEMulti, MontaSelect,
  DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, Buttons, TB97Tlbr, TB97, Grids,
  Wwdbigrd, Wwdbgrid, ExtCtrls, CmEventosCadastro, ImgList;

type
  TFrmCadGrupoFunc = class(TFrmCadastroGridCS)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    dblkcGrauInstr: TwwDBLookupCombo;
    bbtnCargos: TToolbarButton97;
    ToolbarSep972: TToolbarSep97;
    qryGrauInstr: TwwQuery;
    qryCargo: TwwQuery;
    dsCargo: TwwDataSource;
    pnlCargos: TPanel;
    Label5: TLabel;
    dbGridCargos: TwwDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure bbtnCargosClick(Sender: TObject);
    procedure dblkcGrauInstrChange(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    procedure qryAfterScroll(DataSet: TDataSet);
  private
    procedure ListaCargos(CodGrpFunc: string);
  end;

var
  FrmCadGrupoFunc: TFrmCadGrupoFunc;

implementation

{$R *.DFM}

procedure TFrmCadGrupoFunc.FormCreate(Sender: TObject);
begin
  inherited;
//  qryCargo.Open;
  qryGrauInstr.Open;
end;

procedure TFrmCadGrupoFunc.CmeCadastroFind(Sender: TObject);
begin
  if (MontaSelect.RetornouValor) then
    qry.Locate ('CODGRPFUNC', MontaSelect.ValoresChave[0], []);
end;

procedure TFrmCadGrupoFunc.qryAfterScroll(DataSet: TDataSet);
begin
  ListaCargos (qry.FieldByName('CODGRPFUNC').asString);
end;

procedure TFrmCadGrupoFunc.dblkcGrauInstrChange(Sender: TObject);
begin
  if (qry.State in [dsInsert,dsEdit]) then
    qry.FieldByName('DESCRGRINSTR').asString := dblkcGrauInstr.Text;
end;

procedure TFrmCadGrupoFunc.bbtnCargosClick(Sender: TObject);
begin
  pnlCargos.Visible := not(pnlCargos.Visible);
  ListaCargos (qry.FieldByName('CODGRPFUNC').asString);
end;

procedure TFrmCadGrupoFunc.ListaCargos(CodGrpFunc: string);
begin
  if not(qry.IsEmpty) and (pnlCargos.Visible) then
  begin
    qryCargo.Close;
    qryCargo.ParamByName('CODGRPFUNC').asString := CodGrpFunc;
    qryCargo.Open;
  end;
end;

end.
