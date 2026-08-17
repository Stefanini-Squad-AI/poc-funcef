unit FParamContaCC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  uCtrlContab,Dialogs, fParamReports_Padrao, CMProcuraMask, StdCtrls, Spin,
  CmParamReport, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr,
  TB97, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmParamContaCC = class(TfrmParamReports_Padrao)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    chkMascara: TCheckBox;
    chkGrupo: TCheckBox;
    spnPagIni: TSpinEdit;
    Label10: TLabel;
    cmpContaIni: TCMProcuraMaskContabil;
    cmpContaFim: TCMProcuraMaskContabil;
    dtDataRef: TCMDateTimePicker;
    lblDataLimite: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
     CtrlContab  : TCtrlContab;
  public
    { Public declarations }
  end;

var
  frmParamContaCC: TfrmParamContaCC;

implementation

uses UMensErro, uDatabase, DBaseDados, uSistema, uString,
     uModulo, uData, uFuncaoGeral, FSM_FxLib;

{$R *.DFM}

procedure TfrmParamContaCC.FormCreate(Sender: TObject);
begin
  inherited;
   CtrlContab := TCtrlContab.Create;
   CtrlContab.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                  Sistema.AppRemoteServer,True,nil,nil,False);

   If Not CtrlContab.SelecionaParametros(Sistema.IdEmpresa) Then
      MsgDlg(CtrlContab.MessageInfo,'Erro',MtError,[mbOk],0);

end;

procedure TfrmParamContaCC.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlContab.free;
end;

procedure TfrmParamContaCC.FormShow(Sender: TObject);
begin
  inherited;
   //Coloca as máscaras
   cmpContaIni.Plano     := CtrlContab.PlanoParam;
   cmpContaIni.Mascara   := CtrlContab.MascaraContaParam;
   cmpContaFim.Plano     := CtrlContab.PlanoParam;
   cmpContaFim.Mascara   := CtrlContab.MascaraContaParam;

end;

procedure TfrmParamContaCC.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  //*** passa os paramentos para o componente padrao ***
  Cmp_Padrao.ParamValues[0].AsString  := cmpContaIni.Conta.Numero;
  Cmp_Padrao.ParamValues[1].AsString  := cmpContaFim.Conta.Numero;
  Cmp_Padrao.ParamValues[2].AsBoolean := chkMascara.Checked;
  Cmp_Padrao.ParamValues[3].AsBoolean := chkGrupo.Checked;
  Cmp_Padrao.ParamValues[4].AsString  := dtDataRef.Text;
  Cmp_Padrao.ParamValues[5].AsInteger := StrToInt(spnPagIni.text);

end;

end.
