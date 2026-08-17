unit fCadCatEmprGRE;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, Mask, DBCtrls, CmEventosCadastro,
  ImgList;

type
  TfrmCadCatEmprGRE = class(TFrmCadastroGridCS)
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
  frmCadCatEmprGRE: TfrmCadCatEmprGRE;

implementation

{$R *.DFM}

procedure TfrmCadCatEmprGRE.CmeCadastroFind(Sender: TObject);
begin
  if (MontaSelect.RetornouValor) then
    qry.Locate ('IDCATEMPRGRE', MontaSelect.ValoresChave[0], []);
end;

end.
