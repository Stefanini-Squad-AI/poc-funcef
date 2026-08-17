unit FCadGrpObjeto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGrid, cmseldlg, wwidlg, Db, Wwdatsrc, DBCtrls, MAHlpBtn,
  StdCtrls, Buttons, ComCtrls, ToolWin, Grids, Wwdbigrd,
  Wwdbgrid, ExtCtrls, Mask, DBTables, Wwtable, TB97, IvDictio, IvMulti,
  IvEMulti, TB97Ctls, TB97Tlbr, CmEventosCadastro, wwDialog, ImgList;

type
  TfrmCadGrpObjeto = class(TfrmCadastroGrid)
    tblGrpObjeto: TwwTable;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    procedure sbtnProcurarClick(Sender: TObject);
    procedure tblGrpObjetoAfterInsert(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadGrpObjeto: TfrmCadGrpObjeto;

implementation

uses FProcCodDesc;

{$R *.DFM}

procedure TfrmCadGrpObjeto.sbtnProcurarClick(Sender: TObject);
begin
  //inherited;
  ProcurarCodDesc(tblGrpObjeto,'Procura Grupo de Objeto','IDGRUPOOBJETO',
                 'DESCRICAO','GRPOBJPROCJUR','N','','','');
  sbtnProcurar.down := false;
end;


procedure TfrmCadGrpObjeto.tblGrpObjetoAfterInsert(DataSet: TDataSet);
begin
  inherited;
  tblGrpObjeto.FieldByName('CLASSEOBJ').Value := '1';
end;

procedure TfrmCadGrpObjeto.FormCreate(Sender: TObject);
begin
  inherited;
  tblGrpObjeto.Open;
end;

end.
