{===============================================================================
Analista : Marcus Oliveira
Pendência: 23870
Data: 05/12/2006
Descrição: Tela de parametros do relatório de processos em atraso 
===============================================================================}

unit FParamRadAtrasos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, CmParamReport, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, wwdblook,
  CMDBLookupCombo, ComCtrls, uCtrlRadTipoProc, uCtrlPadroes, Db, DBClient,
  uCMClientDataSet, wwdbdatetimepicker;

type
  TFrmParamRadAtrasos = class(TfrmParamReports_Padrao)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    GroupBox2: TGroupBox;
    CMDBLkGrpProcesso: TCMDBLookupCombo;
    GroupBox3: TGroupBox;
    cbSituacao: TComboBox;
    GroupBox4: TGroupBox;
    cbClassificacao: TComboBox;
    cdsLkGrpProcesso: TCMClientDataSet;
    dtpDtInicio: TwwDBDateTimePicker;
    dtpDtFim: TwwDBDateTimePicker;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    CtrlRadTipoProc : tCtrlRadTipoProc;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmParamRadAtrasos: TFrmParamRadAtrasos;

implementation

{$R *.DFM}

procedure TFrmParamRadAtrasos.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlRadTipoProc := TCtrlRadTipoProc.Create;
  CtrlRadTipoProc.InitializeAs(Padroes);
  cdsLkGrpProcesso.data := CtrlRadTipoProc.ListaProcessos;

end;

procedure TFrmParamRadAtrasos.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;

  if  CMDBLkGrpProcesso.LookupValue = '' then
      Cmp_Padrao.ParamValues[0].AsInteger := 0
      else
      Cmp_Padrao.ParamValues[0].AsInteger := StrToInt(CMDBLkGrpProcesso.LookupValue);

  Case cbSituacao.ItemIndex of
    0: Cmp_Padrao.ParamValues[1].AsString := '';
    1: Cmp_Padrao.ParamValues[1].AsString := 'S';
    2: Cmp_Padrao.ParamValues[1].AsString := 'R';
    3: Cmp_Padrao.ParamValues[1].AsString := 'N';
  end;
  
  Cmp_Padrao.ParamValues[2].AsInteger := cbClassificacao.ItemIndex;
  Cmp_Padrao.ParamValues[3].AsString := DateToStr ( dtpDtInicio.Date );
  Cmp_Padrao.ParamValues[4].AsString := DateToStr ( dtpDtFim.Date    );
  Cmp_Padrao.ParamValues[5].AsString := CMDBLkGrpProcesso.Text;
  Cmp_Padrao.ParamValues[6].AsString := cbClassificacao.Text;
  Cmp_Padrao.ParamValues[7].AsString := cbSituacao.Text;


end;

end.
