unit fSelTarifa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fOkCancelar, Db,
  DBClient, uCMClientDataSet, StdCtrls, CheckLst, wwdblook, wwdbdatetimepicker, IvMulti,
  CMDateTimePicker, IvDictio, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls,
  BfDialogs, BrowseFolder, uProcuraDir,
  ColorCheckListBox, Wwdatsrc, DBCtrls, TREdit, Mask, wwdbedit, math,
  Grids, Wwdbigrd, Wwdbgrid;

type
  TfrmSelTarifa = class(TfrmOkCancelar)
    CdsTarifa: TCMClientDataSet;
    dsTarifa: TwwDataSource;
    dbgrdValores: TwwDBGrid;
    Label40: TLabel;
    Label39: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
  public
    class function ExibirTelaTarifa(CdsTarifaOrigem: TCMClientDataSet): boolean;
  end;

var
  frmSelTarifa: TfrmSelTarifa;

implementation

// uses dCds, uCtrlPadroes, uCtrlFuncoesRH, uCtrlUsoGeralRH, uSistema, uMensErro;

{$R *.DFM}

procedure TfrmSelTarifa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caHide;
end;

class function TfrmSelTarifa.ExibirTelaTarifa(CdsTarifaOrigem: TCMClientDataSet): boolean;
var
  frm: TfrmSelTarifa;
begin
  frm := TfrmSelTarifa.Create(Application);
  frm.CdsTarifa := CdsTarifaOrigem;
  frm.dsTarifa.DataSet := CdsTarifaOrigem;
  TFloatField(frm.CdsTarifa.FieldByName('VL_VALOR')).DisplayFormat := '###,###,##0.00';
  Result := (frm.ShowModal = mrOk);
  frm.CdsTarifa := Nil;
  frm.Free;
end;

end.

