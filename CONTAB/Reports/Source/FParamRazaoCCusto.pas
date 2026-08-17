{-------------------------------------------------------------------------------
-------------------------------- ALTERAÇÕES ------------------------------------
--------------------------------------------------------------------------------

 SIG ..........: 102043
 Data .........: 22/12/2020
 Responsável ..: Everson Cunha
 Descrição ....: Máscara de conta por PLANO e período vigente
--------------------------------------------------------------------------------
 Analista : Marcus Oliveira
 Data     : 23/01/2007
 Pendencia: 23695
 Descrição: Troquei o campo CodCentroCusto para CodExterno.
--------------------------------------------------------------------------------}

unit FParamRazaoCCusto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, CMProcuraMask, StdCtrls, Spin, ExtCtrls, ComCtrls,
  Mask, wwdblook, wwdbdatetimepicker, CMDateTimePicker, CmParamReport,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, uCtrlContab,
  MontaSelect, wwclient, Db, DBClient, uCMClientDataSet, uCmSqlParams;

type
  TfrmParamRazaoCCusto = class(TfrmParamReports_Padrao)
    grpDatas: TGroupBox;
    lblDataIni: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    dteDataFim: TCMDateTimePicker;
    dblkExercicio: TwwDBLookupCombo;
    dteDataIni: TCMDateTimePicker;
    Panel1: TPanel;
    Label5: TLabel;
    Label7: TLabel;
    Label6: TLabel;
    Label2: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    mskCCustoIni: TMaskEdit;
    mskAtivProj: TMaskEdit;
    btnAtivProj: TBitBtn;
    btnCCustoIni: TBitBtn;
    mskSubConta: TMaskEdit;
    btnSubConta: TBitBtn;
    dblkModulo: TwwDBLookupCombo;
    dblkTipoOper: TwwDBLookupCombo;
    dblkHist: TwwDBLookupCombo;
    mskCCustoFim: TMaskEdit;
    btnCCustoFim: TBitBtn;
    chkTipoOper: TCheckBox;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label14: TLabel;
    rdgLancamentos: TRadioGroup;
    GroupBox1: TGroupBox;
    chkCorresp: TCheckBox;
    chkQuebra: TCheckBox;
    chkMascara: TCheckBox;
    chkContraPartida: TCheckBox;
    spnPagIni: TSpinEdit;
    TabSheet2: TTabSheet;
    Label11: TLabel;
    Label12: TLabel;
    edtTitulo: TEdit;
    edtSubTitulo: TEdit;
    tbsPlanoPatro: TTabSheet;
    pnlPlanPrev: TPanel;
    Label15: TLabel;
    Label16: TLabel;
    dblcPlanoPrev: TwwDBLookupCombo;
    dblcPatro: TwwDBLookupCombo;
    cmpContaIni: TCMProcuraMaskContabil;
    cmpContaFim: TCMProcuraMaskContabil;
    sqlModulo: TCMSqlParams;
    sqlHistorico: TCMSqlParams;
    sqlSubConta: TCMSqlParams;
    sqlPatro: TCMSqlParams;
    sqlPlanoPrev: TCMSqlParams;
    sqlExercicio: TCMSqlParams;
    sqlAtivProj: TCMSqlParams;
    sqlCCusto: TCMSqlParams;
    sqlTipoOper: TCMSqlParams;
    cdsHistorico: TCMClientDataSet;
    cdsExercicio: TCMClientDataSet;
    cdsSubConta: TCMClientDataSet;
    cdsModulo: TCMClientDataSet;
    cdsAtivProj: TCMClientDataSet;
    cdsPatro: TwwClientDataSet;
    cdsTipoOper: TCMClientDataSet;
    cdsCCusto: TCMClientDataSet;
    cdsPlanoPrev: TwwClientDataSet;
    MontaSelectSubConta: TMontaSelect;
    MontaSelectCCusto: TMontaSelect;
    MontaSelectAtivProj: TMontaSelect;
    sqlPlanCentCusto: TCMSqlParams;
    cdsPlanCentCusto: TCMClientDataSet;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure mskAtivProjExit(Sender: TObject);
    procedure btnAtivProjClick(Sender: TObject);
    procedure mskSubContaExit(Sender: TObject);
    procedure btnSubContaClick(Sender: TObject);
    procedure mskCCustoIniExit(Sender: TObject);
    procedure btnCCustoIniClick(Sender: TObject);
    procedure mskCCustoFimExit(Sender: TObject);
    procedure btnCCustoFimClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dteDataIniExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure dteDataFimExit(Sender: TObject);
  private
    { Private declarations }
    iPlano        : Integer;
    sUnidNegoc    : String;
    sMascaraPlano : String;
    CtrlContab    : TCtrlContab;

   public
    { Public declarations }
  end;

var
  frmParamRazaoCCusto: TfrmParamRazaoCCusto;

implementation

uses UMensErro, uDatabase, DBaseDados, uAutorizacao, uSistema,
     uModulo, uFuncaoGeral, uString;

{$R *.DFM}

procedure TfrmParamRazaoCCusto.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
   if dblkExercicio.text = '' then begin
      MsgDlg('O Exercício deve ser preenchido.','Erro',mtError,[mbOk],0);
      modalResult := mrNone;
      Exit;
   end;

    if  mskAtivProj.Text = '' then sUnidNegoc := '';
    
    //*** passa os paramentos para o componente padrao ***
    Cmp_Padrao.ParamValues[0].AsInteger  := StrToInt(dblkExercicio.LookupValue);
    Cmp_Padrao.ParamValues[1].AsString   := dteDataIni.Text;
    Cmp_Padrao.ParamValues[2].AsString   := dteDataFim.Text;
    Cmp_Padrao.ParamValues[3].AsString   := cmpContaIni.Conta.Numero;
    Cmp_Padrao.ParamValues[4].AsString   := cmpContaFim.Conta.Numero;
    Cmp_Padrao.ParamValues[5].AsString   := Trim(mskCCustoIni.text);
    Cmp_Padrao.ParamValues[6].AsString   := Trim(mskCCustoFim.text);
    Cmp_Padrao.ParamValues[7].AsString   := Trim(mskSubConta.text);
    Cmp_Padrao.ParamValues[8].AsString   := sUnidNegoc;
    Cmp_Padrao.ParamValues[9].AsInteger  := StrToIntDef(dblkModulo.LookupValue,0);
    Cmp_Padrao.ParamValues[10].AsString  := dblkTipoOper.LookupValue;
    Cmp_Padrao.ParamValues[11].AsString  := dblkHist.LookupValue;
    Cmp_Padrao.ParamValues[12].AsBoolean := chkTipoOper.Checked;
    Cmp_Padrao.ParamValues[13].AsInteger := rdgLancamentos.ItemIndex;
    Cmp_Padrao.ParamValues[14].AsBoolean := chkMascara.Checked;
    Cmp_Padrao.ParamValues[15].AsBoolean := chkCorresp.Checked;
    Cmp_Padrao.ParamValues[16].AsBoolean := chkQuebra.Checked;
    Cmp_Padrao.ParamValues[17].AsBoolean := chkContraPartida.Checked;
    Cmp_Padrao.ParamValues[18].AsInteger := StrToInt(spnPagIni.text);
    Cmp_Padrao.ParamValues[19].AsString  := edtTitulo.text;
    Cmp_Padrao.ParamValues[20].AsString  := edtSubTitulo.text;
    Cmp_Padrao.ParamValues[21].AsString  := dblcPlanoPrev.LookupValue;
    Cmp_Padrao.ParamValues[22].AsString  := dblcPatro.LookupValue;


end;

procedure TfrmParamRazaoCCusto.mskAtivProjExit(Sender: TObject);
var sAtivProj : string;
begin
  inherited;
   if mskAtivProj.text <> '' then begin
      sAtivProj := mskAtivProj.text;
      with sqlAtivProj do begin
         Prepare;
         ParamByName('IDPESSOA').asInteger := Sistema.idEmpresa;
         ParamByName('UNIDNEGOC').asInteger := StrToInt(sAtivProj);
         Open;
         if not cdsAtivProj.isEmpty then begin
            mskAtivProj.text  := cdsAtivProj.FieldByName('UNECODIGO').asString;
            sUnidNegoc  := IntToStr(cdsAtivProj.FieldByName('UNIDNEGOC').asInteger);
         end else begin
            MsgDlg('O código da atividade/projeto informado não existe.','Aviso',mtWarning,[mbOk],0);
            mskAtivProj.SetFocus;
         end;
      end;
   end;

end;

procedure TfrmParamRazaoCCusto.btnAtivProjClick(Sender: TObject);
var
 sAtivProj: string;
begin
   inherited;

   MontaSelectAtivProj.Executar;
   Repaint;
   if MontaSelectAtivProj.RetornouValor then begin
      sAtivProj := MontaSelectAtivProj.ValoresChave[0];
      with sqlAtivProj do begin
         Prepare;
         ParamByName('IDPESSOA').asInteger := Sistema.idEmpresa;
         ParamByName('UNIDNEGOC').asInteger := StrToInt(sAtivProj);
         Open;
         mskAtivProj.text  := cdsAtivProj.FieldByName('UNECODIGO').asString;
         sUnidNegoc  := IntToStr(cdsAtivProj.FieldByName('UNIDNEGOC').asInteger);

      end;
   end;

end;

procedure TfrmParamRazaoCCusto.mskSubContaExit(Sender: TObject);
var sSubConta : string;
begin
   inherited;

   if mskSubConta.text <> '' then begin
      sSubConta := mskSubConta.text;
         with sqlSubConta do begin
            Prepare;
            ParamByName('IDPESSOA').asInteger   := Sistema.idEmpresa;
            ParamByName('CODSUBCONTA').asString := sSubConta;
            Open;
            if not cdsSubConta.isEmpty then begin
               mskSubConta.text  := cdsSubConta.FieldByName('CODSUBCONTA').asString;
            end else begin
               MsgDlg('O código da sub-conta inicial informada não existe.','Aviso',mtWarning,[mbOk],0);
               mskSubConta.SetFocus;
            end;
        end;
   end;


end;

procedure TfrmParamRazaoCCusto.btnSubContaClick(Sender: TObject);
var
 sSubConta: string;
begin
   inherited;

   MontaSelectSubConta.Executar;
   Repaint;

   if MontaSelectSubConta.RetornouValor then begin
      sSubConta := MontaSelectSubConta.ValoresChave[1];
         with sqlSubConta do begin
            Prepare;
            ParamByName('IDPESSOA').asInteger   := Sistema.idEmpresa;
            ParamByName('CODSUBCONTA').asString := sSubConta;
            Open;
            mskSubConta.text := cdsSubConta.FieldByName('CODSUBCONTA').asString;
         end;
   end;

end;

procedure TfrmParamRazaoCCusto.mskCCustoIniExit(Sender: TObject);
var sCCusto : string;
begin
   inherited;

   if mskCCustoIni.text <> '' then begin
      sCCusto := mskCCustoIni.text;
      with sqlCCusto do begin
         Prepare;
         ParamByName('IDEMPRESA').asInteger     := Sistema.idEmpresa;
         ParamByName('CODEXTERNO').asString := sCCusto;
         Open;
         if not cdsCCusto.isEmpty then begin
            mskCCustoIni.text := cdsCCusto.FieldByName('CODEXTERNO').asString;
         end else begin
            MsgDlg('O código do centro de custo informado não existe.','Aviso',mtWarning,[mbOk],0);
            mskCCustoIni.SetFocus;
         end;
      end;
   end;

end;

procedure TfrmParamRazaoCCusto.btnCCustoIniClick(Sender: TObject);
var
 sCCusto: string;
begin
   inherited;

   MontaSelectCCusto.Executar;
   Repaint;

   if MontaSelectCCusto.RetornouValor then begin
      sCCusto := MontaSelectCCusto.ValoresChave[1];
      with sqlCCusto do begin
         Prepare;
         ParamByName('IDEMPRESA').asInteger     := Sistema.idEmpresa;
         ParamByName('CODEXTERNO').asString := sCCusto;
         Open;
         mskCCustoIni.text   := cdsCCusto.FieldByName('CODEXTERNO').asString;
      end;
   end;

end;

procedure TfrmParamRazaoCCusto.mskCCustoFimExit(Sender: TObject);
var sCCusto : string;
begin
   inherited;

   if mskCCustoFim.text <> '' then begin
      sCCusto := mskCCustoFim.text;
      with sqlCCusto do begin
         Prepare;
         ParamByName('IDEMPRESA').asInteger     := Sistema.idEmpresa;
         ParamByName('CODEXTERNO').asString := sCCusto;
         Open;
         if not cdsCCusto.isEmpty then begin
            mskCCustoFim.text := cdsCCusto.FieldByName('CODEXTERNO').asString;
         end else begin
            MsgDlg('O código do centro de custo informado não existe.','Aviso',mtWarning,[mbOk],0);
            mskCCustoFim.SetFocus;
         end;
      end;
   end;

end;

procedure TfrmParamRazaoCCusto.btnCCustoFimClick(Sender: TObject);
var
 sCCusto: string;
begin
   inherited;

   MontaSelectCCusto.Executar;
   Repaint;

   if MontaSelectCCusto.RetornouValor then begin
      sCCusto := MontaSelectCCusto.ValoresChave[1];
      with sqlCCusto do begin
         Prepare;
         ParamByName('IDEMPRESA').asInteger     := Sistema.idEmpresa;
         ParamByName('CODEXTERNO').asString := sCCusto;
         Open;
         mskCCustoFim.text   := cdsCCusto.FieldByName('CODEXTERNO').asString;
      end;
   end;

end;

procedure TfrmParamRazaoCCusto.FormCreate(Sender: TObject);
begin
  inherited;
   CtrlContab := TCtrlContab.Create;
   CtrlContab.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                  Sistema.AppRemoteServer,True,nil,nil,False);

   If Not CtrlContab.SelecionaParametros(Sistema.IdEmpresa) Then
      MsgDlg(CtrlContab.MessageInfo,'Erro',MtError,[mbOk],0);


   MontaSelectCCusto.Filtro.Add('CENTCUST.IDEMPRESA = ' + IntToStr(sistema.idEmpresa));
   MontaSelectSubConta.Filtro.Add('SUBCONTA.IDPESSOA = ' + IntToStr(sistema.idEmpresa));
   MontaSelectAtivProj.Filtro.Add('UNIDNEGOCIO.IDPESSOA = ' + IntToStr(sistema.idEmpresa));

   cmpContaIni.Plano     := CtrlContab.PlanoParam;
   cmpContaIni.Mascara   := CtrlContab.MascaraContaParam;
   cmpContaFim.Plano     := CtrlContab.PlanoParam;
   cmpContaFim.Mascara   := CtrlContab.MascaraContaParam;

   mskCCustoIni.editMask := modulo.sMascaraCCusto + ';0; ';
   mskCCustoFim.editMask := modulo.sMascaraCCusto + ';0; ';
   mskAtivProj.editMask  := modulo.sMascaraUnidNegoc + ';0; ';

end;

procedure TfrmParamRazaoCCusto.dteDataIniExit(Sender: TObject);
var iPlanoAnt : LongInt;
begin
  inherited;
   sMascaraPlano := CtrlContab.MascaraContaParam;
   iPlanoAnt     := CtrlContab.PlanoParam;

   If CtrlContab.SelecionaPlanoData(Sistema.IdEmpresa, dteDataIni.Text) Then
      iPlano := CtrlContab.PlanoData;

   if (iPlano <> iPlanoAnt) and (iPlano <> 0) then begin
      cmpContaIni.Plano     := iPlano;
      //cmpContaIni.Mascara   := CtrlContab.MascaraContaParam; //Everson Cunha - SIG102043
      cmpContaIni.Mascara   := CtrlContab.MascaraContaData;    //Everson Cunha - SIG102043
      cmpContaFim.Plano     := iPlano;
      //cmpContaFim.Mascara   := CtrlContab.MascaraContaParam; //Everson Cunha - SIG102043
      cmpContaFim.Mascara   := CtrlContab.MascaraContaData;    //Everson Cunha - SIG102043
   end else begin
      cmpContaIni.Plano     := CtrlContab.PlanoParam;
      cmpContaIni.Mascara   := CtrlContab.MascaraContaParam;
      cmpContaFim.Plano     := CtrlContab.PlanoParam;
      cmpContaFim.Mascara   := CtrlContab.MascaraContaParam;

      iPlano := CtrlContab.PlanoParam;
   end;

end;

procedure TfrmParamRazaoCCusto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlContab.free;
end;

procedure TfrmParamRazaoCCusto.FormShow(Sender: TObject);
begin
  inherited;
   PageControl1.ActivePageIndex := 0;
   pnlPlanPrev.Enabled := Sistema.UsaPlanoPatro;

   with sqlExercicio do begin
      Prepare;
      ParamByName('IDPESSOA').asInteger := Sistema.idEmpresa;
      Open;
   end;
   with sqlHistorico do begin
      Prepare;
      ParamByName('IDPESSOA').asInteger := Sistema.idEmpresa;
      Open;
   end;
   with sqlModulo do begin
      Prepare;
      Open;
   end;
   with sqlTipoOper do begin
      Prepare;
      Open;
   end;
   sqlPlanoPrev.Open;
   sqlPatro.Open;

end;

procedure TfrmParamRazaoCCusto.dteDataFimExit(Sender: TObject);
begin
  inherited;
  //Marcus Oliveira 23695 12/02/2007
  //Trazer o IDPlanCentCusto pelo periodo passado.
  sqlPlanCentCusto.Prepare;
  sqlPlanCentCusto.ParamByName('DATA').AsString := dteDataFim.Text; 
  sqlPlanCentCusto.open;
  MontaSelectCCusto.Filtro.add('IDPLANCENTCUST = '+ IntToStr(cdsPlanCentCusto.fieldbyname('IDPLANCENTCUST').AsInteger));

  mskCCustoIni.Text := '';
  mskCCustoFim.Text := '';

end;

end.
