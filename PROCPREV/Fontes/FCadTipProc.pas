unit FCadTipProc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGrid, cmseldlg, wwidlg, Db, Wwdatsrc, DBCtrls, MAHlpBtn,
  StdCtrls, Buttons, ComCtrls, ToolWin, Grids, Wwdbigrd,
  Wwdbgrid, ExtCtrls, Mask, DBTables, Wwtable, TB97, IvDictio, IvMulti,
  IvEMulti, TB97Ctls, TB97Tlbr, CmEventosCadastro, wwDialog, ImgList;

type
  TfrmCadTipProc = class(TfrmCadastroGrid)
    tblTipProc: TwwTable;
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
  frmCadTipProc: TfrmCadTipProc;

implementation

uses FProcCodDesc;

{$R *.DFM}

procedure TfrmCadTipProc.sbtnProcurarClick(Sender: TObject);
begin
  //inherited;
  ProcurarCodDesc(tblTipProc,'Procura Tipo de Processo','IDTIPOPROC',
                 'NOMETIPOPROC','TIPOPROCESSO','N','','','');
  sbtnProcurar.down := false;
end;


procedure TfrmCadTipProc.FormCreate(Sender: TObject);
begin
  inherited;
  tblTipProc.Open;
end;

end.
