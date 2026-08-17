unit FCadGrupoFator;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fCadastroGridCS,
  fcLabel, wwdblook, StdCtrls, Mask, DBCtrls, IvDictio, IvMulti, IvEMulti, MontaSelect,
  DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, Buttons, TB97Tlbr, TB97, Grids,
  Wwdbigrd, Wwdbgrid, ExtCtrls, CmEventosCadastro, ImgList;

type
  TFrmCadGrupoFator = class(TFrmCadastroGridCS)
    Label1: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    bbtnFatores: TToolbarButton97;
    ToolbarSep972: TToolbarSep97;
    qryFator: TwwQuery;
    dsFator: TwwDataSource;
    pnlFatores: TPanel;
    Label5: TLabel;
    dbGridFatores: TwwDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure bbtnFatoresClick(Sender: TObject);
    procedure qryAfterScroll(DataSet: TDataSet);
    procedure CmeCadastroFind(Sender: TObject);
  private
    procedure ListaFatores(IdGrpFator: integer);
  end;

var
  FrmCadGrupoFator: TFrmCadGrupoFator;

implementation

{$R *.DFM}

procedure TFrmCadGrupoFator.FormCreate(Sender: TObject);
begin
  inherited;
//  qryCargo.Open;

end;

procedure TFrmCadGrupoFator.qryAfterScroll(DataSet: TDataSet);
begin
  ListaFatores (qry.FieldByName('IDGRUPOFATORAVAL').asInteger);
end;

procedure TFrmCadGrupoFator.bbtnFatoresClick(Sender: TObject);
begin
  pnlFatores.Visible := not(pnlFatores.Visible);
  ListaFatores (qry.FieldByName('IDGRUPOFATORAVAL').asInteger);
end;

procedure TFrmCadGrupoFator.ListaFatores(IdGrpFator: integer);
begin
  if not(qry.IsEmpty) and (pnlFatores.Visible) then
  begin
    qryFator.Close;
    qryFator.ParamByName('IDGRUPOFATORAVAL').asInteger := IdGrpFator;
    qryFator.Open;
  end;
end;

procedure TFrmCadGrupoFator.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
    qry.Locate ('IDGRUPOFATORAVAL', StrToInt(MontaSelect.ValoresChave[0]), []);
end;

end.
