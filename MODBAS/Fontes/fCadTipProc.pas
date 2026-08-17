unit fCadTipProc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fCadastroGridCS,
  StdCtrls, Mask, DBCtrls, CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect, DBTables,
  IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, Buttons, TB97Tlbr, TB97Ctls, TB97, Grids,
  Wwdbigrd, Wwdbgrid, ExtCtrls;

type
  TfrmCadTipProc = class(TFrmCadastroGridCS)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    procedure CmeCadastroFind(Sender: TObject);
  end;

var
  frmCadTipProc: TfrmCadTipProc;

implementation

{$R *.DFM}

procedure TfrmCadTipProc.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
    qry.Locate ('IDTIPOPROC', MontaSelect.ValoresChave[0], []);
end;

end.
