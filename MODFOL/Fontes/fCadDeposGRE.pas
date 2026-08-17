unit fCadDeposGRE;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridCS, StdCtrls, ExtCtrls, DBCtrls, Mask, IvDictio, IvMulti,
  IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls,
  MAHlpBtn, Buttons, TB97Tlbr, TB97, Grids, Wwdbigrd, Wwdbgrid,
  CmEventosCadastro, ImgList;

type
  TfrmCadDeposGRE = class(TFrmCadastroGridCS)
    Label1: TLabel;
    dbedCodigo: TDBEdit;
    Label2: TLabel;
    dbedDescr: TDBEdit;
    dbrgTipContra: TDBRadioGroup;
    Procedure CmeCadastroFind(Sender: TObject);
  private
  public
    { Public declarations }
  end;

var
  frmCadDeposGRE: TfrmCadDeposGRE;

implementation

{$R *.DFM}

procedure TfrmCadDeposGRE.CmeCadastroFind(Sender: TObject);
begin
  if (MontaSelect.RetornouValor) then
    qry.Locate ('IDDEPOSGRE', MontaSelect.ValoresChave[0], []);
end;

end.
