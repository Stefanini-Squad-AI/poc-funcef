unit FParamPlanoContas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uCtrlContab, fParamReports_Padrao, Db, DBClient, uCMClientDataSet,
  uCmSqlParams, CMProcuraMask, StdCtrls, Spin, ComCtrls, wwdblook,
  CmParamReport, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr,
  TB97, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmParamPlanoContas = class(TfrmParamReports_Padrao)
    GroupBox1: TGroupBox;
    Label2: TLabel;
    dblkPlano: TwwDBLookupCombo;
    Panel1: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label10: TLabel;
    chkMascara: TCheckBox;
    chkLingua: TCheckBox;
    chkGrupo: TCheckBox;
    chkGrau: TCheckBox;
    spnGrau: TSpinEdit;
    chkEspaco: TCheckBox;
    chkIndenta: TCheckBox;
    spnPagIni: TSpinEdit;
    chkAtivas: TCheckBox;
    TabSheet2: TTabSheet;
    Label8: TLabel;
    Label9: TLabel;
    edtTitulo: TEdit;
    edtSubTitulo: TEdit;
    cmpContaIni: TCMProcuraMaskContabil;
    cmpContaFim: TCMProcuraMaskContabil;
    sqlPlano: TCMSqlParams;
    cdsPlano: TCMClientDataSet;
    Label1: TLabel;
    dtDataRef: TCMDateTimePicker;
    chkSomenteSecretaria: TCheckBox;
    procedure chkGrauClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dblkPlanoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
  private
   CtrlContab  : TCtrlContab;
  public
    { Public declarations }
  end;

var
  frmParamPlanoContas: TfrmParamPlanoContas;

implementation

uses UMensErro, uDatabase, DBaseDados, uSistema, uString,
     uModulo, uData, uFuncaoGeral, FSM_FxLib;

{$R *.DFM}

procedure TfrmParamPlanoContas.chkGrauClick(Sender: TObject);
begin
  inherited;

   if chkGrau.checked then begin
      spnGrau.enabled := true;
      spnGrau.Color   := clWindow;
   end else begin
      spnGrau.enabled := false;
      spnGrau.Color   := clBtnFace;
   end;

end;

procedure TfrmParamPlanoContas.FormCreate(Sender: TObject);
begin
  inherited;
   CtrlContab := TCtrlContab.Create;
   CtrlContab.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                  Sistema.AppRemoteServer,True,nil,nil,False);

   If Not CtrlContab.SelecionaParametros(Sistema.IdEmpresa) Then
      MsgDlg(CtrlContab.MessageInfo,'Erro',MtError,[mbOk],0);

end;

procedure TfrmParamPlanoContas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlContab.Free;

end;

procedure TfrmParamPlanoContas.FormShow(Sender: TObject);
begin
  inherited;
   PageControl1.ActivePageIndex := 0;

   sqlPlano.Open;

   //Coloca as máscaras
   cmpContaIni.Plano     := CtrlContab.PlanoParam;
   cmpContaIni.Mascara   := CtrlContab.MascaraContaParam;
   cmpContaFim.Plano     := CtrlContab.PlanoParam;
   cmpContaFim.Mascara   := CtrlContab.MascaraContaParam;

   spnGrau.MaxValue := FuncaoGeral.CalcGrauMax(modulo.sMascaraContas);
   spnGrau.Value    := FuncaoGeral.CalcGrauMax(modulo.sMascaraContas);
   spnGrau.MinValue := 1;

end;

procedure TfrmParamPlanoContas.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  //*** passa os paramentos para o componente padrao ***
  Cmp_Padrao.ParamValues[0].AsString   := dblkPlano.LookupValue;
  Cmp_Padrao.ParamValues[1].AsString   := cmpContaIni.Conta.Numero;
  Cmp_Padrao.ParamValues[2].AsString   := cmpContaFim.Conta.Numero;
  Cmp_Padrao.ParamValues[3].AsBoolean  := chkMascara.Checked;
  Cmp_Padrao.ParamValues[4].AsBoolean  := chkGrupo.Checked;
  Cmp_Padrao.ParamValues[5].AsBoolean  := chkLingua.Checked;
  Cmp_Padrao.ParamValues[6].AsBoolean  := chkIndenta.Checked;
  Cmp_Padrao.ParamValues[7].AsBoolean  := chkEspaco.Checked;
  Cmp_Padrao.ParamValues[8].AsBoolean  := chkAtivas.Checked;
  Cmp_Padrao.ParamValues[9].AsInteger  := StrToInt(spnGrau.Text);
  Cmp_Padrao.ParamValues[10].AsString  := dtDataRef.Text;
  Cmp_Padrao.ParamValues[11].AsInteger := StrToInt(spnPagIni.text);
  Cmp_Padrao.ParamValues[12].AsString  := edtTitulo.text;
  Cmp_Padrao.ParamValues[13].AsBoolean := chkSomenteSecretaria.Checked;

end;

//Everson Cunha - SIG102043 - ini
procedure TfrmParamPlanoContas.dblkPlanoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;

  if dblkPlano.LookupValue <> '' then
  begin 
    //Coloca as máscaras
    cmpContaIni.Plano   := cdsPlano.fieldbyname('PLANO').AsInteger;
    cmpContaIni.Mascara := cdsPlano.fieldbyname('MASCARA').asstring;
    cmpContaFim.Plano   := cdsPlano.fieldbyname('PLANO').AsInteger;
    cmpContaFim.Mascara := cdsPlano.fieldbyname('MASCARA').asstring;
  end;
end;
//Everson Cunha - SIG102043 - Fim

end.
