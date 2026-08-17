unit FParamCCConta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uCtrlContab, fParamReports_Padrao, MontaSelect, CMProcuraMask, Spin,
  StdCtrls, Mask, CmParamReport, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, ExtCtrls, uCmSqlParams, Db, DBClient,
  uCMClientDataSet, wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmParamCCConta = class(TfrmParamReports_Padrao)
    Panel1: TPanel;
    Label5: TLabel;
    Label2: TLabel;
    mskCCustoIni: TMaskEdit;
    btnCCustoIni: TBitBtn;
    mskCCustoFim: TMaskEdit;
    btnCCustoFim: TBitBtn;
    GroupBox1: TGroupBox;
    chkMascara: TCheckBox;
    chkGrupo: TCheckBox;
    spnPagIni: TSpinEdit;
    Label10: TLabel;
    cmpContaIni: TCMProcuraMaskContabil;
    cmpContaFim: TCMProcuraMaskContabil;
    MontaSelectCCusto: TMontaSelect;
    cdsCCusto: TCMClientDataSet;
    sqlCCusto: TCMSqlParams;
    dteDataLim1: TCMDateTimePicker;
    lblDataLimite: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mskCCustoIniExit(Sender: TObject);
    procedure btnCCustoIniClick(Sender: TObject);
    procedure mskCCustoFimExit(Sender: TObject);
    procedure btnCCustoFimClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
     CtrlContab  : TCtrlContab;
  public
    { Public declarations }
  end;

var
  frmParamCCConta: TfrmParamCCConta;

implementation

uses UMensErro, uDatabase, DBaseDados, uSistema, uString,
     uModulo, uData, uFuncaoGeral, FSM_FxLib;

{$R *.DFM}

procedure TfrmParamCCConta.FormCreate(Sender: TObject);
begin
  inherited;
   CtrlContab := TCtrlContab.Create;
   CtrlContab.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                  Sistema.AppRemoteServer,True,nil,nil,False);

   If Not CtrlContab.SelecionaParametros(Sistema.IdEmpresa) Then
      MsgDlg(CtrlContab.MessageInfo,'Erro',MtError,[mbOk],0);


   MontaSelectCCusto.Mascaras[0] := modulo.sMascaraCCusto + ';0; ';
   MontaSelectCCusto.Filtro.Add('CENTCUST.IDEMPRESA = ' + IntToStr(sistema.idEmpresa));

end;

procedure TfrmParamCCConta.FormShow(Sender: TObject);
begin
  inherited;
   //Coloca as máscaras
   cmpContaIni.Plano     := CtrlContab.PlanoParam;
   cmpContaIni.Mascara   := CtrlContab.MascaraContaParam;
   cmpContaFim.Plano     := CtrlContab.PlanoParam;
   cmpContaFim.Mascara   := CtrlContab.MascaraContaParam;

   mskCCustoIni.editMask := modulo.sMascaraCCusto + ';0; ';
   mskCCustoFim.editMask := modulo.sMascaraCCusto + ';0; ';

end;

procedure TfrmParamCCConta.mskCCustoIniExit(Sender: TObject);
var sCCusto : string;
begin
  inherited;
   if mskCCustoIni.text <> '' then begin
      sCCusto := mskCCustoIni.text;
      with sqlCCusto do begin
         Prepare;
         ParamByName('IDEMPRESA').asFloat := sistema.idEmpresa;
         ParamByName('CODCENTROCUSTO').asString   := sCCusto;
         Open;
         if not cdsCCusto.isEmpty then begin
            mskCCustoIni.text := cdsCCusto.FieldByName('CODCENTROCUSTO').asString;
         end else begin
            MsgDlg('O código do centro de custo informado não existe.','Aviso',mtWarning,[mbOk],0);
            mskCCustoIni.SetFocus;
         end;
      end;
   end;

end;

procedure TfrmParamCCConta.btnCCustoIniClick(Sender: TObject);
var sCCusto : string;
begin
  inherited;
   MontaSelectCCusto.Executar;
   Repaint;

   if MontaSelectCCusto.RetornouValor then begin
      sCCusto := MontaSelectCCusto.ValoresChave[1];
      with sqlCCusto do begin
         Prepare;
         ParamByName('IDEMPRESA').asFloat := sistema.idEmpresa;
         ParamByName('CODCENTROCUSTO').asString   := sCCusto;
         Open;
         mskCCustoIni.text   := cdsCCusto.FieldByName('CODCENTROCUSTO').asString;
      end;
   end;

end;

procedure TfrmParamCCConta.mskCCustoFimExit(Sender: TObject);
var sCCusto : string;
begin
  inherited;
   if mskCCustoFim.text <> '' then begin
      sCCusto := mskCCustoFim.text;
      with sqlCCusto do begin
         Prepare;
         ParamByName('IDEMPRESA').asFloat := sistema.idEmpresa;
         ParamByName('CODCENTROCUSTO').asString   := sCCusto;
         Open;
         if not cdsCCusto.isEmpty then begin
            mskCCustoFim.text := cdsCCusto.FieldByName('CODCENTROCUSTO').asString;
         end else begin
            MsgDlg('O código do centro de custo informado não existe.','Aviso',mtWarning,[mbOk],0);
            mskCCustoFim.SetFocus;
         end;
      end;
   end;

end;

procedure TfrmParamCCConta.btnCCustoFimClick(Sender: TObject);
var sCCusto : string;
begin
  inherited;
   MontaSelectCCusto.Executar;
   Repaint;

   if MontaSelectCCusto.RetornouValor then begin
      sCCusto := MontaSelectCCusto.ValoresChave[1];
      with sqlCCusto do begin
         Prepare;
         ParamByName('IDEMPRESA').asFloat := sistema.idEmpresa;
         ParamByName('CODCENTROCUSTO').asString   := sCCusto;
         Open;
         mskCCustoFim.text   := cdsCCusto.FieldByName('CODCENTROCUSTO').asString;
      end;
   end;

end;

procedure TfrmParamCCConta.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;

  //*** passa os paramentos para o componente padrao ***
  Cmp_Padrao.ParamValues[0].AsString  := Trim(mskCCustoIni.text);
  Cmp_Padrao.ParamValues[1].AsString  := Trim(mskCCustoFim.text);
  Cmp_Padrao.ParamValues[2].AsString  := cmpContaIni.Conta.Numero;
  Cmp_Padrao.ParamValues[3].AsString  := cmpContaFim.Conta.Numero;
  Cmp_Padrao.ParamValues[4].AsBoolean := chkMascara.Checked;
  Cmp_Padrao.ParamValues[5].AsBoolean := chkGrupo.Checked;
  Cmp_Padrao.ParamValues[6].AsInteger := StrToInt(spnPagIni.text);
  Cmp_Padrao.ParamValues[7].AsString  := dteDataLim1.Text;


end;

procedure TfrmParamCCConta.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  CtrlContab.free;

end;

end.
