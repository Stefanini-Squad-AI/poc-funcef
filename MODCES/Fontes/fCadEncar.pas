unit fCadEncar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fCadastroGridCS,
  StdCtrls, TREdit, Mask, DBCtrls, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, Buttons, TB97Tlbr, TB97, Grids, Wwdbigrd, Wwdbgrid,
  ExtCtrls, CmEventosCadastro, ImgList;

type
  TfrmCadEncar = class(TFrmCadastroGridCS)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBRealEdit1: TDBRealEdit;
    qryIDENCARGO: TFloatField;
    qryDESCRENCARGO: TStringField;
    qryPERCENCARGO: TFloatField;
    procedure CmeCadastroFind(Sender: TObject);
  end;

var
  frmCadEncar: TfrmCadEncar;

implementation

{$R *.DFM}

procedure TfrmCadEncar.CmeCadastroFind(Sender: TObject);
begin
  if (MontaSelect.RetornouValor) then
    qry.Locate ('IDENCARGO', MontaSelect.ValoresChave[0], []);
end;

end.
