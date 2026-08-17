unit fCadCID;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, DBCtrls, Mask, CmEventosCadastro,
  ImgList, wwdbedit;

type
  TfrmCadCID = class(TFrmCadastroGridCS)
    Label1: TLabel;
    dbedCodCid: TDBEdit;
    Label2: TLabel;
    dbedDescrCID: TwwDBEdit;
    Procedure CmeCadastroFind(Sender: TObject);
  private
  public
    { Public declarations }
  end;

var
  frmCadCID: TfrmCadCID;

implementation

{$R *.DFM}

procedure TfrmCadCID.CmeCadastroFind(Sender: TObject);
begin
  if (MontaSelect.RetornouValor) then
    qry.Locate ('CODCID', MontaSelect.ValoresChave[0], []);
end;

end.
