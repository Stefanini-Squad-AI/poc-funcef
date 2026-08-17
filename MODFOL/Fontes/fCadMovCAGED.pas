unit fCadMovCAGED;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, Mask, DBCtrls, CmEventosCadastro,
  ImgList;

type
  TfrmCadMovCAGED = class(TFrmCadastroGridCS)
    Label1: TLabel;
    dbedCodigo: TDBEdit;
    Label2: TLabel;
    dbedDescr: TDBEdit;
    Procedure CmeCadastroFind(Sender: TObject);
  private
  public
    { Public declarations }
  end;

var
  frmCadMovCAGED: TfrmCadMovCAGED;

implementation

{$R *.DFM}

procedure TfrmCadMovCAGED.CmeCadastroFind(Sender: TObject);
begin
  if (MontaSelect.RetornouValor) then
    qry.Locate ('IDMOVCONTRCAGED', MontaSelect.ValoresChave[0], []);
end;

end.
