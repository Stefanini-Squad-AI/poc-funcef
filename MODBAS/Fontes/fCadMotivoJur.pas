unit fCadMotivoJur;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fCadastroGridCS,
  IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls, TB97,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, wwdbedit,
  DBCtrls, Mask, CmEventosCadastro, ImgList;

type
  TfrmCadMotivoJur = class(TFrmCadastroGridCS)
    Label1: TLabel;
    dbedCodigo: TDBEdit;
    Label2: TLabel;
    dbedDescr: TDBEdit;
    Label5: TLabel;
    dbedObs: TwwDBEdit;
    Procedure CmeCadastroFind(Sender: TObject);
    procedure qryAfterInsert(DataSet: TDataSet);
  end;

var
  frmCadMotivoJur: TfrmCadMotivoJur;

implementation

uses uDataBase;

{$R *.DFM}

procedure TfrmCadMotivoJur.CmeCadastroFind(Sender: TObject);
begin
  if (MontaSelect.RetornouValor) then
    qry.Locate ('IDMOTIVO', MontaSelect.ValoresChave[0], []);
end;

procedure TfrmCadMotivoJur.qryAfterInsert(DataSet: TDataSet);
begin
  inherited;
  qry.FieldByName('IDMOTIVO').asInteger   := LeUltRegistro(nil,'MOTIVO');
  qry.FieldByName('GRUPOMOTIVO').asString := 'O';
end;

end.
