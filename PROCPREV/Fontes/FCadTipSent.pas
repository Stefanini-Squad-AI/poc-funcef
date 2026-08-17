unit FCadTipSent;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGrid, cmseldlg, wwidlg, Db, Wwdatsrc, DBCtrls, MAHlpBtn,
  StdCtrls, Buttons, ComCtrls, ToolWin, Grids, Wwdbigrd,
  Wwdbgrid, ExtCtrls, Mask, DBTables, Wwtable, TB97, CmEventosCadastro,
  wwDialog, ImgList, IvDictio, IvMulti, IvEMulti, TB97Tlbr, TB97Ctls;

type
  TfrmCadTipSent = class(TfrmCadastroGrid)
    tblTipSent: TwwTable;
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
  frmCadTipSent: TfrmCadTipSent;

implementation

uses FProcCodDesc;

{$R *.DFM}

procedure TfrmCadTipSent.sbtnProcurarClick(Sender: TObject);
begin
  //inherited;
  ProcurarCodDesc(tblTipSent,'Procura Tipo de Sentença','CODTIPOSENT',
                 'DESCRICAO','TIPOSENTENCA','N','','','');
  sbtnProcurar.down := false;
end;


procedure TfrmCadTipSent.FormCreate(Sender: TObject);
begin
  inherited;
  tblTipSent.Open;
end;

end.
