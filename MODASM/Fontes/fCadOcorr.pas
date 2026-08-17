unit fCadOcorr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fCadastroGridCS,
  IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls, TB97,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, DBCtrls, Mask,
  CmEventosCadastro, ImgList;

type
  TfrmCadOcorr = class(TFrmCadastroGridCS)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    dbrgTipoOcor: TDBRadioGroup;
    procedure CmeCadastroFind(Sender: TObject);
  end;

var
  frmCadOcorr: TfrmCadOcorr;

implementation

{$R *.DFM}

procedure TfrmCadOcorr.CmeCadastroFind(Sender: TObject);
begin
  if (MontaSelect.RetornouValor) then
    qry.Locate ('CODTIPOOCMED', MontaSelect.ValoresChave[0], []);
end;

end.
