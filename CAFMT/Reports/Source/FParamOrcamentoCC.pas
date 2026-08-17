unit FParamOrcamentoCC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,uCtrlContab,
  fParamReports_Padrao, MontaSelect, Db, DBClient, uCMClientDataSet,
  uCmSqlParams, CMProcuraMask, ComCtrls, StdCtrls, Spin, Mask,
  wwdbdatetimepicker, CMDateTimePicker, wwdblook, CmParamReport, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls;

type
  TfrmParamOrcamentoCC = class(TfrmParamReports_Padrao)
    grpDatas: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label10: TLabel;
    dblkExercicio: TwwDBLookupCombo;
    dblkPeriodo: TwwDBLookupCombo;
    dteDataLim: TCMDateTimePicker;
    Panel1: TPanel;
    Label5: TLabel;
    Label7: TLabel;
    Label2: TLabel;
    mskCCustoIni: TMaskEdit;
    btnCCustoIni: TBitBtn;
    btnAtivProj: TBitBtn;
    mskAtivProj: TMaskEdit;
    btnCCustoFim: TBitBtn;
    mskCCustoFim: TMaskEdit;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label6: TLabel;
    chkMascara: TCheckBox;
    chkLingua: TCheckBox;
    chkGrupo: TCheckBox;
    chkGrau: TCheckBox;
    spnGrau: TSpinEdit;
    chkCorresp: TCheckBox;
    chkIndenta: TCheckBox;
    chkEspaco: TCheckBox;
    chkCodigo: TCheckBox;
    chkValores: TCheckBox;
    cbDesconsidera: TCheckBox;
    TabSheet2: TTabSheet;
    Label8: TLabel;
    Label9: TLabel;
    edtTitulo: TEdit;
    edtSubTitulo: TEdit;
    pbProgresso: TProgressBar;
    cmpContaIni: TCMProcuraMaskContabil;
    cmpContaFim: TCMProcuraMaskContabil;
    sqlExercicio: TCMSqlParams;
    cdsExercicio: TCMClientDataSet;
    sqlCCusto: TCMSqlParams;
    cdsCCusto: TCMClientDataSet;
    cdsAtivProj: TCMClientDataSet;
    sqlPeriodo: TCMSqlParams;
    cdsPeriodo: TCMClientDataSet;
    MontaSelectCCusto: TMontaSelect;
    MontaSelectAtivProj: TMontaSelect;
    sqlAtivProj: TCMSqlParams;
    procedure FormCreate(Sender: TObject);
    procedure mskAtivProjExit(Sender: TObject);
    procedure btnAtivProjClick(Sender: TObject);
    procedure mskCCustoIniExit(Sender: TObject);
    procedure btnCCustoIniClick(Sender: TObject);
    procedure mskCCustoFimExit(Sender: TObject);
    procedure btnCCustoFimClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblkExercicioClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure chkGrauClick(Sender: TObject);
    procedure dblkPeriodoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
  private
    { Private declarations }
    sUnidNegoc :string;
    CtrlContab  :TCtrlContab;

  public
    { Public declarations }
  end;

var
  frmParamOrcamentoCC: TfrmParamOrcamentoCC;

implementation

uses UMensErro, uDatabase, DBaseDados, uSistema, uString,
     uModulo, uData, uFuncaoGeral, FSM_FxLib;

{$R *.DFM}

procedure TfrmParamOrcamentoCC.FormCreate(Sender: TObject);
begin
  inherited;
   CtrlContab := TCtrlContab.Create;
   CtrlContab.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                  Sistema.AppRemoteServer,True,nil,nil,False);

   If Not CtrlContab.SelecionaParametros(Sistema.IdEmpresa) Then
      MsgDlg(CtrlContab.MessageInfo,'Erro',MtError,[mbOk],0);


   with sqlExercicio do begin
      Prepare;
      ParamByName('IDPESSOA').asInteger := Sistema.idEmpresa;
      Open;
   end;
   with sqlPeriodo do begin
      Prepare;
      ParamByName('IDPESSOA').asInteger := Sistema.idEmpresa;
      ParamByName('PEREXERCICIO').asInteger := Year(Date);
      Open;
   end;

   MontaSelectCCusto.Filtro.Add('CENTCUST.IDEMPRESA = ' + IntToStr(sistema.idEmpresa));
   MontaSelectAtivProj.Filtro.Add('UNIDNEGOCIO.IDPESSOA = ' + IntToStr(sistema.idEmpresa));

   //Coloca as máscaras
   cmpContaIni.Plano     := CtrlContab.PlanoParam;
   cmpContaIni.Mascara   := CtrlContab.MascaraContaParam;
   cmpContaFim.Plano     := CtrlContab.PlanoParam;
   cmpContaFim.Mascara   := CtrlContab.MascaraContaParam;

   mskCCustoIni.editMask := modulo.sMascaraCCusto + ';0; ';
   mskCCustoFim.editMask := modulo.sMascaraCCusto + ';0; ';
   mskAtivProj.editMask  := modulo.sMascaraUnidNegoc + ';0; ';

   spnGrau.MaxValue := FuncaoGeral.CalcGrauMax(CtrlContab.MascaraContaParam);
   spnGrau.Value    := FuncaoGeral.CalcGrauMax(CtrlContab.MascaraContaParam);
   spnGrau.MinValue := 1;

end;

procedure TfrmParamOrcamentoCC.mskAtivProjExit(Sender: TObject);
var sAtivProj : string;
begin
  inherited;
   if mskAtivProj.text <> '' then begin
      sAtivProj := mskAtivProj.text;
      with sqlAtivProj do begin
         Prepare;
         ParamByName('IDPESSOA').asFloat  := sistema.idEmpresa;
         ParamByName('UNECODIGO').asString := sAtivProj;
         Open;
         if not cdsAtivProj.isEmpty then begin
            mskAtivProj.text  := FloatToStr(cdsAtivProj.FieldByName('UNECODIGO').asFloat);
            sUnidNegoc  := IntToStr(cdsAtivProj.FieldByName('UNIDNEGOC').asInteger);
         end else begin
            MsgDlg('O código da atividade/projeto informado não existe.','Aviso',mtWarning,[mbOk],0);
            mskAtivProj.SetFocus;
         end;
      end;
   end;

end;

procedure TfrmParamOrcamentoCC.btnAtivProjClick(Sender: TObject);
var
 sAtivProj: string;
begin
   inherited;

   MontaSelectAtivProj.Executar;
   Repaint;
   if MontaSelectAtivProj.RetornouValor then begin
      sAtivProj := MontaSelectAtivProj.ValoresChave[2];
      with sqlAtivProj do begin
         Prepare;
         ParamByName('IDPESSOA').asFloat  := sistema.idEmpresa;
         ParamByName('UNECODIGO').asString := sAtivProj;
         Open;
         mskAtivProj.text     := cdsAtivProj.FieldByName('UNECODIGO').asString;
         sUnidNegoc  := IntToStr(cdsAtivProj.FieldByName('UNIDNEGOC').asInteger);

      end;
   end;

end;

procedure TfrmParamOrcamentoCC.mskCCustoIniExit(Sender: TObject);
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

procedure TfrmParamOrcamentoCC.btnCCustoIniClick(Sender: TObject);
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

procedure TfrmParamOrcamentoCC.mskCCustoFimExit(Sender: TObject);
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

procedure TfrmParamOrcamentoCC.btnCCustoFimClick(Sender: TObject);
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

procedure TfrmParamOrcamentoCC.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlContab.free;
end;

procedure TfrmParamOrcamentoCC.dblkExercicioClick(Sender: TObject);
begin
  inherited;
   //Preenche a combo-box de período
   if dblkExercicio.text <> '' then begin
      with sqlPeriodo do begin
         Prepare;
         ParamByName('IDPESSOA').asInteger     := Sistema.idEmpresa;
         ParamByName('PEREXERCICIO').asInteger := StrToInt(dblkExercicio.text);
         Open;
      end;
   end;

end;

procedure TfrmParamOrcamentoCC.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
   if dblkExercicio.text = '' then begin
      MsgDlg('O Exercício deve ser preenchido.','Erro',mtError,[mbOk],0);
      modalResult := mrNone;
      Exit;
   end;

   if dblkPeriodo.text = '' then begin
      MsgDlg('O Período deve ser preenchido.','Erro',mtError,[mbOk],0);
      modalResult := mrNone;
      Exit;
   end;

   if dteDataLim.text = '' then begin
      MsgDlg('A Data deve ser preenchida.','Erro',mtError,[mbOk],0);
      modalResult := mrNone;
      Exit;
   end;

   If mskAtivProj.text = '' then
      sUnidNegoc := '';

   //*** passa os paramentos para o componente padrao ***
   Cmp_Padrao.ParamValues[0].AsInteger  := StrToInt(dblkExercicio.LookupValue);
   Cmp_Padrao.ParamValues[1].AsInteger  := StrToInt(dblkPeriodo.LookupValue);
   Cmp_Padrao.ParamValues[2].AsString   := dteDataLim.Text;
   Cmp_Padrao.ParamValues[3].AsString   := cmpContaIni.Conta.Numero;
   Cmp_Padrao.ParamValues[4].AsString   := cmpContaFim.Conta.Numero;
   Cmp_Padrao.ParamValues[5].AsString   := Trim(mskCCustoIni.text);
   Cmp_Padrao.ParamValues[6].AsString   := Trim(mskCCustoFim.text);
   Cmp_Padrao.ParamValues[7].AsString   := sUnidNegoc;
   Cmp_Padrao.ParamValues[8].AsBoolean  := chkMascara.Checked;
   Cmp_Padrao.ParamValues[9].AsBoolean := chkValores.Checked;
   Cmp_Padrao.ParamValues[10].AsBoolean := chkGrupo.Checked;
   Cmp_Padrao.ParamValues[11].AsBoolean := chkLingua.Checked;
   Cmp_Padrao.ParamValues[12].AsInteger := StrToInt(spnGrau.Text);
   Cmp_Padrao.ParamValues[13].AsBoolean := chkCorresp.Checked;
   Cmp_Padrao.ParamValues[14].AsBoolean := chkIndenta.Checked;
   Cmp_Padrao.ParamValues[15].AsBoolean := chkEspaco.Checked;
   Cmp_Padrao.ParamValues[16].AsBoolean := chkCodigo.Checked;
   Cmp_Padrao.ParamValues[17].AsBoolean := cbDesconsidera.Checked;
   Cmp_Padrao.ParamValues[18].AsString  := edtTitulo.text;
   Cmp_Padrao.ParamValues[19].AsString  := edtSubTitulo.text;


end;

procedure TfrmParamOrcamentoCC.FormShow(Sender: TObject);
begin
  inherited;
  PageControl1.ActivePageIndex := 0;
end;

procedure TfrmParamOrcamentoCC.chkGrauClick(Sender: TObject);
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

procedure TfrmParamOrcamentoCC.dblkPeriodoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  dteDataLim.Date := cdsPeriodo.FieldByName('PERDATFIM').AsDateTime;
  dteDataLim.Text := cdsPeriodo.FieldByName('PERDATFIM').AsString;

end;

end.
