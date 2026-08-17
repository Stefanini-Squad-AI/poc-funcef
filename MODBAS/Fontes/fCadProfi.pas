unit fCadProfi;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fCadastroGridCS,
  IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls, TB97,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, Mask, DBCtrls,
  CmEventosCadastro, ImgList;

type
  TfrmCadProfi = class(TFrmCadastroGridCS)
    Label1: TLabel;
    dbedCodigo: TDBEdit;
    Label2: TLabel;
    dbedDescr: TDBEdit;
    procedure CmeCadastroFind(Sender: TObject);
  end;

var
  frmCadProfi: TfrmCadProfi;

implementation

{$R *.DFM}

procedure TfrmCadProfi.CmeCadastroFind(Sender: TObject);
begin
  if (MontaSelect.RetornouValor) then
    qry.Locate ('IDPROFISS', MontaSelect.ValoresChave[0], []);
end;

end.
