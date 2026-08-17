unit fCadTipObjeto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridCS, CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect,
  DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls,
  wwdblook, Mask, DBCtrls;

type
  TfrmCadTipObjeto = class(TFrmCadastroGridCS)
    qryGrpObjeto: TwwQuery;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    dblcGrpObjeto: TwwDBLookupCombo;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
  end;

var
  frmCadTipObjeto: TfrmCadTipObjeto;

implementation

{$R *.DFM}

procedure TfrmCadTipObjeto.FormCreate(Sender: TObject);
begin
  inherited;
  qryGrpObjeto.Open;
end;

procedure TfrmCadTipObjeto.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
    qry.Locate ('CODTIPOOBJETO', MontaSelect.ValoresChave[0], []);
end;

end.
