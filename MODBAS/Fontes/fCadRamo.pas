unit fCadRamo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, Mask, DBCtrls, CmEventosCadastro,
  ImgList;

type
  TfrmCadRamo = class(TFrmCadastroGridCS)
    Label1: TLabel;
    Label2: TLabel;
    dbedCodigo: TDBEdit;
    dbedDescr: TDBEdit;
    Procedure CmeCadastroFind(Sender: TObject);
  private
  public
    { Public declarations }
  end;

var
  frmCadRamo: TfrmCadRamo;

implementation

{$R *.DFM}

procedure TfrmCadRamo.CmeCadastroFind(Sender: TObject);
begin
  if (MontaSelect.RetornouValor) then
    qry.Locate ('IDRAMOFORNECEDOR', MontaSelect.ValoresChave[0], []);
end;

end.
