unit FRParamTransf;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, StdCtrls,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmRParamTransf = class(TfrmOkCancelar)
    gbFaixaDatas: TGroupBox;
    dedDataIni: TCMDateTimePicker;
    dedDataFim: TCMDateTimePicker;
    lblDataIni: TLabel;
    lblDataFim: TLabel;
    QryParamRel: TwwQuery;
    QryParamRelIDPARAMRELATS: TFloatField;
    QryParamRelIDMODULO: TFloatField;
    QryParamRelIDPESSOA: TFloatField;
    QryParamRelNOMECOMPO: TStringField;
    QryParamRelDESCRICAO: TStringField;
    QryParamRelVALOR: TStringField;
    QryParamRelNOMERELATORIO: TStringField;
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRParamTransf: TfrmRParamTransf;

implementation

Uses DRelatoriosCfinan,USistema;

{$R *.DFM}

procedure TfrmRParamTransf.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  //
  dtmRelatoriosCfinan.qryEmisTransf.Close;
  dtmRelatoriosCfinan.qryEmisTransf.ParamByName('pIDPessoa').AsFloat :=Sistema.IdEmpresa;
  dtmRelatoriosCfinan.qryEmisTransf.ParamByName('pDatIni').AsString :=dedDataIni.Text;
  dtmRelatoriosCfinan.qryEmisTransf.ParamByName('pDatFim').AsString :=dedDataFim.Text;
  dtmRelatoriosCfinan.qryEmisTransf.Open;
  //
end;

end.
