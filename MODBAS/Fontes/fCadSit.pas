unit fCadSit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fCadastroGridCS,
  IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls, TB97,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, DBCtrls, Mask,
  CmEventosCadastro, ImgList;

type
  TfrmCadSit = class(TFrmCadastroGridCS)
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    dbrgTipoSit: TDBRadioGroup;
    DBEdit4: TDBEdit;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    procedure qryBeforePost(DataSet: TDataSet);
    Procedure CmeCadastroFind(Sender: TObject);
  end;

var
  frmCadSit: TfrmCadSit;

implementation

{$R *.DFM}

procedure TfrmCadSit.CmeCadastroFind(Sender: TObject);
begin
  if (MontaSelect.RetornouValor) then
    qry.Locate ('IDSITFUNC',MontaSelect.ValoresChave[0],[]);
end;

procedure TfrmCadSit.qryBeforePost(DataSet: TDataSet);
begin
  inherited;
  if (Trim(qry.FieldByName('FLGUSO').asString) = '') then
    qry.FieldByName('FLGUSO').asString := 'R';
end;

end.
