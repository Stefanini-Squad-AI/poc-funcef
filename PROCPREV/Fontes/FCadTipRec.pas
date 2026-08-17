unit FCadTipRec;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGrid, cmseldlg, wwidlg, Db, Wwdatsrc, DBCtrls, MAHlpBtn,
  StdCtrls, Buttons, ComCtrls, ToolWin, Grids, Wwdbigrd,
  Wwdbgrid, ExtCtrls, Mask, DBTables, Wwtable, TB97, IvDictio, IvMulti,
  IvEMulti, TB97Ctls, TB97Tlbr, CmEventosCadastro, wwDialog, ImgList;

type
  TfrmCadTipRec = class(TfrmCadastroGrid)
    tblTipRec: TwwTable;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    procedure sbtnProcurarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadTipRec: TfrmCadTipRec;

implementation

uses FProcCodDesc;

{$R *.DFM}

procedure TfrmCadTipRec.sbtnProcurarClick(Sender: TObject);
begin
  //inherited;
  ProcurarCodDesc(tblTipRec,'Procura Tipo de Recurso','CODTIPORECURSO',
                 'DESCRICAO','TIPORECTRAB','N','','','');
  sbtnProcurar.down := false;
end;


procedure TfrmCadTipRec.FormCreate(Sender: TObject);
begin
  inherited;
  tblTipRec.Open;
end;

end.
