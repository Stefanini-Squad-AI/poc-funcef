unit fParamLancamento;

interface
       
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, Db, DBTables, Wwquery, wwdblook, IvDictio, IvMulti, IvEMulti,
  wwdbdatetimepicker, CMDateTimePicker, ExtCtrls;

type
  TfrmParamLancamento = class(TfrmOkCancelar)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    deDataInicial: TCMDateTimePicker;
    deDataFinal: TCMDateTimePicker;
    Label3: TLabel;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamLancamento: TfrmParamLancamento;
implementation

uses DRelatoriosCFinan,uSistema;

{$R *.DFM}

procedure TfrmParamLancamento.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  dtmRelatoriosCFinan.qryLancamento.Close;
  dtmRelatoriosCFinan.qryLancamento.ParamByName('IDPESSOA').AsInteger := Sistema.idEmpresa;
  dtmRelatoriosCFinan.qryLancamento.ParamByName('DATAINI').AsString   := deDataInicial.Text;
  dtmRelatoriosCFinan.qryLancamento.ParamByName('DATAFIM').AsString   := deDataFinal.Text;
  dtmRelatoriosCFinan.qryLancamento.Open;
  dtmRelatoriosCFinan.lblDataLancamento.caption := deDataInicial.Text+ ' à ' + deDataFinal.Text;
end;

procedure TfrmParamLancamento.FormActivate(Sender: TObject);
begin
  inherited;
  dtmRelatoriosCFinan.qryPrevisao.Close;
  dtmRelatoriosCFinan.qryPrevisao.ParamByName('SDATAREF').AsString := DateToStr(Date);
  dtmRelatoriosCFinan.qryPrevisao.ParamByName('IDPessoa').AsFloat := Sistema.IdEmpresa;  
  dtmRelatoriosCFinan.qryPrevisao.Open;
  deDataInicial.Text := DateToStr(Date);
  deDataFinal.Text   := DateToStr(Date);
end;

end.
