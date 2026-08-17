unit FCadVara;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGrid, cmseldlg, wwidlg, Db, Wwdatsrc, DBCtrls, MAHlpBtn,
  StdCtrls, Buttons, ComCtrls, ToolWin, Grids, Wwdbigrd,
  Wwdbgrid, ExtCtrls, Mask, DBTables, Wwtable, TB97, IvDictio, IvMulti,
  IvEMulti, TB97Ctls, TB97Tlbr, CmEventosCadastro, wwDialog, ImgList;

type
  TfrmCadVara = class(TfrmCadastroGrid)
    tblVara: TwwTable;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    procedure sbtnProcurarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadVara: TfrmCadVara;

implementation

uses FProcCodDesc;

{$R *.DFM}

procedure TfrmCadVara.sbtnProcurarClick(Sender: TObject);
begin
  //inherited;
  ProcurarCodDesc(tblVara,'Procura Vara de Justiça','IDVARAJUSTICA',
                 'DESCRICAO','VARAJUSTICA','N','','','');
  sbtnProcurar.down := false;
end;


procedure TfrmCadVara.FormCreate(Sender: TObject);
begin
  inherited;
  tblVara.Open;
end;

end.
