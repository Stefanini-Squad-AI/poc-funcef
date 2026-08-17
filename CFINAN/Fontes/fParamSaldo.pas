unit fParamSaldo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, Db, DBTables, Wwquery, wwdblook, IvDictio, IvMulti, IvEMulti,
  wwdbdatetimepicker, CMDateTimePicker, ExtCtrls;

type
  TfrmSaldo = class(TfrmOkCancelar)
    rgrpStatus: TRadioGroup;
    gryConta: TwwQuery;
    gryContaDESCRICAO: TStringField;
    gryContaCODPORTADOR: TFloatField;
    GroupBox1: TGroupBox;
    deData: TCMDateTimePicker;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSaldo: TfrmSaldo;

implementation

uses DRelatoriosCFinan, Usistema;

{$R *.DFM}

procedure TfrmSaldo.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  //
  dtmRelatoriosCFinan.grySaldo.Close;
  dtmRelatoriosCFinan.grySaldo.ParamByName('pDataRef').AsString   :=deData.Text;
  dtmRelatoriosCFinan.grySaldo.ParamByName('pIdEmpresa').AsInteger:=Sistema.idEmpresa;

  dtmRelatoriosCFinan.grySaldo.SQL.Delete(9);
  case rgrpStatus.ItemIndex of
     0 : dtmRelatoriosCFinan.grySaldo.SQL.Insert(9,' (M.STATUSCONCILIA IN (''P'',''X'',''I'',''N'',''C'',''J'')) AND ');
     1 : dtmRelatoriosCFinan.grySaldo.SQL.Insert(9,' (M.STATUSCONCILIA IN (''X'',''I'')) AND ');
     2 : dtmRelatoriosCFinan.grySaldo.SQL.Insert(9,' (M.STATUSCONCILIA <> ''C'') AND ');
  end;
  dtmRelatoriosCFinan.grySaldo.Open;
  dtmRelatoriosCFinan.lbDataSaldo.caption   := 'Saldo das Contas em '+ deData.Text;
  dtmRelatoriosCFinan.lbStatusSaldo.caption := rgrpStatus.Items.strings[rgrpStatus.itemindex];

end;

procedure TfrmSaldo.FormActivate(Sender: TObject);
begin
  inherited;
  deData.Text := DateToStr(Date);
  gryConta.Open;
end;

end.
