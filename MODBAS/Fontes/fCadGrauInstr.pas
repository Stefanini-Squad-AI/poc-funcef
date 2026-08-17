unit FCadGrauInstr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fCadastroGridCS,
  IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls, TB97,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, Mask, DBCtrls,
  CmEventosCadastro, ImgList;

type
  TfrmCadGrauInstr = class(TFrmCadastroGridCS)
    Label1: TLabel;
    dbedCodigo: TDBEdit;
    Label2: TLabel;
    dbedDescr: TDBEdit;
    Label3: TLabel;
    dbedRAIS: TDBEdit;
    procedure CmeCadastroFind(Sender: TObject);
  end;

var
  frmCadGrauInstr: TfrmCadGrauInstr;

implementation

{$R *.DFM}

procedure TfrmCadGrauInstr.CmeCadastroFind(Sender: TObject);
begin
  if (MontaSelect.RetornouValor) then
    qry.Locate ('IDGRINSTR',MontaSelect.ValoresChave[0], []);
end;

end.
