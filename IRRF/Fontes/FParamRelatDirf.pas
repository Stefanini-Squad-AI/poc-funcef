unit FParamRelatDirf;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, Db, DBTables, Wwquery;

type
  TfrmParamRelatDirf = class(TfrmOkCancelar)
    edtAnoretencao: TEdit;
    Label1: TLabel;
    UpDown1: TUpDown;
    qryAux: TwwQuery;
    qryAuxNUMDOCUMENTO: TStringField;
    procedure FormActivate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamRelatDirf: TfrmParamRelatDirf;

implementation
uses DRelatIRRF,uSistema;
{$R *.DFM}

procedure TfrmParamRelatDirf.FormActivate(Sender: TObject);
var
data : string;
begin
   inherited;
   data := datetimetostr(date);
   APPLICATION.ProcessMessages;
   dtmRelatIRRF.qryRelatDirf.close;
   dtmRelatIRRF.qryRelatDirf.PARAMBYNAME('IDEMPRESA').asinteger := sistema.IdEmpresa;
   dtmRelatIRRF.qryRelatDirf.open;
   edtAnoretencao.text := data[7]+data[8]+data[9]+data[10];

end;

procedure TfrmParamRelatDirf.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   qryAux.Close;
   qryAux.ParamByName('IDPESSOA').AsInteger := Sistema.idEmpresa;
   qryAux.Open;
   //
   dtmRelatIRRF.rpRelatDirfLabel152.caption := edtAnoretencao.text;
   //
   dtmRelatIRRF.qryConfDIRF.Close;
   dtmRelatIRRF.qryConfDIRF.ParamByName('sNumDocumento').AsString := Copy(qryAuxNUMDOCUMENTO.AsString,1,8);
   dtmRelatIRRF.qryConfDIRF.ParamByName('sDATAINI').AsString   := '01/01/'+edtAnoretencao.Text;
   dtmRelatIRRF.qryConfDIRF.ParamByName('sDATAFIM').AsString   := '31/12/'+edtAnoretencao.Text;
   dtmRelatIRRF.qryConfDIRF.ParamByName('IDPESSOA').AsInteger  := Sistema.IdEmpresa;
   dtmRelatIRRF.qryConfDIRF.Open;
   //
end;

end.
