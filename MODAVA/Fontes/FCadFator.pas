unit fCadFator;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, DBCtrls, Mask, CmEventosCadastro,
  ImgList, wwdblook;

type
  TfrmCadFator = class(TFrmCadastroGridCS)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBMemo1: TDBMemo;
    qryGrupoFator: TwwQuery;
    Label6: TLabel;
    dblcGrupo: TwwDBLookupCombo;
    Procedure CmeCadastroFind(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
  public
    { Public declarations }
  end;

var
  frmCadFator: TfrmCadFator;

implementation

{$R *.DFM}

procedure TfrmCadFator.CmeCadastroFind(Sender: TObject);
begin
  if (MontaSelect.RetornouValor) then
    qry.Locate ('IDFATORAVAL', StrToInt(MontaSelect.ValoresChave[0]), []);
end;

procedure TfrmCadFator.FormCreate(Sender: TObject);
begin
  inherited;
  qryGrupoFator.Open;
end;

end.
