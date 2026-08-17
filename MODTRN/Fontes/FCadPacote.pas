unit FCadPacote;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGrid, cmseldlg, wwidlg, Db, Wwdatsrc, DBCtrls, MAHlpBtn,
  StdCtrls, Buttons, ComCtrls, ToolWin, Grids, Wwdbigrd,
  Wwdbgrid, ExtCtrls, Mask, DBTables, Wwquery, Wwtable, TB97, TB97Ctls,
  TB97Tlbr, CmEventosCadastro, wwDialog, ImgList, IvDictio, IvMulti,
  IvEMulti;

type
  TfrmCadPacote = class(TfrmCadastroGrid)
    tblPacote: TwwTable;
    ds2: TwwDataSource;
    dbGridCursos: TwwDBGrid;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    tblCurso: TwwTable;
    sbtnCursos: TToolbarButton97;
    ToolbarSep972: TToolbarSep97;
    procedure sbtnProcurarClick(Sender: TObject);
    procedure sbtnCursosClick(Sender: TObject);
    procedure dsStateChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadPacote: TfrmCadPacote;

implementation

uses FProcCodDesc;

{$R *.DFM}

procedure TfrmCadPacote.FormCreate(Sender: TObject);
begin
  inherited;
  tblPacote.Open;
  tblCurso.Open;
end;

procedure TfrmCadPacote.sbtnProcurarClick(Sender: TObject);
begin
  //inherited;
  ProcurarCodDesc(tblPacote,'Procura Pacote de Curso','IDPACOTE',
                  'DESCRICAO','PACOTE','N','','','');
  sbtnProcurar.down := false;
end;

procedure TfrmCadPacote.sbtnCursosClick(Sender: TObject);
begin
  //inherited;
   dbGridCursos.Visible := not dbGridCursos.Visible;
end;

procedure TfrmCadPacote.dsStateChange(Sender: TObject);
begin
  inherited;
  if ds.DataSet <> nil then
     sbtnCursos.Enabled  := (ds.DataSet.State = dsBrowse)
end;

end.
