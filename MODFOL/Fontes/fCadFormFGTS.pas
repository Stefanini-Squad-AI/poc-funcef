unit fCadFormFGTS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, DBCtrls, Mask, CmEventosCadastro,
  ImgList;

type
  TfrmCadFormFGTS = class(TFrmCadastroGridCS)
    Label1: TLabel;
    dbedCodigo: TDBEdit;
    Label2: TLabel;
    dbedDescr: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    Procedure CmeCadastroFind(Sender: TObject);
  private
  public
    { Public declarations }
  end;

var
  frmCadFormFGTS: TfrmCadFormFGTS;

implementation

{$R *.DFM}

procedure TfrmCadFormFGTS.CmeCadastroFind(Sender: TObject);
begin
  if (MontaSelect.RetornouValor) then
    qry.Locate ('IDFORMARESC', MontaSelect.ValoresChave[0], []);
end;

end.
