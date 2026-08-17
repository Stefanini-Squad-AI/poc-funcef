unit FParamSaldoInicial;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, uCmSqlParams, Db, DBClient, uCMClientDataSet,
  CMProcuraMask, Spin, StdCtrls, wwdblook, CmParamReport, IvDictio,uCtrlContab,
  IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmParamSaldoInicial = class(TfrmParamReports_Padrao)
    grpDatas: TGroupBox;
    Label3: TLabel;
    dblkExercicio: TwwDBLookupCombo;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    chkMascara: TCheckBox;
    chkLingua: TCheckBox;
    chkGrupo: TCheckBox;
    chkGrau: TCheckBox;
    spnGrau: TSpinEdit;
    chkCorresp: TCheckBox;
    chkIndenta: TCheckBox;
    chkEspaco: TCheckBox;
    chkZerados: TCheckBox;
    cmpContaIni: TCMProcuraMaskContabil;
    cmpContaFim: TCMProcuraMaskContabil;
    cdsExercicio: TCMClientDataSet;
    sqlExercicio: TCMSqlParams;
    Label10: TLabel;
    spnPagIni: TSpinEdit;
    dteDataLim1: TCMDateTimePicker;
    lblDataLimite: TLabel;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure chkGrauClick(Sender: TObject);
  private
    { Private declarations }
    CtrlContab : TCtrlContab;
  public
    { Public declarations }
  end;

var
  frmParamSaldoInicial: TfrmParamSaldoInicial;

implementation

uses UMensErro, uDatabase, DBaseDados, uSistema, uString,
     uModulo, uData, uFuncaoGeral;

{$R *.DFM}

procedure TfrmParamSaldoInicial.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   if dblkExercicio.text = '' then begin
      MsgDlg('O Exercício deve ser preenchido.','Erro',mtError,[mbOk],0);
      modalResult := mrNone;
      Exit;
   end;

  //*** passa os paramentos para o componente padrao ***
  Cmp_Padrao.ParamValues[0].AsString   := dblkExercicio.LookupValue;
  Cmp_Padrao.ParamValues[1].AsString   := cmpContaIni.Conta.Numero;
  Cmp_Padrao.ParamValues[2].AsString   := cmpContaFim.Conta.Numero;
  Cmp_Padrao.ParamValues[3].AsBoolean  := chkMascara.Checked;
  Cmp_Padrao.ParamValues[4].AsBoolean  := chkGrupo.Checked;
  Cmp_Padrao.ParamValues[5].AsBoolean  := chkLingua.Checked;
  Cmp_Padrao.ParamValues[6].AsInteger  := StrToInt(spnGrau.Text);
  Cmp_Padrao.ParamValues[7].AsBoolean  := chkCorresp.Checked;
  Cmp_Padrao.ParamValues[8].AsBoolean  := chkIndenta.Checked;
  Cmp_Padrao.ParamValues[9].AsBoolean  := chkEspaco.Checked;
  Cmp_Padrao.ParamValues[10].AsBoolean := chkZerados.Checked;
  Cmp_Padrao.ParamValues[11].AsInteger := StrToInt(spnPagIni.text);
  Cmp_Padrao.ParamValues[12].AsString  := dteDataLim1.Text;



end;

procedure TfrmParamSaldoInicial.FormCreate(Sender: TObject);
begin
  inherited;
   CtrlContab := TCtrlContab.Create;
   CtrlContab.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                  Sistema.AppRemoteServer,True,nil,nil,False);

   If Not CtrlContab.SelecionaParametros(Sistema.IdEmpresa) Then
      MsgDlg(CtrlContab.MessageInfo,'Erro',MtError,[mbOk],0);

   sqlExercicio.Prepare;
   sqlExercicio.ParamByName('IDPESSOA').asFloat := Sistema.idEmpresa;
   sqlExercicio.Open;


   //Coloca as máscaras nas edit's
   cmpContaIni.Mascara  := CtrlContab.MascaraContaParam;
   cmpContaIni.Plano    := CtrlContab.PlanoParam;
   cmpContaFim.Mascara  := CtrlContab.MascaraContaParam;
   cmpContaFim.Plano    := CtrlContab.PlanoParam;


   spnGrau.MaxValue := FuncaoGeral.CalcGrauMax(CtrlContab.MascaraContaParam);
   spnGrau.Value    := FuncaoGeral.CalcGrauMax(CtrlContab.MascaraContaParam);
   spnGrau.MinValue := 1;

end;

procedure TfrmParamSaldoInicial.chkGrauClick(Sender: TObject);
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

end.
