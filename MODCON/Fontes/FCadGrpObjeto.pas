unit fCadGrpObjeto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fCadastroGridCS,
  StdCtrls, Mask, DBCtrls, CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect, DBTables,
  IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, Buttons, TB97Tlbr, TB97Ctls, TB97, Grids,
  Wwdbigrd, Wwdbgrid, ExtCtrls;

type
  TfrmCadGrpObjeto = class(TFrmCadastroGridCS)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
  end;

var
  frmCadGrpObjeto: TfrmCadGrpObjeto;

implementation

{$R *.DFM}

procedure TfrmCadGrpObjeto.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
    qry.Locate ('IDGRUPOOBJETO', MontaSelect.ValoresChave[0], []);
end;

procedure TfrmCadGrpObjeto.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  qry.FieldByName('CLASSEOBJ').asString := '1';
end;

end.
