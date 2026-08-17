unit fCadRubCLT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, Mask, DBCtrls, CmEventosCadastro,
  ImgList;

type
  TfrmCadRubCLT = class(TFrmCadastroGridCS)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Procedure CmeCadastroFind(Sender: TObject);
  private
  public
    { Public declarations }
  end;

var
  frmCadRubCLT: TfrmCadRubCLT;

implementation

{$R *.DFM}

procedure TfrmCadRubCLT.CmeCadastroFind(Sender: TObject);
begin
  if (MontaSelect.RetornouValor) then
    qry.Locate ('CODRUBCLT', MontaSelect.ValoresChave[0], []);
end;

end.
