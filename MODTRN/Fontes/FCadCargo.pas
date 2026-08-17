unit FCadCargo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastro, StdCtrls, DBCtrls, Mask, Db, DBTables, Wwtable, cmseldlg,
  wwidlg, Wwdatsrc, MAHlpBtn, Buttons, ComCtrls, ToolWin, ExtCtrls, wwdblook,
  Wwquery, TB97, IvDictio, IvMulti, IvEMulti, TB97Ctls, TB97Tlbr, MontaSelect,
  CmEventosCadastro, wwDialog, ImgList;

type
  TfrmCadCargo = class(TfrmCadastro)
    tblCargo: TwwTable;
    Label1: TLabel;
    dbedCodigo: TDBEdit;
    Label2: TLabel;
    dbedTitulo: TDBEdit;
    Label4: TLabel;
    dbedCBO: TDBEdit;
    Label3: TLabel;
    DBMemo1: TDBMemo;
    Label5: TLabel;
    qryGrupoTr: TwwQuery;
    dblcGrupo: TwwDBLookupCombo;
    MontaSelect: TMontaSelect;
    procedure FormCreate(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadCargo: TfrmCadCargo;

implementation

{$R *.DFM}

procedure TfrmCadCargo.FormCreate(Sender: TObject);
begin
  inherited;
  tblCargo.Open;
  qryGrupoTr.Open;
end;

procedure TfrmCadCargo.sbtnProcurarClick(Sender: TObject);
begin
  //inherited;
  sbtnProcurar.down := false;
  MontaSelect.Executar;
  if (MontaSelect.ValoresChave.Count > 0) and
     (MontaSelect.ValoresChave[0] <> '')  then
    tblCargo.FindKey([StrToInt(MontaSelect.ValoresChave[0])]);
end;

end.
