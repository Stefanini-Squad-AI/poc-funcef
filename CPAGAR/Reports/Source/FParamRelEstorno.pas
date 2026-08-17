unit FParamRelEstorno;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, CmParamReport, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  wwdbdatetimepicker, CMDateTimePicker, UMensErro;

type
  TfrmRelDocEstornados = class(TfrmParamReports_Padrao)
    GroupBox2: TGroupBox;
    Label4: TLabel;
    DtIniLanc: TCMDateTimePicker;
    DtFimLanc: TCMDateTimePicker;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    DtIniProg: TCMDateTimePicker;
    DtFimProg: TCMDateTimePicker;
    GroupBox3: TGroupBox;
    Label2: TLabel;
    DtIniVenc: TCMDateTimePicker;
    DtFimVenc: TCMDateTimePicker;
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    function validaData(dtini:TCMDateTimePicker;dtfim:TCMDateTimePicker):boolean;
    
  public
    { Public declarations }
  end;

var
  frmRelDocEstornados: TfrmRelDocEstornados;

implementation

{$R *.DFM}

procedure TfrmRelDocEstornados.bbtnConfirmarClick(Sender: TObject);

begin
  inherited;

  if not validaData(DtIniLanc,DtFimLanc) then
  begin
      MsgDlg('O Período de Lançamento é inválido.','Erro',mtError,[mbOk],0);
      modalResult := mrNone;
      Exit;
  end;

  if not validaData(DtIniProg,DtFimProg) then
    begin
      MsgDlg('O Período da Programação é inválida.','Erro',mtError,[mbOk],0);
      modalResult := mrNone;
      Exit;
  end;

  if not validaData(DtIniVenc,DtFimVenc) then
  begin
      MsgDlg('O Período de Vencimento é inválido.','Erro',mtError,[mbOk],0);
      modalResult := mrNone;
      Exit;
  end;

  Cmp_Padrao.ParamValues[0].AsString:= DtIniLanc.Text;
  Cmp_Padrao.ParamValues[1].AsString:= DtFimLanc.text;
  Cmp_Padrao.ParamValues[2].AsString:= DtIniProg.text;
  Cmp_Padrao.ParamValues[3].AsString:= DtFimProg.text;
  Cmp_Padrao.ParamValues[4].AsString:= DtIniVenc.text;
  Cmp_Padrao.ParamValues[5].AsString:= DtFimVenc.text;
end;


function TfrmRelDocEstornados.validaData(dtini,
  dtfim: TCMDateTimePicker): boolean;
begin
  result:= true;
  if (dtini.text = '') and (dtfim.text<>'') then
    result:= false;

  if (dtini.text <>'') and (dtfim.text='') then
     result:=false;

  if dtini.Date > dtfim.date then
     result:= false;
end;

end.
