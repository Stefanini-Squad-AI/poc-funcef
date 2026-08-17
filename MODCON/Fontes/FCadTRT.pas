unit fCadTRT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fCadastroGridCS,
  StdCtrls, Mask, DBCtrls, CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect, DBTables,
  IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, Buttons, TB97Tlbr, TB97Ctls, TB97, Grids,
  Wwdbigrd, Wwdbgrid, ExtCtrls;

type
  TfrmCadTRT = class(TFrmCadastroGridCS)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    procedure CmeCadastroFind(Sender: TObject);
  end;

var
  frmCadTRT: TfrmCadTRT;

implementation

{$R *.DFM}

procedure TfrmCadTRT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
    qry.Locate ('CODIGOTRT', MontaSelect.ValoresChave[0], []);
end;

end.
