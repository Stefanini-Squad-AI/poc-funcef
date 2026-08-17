unit FCadTipAcao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGrid, cmseldlg, wwidlg, Db, Wwdatsrc, DBCtrls, MAHlpBtn,
  StdCtrls, Buttons, ComCtrls, ToolWin, Grids, Wwdbigrd,
  Wwdbgrid, ExtCtrls, Mask, DBTables, Wwtable, TB97, IvDictio, IvMulti,
  IvEMulti, TB97Ctls, TB97Tlbr, CmEventosCadastro, wwDialog, ImgList;

type
  TfrmCadTipAcao = class(TfrmCadastroGrid)
    tblTipAcao: TwwTable;
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
  frmCadTipAcao: TfrmCadTipAcao;

implementation

uses FProcCodDesc;

{$R *.DFM}

procedure TfrmCadTipAcao.sbtnProcurarClick(Sender: TObject);
begin
  //inherited;
  ProcurarCodDesc(tblTipAcao,'Procura Tipo de Ação','IDTIPOACAO',
                 'DESCRICAO','TIPOACAOPROCJUR','N','','','');
  sbtnProcurar.down := false;
end;


procedure TfrmCadTipAcao.FormCreate(Sender: TObject);
begin
  inherited;
  tblTipAcao.Open;
end;

end.
