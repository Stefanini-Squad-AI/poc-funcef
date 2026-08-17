unit FCadTRT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGrid, cmseldlg, wwidlg, Db, Wwdatsrc, DBCtrls, MAHlpBtn,
  StdCtrls, Buttons, ComCtrls, ToolWin, Grids, Wwdbigrd,
  Wwdbgrid, ExtCtrls, Mask, DBTables, Wwtable, TB97, CmEventosCadastro,
  wwDialog, ImgList, IvDictio, IvMulti, IvEMulti, TB97Tlbr, TB97Ctls;

type
  TfrmCadTRT = class(TfrmCadastroGrid)
    tblTRT: TwwTable;
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
  frmCadTRT: TfrmCadTRT;

implementation

uses FProcCodDesc;

{$R *.DFM}

procedure TfrmCadTRT.sbtnProcurarClick(Sender: TObject);
begin
  //inherited;
  ProcurarCodDesc(tblTRT,'Procura TRT','CODIGOTRT',
                 'DESCRICAO','TRT','N','','','');
  sbtnProcurar.down := false;
end;


procedure TfrmCadTRT.FormCreate(Sender: TObject);
begin
  inherited;
  tblTRT.Open;
end;

end.
