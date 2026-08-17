unit fParamApuracoesRoteiros;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fConsRoteiros, Db, DBClient, uCMClientDataSet, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  wwdbdatetimepicker, CMDateTimePicker, wwdblook, CMDBLookupCombo,fParamReports_Padrao,
  CmParamReport, uCtrlRoteiros, uCtrlAtivo, DBaseDados, USistema, JCLSysUtils;

type
  TfrmParamApuracoesRoteiros = class(TfrmParamReports_Padrao)
    lblRoteiro: TLabel;
    dblkpRoteiro: TCMDBLookupCombo;
    dblkpAtivo: TCMDBLookupCombo;
    lblAtivo: TLabel;
    rdgrpTipoApur: TRadioGroup;
    dtApuracao: TCMDateTimePicker;
    lblData: TLabel;
    edtUsuario: TEdit;
    lblUsuario: TLabel;
    dtExecucao: TCMDateTimePicker;
    lblDtExec: TLabel;
    edtNumLancto: TEdit;
    lblNumLancto: TLabel;
    cmbOperacao: TComboBox;
    lblOperacao: TLabel;
    edtNoDocumento: TEdit;
    lblDocumento: TLabel;
    edtObs: TEdit;
    lblObservacao: TLabel;
    cmbSituacao: TComboBox;
    lblSituacao: TLabel;
    cdsRoteiro: TCMClientDataSet;
    CdsAtivo: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    CtrlRoteiro      : TCtrlRoteiro;
    CtrlAtivo        : TCtrlAtivo;
  public
    { Public declarations }
  end;

var
  frmParamApuracoesRoteiros: TfrmParamApuracoesRoteiros;

implementation

{$R *.DFM}

procedure TfrmParamApuracoesRoteiros.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlRoteiro := TCtrlRoteiro.Create;
  CtrlRoteiro.Initialize( DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
   Sistema.ConnectionSide, Sistema.AppRemoteServer, True);

  CtrlAtivo := TCtrlAtivo.Create;
  CtrlAtivo.InitializeAs( CtrlRoteiro );

  cdsRoteiro.Data := CtrlRoteiro.LookupRoteiros;
  CdsAtivo.Data   := CtrlAtivo.CarregaAtivo;

  
end;

procedure TfrmParamApuracoesRoteiros.FormDestroy(Sender: TObject);
begin
  inherited;
  CtrlRoteiro.Free;
  CtrlAtivo.Free;
end;

procedure TfrmParamApuracoesRoteiros.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  Cmp_Padrao.ParamValues[0].AsInteger:= 0;
  Cmp_Padrao.ParamValues[1].AsInteger:= StrToIntDef( dblkpRoteiro.LookupValue, -1 );
  Cmp_Padrao.ParamValues[2].AsInteger:= 0;
  Cmp_Padrao.ParamValues[3].AsInteger:= StrToIntDef( dblkpAtivo.LookupValue, -1 );
  Cmp_Padrao.ParamValues[4].AsString:= iff( rdgrpTipoApur.ItemIndex = 0, 'M', iff( rdgrpTipoApur.ItemIndex = 1, 'D', iff( rdgrpTipoApur.ItemIndex = 2, 'F', '' ) ) );
  Cmp_Padrao.ParamValues[5].AsString:= Copy( cmbSituacao.Text, 1, 1 );
  Cmp_Padrao.ParamValues[6].AsDateTime:= dtApuracao.DateTime;
  Cmp_Padrao.ParamValues[7].AsString:= trim( edtUsuario.Text );
  Cmp_Padrao.ParamValues[8].AsDateTime:= dtExecucao.DateTime;
  Cmp_Padrao.ParamValues[9].AsString:=  trim( edtNoDocumento.Text );
  Cmp_Padrao.ParamValues[10].AsString:=  iff( cmbOperacao.ItemIndex = 1, 'D', iff( cmbOperacao.ItemIndex = 2, 'E', iff( cmbOperacao.ItemIndex = 3, 'P', '' ) ) );
  Cmp_Padrao.ParamValues[11].AsInteger:=  StrToIntDef( edtNumLancto.Text, -1 );
  Cmp_Padrao.ParamValues[12].AsString:=  trim( edtObs.Text );
end;

end.
