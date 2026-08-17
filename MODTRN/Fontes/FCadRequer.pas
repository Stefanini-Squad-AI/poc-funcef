unit FCadRequer;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGrid, cmseldlg, wwidlg, Db, Wwdatsrc, DBCtrls, MAHlpBtn,
  StdCtrls, Buttons, ComCtrls, ToolWin, Grids, Wwdbigrd,
  Wwdbgrid, ExtCtrls, Mask, DBTables, Wwtable, wwdblook, Wwquery, TB97,
  IvDictio, IvMulti, IvEMulti, TB97Ctls, TB97Tlbr, MontaSelect,
  CmEventosCadastro, wwDialog, ImgList;

type
  TfrmCadRequer = class(TfrmCadastroGrid)
    tblCurca: TwwTable;
    tblCargo: TwwTable;
    ds2: TwwDataSource;
    tblCurso2: TwwTable;
    gbxGrupoFunc: TGroupBox;
    dbedCodCargo: TDBEdit;
    dbedDescricao: TDBEdit;
    Label1: TLabel;
    wwDBLookupCombo1: TwwDBLookupCombo;
    tblCurcaIDCARGO: TFloatField;
    tblCurcaIDCURSO: TFloatField;
    tblCurcaFLGIMPRESCIND: TFloatField;
    DBRadioGroup1: TDBRadioGroup;
    tblCurcaDESCRICAO: TStringField;
    qryCurso: TwwQuery;
    MontaSelect: TMontaSelect;
    procedure sbtnProcurarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadRequer: TfrmCadRequer;

implementation

uses FProcCodDesc;

{$R *.DFM}

procedure TfrmCadRequer.FormCreate(Sender: TObject);
begin
  inherited;
  tblCurca.Open;
  tblCargo.Open;
  qryCurso.Open;
  tblCurso2.Open;
  dbGrd.ShowVertScrollBar := True;  // Nao Adianta !!!!
end;

procedure TfrmCadRequer.sbtnProcurarClick(Sender: TObject);
begin
  //inherited;
  sbtnProcurar.down := false;
  MontaSelect.Executar;
  if (MontaSelect.ValoresChave.Count > 0) and
     (MontaSelect.ValoresChave[0] <> '')  then
     tblCargo.FindKey([StrToInt(MontaSelect.ValoresChave[0])]);  
end;

end.
